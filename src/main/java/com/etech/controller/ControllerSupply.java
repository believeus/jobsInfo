package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 职位供给排行
 * */
@Controller
public class ControllerSupply {
	private static Log log = LogFactory.getLog(ControllerSupply.class);

	@RequestMapping(value = "/supply", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "dataChannel/gongjipaihang";
	}
}
