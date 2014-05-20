package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 下载专区
 * */
@Controller
public class ControllerDownloadZone {
	private static Log log = LogFactory.getLog(ControllerDownloadZone.class);

	@RequestMapping(value = "/downloadZone", method = RequestMethod.GET)
	public String downloadZoneView() {
		log.debug("current controller is imgShowView !");
		return "index";
	}
}
