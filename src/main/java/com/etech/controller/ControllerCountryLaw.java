package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 国家法律法规
 * */
@Controller
public class ControllerCountryLaw {
	private static Log log = LogFactory.getLog(ControllerCountryLaw.class);

	@RequestMapping(value = "/countryLaw", method = RequestMethod.GET)
	public String policyAdviceView() {
		log.debug("current controller is policyAdviceView !");
		return "policyAdvice/countryLaw";
	}
}
