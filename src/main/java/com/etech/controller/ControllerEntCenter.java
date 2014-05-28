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
public class ControllerEntCenter {
	private static Log log = LogFactory.getLog(ControllerEntCenter.class);

	@RequestMapping(value = "/enterpriseCenter", method = RequestMethod.GET)
	public String enterpriseCenter() {
		log.debug("current controller is enterpriseCenter !");
		return "center/enterpriseCenter";
	}
}
