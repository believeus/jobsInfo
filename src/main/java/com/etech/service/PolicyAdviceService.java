package com.etech.service;

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

@Service
public class PolicyAdviceService {
	private static final Log log=LogFactory.getLog(PolicyAdviceService.class);
	@Resource
	private SessionFactory sessionFactory;
	@SuppressWarnings("unchecked")
	public List<TdataCenter> searchPolicyAdvice(TdataCenter formDataCenter,Long beginData,Long endDate,int currentPage,int perCount){
		List<TdataCenter> dataCenterList=null;
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
				TermRangeQuery rangeQuery=new TermRangeQuery("editTime", String.valueOf(beginData), String.valueOf(endDate), true, true);
				booleanQuery.add(rangeQuery,Occur.MUST);
			}
			//查询  国家法规 国家文件 地方法规 地方文件
			TermRangeQuery advicePolicyQuery=new TermRangeQuery("type", "10", "13", true,true);
			booleanQuery.add(advicePolicyQuery,Occur.MUST);
			
			FullTextQuery fullTextQuery = fullTextSession.createFullTextQuery(booleanQuery, TdataCenter.class);
			fullTextQuery.setSort(new Sort(new SortField("editTime", SortField.LONG,true)));
			int total=fullTextQuery.getResultSize();
			// 分页
			if (currentPage > ((int) Math.ceil((float) total / perCount))) {
				currentPage = (int) Math.ceil((float) total/ perCount);
			}
			// 如果当前页小于第一页则等于第一页
			if (currentPage < 1) {
				currentPage = 1;
			}
			fullTextQuery.setFirstResult(perCount * (currentPage - 1));
			fullTextQuery.setMaxResults(perCount);
			log.debug("fullTextQuery:"+fullTextQuery);
			dataCenterList=fullTextQuery.list();
			tx.commit();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dataCenterList;
	}
}
