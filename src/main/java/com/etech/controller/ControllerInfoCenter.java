package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 咨询中心
 * */
@Controller
public class ControllerInfoCenter {
	private static Log log = LogFactory.getLog(ControllerInfoCenter.class);

	@RequestMapping(value = "/infoCenter", method = RequestMethod.GET)
	public String infoCenterView() {
		log.debug("current controller is infoCenterView !");
		return "index";
	}
}
