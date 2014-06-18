package com.etech.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;

/**
 * 指导价位
 * */
@Controller
public class ControllerGuidance {

	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/guidance", method = RequestMethod.GET)
	public String newsListView(HttpSession session,Integer id) {
		TdataCenter dataCenter = (TdataCenter)etechService.findObjectById(TdataCenter.class, id);
		session.setAttribute("data", dataCenter);
		return "dataChannel/zhidaojiawei";
	}
}
