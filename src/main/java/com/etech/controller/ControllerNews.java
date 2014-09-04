package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.Page;
import com.etech.util.Pageable;

/**
 * 新闻详情
 * */
@Controller
public class ControllerNews {

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/newsInfo", method = RequestMethod.GET)
	public String newsInfoView(HttpSession session,Integer id,HttpServletRequest request) {
		TdataCenter dataCenter = (TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("data", dataCenter);
		
		// 专题
		String hql="From TdataCenter dataCenter where dataCenter.type='5'";
		List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
		request.setAttribute("subjectReport", subjectReport);
		return "infoCenter/newsInfo";
	}
	
	@RequestMapping(value = "/newsList")
	public String newsListView(HttpSession session,HttpServletRequest request) {
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		String hql="From TdataCenter dataCenter where dataCenter.type='0' order by dataCenter.editTime desc";
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("news",page);
		// 专题
			    hql="From TdataCenter dataCenter where dataCenter.type='5'";
				List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
				request.setAttribute("subjectReport", subjectReport);
		return "infoCenter/newsList";
	}
}
