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
		String hql="From TdataCenter dataCenter where dataCenter.type='9'";
		List<TdataCenter> zhaopinhuiService = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("zhaopinhuiService", zhaopinhuiService);
		
		//面试宝典
		hql="From TdataCenter dataCenter where dataCenter.type='25'";
		List<TdataCenter> mianshibaodianService = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("mianshibaodianService", mianshibaodianService);
		
		//求职指导
		hql="From TdataCenter dataCenter where dataCenter.type='26'";
		List<TdataCenter> qiuzhizhidaoService = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("qiuzhizhidaoService", qiuzhizhidaoService);
		
		//简历指南
		hql="From TdataCenter dataCenter where dataCenter.type='27'";
		List<TdataCenter> jianlizhinanService = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("jianlizhinanService", jianlizhinanService);
		
		return "occupationIntroduction/occupationIntroduction";
	}
}
