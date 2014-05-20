package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 内设机构
 * */
@Controller
public class ControllerOrganization {
	private static Log log = LogFactory.getLog(ControllerOrganization.class);

	@RequestMapping(value = "/organization", method = RequestMethod.GET)
	public String organizationView() {
		log.debug("current controller is organizationView !");
		return "index";
	}
}
