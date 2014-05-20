package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 个人注册页
 * */
@Controller
public class ControllerPersonalReg {
	private static Log log = LogFactory.getLog(ControllerPersonalReg.class);

	@RequestMapping(value = "/personalreg", method = RequestMethod.GET)
	public String personalregView() {
		log.debug("current controller is personalregView !");
		return "index";
	}
}
