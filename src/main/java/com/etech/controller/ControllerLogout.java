package com.etech.controller;

import javax.servlet.http.HttpServletRequest;
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
	public String logout(HttpServletRequest request) {
		log.debug("current user logout");
		request.getSession().invalidate();
		//退出之后停留在当前页面
		StringBuffer currentURL = request.getRequestURL();
		return "redirect:"+currentURL.toString(); 
	}
}
