package com.etech.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import com.etech.entity.CommonUser;
import com.etech.entity.EnterpriseUser;
import com.etech.service.CommonUserService;
import com.etech.service.EnterpriseUserService;

@Controller
public class ControllerUser {
	@Resource
	private CommonUserService commonUserService;
	@Resource
	private EnterpriseUserService enterpriseUserService;
	/**普通用户登录验证*/
	public String ajaxLoginValidComUser(){
		String result="";
		return result;
	}
	/**普通用户注册验证*/
	public String ajaxRegValidComUser(){
		String result="";
		return result;
	}
	/**企业用户注册验证*/
	public String ajaxRegEnterpriseComUser(){
		String result="";
		return result;
	}
	/**企业用户登录验证*/
	public String ajaxLoginValidEnterpriseUser(){
		String result="";
		return result;
	}
	/**一般用户注册*/
	@RenderMapping(value="/commonregister")
	public String commonuserReg(CommonUser commonUser){
		commonUserService.saveOrUpdate(commonUser);
		String result="";
		return result;
	}
	/**企业用户注册*/
	@RenderMapping(value="/enterpriseregister")
	public String enterpriseReg(EnterpriseUser enterpriseUser){
		enterpriseUserService.saveOrUpdate(enterpriseUser);
		String result="";
		return result;
	}
}
