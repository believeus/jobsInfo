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
 * 工作动态详情
 * */
@Controller
public class ControllerWork {

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/workInfo", method = RequestMethod.GET)
	public String workInfoView(HttpSession session,Integer id) {
		TdataCenter dataCenter = (TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		session.setAttribute("data", dataCenter);
		return "infoCenter/workInfo";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/workList", method = RequestMethod.GET)
	public String worksList(HttpSession session) {
		String hql="From TdataCenter dataCenter where dataCenter.type='1'";
		List<TdataCenter> works = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		session.setAttribute("works", works);
		return "infoCenter/workList";
	}
}
