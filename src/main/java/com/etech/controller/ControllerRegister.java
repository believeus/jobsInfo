package com.etech.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etech.entity.EnterpriseUser;
import com.etech.entity.TCommonUser;
import com.etech.entity.TUser;
import com.etech.service.UserService;
import com.etech.util.EtechGobal;
import com.etech.util.JsonOutToBrower;

/** Begin Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com CreateReason:企业用户和普通用户注册*/
@Controller
public class ControllerRegister {
	private static final Log log = LogFactory.getLog(ControllerRegister.class);
	@Resource
	private UserService userService;
	/** Begin Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:企业用户注册页面*/
	@RequestMapping(value = "/personalReg")
	public String personalRegister() {
		return "register/personalRegister";
	}
	/** End Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:普通用户注册页面*/
	
	
	/** Begin Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:ajax判断一般用户的ajax验证*/
	@RequestMapping(value="/ajaxComValidReg")
	public void ajaxComValidReg(TCommonUser regUser,String submit,String comfirmPwd,HttpSession session,HttpServletResponse response){
		log.debug("current regUser reginName:"+regUser.getLoginName());
		Map<String, Object> message=new HashMap<String, Object>();
		if(StringUtils.isEmpty(regUser.getLoginName())){
			message.put("property","loginName");
			message.put("message","用户名必填!");
			JsonOutToBrower.out(message, response);
			return;
		}
		boolean matches = regUser.getLoginName().matches("[a-zA-Z0-9]{6,}");
		if(matches==false){
			message.put("property","loginName");
			message.put("message","最少6位的英文字母或数字");
			JsonOutToBrower.out(message, response);
			return;
		}
		if(StringUtils.isEmpty(regUser.getPassword())){
			message.put("property","password");
			message.put("message","密码必填!");
			JsonOutToBrower.out(message, response);
			return;
		}
		if(StringUtils.isEmpty(comfirmPwd)){
			message.put("property","comfirmPwd");
			message.put("message","密码和确定密码必填!");
			JsonOutToBrower.out(message, response);
			return;
		}
		if(!regUser.getPassword().equals(comfirmPwd)){
			message.put("property","comfirmPwd");
			message.put("message","密码和确定密码不一致!");
			JsonOutToBrower.out(message, response);
			return;
		}
		log.debug("Idcard:"+regUser.getIdcard());
		String sex="finish";
		if(!StringUtils.isEmpty(regUser.getIdcard())){
			//身份证正则表达式
			boolean matcheIdCard1 = regUser.getIdcard().matches("^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[A-Z])$");
			boolean matcheIdCard2 = regUser.getIdcard().matches("/^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$/");
			// 身份证验证不匹配
			if(matcheIdCard1==false && matcheIdCard2==false){
				message.put("property","idcard");
				message.put("message","身份证格式不对");
				JsonOutToBrower.out(message, response);
				return;
			}
			//验证身份证号是否存在过
			TUser user = (TUser) userService.findObjectByProperty(TCommonUser.class, EtechGobal.Idcard, regUser.getIdcard());
			log.debug("idcard:"+regUser.getIdcard());
			log.debug("current user:"+user);
			if (!StringUtils.isEmpty(user)) {
				message.put("property","idcard");
				message.put("message","身份证号已存在,请重新填写");
				JsonOutToBrower.out(message, response);
				return;
			}
			//如果提交的表单中的性别和身份证计算的不一致,则返回身份证计算的性别
			int sexIndex = Integer.parseInt(regUser.getIdcard().substring(16,regUser.getIdcard().length()-1));
			sex=sexIndex%2!=0?"man":"woman";
			log.debug("sex:"+regUser.getSex());
			if(!regUser.getSex().equals(sex)){
				message.put("property","sex");
				message.put("message",sex);
				JsonOutToBrower.out(message, response);
				return;
			}
		}
		
		TUser user = (TUser) userService.findObjectByProperty(TCommonUser.class, EtechGobal.LoginName, regUser.getLoginName());
		if (!StringUtils.isEmpty(user)) {
			message.put("property","loginName");
			message.put("message","用户名已存在");
			JsonOutToBrower.out(message, response);
			return;
		}
		//表单点击提交
		if(!StringUtils.isEmpty(submit)&&submit.equals("submit")){
			String password = DigestUtils.md5Hex(regUser.getPassword());
			regUser.setCreateDate(System.currentTimeMillis());
			regUser.setEditDate(System.currentTimeMillis());
			regUser.setLastLoginData(System.currentTimeMillis());
			regUser.setPassword(password);
			userService.saveOrUpdate(regUser);
			session.setAttribute("sessionUser", regUser);
			session.setAttribute("clazz",regUser.getClass().getName());
			message.put("message","success");
			JsonOutToBrower.out(message, response);
		}else {
			// 完成所有验证
			message.put("message",sex);
			JsonOutToBrower.out(message, response);
		}
	}
	/** End Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:ajax判断一般用户的ajax验证*/
	
	
	/**Begin Author:wuqiwei Data:2014-05-26  Email:1058633117@qq.com:AddReason:企业注册登陆名验证*/
	@RequestMapping(value="/ajaxEnterpriseValidReg")
	public void ajaxEnterpriseValidReg(EnterpriseUser regUser,String submit,String comfirmPwd,HttpSession session,HttpServletResponse response){
		Map<String, Object> message=new HashMap<String, Object>();
		if(StringUtils.isEmpty(regUser.getLoginName())){
			message.put("property","loginName");
			message.put("message","重新填写用户名");
			JsonOutToBrower.out(message, response);
			return;
		}
		boolean matches = regUser.getLoginName().matches("[a-zA-Z0-9]{6,}");
		if(matches==false){
			message.put("property","loginName");
			message.put("message","最少6位的英文字母或数字");
			JsonOutToBrower.out(message, response);
			return;
		}
		if(StringUtils.isEmpty(regUser.getPassword())){
			message.put("property","password");
			message.put("message","密码必填!");
			JsonOutToBrower.out(message, response);
			return;
		}
		if(!regUser.getPassword().equals(comfirmPwd)){
			message.put("property","comfirmPwd");
			message.put("message","密码和确定密码不一致!");
			JsonOutToBrower.out(message, response);
			return;
		}
		TUser user = (TUser) userService.findObjectByProperty(EnterpriseUser.class, EtechGobal.LoginName, regUser.getLoginName());
		if (!StringUtils.isEmpty(user)) {
			message.put("property","loginName");
			message.put("message","用户名已存在");
			JsonOutToBrower.out(message, response);
			return;
		}
		if(!StringUtils.isEmpty(submit)&&submit.equals("submit")){
			String password = DigestUtils.md5Hex(regUser.getPassword());
			regUser.setCreateDate(System.currentTimeMillis());
			regUser.setEditDate(System.currentTimeMillis());
			regUser.setLastLoginData(System.currentTimeMillis());
			regUser.setPassword(password);
			userService.saveOrUpdate(regUser);
			session.setAttribute("sessionUser", regUser);
			session.setAttribute("clazz",regUser.getClass().getName());
			message.put("message","success");
			JsonOutToBrower.out(message, response);
		}else {
			// 完成所有验证
			message.put("message","finish");
			JsonOutToBrower.out(message, response);
		}
	}
	/**End Author:wuqiwei Data:2014-05-26  Email:1058633117@qq.com:AddReason:企业注册登陆名验证*/
	
	/** Begin Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:企业用户注册*/
	@RequestMapping(value = "/enterpriseReg")
	public String enterpriseRegister() {
		return "register/enterpriseRegister";
	}
	/** End Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:企业用户注册*/
}
/** End Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com CreateReason:企业用户和普通用户注册*/