package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 高级搜索页
 * */
@Controller
public class ControllerSearch {
	private static Log log = LogFactory.getLog(ControllerSearch.class);

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchView() {
		log.debug("current controller is searchView !");
		return "index";
	}
}
