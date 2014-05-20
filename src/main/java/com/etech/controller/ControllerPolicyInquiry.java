package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 政策查询
 * */
@Controller
public class ControllerPolicyInquiry {
	private static Log log = LogFactory.getLog(ControllerPolicyInquiry.class);

	@RequestMapping(value = "/policyInquiry", method = RequestMethod.GET)
	public String policyInquiryView() {
		log.debug("current controller is policyInquiryView !");
		return "index";
	}
}
