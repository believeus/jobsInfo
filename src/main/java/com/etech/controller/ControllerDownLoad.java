package com.etech.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 下载中心
 * */
@Controller
public class ControllerDownLoad {
	private static Log log = LogFactory.getLog(ControllerDownLoad.class);

	@RequestMapping(value = "/downLoad", method = RequestMethod.GET)
	public String downLoad(int id,HttpServletRequest request) {
		log.debug("current controller is newsListView !");
		return "dataChannel/xiazaizhongxinList";
	}
}
