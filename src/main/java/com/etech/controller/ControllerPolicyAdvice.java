package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 政策咨询
 * */
@Controller
public class ControllerPolicyAdvice {
	private static Log log = LogFactory.getLog(ControllerPolicyAdvice.class);

	@RequestMapping(value = "/policyAdvice", method = RequestMethod.GET)
	public String policyAdviceView() {
		log.debug("current controller is policyAdviceView !");
		return "index";
	}
}
