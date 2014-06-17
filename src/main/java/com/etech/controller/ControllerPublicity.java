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
 * 公示公告详情
 * */
@Controller
public class ControllerPublicity {
	
	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/publicityInfo", method = RequestMethod.GET)
	public String publicityInfoView(HttpSession session,Integer id) {
		TdataCenter dataCenter = (TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		session.setAttribute("data", dataCenter);
		return "infoCenter/publicityInfo";
	}
	
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "/publicityList", method = RequestMethod.GET)
	public String publictityList(HttpSession session) {
		String hql="From TdataCenter dataCenter where dataCenter.type='2'";
		List<TdataCenter> notices = (List<TdataCenter>)etechService.findObjectByList(hql);
		session.setAttribute("notices", notices);
		return "infoCenter/publicityList";
	}
}
