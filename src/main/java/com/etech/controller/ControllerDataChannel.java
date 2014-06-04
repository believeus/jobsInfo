package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 数据频道
 * */
@Controller
public class ControllerDataChannel {
	private static Log log = LogFactory.getLog(ControllerDataChannel.class);

	@RequestMapping(value = "/dataChannel", method = RequestMethod.GET)
	public String dataChanelView() {
		log.debug("current controller is dataChanelView !");
		return "dataChannel/dataChannel";
	}
}
