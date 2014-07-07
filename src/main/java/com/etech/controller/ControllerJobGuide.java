package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.Page;
import com.etech.util.Pageable;

/**
 * 工作指南
 * */
@Controller("conJobGuide")
public class ControllerJobGuide {
	
	@Resource
	private EtechService etechService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/organization", method = RequestMethod.GET)
	public String organizationView(HttpServletRequest request) {
		String hql="From TdataCenter dataCenter where dataCenter.type='6' order by dataCenter.editTime desc";
		List<TdataCenter> datas = (List<TdataCenter>)etechService.findListByHQL(hql, 1);
		request.setAttribute("datas", datas);
		getSubjectReport(request); 
		return "guide/organization";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mainFunction", method = RequestMethod.GET)
	public String mainFunctioView(HttpServletRequest request) {
		String hql="From TdataCenter dataCenter where dataCenter.type='7' order by dataCenter.editTime desc";
		List<TdataCenter> datas = (List<TdataCenter>)etechService.findListByHQL(hql, 1);
		request.setAttribute("datas", datas);
		getSubjectReport(request);
		return "guide/mainFunction";
	}
	
	@RequestMapping(value = "/leader", method = RequestMethod.GET)
	public String leaderView(HttpServletRequest request) {
		
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		
		String hql="From TdataCenter dataCenter where dataCenter.type='8' order by dataCenter.editTime desc";
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("datas", page);
		getSubjectReport(request); 
		return "guide/leader";
	}
	
	@SuppressWarnings("unchecked")
	private void getSubjectReport(HttpServletRequest request){
		String hql="From TdataCenter dataCenter where dataCenter.type='5' order by dataCenter.editTime desc";
		List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
		request.setAttribute("subjectReport", subjectReport); // 专题报道
	}
}
