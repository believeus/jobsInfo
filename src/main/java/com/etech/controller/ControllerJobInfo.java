package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 职业详情
 * */
@Controller
public class ControllerJobInfo {
	private static Log log = LogFactory.getLog(ControllerJobInfo.class);

	@RequestMapping(value = "/jobInfo", method = RequestMethod.GET)
	public String JobInfoView() {
		log.debug("current controller is JobInfoView !");
		return "index";
	}
}
