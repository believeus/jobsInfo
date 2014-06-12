package com.etech.shiro;


import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import com.etech.entity.TbaseUser;
import com.etech.service.EtechService;


public class AuthenticationFilter extends FormAuthenticationFilter {
	@Resource
	private EtechService etechService;
	public AuthenticationFilter() {
	}

	// 判断请求是否被拒绝
	@Override
	protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) {
		try {
			HttpServletRequest request = (HttpServletRequest) servletRequest;
			HttpServletResponse response = (HttpServletResponse) servletResponse;
			return super.onAccessDenied(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}


	// 提交表单的时候如果没有被拒绝创建调用
	@Override
	protected AuthenticationToken createToken(ServletRequest request,
			ServletResponse response) {
		HttpServletRequest httpRequest=(HttpServletRequest)request;
		String username=httpRequest.getParameter("username");
		String password=httpRequest.getParameter("password");
		password=DigestUtils.md5Hex(password);
		return new TokenAuthentication(username, password,true);
	}

	@Override
	protected boolean onLoginSuccess(org.apache.shiro.authc.AuthenticationToken token, Subject subject, ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
		Session session = subject.getSession();
		TokenAuthentication authenticationToken = (TokenAuthentication) token;
		String username = authenticationToken.getUsername();
		TbaseUser sessionUser = (TbaseUser)etechService.findObjectByProperty(TbaseUser.class, "loginName", username);
		// 更新登录时间
		sessionUser.setLastLoginData(System.currentTimeMillis());
		etechService.saveOrUpdate(sessionUser);
		session.setAttribute("sessionUser",sessionUser);
		return super.onLoginSuccess(token, subject, servletRequest, servletResponse);
	}
}
