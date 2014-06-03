package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 地方相关文件
 * */
@Controller
public class ControllerCityFile {
	private static Log log = LogFactory.getLog(ControllerCityFile.class);

	@RequestMapping(value = "/cityFile", method = RequestMethod.GET)
	public String policyAdviceView() {
		log.debug("current controller is policyAdviceView !");
		return "policyAdvice/cityFile";
	}
}
