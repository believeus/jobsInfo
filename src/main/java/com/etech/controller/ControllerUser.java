package com.etech.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.etech.entity.TcomUser;
import com.etech.service.EtechService;

@Controller
public class ControllerUser {

	@Resource
	private EtechService etechService;

	@RequestMapping(value = "/submitComUserInfo")
	public void submitComUserInfo(TcomUser comUser) {
		etechService.saveOrUpdate(comUser);
	}
}
