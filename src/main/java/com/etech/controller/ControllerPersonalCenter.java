package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 个人中心
 * */
@Controller
public class ControllerPersonalCenter {
	private static Log log = LogFactory.getLog(ControllerPersonalCenter.class);

	@RequestMapping(value = "/personalCenter", method = RequestMethod.GET)
	public String personalCenter() {
		log.debug("current controller is personalCenter !");
		return "center/personalCenter";
	}
}
