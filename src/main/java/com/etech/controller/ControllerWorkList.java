package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 工作动态列表
 * */
@Controller
public class ControllerWorkList {
	private static Log log = LogFactory.getLog(ControllerWorkList.class);

	@RequestMapping(value = "/workList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "infoCenter/workList";
	}
}
