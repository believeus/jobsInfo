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
 * 工作动态详情
 * */
@Controller
public class ControllerWork {

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/workInfo", method = RequestMethod.GET)
	public String workInfoView(Integer id,HttpServletRequest request) {
		TdataCenter dataCenter = (TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		request.setAttribute("data", dataCenter);
		String hql="From TdataCenter dataCenter where dataCenter.type='5'";
		List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
		request.setAttribute("subjectReport", subjectReport);
		return "infoCenter/workInfo";
	}
	
	@RequestMapping(value = "/workList")
	public String worksList(HttpServletRequest request) {
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		String hql="From TdataCenter dataCenter where dataCenter.type='1' order by dataCenter.editTime desc";
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("works",page);
		
		// 专题
				hql="From TdataCenter dataCenter where dataCenter.type='5' order by editTime desc";
				List<TdataCenter> subjectReport = (List<TdataCenter>)etechService.findListByHQL(hql);
				request.setAttribute("subjectReport", subjectReport);
		return "infoCenter/workList";
	}
}
