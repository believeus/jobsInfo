package com.etech.service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

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

import com.etech.entity.TmajorType;
import com.etech.entity.Trecruit;
import com.etech.util.Page;
import com.etech.util.Pageable;

@Service
public class JobSearchService {
	private static final Log log=LogFactory.getLog(JobSearchService.class);
	@Resource
	private SessionFactory sessionFactory;
	@Resource
	private EtechService etechService;
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Page searchJobAdvice(String issueTime, String salaryRange,String workType, String eduRequire, String workYear,
			String companyType,String keyword,String majorTypeId,String area,String type,Pageable pageable){
		List<Trecruit> recruitList=null;
		int total=0;
		try {
			Session session = sessionFactory.getCurrentSession();
			FullTextSession fullTextSession = Search.getFullTextSession(session);
			Transaction tx = fullTextSession.beginTransaction();
			tx.begin();
			// 用BooleanQuery来做搜索条件的组合，即多条件查询
			BooleanQuery booleanQuery = new BooleanQuery();
			
			// 发布时间
			if(!StringUtils.isEmpty(issueTime)){
				try {
					Pattern regex = Pattern.compile("[0-9]+");
					Matcher matcher = regex.matcher(issueTime);
					if (matcher.find()) {
						issueTime=matcher.group();
						log.debug("issueTime:"+issueTime);
						// 3600*60*60*24
						//当前时间为标准,近n天
						long endTime=System.currentTimeMillis();
						log.debug("endTime:"+endTime);
						long beginTime=endTime-(Integer.valueOf(issueTime)*1000*60*60*24);
						log.debug("beginTime:"+beginTime);
						TermRangeQuery issueRangeQuery=new TermRangeQuery("editTime", String.valueOf(beginTime),String.valueOf(endTime),true, true);
						booleanQuery.add(issueRangeQuery,Occur.MUST);
					}
				} catch (PatternSyntaxException ex) {
					ex.printStackTrace();
				}
			}
			//薪水范围
			if(!StringUtils.isEmpty(salaryRange)){
				log.debug("salaryRange:"+salaryRange);
				TermQuery salaryRangeQuery=new TermQuery(new Term("salary",salaryRange));
				booleanQuery.add(salaryRangeQuery,Occur.MUST);
			}
			// 工作性质
			if(!StringUtils.isEmpty(workType)){
				log.debug("workType:"+workType);
				TermQuery workTypeQuery=new TermQuery(new Term("workWay",workType));
				booleanQuery.add(workTypeQuery,Occur.MUST);
			}
			// 学历要求
			if(!StringUtils.isEmpty(eduRequire)){
				log.debug("eduRequire:"+eduRequire);
				TermQuery eduRequireQuery=new TermQuery(new Term("eduLevel",eduRequire));
				booleanQuery.add(eduRequireQuery,Occur.MUST);
			}
			//工作年限
			if(!StringUtils.isEmpty(workYear)){
				log.debug("workYear:"+workYear);
				TermQuery workyearQuery=new TermQuery(new Term("workyear",workYear));
				booleanQuery.add(workyearQuery,Occur.MUST);
			}
		
			// 公司性质
			if(!StringUtils.isEmpty(companyType)){
				log.debug("companyType:"+companyType);
				TermQuery companyTypeQuery=new TermQuery(new Term("companyType",companyType));
				booleanQuery.add(companyTypeQuery, Occur.MUST);
			}
			//根据关键字搜索
			if(!StringUtils.isEmpty(keyword)){
				log.debug("keyword:"+keyword);
				MultiFieldQueryParser parser = new MultiFieldQueryParser(Version.LUCENE_36, new String[]{"company","workType.name"}, new IKAnalyzer());
				parser.setDefaultOperator(QueryParser.OR_OPERATOR);
				Query multiFieldQueryParser = parser.parse(keyword);
				booleanQuery.add(multiFieldQueryParser, Occur.MUST);
			}
			// 工作地点
			if(!StringUtils.isEmpty(area)){
				log.debug("area:"+area);
				MultiFieldQueryParser parser = new MultiFieldQueryParser(Version.LUCENE_36, new String[]{"workspace"}, new IKAnalyzer());
				parser.setDefaultOperator(QueryParser.OR_OPERATOR);
				Query workspaceQuery = parser.parse(area);
				booleanQuery.add(workspaceQuery, Occur.MUST);
			}
			// 专业
			if(!StringUtils.isEmpty(majorTypeId)){
				TmajorType majorType=(TmajorType)etechService.findObjectById(TmajorType.class, Integer.valueOf(majorTypeId));
				log.debug("majorType.getName()"+majorType.getName());
				QueryParser parser = new QueryParser(Version.LUCENE_36,"majorType.name",new IKAnalyzer());
				Query queryParser = parser.parse(majorType.getName());
				booleanQuery.add(queryParser, Occur.MUST);
			}
			// 查需该招聘信息已被审核通过
			TermQuery recruitReviewSuccess=new TermQuery(new Term("status","1"));
			booleanQuery.add(recruitReviewSuccess, Occur.MUST);
			
			FullTextQuery fullTextQuery = fullTextSession.createFullTextQuery(booleanQuery, Trecruit.class);
			// 根据时间进行排序
			fullTextQuery.setSort(new Sort(new SortField("editTime", SortField.LONG,true)));
			total=fullTextQuery.getResultSize();
			int totalPages = (int) Math.ceil((double) total / (double) pageable.getPageSize());
			if (totalPages < pageable.getPageNumber()) {
				pageable.setPageNumber(totalPages);
			}
			fullTextQuery.setFirstResult((pageable.getPageNumber() - 1) * pageable.getPageSize());
			fullTextQuery.setMaxResults(pageable.getPageSize());
			log.debug("fullTextQuery:"+fullTextQuery);
			recruitList=fullTextQuery.list();
			tx.commit();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return new Page(recruitList, total, pageable);
	}
	
}
