package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 分析报告
 * */
@Controller
public class ControllerReport {
	private static Log log = LogFactory.getLog(ControllerReport.class);

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "dataChannel/fenxibaogao";
	}
}
