package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 局长信箱
 * */
@Controller
public class ControllerMailBox {
	private static Log log = LogFactory.getLog(ControllerMailBox.class);

	@RequestMapping(value = "/mailBox", method = RequestMethod.GET)
	public String mailBoxView() {
		log.debug("current controller is mailBoxView !");
		return "MailBox/mailBox";
	}
}
