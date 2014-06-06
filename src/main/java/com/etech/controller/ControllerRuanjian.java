package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 软件下载详情
 * */
@Controller
public class ControllerRuanjian {
	private static Log log = LogFactory.getLog(ControllerRuanjian.class);

	@RequestMapping(value = "/ruanjian", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "dataChannel/ruanjian";
	}
}
