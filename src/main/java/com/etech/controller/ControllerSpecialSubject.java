package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 专栏
 * */
@Controller
public class ControllerSpecialSubject {
	private static Log log = LogFactory.getLog(ControllerSpecialSubject.class);

	@RequestMapping(value = "/specialSubject", method = RequestMethod.GET)
	public String specialSubjectView() {
		log.debug("current controller is enterpriseRegView !");
		return "index";
	}
}
