package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 公示公告详情
 * */
@Controller
public class ControllerPublicityInfo {
	private static Log log = LogFactory.getLog(ControllerPublicityInfo.class);

	@RequestMapping(value = "/publicityInfo", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "infoCenter/publicityInfo";
	}
}
