package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 图片展示详情
 * */
@Controller
public class ControllerImgShow {
	private static Log log = LogFactory.getLog(ControllerImgShow.class);

	@RequestMapping(value = "/imgShow", method = RequestMethod.GET)
	public String imgShowView() {
		log.debug("current controller is imgShowView !");
		return "infoCenter/imageInfo";
	}
}
