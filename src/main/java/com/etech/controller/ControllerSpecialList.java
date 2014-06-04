package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 专题列表
 * */
@Controller
public class ControllerSpecialList {
	private static Log log = LogFactory.getLog(ControllerSpecialList.class);

	@RequestMapping(value = "/specialList", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "infoCenter/specialList";
	}
}
