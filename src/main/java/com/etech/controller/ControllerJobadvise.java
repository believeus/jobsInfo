package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 职业咨询
 * */
@Controller
public class ControllerJobadvise {
	private static Log log = LogFactory.getLog(ControllerJobadvise.class);

	@RequestMapping(value = "/jobadvise", method = RequestMethod.GET)
	public String jobadviseView() {
		log.debug("current controller is searchView !");
		return "index";
	}
}
