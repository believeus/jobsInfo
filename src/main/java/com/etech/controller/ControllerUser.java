package com.etech.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etech.entity.TcomUser;
import com.etech.entity.TentUser;
import com.etech.service.EtechService;
import com.etech.util.JsonOutToBrower;

@Controller
public class ControllerUser {

	@Resource
	private EtechService etechService;

	/**一般用户信息提交*/
	@RequestMapping(value = "/submitComUserInfo")
	public void submitComUserInfo(TcomUser comUser,HttpServletResponse response) {
		Map<String, Object> map=new HashMap<String,Object>();
		try{
			etechService.saveOrUpdate(comUser);
			map.put("message", "success");
		}catch(Exception ex){
			map.put("message", "error");
			JsonOutToBrower.out(map, response);
		}
	}
	/**企业用户信息提交*/
	@RequestMapping(value = "/submitEntUserInfo")
	public void submitEntUserInfo(TentUser entUser) {
		etechService.saveOrUpdate(entUser);
	}
}
