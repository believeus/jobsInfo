package com.etech.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TcomInfo;
import com.etech.entity.TcomUser;
import com.etech.entity.Trecruit;
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
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/personalResume", method = RequestMethod.GET)
	public String personalCenter(HttpSession session,HttpServletRequest request ,Integer id) {
		//求职信息
		TcomUser tcomUser = (TcomUser)etechService.findObjectById(TcomUser.class, id);
		request.setAttribute("tcomUser", tcomUser);
		
		String hql="From TcomInfo comInfo left join fetch comInfo.comUser as user where comInfo.infoType='4' and user.id='"+id+"'";;
		List<TcomInfo> volunteers = (List<TcomInfo>)etechService.findListByHQL(hql);
		List<Trecruit> recommendTrecruit = commonUserService.enterpriseRecommend(volunteers);
		request.setAttribute("recommendTrecruit", recommendTrecruit);
		// 获取推荐企业
		
		return "occupationIntroduction/personalResume";
	}
}
