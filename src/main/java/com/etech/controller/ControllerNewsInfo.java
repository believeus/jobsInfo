package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 新闻详情
 * */
@Controller
public class ControllerNewsInfo {
	private static Log log = LogFactory.getLog(ControllerNewsInfo.class);

	@RequestMapping(value = "/newsInfo", method = RequestMethod.GET)
	public String newsInfoView() {
		log.debug("current controller is newsInfoView !");
		return "index";
	}
}
