package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 面试宝典列表
 * */
@Controller
public class ControllerMianshibaodianList {
	private static Log log = LogFactory.getLog(ControllerMianshibaodianList.class);

	@RequestMapping(value = "/mianshibaodianList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "occupationIntroduction/mianshibaodianList";
	}
}
