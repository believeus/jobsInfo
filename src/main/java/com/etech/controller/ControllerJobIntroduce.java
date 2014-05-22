package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 职业介绍
 * */
@Controller
public class ControllerJobIntroduce {
	private static Log log = LogFactory.getLog(ControllerJobIntroduce.class);

	@RequestMapping(value = "/jobIntroduce", method = RequestMethod.GET)
	public String jobIntroduceView() {
		log.debug("current controller is jobIntroduceView !");
		return "occupationIntroduction";
	}
}
