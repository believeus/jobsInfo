package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 简历指南列表
 * */
@Controller
public class ControllerJianlizhinanList {
	private static Log log = LogFactory.getLog(ControllerJianlizhinanList.class);

	@RequestMapping(value = "/jianlizhinanList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "occupationIntroduction/jianlizhinanList";
	}
}
