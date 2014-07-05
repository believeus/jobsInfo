package com.etech.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TcomUser;
import com.etech.entity.TdataCenter;
import com.etech.entity.TentImgVedio;
import com.etech.entity.Trecruit;
import com.etech.service.EtechService;

/**
 * 职业介绍
 * */
@Controller
public class ControllerJobIntroduce {

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/jobIntroduce", method = RequestMethod.GET)
	public String jobIntroduceView(HttpSession session) {
		
		//招聘会
		String hql="From TdataCenter dataCenter where dataCenter.type='9' order by id desc";
		List<TdataCenter> zhaopinhuiService = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("zhaopinhuiService", zhaopinhuiService);
		
		// 公告公示
		hql="From TdataCenter dataCenter where dataCenter.type='2' order by id desc";
		List<TdataCenter> notices = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("notices",notices ); 
		
		//面试宝典
		hql="From TdataCenter dataCenter where dataCenter.type='25' order by id desc";
		List<TdataCenter> mianshibaodianService = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("mianshibaodianService", mianshibaodianService);
		
		//求职指导
		hql="From TdataCenter dataCenter where dataCenter.type='26' order by id desc";
		List<TdataCenter> qiuzhizhidaoService = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("qiuzhizhidaoService", qiuzhizhidaoService);
		
		//简历指南
		hql="From TdataCenter dataCenter where dataCenter.type='27' order by id desc";
		List<TdataCenter> jianlizhinanService = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("jianlizhinanService", jianlizhinanService);
		
		//企业电子图
		hql="From TdataCenter dataCenter where dataCenter.type='30' order by id desc";
		List<TdataCenter> enterpriseHeaderImgs = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("enterpriseHeaderImgs", enterpriseHeaderImgs);
		
		//招聘信息 审核通过的status='1'  所属企业没有被删除的disable='0'
		hql = "From Trecruit trecruit where trecruit.status='1' and trecruit.isview='发布' and trecruit.entUser.disable='0' order by id desc";
		List<Trecruit> zhaopList = (List<Trecruit>)etechService.findListByHQL(hql);
		session.setAttribute("zhaopList", zhaopList); 
		
		//求职信息   所属企业没有被删除的disable='0'
		hql = "From TcomUser tcomUser where tcomUser.disable='0' order by id desc";
		List<TcomUser> qiuzhiList = (List<TcomUser>)etechService.findListByHQL(hql);
		session.setAttribute("qiuzhiList", qiuzhiList); 
		
		//企业图片
		hql = "From TentImgVedio tentImgVedio where tentImgVedio.type = '2' order by id desc";
		List<TentImgVedio> headImgs = (List<TentImgVedio>)etechService.findListByHQL(hql);
		session.setAttribute("headImgs", headImgs); 
		
		return "occupationIntroduction/occupationIntroduction";
	}
}
