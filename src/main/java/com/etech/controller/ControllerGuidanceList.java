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
 * 指导价位列表
 * */
@Controller
public class ControllerGuidanceList {

	@Resource
	private EtechService etechService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/zhidaojiaweiList", method = RequestMethod.GET)
	public String newsListView(HttpSession session) {
		
		//指导价位
		String hql="From TdataCenter dataCenter where dataCenter.type='15'";
		List<TdataCenter> wagePriceGuide = (List<TdataCenter>)etechService.findListByHQL(hql);
		session.setAttribute("wagePriceGuide", wagePriceGuide);
		
		return "dataChannel/zhidaojiaweiList";
	}
}
