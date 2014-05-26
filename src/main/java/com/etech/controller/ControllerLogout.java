package com.etech.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 工作指南
 * */
@Controller
public class ControllerLogout {
	private static Log log = LogFactory.getLog(ControllerLogout.class);

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		log.debug("current user logout");
		session.invalidate();
		return "redirect:/"; 
	}
}
