package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 面试宝典
 * */
@Controller
public class ControllerMianshibaodian {
	private static Log log = LogFactory.getLog(ControllerMianshibaodian.class);

	@RequestMapping(value = "/mianshibaodian", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "occupationIntroduction/mianshibaodian";
	}
}
