package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 指导价位列表
 * */
@Controller
public class ControllerGuidanceList {
	private static Log log = LogFactory.getLog(ControllerGuidanceList.class);

	@RequestMapping(value = "/zhidaojiaweiList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "dataChannel/zhidaojiaweiList";
	}
}
