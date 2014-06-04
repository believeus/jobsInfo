package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 分析报告列表
 * */
@Controller
public class ControllerReportList {
	private static Log log = LogFactory.getLog(ControllerReportList.class);

	@RequestMapping(value = "/fenxibaogaoList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "dataChannel/fenxibaogaoList";
	}
}
