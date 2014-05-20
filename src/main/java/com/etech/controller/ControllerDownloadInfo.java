package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 下载详情
 * */
@Controller
public class ControllerDownloadInfo {
	private static Log log = LogFactory.getLog(ControllerDownloadInfo.class);

	@RequestMapping(value = "/downloadInfo", method = RequestMethod.GET)
	public String downloadInfoView() {
		log.debug("current controller is imgShowView !");
		return "index";
	}
}
