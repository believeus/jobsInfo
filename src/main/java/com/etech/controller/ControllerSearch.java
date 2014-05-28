package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 搜索
 * */
@Controller
public class ControllerSearch {
	private static Log log = LogFactory.getLog(ControllerSearch.class);

	/**简单搜索*/
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchView() {
		log.debug("current controller is searchView !");
		return "index";
	}
	/**高级搜索*/
	@RequestMapping(value = "/advancedSearch", method = RequestMethod.GET)
	public String advancedSearchView() {
		log.debug("current controller is searchView !");
		return "occupationIntroduction/advancedSearch";
	}
}
