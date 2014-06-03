package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 工作动态详情
 * */
@Controller
public class ControllerWorkInfo {
	private static Log log = LogFactory.getLog(ControllerWorkInfo.class);

	@RequestMapping(value = "/workInfo", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "infoCenter/workInfo";
	}
}
