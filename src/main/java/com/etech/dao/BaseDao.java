package com.etech.dao;

import java.io.InputStream;
import java.io.Reader;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.jdbc.Work;
import org.springframework.stereotype.Repository;

import com.etech.exception.UnSupportTypeExcetion;

@Repository
public abstract class BaseDao {
	@Resource
	protected SessionFactory sessionFactory;

	public BaseDao() {
	}

	protected Object execute(EtechCallBack<?> callBack) {
		Session session = null;
		Object result = null;
		try {
			session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			result = callBack.callBack(session);
			transaction.commit();
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
		}
		return result;
	}

	public interface EtechCallBack<T> {
		public abstract T callBack(Session session);
	}

	/** 根据对象保存对象 */
	protected Integer save(final Object object) {
		return (Integer) execute(new EtechCallBack<Object>() {

			@Override
			public Object callBack(Session session) {
				Integer success = (Integer) session.save(object);
				return success;
			}
		});
	}

	/** 根据对象删除对象 */
	protected void delete(final Object object) {
		this.execute(new EtechCallBack<Object>() {

			@Override
			public Object callBack(Session session) {
				session.delete(object);
				return null;
			}
		});
	}

	protected Object get(final Class<?> clazz, final Serializable id) {
		return this.execute(new EtechCallBack<Object>() {

			@Override
			public Object callBack(Session session) {
				return session.get(clazz, id);
			}
		});
	}

	protected Object delete(final String hql) {
		return this.execute(new EtechCallBack<Object>() {

			@Override
			public Object callBack(Session session) {
				Query query = session.createQuery(hql);
				return query.executeUpdate();
			}
		});
	}

	protected void saveOrUpdate(final Object object) {
		this.execute(new EtechCallBack<Object>() {

			@Override
			public Object callBack(Session session) {
				session.saveOrUpdate(object);
				return null;
			}
		});
	}

	protected Integer saveOrUpdateByHQL(final String hql) {
		return (Integer) this.execute(new EtechCallBack<Integer>() {
			@Override
			public Integer callBack(Session session) {
				Query query = session.createQuery(hql);
				return query.executeUpdate();
			}
		});
	}

	protected Object getObjectByHQL(final String hql) {
		return (Object) this.execute(new EtechCallBack<Object>() {
			@Override
			public Object callBack(Session session) {
				Query query = session.createQuery(hql);
				return query.uniqueResult();
			}
		});
	}

	protected List<?> getObjecListByHQL(final String hql) {
		return (List<?>) this.execute(new EtechCallBack<List<?>>() {
			@Override
			public List<?> callBack(Session session) {
				Query query = session.createQuery(hql);
				return query.list();
			}
		});
	}

	/* Begin Author:wuqiwei Date:2014-03-28 AddReason:批量更新删除插入操作 */
	/**
	 * 支持Date Boolean Integer Float String Byte Double Short BigDecimal Time
	 * Timestamp URL Blob Clob 类型批量更新
	 */
	public void batchUpdate(final String sql,final List<LinkedHashMap<Object, Object>> list) {
		Session session = sessionFactory.getCurrentSession();
		final Transaction transaction = session.getTransaction();
		transaction.begin();
		session.doWork(new Work() {

			@Override
			public void execute(Connection connection) throws SQLException {
				try {
					PreparedStatement prepareStatement = connection.prepareStatement(sql);
					Class<? extends PreparedStatement> psClazz = prepareStatement.getClass();
					for (Map<Object, Object> map : list) {
						Set<Object> keySet = map.keySet();
						for (Object indexKey : keySet) {
							Object object = map.get(indexKey);
							Class<? extends Object> clazz = object.getClass();
							String clazzName = clazz.getName();
							String clazzType = clazzName.substring(clazzName.lastIndexOf(".") + 1);
							if (clazzType.equals("Integer"))clazzType = "Int";
							else if (clazzType.equals("Long"))clazzType = "Long";
							else if (clazzType.equals("Boolean"))clazzType = "boolean";
							else if (clazzType.equals("Byte"))clazzType = "byte";
							else if (clazzType.equals("Float"))clazzType = "float";
							else if (clazzType.equals("Double"))clazzType = "double";
							else if (clazzType.equals("Short"))clazzType = "short";
							else if (object instanceof InputStream)throw new UnSupportTypeExcetion(clazzName+"is unsupportType!!Only support Date,Boolean,Integer,Float,String,Byte,Double,Short,BigDecimal,Time,Timestamp,URL,Blob,Clob");
							else if (object instanceof Reader)throw new UnSupportTypeExcetion(clazzName+"is unsupportType!!Only support Date,Boolean,Integer,Float,String,Byte,Double,Short,BigDecimal,Time,Timestamp,URL,Blob,Clob");
							if (clazzName.equals("java.lang.Integer"))clazz = int.class;
							else if (clazzName.equals("java.lang.Long"))clazz = long.class;
							else if (clazzName.equals("java.lang.Boolean"))clazz = boolean.class;
							else if (clazzName.equals("java.lang.Byte"))clazz = byte.class;
							else if (clazzName.equals("java.lang.Float"))clazz = float.class;
							else if (clazzName.equals("java.lang.Double"))clazz = double.class;
							else if (clazzName.equals("java.lang.Short"))clazz = short.class;
							Method psMothod = psClazz.getDeclaredMethod("set"+ clazzType, int.class, clazz);
							psMothod.invoke(prepareStatement, indexKey, object);
						}
						prepareStatement.addBatch();
					}
					prepareStatement.executeBatch();
					transaction.commit();
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (SecurityException e) {
					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}

			}
		});
	}
	/* End Author:wuqiwei Date:2014-03-28 AddReason:批量更新删除插入操作 */

}
