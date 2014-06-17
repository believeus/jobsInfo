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
 * 工作指南
 * */
@Controller("conJobGuide")
public class ControllerJobGuide {
	
	@Resource
	private EtechService etechService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/organization", method = RequestMethod.GET)
	public String organizationView(HttpSession session) {
		String hql="From TdataCenter dataCenter where dataCenter.type='6'";
		List<TdataCenter> datas = (List<TdataCenter>)etechService.findListByHQL(hql, 1);
		session.setAttribute("datas", datas);
		return "guide/organization";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mainFunction", method = RequestMethod.GET)
	public String mainFunctioView(HttpSession session) {
		String hql="From TdataCenter dataCenter where dataCenter.type='7'";
		List<TdataCenter> datas = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		session.setAttribute("datas", datas);
		return "guide/mainFunction";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/leader", method = RequestMethod.GET)
	public String leaderView(HttpSession session) {
		String hql="From TdataCenter dataCenter where dataCenter.type='8'";
		List<TdataCenter> datas = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		session.setAttribute("datas", datas);
		return "guide/leader";
	}
	
}
