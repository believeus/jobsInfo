package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 招聘会列表
 * */
@Controller
public class ControllerZhaopinhuiList {
	private static Log log = LogFactory.getLog(ControllerZhaopinhuiList.class);

	@RequestMapping(value = "/zhaopinhuiList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "occupationIntroduction/zhaopinhuiList";
	}
}
