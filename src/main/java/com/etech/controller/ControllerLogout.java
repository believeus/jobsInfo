package com.etech.controller;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 工作指南
 * */
@Controller
public class ControllerLogout {
	private static Log log = LogFactory.getLog(ControllerLogout.class);

	@RequestMapping(value = "/adminLogout", method = RequestMethod.GET)
	public void adminLogout(HttpServletResponse response) throws Exception {
		log.debug("current user logout");
		try {
			Subject currentUser = SecurityUtils.getSubject();
			if (SecurityUtils.getSubject().getSession() != null) {
				currentUser.logout();
			}
			// 退出之后停留在当前页面
		} catch (Exception e) {
			e.printStackTrace();
		}
		StringBuilder script=new StringBuilder();
		script.append("<script>").append("top.location.href='/admin/login.jhtml'").append("</script>");
		PrintWriter pw = new PrintWriter(response.getOutputStream());
		pw.write(script.toString());
		pw.close();
	
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpServletResponse response) throws Exception {
		log.debug("current user logout");
		try {
			Subject currentUser = SecurityUtils.getSubject();
			if (SecurityUtils.getSubject().getSession() != null) {
				currentUser.logout();
			}
			// 退出之后停留在当前页面
		} catch (Exception e) {
			e.printStackTrace();
		}
		StringBuilder script=new StringBuilder();
		script.append("<script>").append("top.location.href='/'").append("</script>");
		PrintWriter pw = new PrintWriter(response.getOutputStream());
		pw.write(script.toString());
		pw.close();
	
	}
}
