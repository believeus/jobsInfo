package com.etech.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ControllerAdmin {
	
	@RequestMapping(value = "/admin/admin", method = RequestMethod.GET)
	public String admin(){ 
		return "admin/login";
	}
}
