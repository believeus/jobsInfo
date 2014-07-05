package com.etech.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Assert; 
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TcomInfo;
import com.etech.entity.TdataCenter;
import com.etech.entity.TmajorType;
import com.etech.entity.Trecruit;
import com.etech.service.EtechService;
import com.etech.service.JobSearchService;
import com.etech.service.PolicyAdviceService;
import com.etech.service.ResumeSearchService;

/**
 * 搜索
 * */
@Controller
public class ControllerSearch {
	private static Map<String, String> conditonMap=new HashMap<String, String>();
	static{
		// 发布日期
		conditonMap.put("近2天","issueTime_1");
		conditonMap.put("近3天", "issueTime_2");
		conditonMap.put("近7天","issueTime_3");
		conditonMap.put("近15天", "issueTime_4");
		conditonMap.put("近30天","issueTime_5");
		conditonMap.put("近60天", "issueTime_6");
		conditonMap.put("近60天以上","issueTime_7");
		//起薪范围
		conditonMap.put("1000以下", "salaryRange_1");
		conditonMap.put("1000~1999", "salaryRange_2");
		conditonMap.put("2000~2999", "salaryRange_3");
		conditonMap.put("3000~3999", "salaryRange_4");
		conditonMap.put("4000~4999", "salaryRange_5");
		conditonMap.put("5000以上", "salaryRange_6");
		//工作性质
		conditonMap.put("全职", "workType_1");
		conditonMap.put("兼职", "workType_2");
		conditonMap.put("实习", "workType_3");
		conditonMap.put("临时", "workType_4");
		conditonMap.put("小时工", "workType_5");
		conditonMap.put("全职/兼职/实习均可", "workType_6");
		conditonMap.put("就业见习", "workType_7");
		// 学历要求 
		conditonMap.put("博士", "eduRequire_1");
		conditonMap.put("硕士", "eduRequire_2");
		conditonMap.put("大学", "eduRequire_3");
		conditonMap.put("大专", "eduRequire_4");
		conditonMap.put("中专中技", "eduRequire_5");
		conditonMap.put("技校", "eduRequire_6");
		conditonMap.put("高中", "eduRequire_7");
		conditonMap.put("职高", "eduRequire_8");
		conditonMap.put("初中", "eduRequire_9");
		conditonMap.put("小学", "eduRequire_10");
		conditonMap.put("文盲或半文盲", "eduRequire_11");
		//工作年限
		conditonMap.put("在读学生", "workYear_1");
		conditonMap.put("应届毕业生", "workYear_2");
		conditonMap.put("1~2年", "workYear_3");
		conditonMap.put("2~3年", "workYear_4");
		conditonMap.put("3~5年", "workYear_5");
		conditonMap.put("5~8年", "workYear_6");
		conditonMap.put("8~10年", "workYear_7");
		conditonMap.put("10年以上", "workYear_8");
		//公司性质
		conditonMap.put("内资", "companyType_1");
		conditonMap.put("国有全资", "companyType_2");
		conditonMap.put("集体全资", "companyType_3");
		conditonMap.put("股份合作", "companyType_3");
		conditonMap.put("联营", "companyType_4");
		conditonMap.put("国有联营", "companyType_5");
		conditonMap.put("国有与集体联营", "companyType_6");
		conditonMap.put("其他联营", "companyType_7");
		conditonMap.put("有限责任（公司）", "companyType_8");
	}
	private static Log log = LogFactory.getLog(ControllerSearch.class);
	@Resource
	private EtechService etechService;
	@Resource
	private PolicyAdviceService policyAdviceService;
	@Resource
	private JobSearchService jobSearchService;
	@Resource
	private ResumeSearchService resumeSearchService;
	/**简单搜索*/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/search")
	public String searchView(HttpServletRequest request) {
		String key = request.getParameter("key");
		int currentpage=Integer.parseInt(request.getParameter("currentpage"));
		int perCount=Integer.parseInt(request.getParameter("perCount"));
		log.debug("search key:"+key);
		Assert.assertNotNull(key);
		List<TdataCenter> tdataCenterList = (List<TdataCenter>) etechService.search(TdataCenter.class, key, new String[]{"title","content"},currentpage,perCount);
		request.setAttribute("tdataCenterList", tdataCenterList);
		
		String hql="From TdataCenter dataCenter where dataCenter.type='5'";
		List<TdataCenter> spceilas = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		request.setAttribute("spceilas", spceilas);
		
		// 公告公示
		hql="From TdataCenter dataCenter where dataCenter.type='2'";
		List<TdataCenter> notices = (List<TdataCenter>)etechService.findListByHQL(hql);
		request.setAttribute("notices",notices ); 
		
		return "occupationIntroduction/search";
	}
	
