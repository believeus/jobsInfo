package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 国家相关文件详情
 * */
@Controller
public class ControllerCountryFile {
	private static Log log = LogFactory.getLog(ControllerCountryFile.class);

	@RequestMapping(value = "/countryFile", method = RequestMethod.GET)
	public String policyAdviceView() {
		log.debug("current controller is policyAdviceView !");
		return "policyAdvice/countryFile";
	}
}
