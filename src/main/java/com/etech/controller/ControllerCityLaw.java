package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 地方法律法规
 * */
@Controller
public class ControllerCityLaw {
	private static Log log = LogFactory.getLog(ControllerCityLaw.class);

	@RequestMapping(value = "/cityLaw", method = RequestMethod.GET)
	public String policyAdviceView() {
		log.debug("current controller is policyAdviceView !");
		return "policyAdvice/cityLaw";
	}
}
