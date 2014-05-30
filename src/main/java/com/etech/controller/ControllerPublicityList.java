package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 公示公告
 * */
@Controller
public class ControllerPublicityList {
	private static Log log = LogFactory.getLog(ControllerPublicityList.class);

	@RequestMapping(value = "/publicityList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "infoCenter/publicityList";
	}
}
