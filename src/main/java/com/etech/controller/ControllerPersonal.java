package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *求职者中心
 * */
@Controller
public class ControllerPersonal {
	private static Log log = LogFactory.getLog(ControllerPersonal.class);

	@RequestMapping(value = "/personalreg", method = RequestMethod.GET)
	public String personalregView() {
		log.debug("current controller is personalregView !");
		return "employmentService/personalCenter";
	}
}
