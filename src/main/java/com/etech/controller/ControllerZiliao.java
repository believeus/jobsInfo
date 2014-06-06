package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 资料下载详情
 * */
@Controller
public class ControllerZiliao {
	private static Log log = LogFactory.getLog(ControllerZiliao.class);

	@RequestMapping(value = "/ziliao", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "dataChannel/ziliao";
	}
}
