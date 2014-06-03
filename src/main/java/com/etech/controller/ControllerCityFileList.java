package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 地方相关文件列表
 * */
@Controller
public class ControllerCityFileList {
	private static Log log = LogFactory.getLog(ControllerCityFileList.class);

	@RequestMapping(value = "/cityFileList", method = RequestMethod.GET)
	public String policyAdviceView() {
		log.debug("current controller is policyAdviceView !");
		return "policyAdvice/cityFileList";
	}
}
