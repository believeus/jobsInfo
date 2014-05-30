package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 图片新闻列表
 * */
@Controller
public class ControllerImagesList {
	private static Log log = LogFactory.getLog(ControllerImagesList.class);

	@RequestMapping(value = "/imagesList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "infoCenter/imagesList";
	}
}
