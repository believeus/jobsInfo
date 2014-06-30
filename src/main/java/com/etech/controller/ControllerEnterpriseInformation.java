package com.etech.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TcomUser;
import com.etech.entity.TentImgVedio;
import com.etech.entity.Trecruit;
import com.etech.service.EnterpriseUserService;
import com.etech.service.EtechService;

/**
 * 企业信息
 * */
@Controller
public class ControllerEnterpriseInformation {

	@Resource
	private EtechService etechService;
	@Resource
	private EnterpriseUserService enterpriseUserService;
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/enterpriseInformation", method = RequestMethod.GET)
	public String policyAdviceView(HttpSession session,Integer id,HttpServletRequest request) {
		
		
		Trecruit trecruit = (Trecruit)etechService.findObjectById(Trecruit.class, id);
		session.setAttribute("trecruit", trecruit);
		
		//招聘信息
		List<Trecruit> trecruitList = (List<Trecruit>)etechService.getListByProperty(Trecruit.class, "entUser.id", trecruit.getEntUser().getId());
		request.setAttribute("trecruitList", trecruitList);
		String hql="From TentImgVedio vedio where vedio.type='1'";
		List<TentImgVedio> vedios = (List<TentImgVedio>)etechService.findListByHQL(hql);
		request.setAttribute("vedios", vedios);
		hql="From TentImgVedio info left join fetch info.entUser as user where user.id="+id+"  and info.type='2'";
		List<TentImgVedio> Maps=(List<TentImgVedio>)etechService.findListByHQL(hql);
		request.setAttribute("Maps", Maps);
		hql="From Trecruit recruit left join fetch recruit.entUser as user where  user.id='"+id+"'";
		List<Trecruit> recruits = (List<Trecruit>)etechService.findListByHQL(hql);
		List<TcomUser> talentRecommend =(List<TcomUser>)enterpriseUserService.talentRecommend(recruits);
		request.setAttribute("talentRecommend", talentRecommend);
		return "occupationIntroduction/enterpriseInformation";
	}
}
