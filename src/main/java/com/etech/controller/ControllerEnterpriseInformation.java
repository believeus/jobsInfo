package com.etech.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.entity.TentImgVedio;
import com.etech.entity.Trecruit;
import com.etech.service.EtechService;

/**
 * 企业信息
 * */
@Controller
public class ControllerEnterpriseInformation {

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/enterpriseInformation", method = RequestMethod.GET)
	public String policyAdviceView(HttpSession session,Integer id,HttpServletRequest request) {
		
		//招聘信息
		Trecruit trecruit = (Trecruit)etechService.findObjectById(Trecruit.class, id);
		session.setAttribute("trecruit", trecruit);
		String hql="From TentImgVedio vedio where vedio.type='1'";
		List<TentImgVedio> vedios = (List<TentImgVedio>)etechService.findListByHQL(hql);
		System.out.println(vedios.size());
		request.setAttribute("vedios", vedios);
		return "occupationIntroduction/enterpriseInformation";
	}
}
