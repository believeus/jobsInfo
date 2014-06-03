package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 国家法律法规列表
 * */
@Controller
public class ControllerCountryLawList {
	private static Log log = LogFactory.getLog(ControllerCountryLawList.class);

	@RequestMapping(value = "/countryLawList", method = RequestMethod.GET)
	public String policyAdviceView() {
		log.debug("current controller is policyAdviceView !");
		return "policyAdvice/countryLawList";
	}
}
