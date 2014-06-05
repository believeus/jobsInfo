package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 就业公告列表
 * */
@Controller
public class ControllerjiuyegonggaoList {
	private static Log log = LogFactory.getLog(ControllerjiuyegonggaoList.class);

	@RequestMapping(value = "/jiuyegonggaoList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "occupationIntroduction/jiuyegonggaoList";
	}
}
