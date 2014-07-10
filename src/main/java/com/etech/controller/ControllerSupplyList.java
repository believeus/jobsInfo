package com.etech.controller;


import java.util.Calendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.etech.service.EtechService;
import com.etech.util.Page;
import com.etech.util.Pageable;

/**
 * 职业供给排行列表
 * */
@Controller
public class ControllerSupplyList {

	@Resource
	private EtechService etechService;
	private static final Log log = LogFactory.getLog(ControllerSupplyList.class);

	// 每月供给排行,求职者发送的求职信息
	@RequestMapping(value = "/gongjipaihangList", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		//当前页
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		// 每月供给排行
		String hql="from TcomInfo info left join fetch info.comUser "
				 + "where info.infoType=4 group by FROM_UNIXTIME(info.editDate/1000, '%Y-%m') order by FROM_UNIXTIME(info.editDate/1000, '%Y-%m') desc";
		log.debug(hql);
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("monthSupplyList", page);

		return "dataChannel/gongjipaihangList";
	}
	// 供给排行按月份进行排序
	@RequestMapping(value="/gongjipaihangOrderMonth")
	public String gongjipaihangOrderMonth(HttpServletRequest request,String year,String month){
		//当前页
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pattern regex = Pattern.compile("0[1-9]");
		Matcher matcher = regex.matcher(month);
		if(matcher.find()){
			month = matcher.group().replace("0", "");
		}
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR,Integer.valueOf(year));
		cal.set(Calendar.MONTH, (Integer.valueOf(month)-1));
		
		cal.set(Calendar.DAY_OF_MONTH, 1);
		long beginTime = cal.getTimeInMillis();
		
		cal.add(Calendar.MONTH, 1);  
		cal.set(Calendar.DAY_OF_MONTH, 0);
		long endTime=cal.getTimeInMillis();
		String hql="from  TcomInfo info "
				  + "where info.infoType=4 and info.comUser.disable=0 "
				  + "and info.editDate >='"+beginTime+"' "
				  + "and info.editDate <='"+endTime+"' "
				  + "and info.jobPost !=null group by info.jobPost order by count(info.jobPost) desc";
		log.debug(hql);
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = etechService.getPage(hql, pageable);
		log.debug(page.getContent().size());
		request.setAttribute("monthSupplyList", page);
		return "dataChannel/gongjipaihangOrderMonth";
	}
}
