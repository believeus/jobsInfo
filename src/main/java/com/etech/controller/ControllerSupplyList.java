package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 职业供给排行列表
 * */
@Controller
public class ControllerSupplyList {
	private static Log log = LogFactory.getLog(ControllerSupplyList.class);

	@RequestMapping(value = "/gongjipaihangList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "dataChannel/gongjipaihangList";
	}
}
