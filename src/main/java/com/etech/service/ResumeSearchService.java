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

import com.etech.entity.TcomInfo;
import com.etech.entity.TmajorType;
import com.etech.util.EtechGobal;

@Service
public class ResumeSearchService {
	private static final Log log=LogFactory.getLog(ResumeSearchService.class);
	@Resource
	private SessionFactory sessionFactory;
	@Resource
	private EtechService etechService;
	@SuppressWarnings("unchecked")
	public List<TcomInfo> search(String issueTime, String salaryRange,String workType, String eduRequire, String workYear,
			String companyType,String keyword,String majorTypeId,String area,String type,int currentPage,int perCount){
		List<TcomInfo> comInfoList=null;
		try {
			Session session = sessionFactory.getCurrentSession();
			FullTextSession fullTextSession = Search.getFullTextSession(session);
			Transaction tx = fullTextSession.beginTransaction();
			tx.begin();
			// 用BooleanQuery来做搜索条件的组合，即多条件查询
			BooleanQuery booleanQuery = new BooleanQuery();
			// 查询志愿
			TermQuery infoTypeQuery=new TermQuery(new Term("infoType",String.valueOf(EtechGobal.seekerWish)));
			booleanQuery.add(infoTypeQuery,Occur.MUST);
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
						TermRangeQuery issueRangeQuery=new TermRangeQuery("editDate", String.valueOf(beginTime),String.valueOf(endTime),true, true);
						booleanQuery.add(issueRangeQuery,Occur.MUST);
					}
				} catch (PatternSyntaxException ex) {
					ex.printStackTrace();
				}
			}
			//薪水范围
			if(!StringUtils.isEmpty(salaryRange)){
				log.debug("salaryRange:"+salaryRange);
				TermQuery salaryRangeQuery=new TermQuery(new Term("expectSalary",salaryRange));
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
				TermQuery eduRequireQuery=new TermQuery(new Term("comUser.eduLevel",eduRequire));
				booleanQuery.add(eduRequireQuery,Occur.MUST);
			}
			//根据关键字搜索
			if(!StringUtils.isEmpty(keyword)){
				log.debug("keyword:"+keyword);
				MultiFieldQueryParser parser = new MultiFieldQueryParser(Version.LUCENE_36, new String[]{"workType.name"}, new IKAnalyzer());
				parser.setDefaultOperator(QueryParser.OR_OPERATOR);
				Query multiFieldQueryParser = parser.parse(keyword);
				booleanQuery.add(multiFieldQueryParser, Occur.MUST);
			}
			// 工作地点
			if(!StringUtils.isEmpty(area)){
				log.debug("area:"+area);
				MultiFieldQueryParser multiFieldQueryParser = new MultiFieldQueryParser(Version.LUCENE_36, new String[]{"expectArea"}, new IKAnalyzer());
				Query workspaceQuery = multiFieldQueryParser.parse(area);
				booleanQuery.add(workspaceQuery, Occur.MUST);
			}
			// 专业
			if(!StringUtils.isEmpty(majorTypeId)){
				TmajorType majorType=(TmajorType)etechService.findObjectById(TmajorType.class, Integer.valueOf(majorTypeId));
				log.debug("majorType.name:"+majorType.getName());
				QueryParser parser = new QueryParser(Version.LUCENE_36,"majorType.name",new IKAnalyzer());
				Query queryParser = parser.parse(majorType.getName());
				booleanQuery.add(queryParser, Occur.MUST);
			}
			FullTextQuery fullTextQuery = fullTextSession.createFullTextQuery(booleanQuery, TcomInfo.class);
			// 根据时间进行排序
			fullTextQuery.setSort(new Sort(new SortField("editDate", SortField.LONG,true)));
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
			comInfoList=fullTextQuery.list();
			tx.commit();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return comInfoList;
	}
	
}
