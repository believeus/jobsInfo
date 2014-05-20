package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 局领导
 * */
@Controller
public class ControllerLeader {
	private static Log log = LogFactory.getLog(ControllerLeader.class);

	@RequestMapping(value = "/leader", method = RequestMethod.GET)
	public String leaderView() {
		log.debug("current controller is leaderView !");
		return "index";
	}
}
