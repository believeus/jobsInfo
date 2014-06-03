package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 地方法律法规列表
 * */
@Controller
public class ControllerCityLawList {
	private static Log log = LogFactory.getLog(ControllerCityLawList.class);

	@RequestMapping(value = "/cityLawList", method = RequestMethod.GET)
	public String policyAdviceView() {
		log.debug("current controller is policyAdviceView !");
		return "policyAdvice/cityLawList";
	}
}
