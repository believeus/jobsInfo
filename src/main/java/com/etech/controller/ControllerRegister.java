package com.etech.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etech.entity.TCommonUser;
import com.etech.service.CommonUserService;
import com.etech.util.EtechGobal;
import com.etech.util.JsonOutToBrower;

/** Begin Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com CreateReason:企业用户和普通用户注册*/
@Controller
public class ControllerRegister {
	private static final Log log = LogFactory.getLog(ControllerRegister.class);
	@Resource
	private CommonUserService commonUserService;
	/** Begin Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:企业用户注册页面*/
	@RequestMapping(value = "/personalReg")
	public String personalRegister() {
		return "register/personalRegister";
	}
	/** End Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:普通用户注册页面*/
	
	/** Begin Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:普通用户注册*/
	public String submitpersonalReg(TCommonUser user,HttpServletRequest request){
		if(user.getLoginName()!=null || user.getPassword()!=null){
			String referer=request.getHeader("Referer");
			String password = DigestUtils.md5Hex(user.getPassword());
			user.setCreateDate(System.currentTimeMillis());
			user.setEditDate(System.currentTimeMillis());
			user.setPassword(password);
			commonUserService.saveOrUpdate(user);
			return "redirect:"+referer; 
		}else{
			request.setAttribute("email", user.getEmail());
			request.setAttribute("phoneNum", user.getPhoneNum());
			return "register/personalRegister";
		}
	}
	/** End Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:普通用户注册*/
	
	/** Begin Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:ajax判断用户名是否已经存在*/
	@RequestMapping(value="/ajaxValidReg")
	public void ajaxValidReg(String loginName,String idcard,HttpServletResponse response){
		log.debug("loginName:"+loginName);
		TCommonUser user = (TCommonUser)commonUserService.findObjectByProperty(TCommonUser.class, EtechGobal.LoginName, loginName);
		Map<String, Object> message=new HashMap<String, Object>();
		if (user!=null) {
			message.put("messageLoginName","用户名已存在，请重新填写用户名");
		}
		user = (TCommonUser)commonUserService.findObjectByProperty(TCommonUser.class, EtechGobal.Idcard, idcard);
		if (user!=null) {
			message.put("messagePwd","身份证号已存在,请重新填写");
		}
		JsonOutToBrower.out(message, response);
	}
	/** End Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:ajax判断用户名是否已经存在*/
	
	/** Begin Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:企业用户注册*/
	@RequestMapping(value = "/enterpriseReg")
	public String enterpriseRegister() {
		return "register/enterpriseRegister";
	}
	/** End Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:企业用户注册*/
}
/** End Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com CreateReason:企业用户和普通用户注册*/