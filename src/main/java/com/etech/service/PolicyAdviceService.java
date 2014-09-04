package com.etech.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.search.TermRangeQuery;
import org.apache.lucene.util.Version;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.etech.entity.TdataCenter;
import com.etech.util.Page;
import com.etech.util.Pageable;

@Service
public class PolicyAdviceService {
	private static final Log log=LogFactory.getLog(PolicyAdviceService.class);
	@Resource
	private SessionFactory sessionFactory;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Page searchPolicyAdvicePage(TdataCenter formDataCenter,Long beginData,Long endDate,Pageable pageable){
		List<TdataCenter> dataCenterList=null;
		PolicyAdviceService pAdviceService = new PolicyAdviceService();
		int total=0;
		log.debug("title:"+formDataCenter.getTitle());
		log.debug("beginData:"+beginData);
		log.debug("endDate:"+endDate);
		log.debug("powerLevel:"+formDataCenter.getPowerLevel());
		log.debug("powerProperty:"+formDataCenter.getPowerProperty());
		try {
			Session session = sessionFactory.getCurrentSession();
			FullTextSession fullTextSession = Search.getFullTextSession(session);
			Transaction tx = fullTextSession.beginTransaction();
			tx.begin();
			// 用BooleanQuery来做搜索条件的组合，即多条件查询
			BooleanQuery booleanQuery = new BooleanQuery();
			if(!StringUtils.isEmpty(formDataCenter.getTitle())){
				// 从title和content中查询关键字
				MultiFieldQueryParser parser = new MultiFieldQueryParser(Version.LUCENE_36, new String[]{"title","content"}, new IKAnalyzer());
				parser.setDefaultOperator(QueryParser.OR_OPERATOR);
				Query titleAndContentQuery = parser.parse(formDataCenter.getTitle());
				booleanQuery.add(titleAndContentQuery, Occur.MUST);
			}
			
			// 精确查询powerLevel
			int powerLevel=formDataCenter.getPowerLevel();
			int all=0;
			if(powerLevel!=all){
				Term powerLeverTerm=new Term("powerLevel", String.valueOf(powerLevel));
				Query powerLeverQuery = new TermQuery(powerLeverTerm);
				booleanQuery.add(powerLeverQuery,Occur.MUST);
			}
			
			// 精确查询powerProperty
			int powerProperty=formDataCenter.getPowerProperty();
			if(powerProperty!=all){
				Term powerPropertyTerm=new Term("powerProperty",String.valueOf(powerProperty));
				Query powerPropertyQuery=new TermQuery(powerPropertyTerm);
				booleanQuery.add(powerPropertyQuery,Occur.MUST);
			}
			// 时间范围查询
			if(!StringUtils.isEmpty(beginData)&&!StringUtils.isEmpty(endDate)){
				// 范围查询条件
				//TermRangeQuery rangeQuery=new TermRangeQuery("editTime", String.valueOf(beginData), String.valueOf(endDate), true, true);
				
				/**
				 * 刘杰2014-8-29 修改时间
				 */
				String bdate= pAdviceService.dateVlaueSet(beginData, "-");
				String edate= pAdviceService.dateVlaueSet(endDate, "+");
				System.out.println("创建时间---------"+bdate+"-----------------------");
				System.out.println("结束时间---------"+edate+"-----------------------");
				TermRangeQuery rangeQuery=new TermRangeQuery("editTime", bdate, edate, true, true);
				booleanQuery.add(rangeQuery,Occur.MUST);
				
			}
			//查询  国家法规 国家文件 地方法规 地方文件
			TermRangeQuery advicePolicyQuery=new TermRangeQuery("type", "10", "13", true,true);
			booleanQuery.add(advicePolicyQuery,Occur.MUST);
			
			FullTextQuery fullTextQuery = fullTextSession.createFullTextQuery(booleanQuery, TdataCenter.class);
			fullTextQuery.setSort(new Sort(new SortField("editTime", SortField.LONG,true)));
			total=fullTextQuery.getResultSize();
			
			int totalPages = (int) Math.ceil((double) total / (double) pageable.getPageSize());
			if (totalPages < pageable.getPageNumber()) {
				pageable.setPageNumber(totalPages);
			}
			
			fullTextQuery.setFirstResult((pageable.getPageNumber() - 1) * pageable.getPageSize());
			fullTextQuery.setMaxResults(pageable.getPageSize());
			log.debug("fullTextQuery:"+fullTextQuery);
			dataCenterList=fullTextQuery.list();
			tx.commit();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return new Page(dataCenterList, total, pageable);
	}
	
	/**
	 * 2014-8-29 刘杰添加 日期加减
	 */
	public String dateVlaueSet(Long dateLong,String op){
	     long time=Long.valueOf(dateLong);  
		 SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		 String y = sdf.format(new Date(time));
		 System.out.println("初始化:"+y);
		 int temp = Integer.parseInt(y.substring(9,10));
		 String edataString = "";
		 String beginString = "";
		
		 beginString = y.substring(0, 9);
		 edataString = y.substring(10,y.length());
		 String dLong ="";
		 if(op=="+"){
			 dLong = beginString+(temp+1)+edataString;
		 }else {
			 dLong = beginString+(temp-1)+edataString;
		}
		 long b = 0;
		try {
			Date dt = sdf.parse(dLong);
			b = dt.getTime();
			
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}        
		 return String.valueOf(b);
	}
}
