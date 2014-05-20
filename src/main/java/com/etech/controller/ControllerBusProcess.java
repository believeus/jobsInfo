package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 业务办理流程
 * */
@Controller
public class ControllerBusProcess {
	private static Log log = LogFactory.getLog(ControllerBusProcess.class);

	@RequestMapping(value = "/busProcess", method = RequestMethod.GET)
	public String busProcessView() {
		log.debug("current controller is busProcessView !");
		return "index";
	}
}
