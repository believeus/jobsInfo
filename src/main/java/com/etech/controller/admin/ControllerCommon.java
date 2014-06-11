package com.etech.controller.admin;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;

/**
 * Controller - 共用
 * 
 * @author e3dmall Team
 * @version 1.0
 */
@Controller("controllerAdminCommon")
@RequestMapping("/admin/common")
public class ControllerCommon implements ServletContextAware {

	/** servletContext */
	private ServletContext servletContext;

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	/**
	 * 主页
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "/admin/common/main";
	}

	@RequestMapping(value = "/left", method = RequestMethod.GET)
	public String left() {
		return "/admin/common/left";
	}

	@RequestMapping(value = "/admin_top", method = RequestMethod.GET)
	public String admin_top() {
		return "/admin/common/admin_top";
	}

	@RequestMapping(value = "/right", method = RequestMethod.GET)
	public String right() {
		return "/admin/common/right";
	}

	@RequestMapping(value = "/admintitle", method = RequestMethod.GET)
	public String admintitle() {
		return "/admin/common/admintitle";
	}

	/**
	 * 首页
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap model) {
		return "/admin/common/index";
	}



	/**
	 * 错误提示
	 */
	@RequestMapping("/error")
	public String error() {
		return "/admin/common/error";
	}

	/**
	 * 权限错误
	 */
	@RequestMapping("/unauthorized")
	public String unauthorized(HttpServletRequest request,
			HttpServletResponse response) {
		String requestType = request.getHeader("X-Requested-With");
		if (requestType != null
				&& requestType.equalsIgnoreCase("XMLHttpRequest")) {
			response.addHeader("loginStatus", "unauthorized");
			try {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		return "/admin/common/unauthorized";
	}

}