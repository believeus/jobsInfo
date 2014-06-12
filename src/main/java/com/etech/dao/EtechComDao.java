package com.etech.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.util.Version;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.wltea.analyzer.lucene.IKAnalyzer;

@Repository
public class EtechComDao extends HibernateDaoSupport {
	private static final Log log=LogFactory.getLog(EtechComDao.class);
	@Resource
	private SessionFactory sessionFactory;
	// 以对象的方式保存对象
	public void saveOrUpdateByObject(final Object object){
		HibernateTemplate ht = super.getHibernateTemplate();
		ht.saveOrUpdate(object);
		ht.flush();
	}

	// 以HQL的方式保存对象
	public Integer saveOrUpdate(final String hql) {
		this.getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				int result = query.executeUpdate();
				return result;
			}
		});
		return 0;
	}

	// 以对象的方式删除对象
	public void delete(Object object) {
		this.getHibernateTemplate().delete(object);
	}

	// 以HQL的方式删除对象
	public void delete(final String hql) {
		this.getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				query.executeUpdate();
				return null;
			}
		});
		
	}
	/**Begin Author:wuqiwei Data:2014-05-22 AddReason:根据id的方式删除对象*/
	public void delete(Class<?> clazz,final Integer id) {
		final String clazzName = clazz.getName();
		final String hql="delete from "+clazzName+" where id=:id";
		this.getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				query.setInteger("id", id);
				query.executeUpdate();
				return null;
			}
		});
	}
	/**End Author:wuqiwei Data:2014-05-22 AddReason:根据id的方式删除对象*/
	// 获取单一对象
	public Object getObjectByHQL(final String hql) {
		return this.getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				return query.uniqueResult();
			}
		});
	}
	/**Begin Author:wuqiwei Data:2014-05-12 AddReason:根据属性获取对象*/
	public Object getObjectByProperty(Class<?> clazz,final Object witchProperty,final Object propertyValue){
		final String clazzName = clazz.getName();
		final String hql="from "+clazzName+" as entity where entity."+witchProperty+" =:propertyValue";
		log.debug("current hql:"+hql);
		return this.getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				query.setParameter("propertyValue", propertyValue);
				return query.uniqueResult();
			}
		});
	}
	/**End Author:wuqiwei Data:2014-05-12 AddReason:根据属性获取对象*/
	
	// 获取多个对象
	public List<?> getObjecListByHQL(final String hql) {
		return (List<?>) this.getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				return query.list();
			}
		});
	}
	//以对象的方式获取对象。
	public Object getObjecById(Class<?> clazz, final Integer id) {
		final String clazzName = clazz.getName();
		final String hql="from "+clazzName+" as model where model.id =:id";
		log.debug("current hql:"+hql);
		return  this.getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				query.setInteger("id", id);
				return query.uniqueResult();
			}
		});
	}
	
	public List<?> getPageDateList(final String hql,final Integer currentPage,final Integer perPageCount,Class<?> clazz){
		String hqlCount="select count (*) from "+clazz.getName();
		final Long totalCount =(Long) getObjectByHQL(hqlCount);
		if(totalCount==null) {return null;}
		return (List<?>) getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				// 该方法是设置从哪一行开始
				Integer pageIndex=currentPage;
				Integer perCount=perPageCount;
				if ((pageIndex!=null&&currentPage!=0)||(perCount!=null&&perPageCount!=0)) {
					// 如果当前页大于最大页,则当前页等于最大页
					//使用ceil的时候注意：一定要把参数转换为float类型。
					if (currentPage>((int)Math.ceil((float)totalCount/perCount))) {
						pageIndex=(int)Math.ceil((float)totalCount/perCount);
					}
					// 如果当前页小于第一页则等于第一页
					if (pageIndex<1) {
						pageIndex=1;
					}
					query.setFirstResult(perCount*(pageIndex-1));  // 此处是 页和开始行的关系 y=perPageCount(x-1)
					// 设置到哪里结束
					//query.setMaxResults(perPageCount*nowPage-1); // 之前理解错误不是"此处是开始行和结束行之间的关系 z=perPageCount*x-1;"
					// 二是每次获取多少条记录
					query.setMaxResults(perCount);// 获取多少条数据。
				}
				return query.list();
			}
		});
	}
	/*Begin Name:wuqiwei Date:2013-11-5 07:24:40 AddReason:返回一定数量的行数*/
	public List<?> getPageDateList(final String hql,final Integer num){
		return null;
	}
	/*End Name:wuqiwei Date:2013-11-5 07:24:40 AddReason:返回一定数量的行数*/
	
	/*Begin Author:wuqiwei Date:2013-04-06 AddReason:使用hibernatesearch完成全文搜索*/
	@SuppressWarnings("unchecked")
	public <T> List<?> getListByHSearch(Class<?> clazz,String key,String[] properties){
		Session session = sessionFactory.getCurrentSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);
		Transaction tx = fullTextSession.beginTransaction();
		MultiFieldQueryParser parser = new MultiFieldQueryParser(Version.LUCENE_36, properties, new IKAnalyzer());
		parser.setDefaultOperator(QueryParser.OR_OPERATOR);
		BooleanQuery booleanQuery = new BooleanQuery();// 用BooleanQuery来做搜索条件的组合，即多条件查询
		try {
			booleanQuery.add(parser.parse(key), Occur.SHOULD);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		FullTextQuery hibQuery = fullTextSession.createFullTextQuery(booleanQuery,clazz);
		List<T> userList = (List<T>) hibQuery.list();
		tx.commit();
		return userList;
	}
	/*End Author:wuqiwei Date:2013-04-06 AddReason:使用hibernatesearch完成全文搜索*/
}
