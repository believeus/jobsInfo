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
import com.etech.entity.TentUser;
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
	public String policyAdviceView(HttpSession session,Integer id,String vid,HttpServletRequest request) {
		//id 招聘信息id
		//eid = trecruit.getEntUser().getId() 企业id
		Trecruit trecruit = (Trecruit)etechService.findObjectById(Trecruit.class, id);
		TentUser tentUser = new TentUser();
		if (trecruit != null) {
			tentUser = (TentUser)etechService.findObjectById(TentUser.class, trecruit.getEntUser().getId());
		}
		session.setAttribute("trecruit", trecruit);
		session.setAttribute("entUser", tentUser);
		if (vid != null) {//点击视频
			TentImgVedio tentImgVedio = (TentImgVedio)etechService.findObjectById(TentImgVedio.class, Integer.parseInt(vid));
			session.setAttribute("tentImgVedio", tentImgVedio);
		}
		
		//招聘信息
		String hql = "From Trecruit recruit where recruit.entUser.id='"+trecruit.getEntUser().getId()+"' and recruit.entUser.disable='0' and recruit.status='1' and  recruit.isview='发布'";
		List<Trecruit> trecruitList = (List<Trecruit>)etechService.findListByHQL(hql);
		request.setAttribute("trecruitList", trecruitList);
		hql="From TentImgVedio vedio where vedio.type='1' and vedio.entUser.id='"+trecruit.getEntUser().getId()+"'";
		List<TentImgVedio> vedios = (List<TentImgVedio>)etechService.findListByHQL(hql);
		request.setAttribute("vedios", vedios);
		hql="From TentImgVedio info left join fetch info.entUser as user where user.id="+trecruit.getEntUser().getId()+"  and info.type='2'";
		List<TentImgVedio> Maps=(List<TentImgVedio>)etechService.findListByHQL(hql);
		request.setAttribute("Maps", Maps);
		hql="From Trecruit recruit left join fetch recruit.entUser as user where  user.id='"+trecruit.getEntUser().getId()+"'";
		List<Trecruit> recruits = (List<Trecruit>)etechService.findListByHQL(hql);
		List<TcomUser> talentRecommend =(List<TcomUser>)enterpriseUserService.talentRecommend(recruits);
		request.setAttribute("talentRecommend", talentRecommend);
		String host=request.getHeader("Host");
		request.setAttribute("host", host);
		return "occupationIntroduction/enterpriseInformation";
	}
}
