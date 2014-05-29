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

import com.etech.entity.TentUser;
import com.etech.entity.TcomUser;
import com.etech.entity.TbaseUser;
import com.etech.service.EtechService;
import com.etech.util.EtechGobal;
import com.etech.util.JsonOutToBrower;

/** Begin Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com CreateReason:企业用户和普通用户注册*/
@Controller
public class ControllerRegister {
	private static final Log log = LogFactory.getLog(ControllerRegister.class);
	@Resource
	private EtechService userService;
	/** Begin Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:企业用户注册页面*/
	@RequestMapping(value = "/personalReg")
	public String personalRegister() {
		return "register/personalRegister";
	}
	/** End Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:普通用户注册页面*/
	
	
	/** Begin Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:ajax判断一般用户的ajax验证*/
	@RequestMapping(value="/ajaxComValidReg")
	public void ajaxComValidReg(TcomUser regUser,String submit,String comfirmPwd,HttpSession session,HttpServletResponse response){
		log.debug("current regUser reginName:"+regUser.getLoginName());
		TbaseUser sessionUser = (TbaseUser)session.getAttribute("sessionUser");
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
		// 用户注册
		if(StringUtils.isEmpty(sessionUser)){
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
		}
		log.debug("Idcard:"+regUser.getIdcard());
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
			//用户注册
			if(StringUtils.isEmpty(sessionUser)){
				//验证身份证号是否存在过
				TbaseUser user = (TbaseUser) userService.findObjectByProperty(TcomUser.class, EtechGobal.Idcard, regUser.getIdcard());
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
				String sex=sexIndex%2!=0?"man":"woman";
				log.debug("sex:"+regUser.getSex());
				message.put("property","sex");
				message.put("message",sex);
				JsonOutToBrower.out(message, response);
			}
		}
		//用户注册
		if(StringUtils.isEmpty(sessionUser)){
			TbaseUser user = (TbaseUser) userService.findObjectByProperty(TcomUser.class, EtechGobal.LoginName, regUser.getLoginName());
			if (!StringUtils.isEmpty(user)) {
				message.put("property","loginName");
				message.put("message","用户名已存在");
				JsonOutToBrower.out(message, response);
				return;
			}
		// 用户编辑
		}else{
			TbaseUser user = (TbaseUser) userService.findObjectByProperty(TcomUser.class, "id", regUser.getId());
			log.debug(user);
			// 编辑用户名和原用户名不等
			if(!user.getLoginName().equals(regUser.getLoginName())){
				user = (TbaseUser) userService.findObjectByProperty(TcomUser.class, EtechGobal.LoginName, regUser.getLoginName());
				if (!StringUtils.isEmpty(user)) {
					message.put("property","loginName");
					message.put("message","用户名已存在");
					JsonOutToBrower.out(message, response);
					return;
				}
			}
		}
		//表单点击提交
		log.debug("submit:"+submit);
		log.debug(submit.equals("submit"));
		if("submit".equals(submit)){
			// 注册
			if(StringUtils.isEmpty(sessionUser)){
				String password = DigestUtils.md5Hex(regUser.getPassword());
				regUser.setPassword(password);
			// 编辑个人资料
			}else{
				// 如果用户修改个人资料，并修改了密码,更新密码
				if(!StringUtils.isEmpty(regUser.getPassword())){
					String password = DigestUtils.md5Hex(regUser.getPassword());
					regUser.setPassword(password);
				}
			}
			regUser.setCreateDate(System.currentTimeMillis());
			regUser.setEditDate(System.currentTimeMillis());
			regUser.setLastLoginData(System.currentTimeMillis());
			userService.saveOrUpdate(regUser);
			session.setAttribute("sessionUser", regUser);
			message.put("message","success");
			JsonOutToBrower.out(message, response);
		}else {
			// 完成所有验证
			message.put("message","finish");
			JsonOutToBrower.out(message, response);
		}
	}
	/** End Author:wuqiwei Data:2014=05-26 Email:1058633117@qq.com AddReason:ajax判断一般用户的ajax验证*/
	
	
	/**Begin Author:wuqiwei Data:2014-05-26  Email:1058633117@qq.com:AddReason:企业注册登陆名验证*/
	@RequestMapping(value="/ajaxEnterpriseValidReg")
	public void ajaxEnterpriseValidReg(TentUser regUser,String submit,String comfirmPwd,HttpSession session,HttpServletResponse response){
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
		TbaseUser user = (TbaseUser) userService.findObjectByProperty(TentUser.class, EtechGobal.LoginName, regUser.getLoginName());
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
			String mustVilid="0";
			regUser.setStatus(mustVilid);
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