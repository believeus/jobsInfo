package com.etech.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etech.entity.Tadmin;
import com.etech.entity.TbaseUser;

/**
 * 首页面
 * */
@Controller
public class ControllerIndex {
	private static Log log = LogFactory.getLog(ControllerIndex.class);

	@RequestMapping(value = "/index")
	public String defaultIndex(HttpServletRequest request) {
		/*Begin Author:wuqiwei Data:2014-06-11 AddReason:shiro登录成功之后会跳转到主页面,此处控制后台登录后进入后台主页面*/
		HttpSession session = request.getSession();
		String refer=request.getHeader("Referer");
		TbaseUser sessionUser = (TbaseUser)session.getAttribute("sessionUser");
		if(!StringUtils.isEmpty(sessionUser)){
			if(sessionUser instanceof Tadmin){
				if(refer.contains("/admin/login.jhtml")){
					return "redirect:/admin/common/main.jhtml";
				}
			}
		}
		/*End Author:wuqiwei Data:2014-06-11 AddReason:shiro登录成功之后会跳转到主页面,此处控制后台登录后进入后台主页面*/
		log.debug("current controller is defaultIndex !");
		return "index";
	}
}
