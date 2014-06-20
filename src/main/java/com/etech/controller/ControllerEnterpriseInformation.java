package com.etech.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.Trecruit;
import com.etech.service.EtechService;

/**
 * 企业信息
 * */
@Controller
public class ControllerEnterpriseInformation {

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/enterpriseInformation", method = RequestMethod.GET)
	public String policyAdviceView(HttpSession session,Integer id) {
		
		//招聘信息
		Trecruit trecruit = (Trecruit)etechService.findObjectById(Trecruit.class, id);
		session.setAttribute("trecruit", trecruit);
		
		
		return "occupationIntroduction/enterpriseInformation";
	}
}