	@RequestMapping(value="/advanceSearchByContision")
	public String advanceSearch(String data,String keyword,String majorTypeId,String workTypeId,
			String area,String type,HttpServletRequest request,HttpSession session){

		// 第一组：发布日期 第二组:起薪范围 第三组：工作性质
		// 第三组：学历性质 第四组:工作年限 第五组：公司性质
		String issueTime="issueTime";
		String salaryRange="salaryRange";
		String workType="workType";
		String eduRequire="eduRequire";
		String workYear="workYear";
		String companyType="companyType";
		if (!StringUtils.isEmpty(data)) {
			log.debug("search data:"+data);
			String[] split = data.split("-");
			for (String key : split) {
				// 进行条件映射
				if(!StringUtils.isEmpty(conditonMap.get(key))){
					String value=conditonMap.get(key).replaceAll("_[0-9]+", "");
					if(value.equals(issueTime)){
						issueTime=key;
					}else if(value.equals(salaryRange)) {
						salaryRange=key;
					}else if(value.equals(workType)){
						workType=key;
					}else if(value.equals(eduRequire)){
						eduRequire=key;
					}else if (value.equals(workYear)) {
						workYear=key;
					}else if (value.equals(companyType)) {
						companyType=key;
					}
				}
			}
		}
		if(issueTime.equals("issueTime")){
			issueTime="";
		}
		if(salaryRange.equals("salaryRange")){
			salaryRange="";
		}
		if(workType.equals("workType")){
			workType="";
		}
		if(eduRequire.equals("eduRequire")){
			eduRequire="";
		}
		if(workYear.equals("workYear")){
			workYear="";
		}
		if(companyType.equals("companyType")){
			companyType="";
		}
		if (!StringUtils.isEmpty(majorTypeId)) {
			// 获取对象
			TmajorType majorValue=(TmajorType)etechService.findObjectById(TmajorType.class, Integer.valueOf(majorTypeId));
			// 获取字符串
			request.setAttribute("majorValue",majorValue.getName());
		}
		if (!StringUtils.isEmpty(workTypeId)) {
			// 获取对象
			TmajorType  workValue= (TmajorType)etechService.findObjectById(TmajorType.class, Integer.valueOf(workTypeId));
			// 获取字符串
			request.setAttribute("workValue",workValue.getName());
		}
		if (area!=null) {
			
		}
		request.setAttribute("data", data);
		request.setAttribute("keyword", keyword);
		request.setAttribute("majorTypeId", majorTypeId);
		request.setAttribute("workTypeId", workTypeId);
		String hql="From TdataCenter dataCenter where dataCenter.type='2'";
		@SuppressWarnings("unchecked")
		List<TdataCenter> notices = (List<TdataCenter>)etechService.findListByHQL(hql);
		request.setAttribute("notices",notices ); 
		
		// 岗位搜索和
		if ("position".equals(type)) {
			log.debug("根据关键字和条件搜索招聘岗位");
			List<Trecruit> recruitList=(List<Trecruit>)jobSearchService.searchJobAdvice(issueTime, salaryRange, workType, eduRequire, workYear, companyType, keyword, majorTypeId, area, companyType, 0, 25);
			request.setAttribute("recruitList", recruitList);
			return "occupationIntroduction/advancedSearchJob";
		//公司搜索
		}else if ("company".equals(type)) {
			log.debug("根据关键字和条件搜索公司");
			List<Trecruit> recruitList=(List<Trecruit>)jobSearchService.searchJobAdvice(issueTime, salaryRange, workType, eduRequire, workYear, companyType, keyword, majorTypeId, area, companyType, 0, 25);
			request.setAttribute("recruitList", recruitList);
			return "occupationIntroduction/advancedSearchCompany";
		// 简历搜索
		}else{
			log.debug("简历搜索");
			List<TcomInfo> comInfoList = resumeSearchService.search(issueTime, salaryRange, workType, eduRequire, workYear, companyType, keyword, majorTypeId, area, companyType, 0, 25);
			request.setAttribute("comInfoList", comInfoList);
			return "occupationIntroduction/advancedSearchResume";
		}
		
	}
	/**高级搜索页,默认搜索职位信息*/
	@RequestMapping(value = "/jobAdvancedSearch")
	public String jobAdvancedSearchView(HttpServletRequest request) {
		// 当前是第几页
		int pageNo=0;
		// 每页几行
		int pageSize=20;
		if(!StringUtils.isEmpty(request.getParameter("pageNo"))){
			pageNo=Integer.valueOf(request.getParameter("pageNo"));
		}
		if(!StringUtils.isEmpty(request.getParameter("pageSize"))){
			pageSize=Integer.valueOf(request.getParameter("pageSize"));
		}
		//搜索招聘职位
		String hql="from Trecruit recruit order by recruit.editTime desc";
		@SuppressWarnings("unchecked")
		List<Trecruit> recruitList= (List<Trecruit>)etechService.findObjectList(hql, pageNo, pageSize, Trecruit.class);
		request.setAttribute("recruitList", recruitList);
		request.setAttribute("location", "position");
		return "occupationIntroduction/advancedSearchJob";
	}
	// 简历搜索
	@RequestMapping(value = "/resumeAdvancedSearch")
	public String resumeAdvancedSearchView(HttpServletRequest request) {
		// 当前是第几页
		int pageNo=0;
		// 每页几行
		int pageSize=20;
		if(!StringUtils.isEmpty(request.getParameter("pageNo"))){
			pageNo=Integer.valueOf(request.getParameter("pageNo"));
		}
		if(!StringUtils.isEmpty(request.getParameter("pageSize"))){
			pageSize=Integer.valueOf(request.getParameter("pageSize"));
		}
		//搜索简历
		String hql="from TcomInfo comInfo where comInfo.infoType=4  order by comInfo.editDate desc";
		@SuppressWarnings("unchecked")
		List<TcomInfo> comInfoList= (List<TcomInfo>)etechService.findObjectList(hql, pageNo, pageSize, TcomInfo.class);
		request.setAttribute("comInfoList", comInfoList);
		request.setAttribute("location", "resume");
		return "occupationIntroduction/advancedSearchResume";
	}
	//搜索公司
		@RequestMapping(value = "/companyAdvancedSearch")
		public String companyAdvancedSearch(HttpServletRequest request) {
			// 当前是第几页
			int pageNo=0;
			// 每页几行
			int pageSize=20;
			if(!StringUtils.isEmpty(request.getParameter("pageNo"))){
				pageNo=Integer.valueOf(request.getParameter("pageNo"));
			}
			if(!StringUtils.isEmpty(request.getParameter("pageSize"))){
				pageSize=Integer.valueOf(request.getParameter("pageSize"));
			}
			//搜索职位
			String hql="from Trecruit recruit order by recruit.editTime desc";
			@SuppressWarnings("unchecked")
			List<Trecruit> recruitList= (List<Trecruit>)etechService.findObjectList(hql, pageNo, pageSize, Trecruit.class);
			Collections.shuffle(recruitList);
			request.setAttribute("recruitList", recruitList);
			request.setAttribute("location", "company");
			return "occupationIntroduction/advancedSearchCompany";
		}
	@RequestMapping(value="/searchPolicyAdvice",method = RequestMethod.POST)
	public String searchPolicyAdvice(HttpServletRequest request){
		int currentPage=Integer.parseInt(request.getParameter("currentPage"));
		int perCount=Integer.parseInt(request.getParameter("perCount"));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Long beginDate=null;
			Long endDate=null;
			if(!StringUtils.isEmpty(request.getParameter("beginDate"))&&!StringUtils.isEmpty(request.getParameter("endDate"))){
				beginDate = formatter.parse(request.getParameter("beginDate")).getTime();
				log.debug("beginData:"+beginDate);
				endDate=formatter.parse(request.getParameter("endDate")).getTime();
				log.debug("endDate:"+endDate);
			}
			TdataCenter formDataCenter=new TdataCenter();
			String title=request.getParameter("title");
			String powerLevel=request.getParameter("powerLevel");
			String powerProperty=request.getParameter("powerProperty");
			formDataCenter.setTitle(title);
			formDataCenter.setPowerLevel(Integer.parseInt(powerLevel));
			formDataCenter.setPowerProperty(Integer.parseInt(powerProperty));
			List<TdataCenter> dataCenterList = policyAdviceService.searchPolicyAdvice(formDataCenter,beginDate,endDate,currentPage,perCount);
			request.setAttribute("dataCenterList", dataCenterList);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "policyAdvice/policyAdviceSearch";
	}
	
}
