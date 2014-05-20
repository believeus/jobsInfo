package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 新闻列表
 * */
@Controller
public class ControllerNewsList {
	private static Log log = LogFactory.getLog(ControllerNewsList.class);

	@RequestMapping(value = "/newsList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "index";
	}
}
