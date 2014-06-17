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
 * 专题详情
 * */
@Controller
public class ControllerSpecial {
	
	@Resource
	private EtechService etechService;

	@RequestMapping(value = "/special", method = RequestMethod.GET)
	public String specialView(HttpSession session,Integer id) {
		TdataCenter dataCenter = (TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		session.setAttribute("data", dataCenter); 
		return "infoCenter/special";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/specialList", method = RequestMethod.GET)
	public String specialList(HttpSession session) {
		String hql="From TdataCenter dataCenter where dataCenter.type='5'";
		List<TdataCenter> spceilas = (List<TdataCenter>)etechService.findListByHQL(hql, 10);
		session.setAttribute("spceilas", spceilas);
		return "infoCenter/specialList";
	}
}
