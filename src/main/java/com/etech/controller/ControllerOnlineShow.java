package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 网上展示厅
 * */
@Controller
public class ControllerOnlineShow {
	private static Log log = LogFactory.getLog(ControllerOnlineShow.class);

	@RequestMapping(value = "/onlineShow", method = RequestMethod.GET)
	public String onlineShowView() {
		log.debug("current controller is imgShowView !");
		return "onlineShow/onlineShow";
	}
}
