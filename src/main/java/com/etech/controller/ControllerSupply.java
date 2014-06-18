package com.etech.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;

/**
 * 职位供给排行
 * */
@Controller
public class ControllerSupply {

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/supply", method = RequestMethod.GET)
	public String newsListView(HttpSession session,Integer id) {
		TdataCenter dataCenter = (TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		session.setAttribute("data", dataCenter);
		return "dataChannel/gongjipaihang";
	}
}
