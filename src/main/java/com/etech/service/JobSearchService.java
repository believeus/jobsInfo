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
import com.etech.entity.Trecruit;

@Service
public class JobSearchService {
	private static final Log log=LogFactory.getLog(JobSearchService.class);
	@Resource
	private SessionFactory sessionFactory;
	@SuppressWarnings("unchecked")
	public List<Trecruit> searchJobAdvice(String data,String keyword,String majorTypeId,
				String workTypeId,Integer area,String type,int currentPage,int perCount){
		List<Trecruit> recruitList=null;
		try {
			Session session = sessionFactory.getCurrentSession();
			FullTextSession fullTextSession = Search.getFullTextSession(session);
			Transaction tx = fullTextSession.beginTransaction();
			tx.begin();
			// 用BooleanQuery来做搜索条件的组合，即多条件查询
			BooleanQuery booleanQuery = new BooleanQuery();
			// 从title和content中查询关键字
			// 根据职位名搜索
			if(!StringUtils.isEmpty(keyword)){
				QueryParser parser = new QueryParser(Version.LUCENE_36,"workType.name",new IKAnalyzer());
				Query queryParser = parser.parse(keyword);
				booleanQuery.add(queryParser, Occur.MUST);
			}
			
			FullTextQuery fullTextQuery = fullTextSession.createFullTextQuery(booleanQuery, TdataCenter.class);
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
			recruitList=fullTextQuery.list();
			tx.commit();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return recruitList;
	}
}
