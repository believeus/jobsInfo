package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 表格下载详情
 * */
@Controller
public class ControllerBiaoge {
	private static Log log = LogFactory.getLog(ControllerBiaoge.class);

	@RequestMapping(value = "/biaoge", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "dataChannel/biaoge";
	}
}
