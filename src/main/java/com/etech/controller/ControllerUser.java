package com.etech.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etech.entity.TcomUser;
import com.etech.entity.TentUser;
import com.etech.service.EtechService;

@Controller
public class ControllerUser {

	@Resource
	private EtechService etechService;

	/**一般用户信息提交*/
	@RequestMapping(value = "/submitComUserInfo")
	public void submitComUserInfo(TcomUser comUser) {
		etechService.saveOrUpdate(comUser);
	}
	/**企业用户信息提交*/
	@RequestMapping(value = "/submitEntUserInfo")
	public void submitEntUserInfo(TentUser entUser) {
		etechService.saveOrUpdate(entUser);
	}
}
