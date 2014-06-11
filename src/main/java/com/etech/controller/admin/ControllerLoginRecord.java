package com.etech.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller - 登录记录
 * 
 * @author e3dmall Team
 * @version 1.0
 */
@Controller("controllerAdminLoginRecord")
@RequestMapping("/admin/loginRecord")
public class ControllerLoginRecord{

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "/admin/loginRecord/list";
	}
	
}