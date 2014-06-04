package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 职位需求排行列表
 * */
@Controller
public class ControllerDemandList {
	private static Log log = LogFactory.getLog(ControllerDemandList.class);

	@RequestMapping(value = "/xuqiupaihangList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "dataChannel/xuqiupaihangList";
	}
}
