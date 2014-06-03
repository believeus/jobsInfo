package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 主要职能
 * */
@Controller
public class ControllerMainFunction {
	private static Log log = LogFactory.getLog(ControllerMainFunction.class);

	@RequestMapping(value = "/mainFunction", method = RequestMethod.GET)
	public String organizationView() {
		log.debug("current controller is organizationView !");
		return "guide/mainFunction";
	}
}
