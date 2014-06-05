package com.etech.controller;


import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.etech.service.EtechService;

/**
 * 个人简历
 * */
@Controller
public class ControllerPersonalResume {
	private static Log log = LogFactory.getLog(ControllerPersonalResume.class);
	
	@Resource
	private EtechService etechService;
	
	@RequestMapping(value = "/personalResume", method = RequestMethod.GET)
	public String personalCenter() {
		log.debug("current controller is personalCenter !");
		return "occupationIntroduction/personalResume";
	}
}
