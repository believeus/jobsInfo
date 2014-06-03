package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 简历指南
 * */
@Controller
public class ControllerJianlizhinan {
	private static Log log = LogFactory.getLog(ControllerJianlizhinan.class);

	@RequestMapping(value = "/jianlizhinan", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "occupationIntroduction/jianlizhinan";
	}
}
