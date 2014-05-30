package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 视频新闻
 * */
@Controller
public class ControllerVideosList {
	private static Log log = LogFactory.getLog(ControllerVideosList.class);

	@RequestMapping(value = "/videosList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "infoCenter/videosList";
	}
}
