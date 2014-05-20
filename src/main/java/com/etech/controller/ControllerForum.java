package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 论坛
 * */
@Controller
public class ControllerForum {
	private static Log log = LogFactory.getLog(ControllerForum.class);

	@RequestMapping(value = "/Forum", method = RequestMethod.GET)
	public String forumView() {
		log.debug("current controller is forumView !");
		return "index";
	}
}
