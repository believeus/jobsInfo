package com.etech.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
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

import com.etech.entity.TdataCenter;
import com.etech.entity.Trecruit;
import com.etech.service.EtechService;
import com.etech.service.JobSearchService;
import com.etech.service.PolicyAdviceService;

/**
 * 搜索
 * */
@Controller
public class ControllerSearch {
	private static Log log = LogFactory.getLog(ControllerSearch.class);
	@Resource
	private EtechService etechService;
	@Resource
	private PolicyAdviceService policyAdviceService;
	@Resource
	private JobSearchService jobSearchService;
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
		String issueTime="";
		String salaryRange="";
		String workType="";
		String eduRequire="";
		String workYear="";
		String companyType="";
		if (!StringUtils.isEmpty(data)) {
			log.debug("search data:"+data);
			String[] split = data.split("-");
			int length=split.length;
			// length 长度=6
			if(length-5>0){
			  // 公司性质
			  companyType=split[5];
			}
			// length 长度=5
			if(length-4>0){
				// 工作年限
				workYear=split[4];
			}
			// length 长度=4
			if(length-3>0){
				// 学历要求
				eduRequire=split[3];
			}
			// length 长度=3
			if(length-2>0){
				// 工作性质
				workType=split[2];
			}
			// length长度等于2
			if(length-1>0){
				//起薪范围
			  salaryRange=split[1];
			  log.debug("salaryRange:"+salaryRange);
			}
			// length长度等于1
			if(length-1>=0){
				// 发布日期
				issueTime=split[0];
				log.debug("issueTime:"+issueTime);
			}
		}
		if (majorTypeId!=null) {
			// 获取对象
			// 获取字符串
			request.setAttribute("majorValue","" );
		}
		if (workTypeId!=null) {
			// 获取对象
			// 获取字符串
			request.setAttribute("workValue","" );
		}
		if (area!=null) {
			
		}
		if ("position".equals(type)) {
			log.debug("根据关键字搜索招聘岗位");
			List<Trecruit> recruitList=(List<Trecruit>)jobSearchService.searchJobAdvice(issueTime, salaryRange, workType, eduRequire, workYear, companyType, keyword, majorTypeId, area, companyType, 0, 25);
			request.setAttribute("recruitList", recruitList);
			
		}else if (type=="resume") {
			System.out.println("简历搜索");
		
		}else {
			System.out.println("公司搜索");
		}
		request.setAttribute("data", data);
		request.setAttribute("keyword", keyword);
		request.setAttribute("majorTypeId", majorTypeId);
		request.setAttribute("workTypeId", workTypeId);
		return "occupationIntroduction/advancedSearch";			
	}
	/**高级搜索*/
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearchView() {
		return "occupationIntroduction/advancedSearch";		
	}
	
	//
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
