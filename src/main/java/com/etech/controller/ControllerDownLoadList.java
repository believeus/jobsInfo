package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 下载中心列表
 * */
@Controller
public class ControllerDownLoadList {
	private static Log log = LogFactory.getLog(ControllerDownLoadList.class);

	@RequestMapping(value = "/xiazai", method = RequestMethod.GET)
	public String newsListView() {
		log.debug("current controller is newsListView !");
		return "dataChannel/xiazaizhongxinList";
	}
}
