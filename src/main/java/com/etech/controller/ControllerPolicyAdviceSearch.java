package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 政策咨询-搜索
 * */
@Controller
public class ControllerPolicyAdviceSearch {
	private static Log log = LogFactory.getLog(ControllerPolicyAdviceSearch.class);

	@RequestMapping(value = "/policyAdviceSearch", method = RequestMethod.GET)
	public String policyAdviceView() {
		log.debug("current controller is policyAdviceView !");
		return "policyAdvice/policyAdviceSearch";
	}
}
