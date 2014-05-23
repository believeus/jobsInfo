package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 工作指南
 * */
@Controller
public class ControllerGuide {
	private static Log log = LogFactory.getLog(ControllerGuide.class);

	@RequestMapping(value = "/guide", method = RequestMethod.GET)
	public String guideView() {
		log.debug("current controller is guideView !");
		return "guide/guide";
	}
}
