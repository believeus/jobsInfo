package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 表格下载列表
 * */
@Controller
public class ControllerBiaogeList {
	private static Log log = LogFactory.getLog(ControllerBiaogeList.class);

	@RequestMapping(value = "/biaogeList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "dataChannel/biaogeList";
	}
}
