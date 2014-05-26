package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 企业注册页
 * */
@Controller
public class ControllerEnterprise {
	private static Log log = LogFactory.getLog(ControllerEnterprise.class);

	@RequestMapping(value = "/enterpriseReg", method = RequestMethod.GET)
	public String enterpriseRegView() {
		log.debug("current controller is enterpriseRegView !");
		return "index";
	}
}
