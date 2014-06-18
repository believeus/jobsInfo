package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;

/**
 * 分析报告列表
 * */
@Controller
public class ControllerReportList {

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/fenxibaogaoList", method = RequestMethod.GET)
	public String newsListView(HttpSession session) {
		
		//供求分析报告
		String hql="From TdataCenter dataCenter where dataCenter.type='14'";
		List<TdataCenter> analysisreport = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("analysisreport", analysisreport);
		
		return "dataChannel/fenxibaogaoList";
	}
}
