package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 企业信息
 * */
@Controller
public class ControllerEnterpriseInformation {
	private static Log log = LogFactory.getLog(ControllerEnterpriseInformation.class);

	@RequestMapping(value = "/enterpriseInformation", method = RequestMethod.GET)
	public String policyAdviceView() {
		log.debug("current controller is policyAdviceView !");
		return "occupationIntroduction/enterpriseInformation";
	}
}
