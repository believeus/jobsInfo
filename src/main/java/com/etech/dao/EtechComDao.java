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
		super.getHibernateTemplate().saveOrUpdate(object);
		/*HibernateTemplate ht = getHibernateTemplate();
		// 如果session中有该对象,只是更新了session缓存中的数据，不会把
		// 发出sql语句，必须要flush一下才会发出sql语句同步session缓存中
		// 的数据
		// 原因已经更新了数据库的数据，但是读取数据的时候却是从内存中获取的数据
		// 解决办法是保存一个对象的时候清空缓存数据即可
		ht.saveOrUpdate(object);
		ht.flush();
		// 奇怪的问题: 小欢的计算机不需要添加ht.flush 即可更新
		// 而我的计算机需要添加这句话才能更新。故而加之
		// 原因找到了，小欢的数据在内存中没有命中所以可以即使的显示
*/	}

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
		final String clazzName = clazz.getClass().getName();
		final String hql="delete from :clazzName where id=':id'";
		this.getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				query.setString("clazzName", clazzName);
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
		final String clazzName = clazz.getClass().getName();
		final String hql="from :className where id =':id'";
		return (List<?>) this.getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				query.setString("className", clazzName);
				query.setInteger("id", id);
				return query.uniqueResult();
			}
		});
	}
	
	// 分页查询  
	//  第一个参数：当前页数 
	//  第二个参数：每页显示多少条数据
	//  第三个参数：共有多少条数据
	// 算法分析 如果总共有n条数据  每页perPageCount条数据 则可以分((n/c)+(n%c))页 所以
	/*		  x				y			        					z                   
	 *       页          开始行           					结束行                结束行-开始行(注意该值是每页显示的行数，所以是一个固定值)
	 *       1			     0		 		  				perPageCount-1           perPageCount-1  行 (注意第0行也算一行)
	 *       2			 perPageCount		            2perPageCount-1          perPageCount-1  行
	 *       3			 2perPageCount				    3perPageCount-1          perPageCount-1  行
	 *       
	 *       得出页x和开始行y之间的关系式        y=perPageCount(x-1);
	 *       得出开始行x和结束行y之间的关系式  z=y+9  又因为 y=perPageCount(x-1)  所以z=perPageCount*x-1;
	 * */
	public List<?> getPageDateList(final String hql,final Integer currentPage,final Integer perPageCount,final Integer totalCount){
		
	/*	return (List<?>)super.execute(new BelieveusCallBack<List<?>>() {
			@Override
			public List<?> callBack(Session session) {
				Query query = session.createQuery(hql);
				// 该方法是设置从哪一行开始
				Integer pageIndex=currentPage;
				Integer perCount=perPageCount;
				Integer allCount=totalCount;
				if ((pageIndex!=null&&currentPage!=0)||(perCount!=null&&perPageCount!=0)||(allCount!=null&&totalCount!=0)) {
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
		});*/
		return null;
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
