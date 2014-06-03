package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 求职指导
 * */
@Controller
public class ControllerQiuzhi {
	private static Log log = LogFactory.getLog(ControllerQiuzhi.class);

	@RequestMapping(value = "/qiuzhizhidao", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "occupationIntroduction/qiuzhizhidao";
	}
}
