package com.etech.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TcomUser;
import com.etech.service.CommonUserService;
import com.etech.service.EtechService;

/**
 * 个人简历
 * */
@Controller
public class ControllerPersonalResume {
	
	@Resource
	private EtechService etechService;
	@Resource
	private CommonUserService commonUserService;
	@RequestMapping(value = "/personalResume", method = RequestMethod.GET)
	public String personalCenter(HttpSession session ,Integer id) {
		
		//求职信息
		TcomUser tcomUser = (TcomUser)etechService.findObjectById(TcomUser.class, id);
		session.setAttribute("tcomUser", tcomUser);
		
		// 获取推荐企业
		
		return "occupationIntroduction/personalResume";
	}
}
