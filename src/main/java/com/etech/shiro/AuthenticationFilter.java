package com.etech.shiro;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.util.StringUtils;
import com.etech.entity.Tadmin;
import com.etech.entity.TbaseUser;
import com.etech.entity.TcomUser;
import com.etech.entity.TentUser;
import com.etech.service.EtechService;
import com.etech.util.Location;


public class AuthenticationFilter extends FormAuthenticationFilter {
	@Resource
	private EtechService etechService;
	private static final Log log=LogFactory.getLog(AuthenticationFilter.class);
	public AuthenticationFilter() {
	}

	// 判断请求是否被拒绝
	@Override
	protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse response) {
		try {
			HttpServletRequest request = (HttpServletRequest) servletRequest;
			/**Begin Author:wuqiwei Data:2014-07-03 AddReason:后台登录如果使用的不是管理员帐号登录跳转到管理员登录页面*/
			String username=request.getParameter("loginName");
			String password=request.getParameter("password");
			TbaseUser sessionUser = (TbaseUser)etechService.findObjectByProperty(TbaseUser.class, "loginName", username);
		
			String refered=request.getHeader("Referer");
			log.debug("refer:"+refered);
			/**Begin Author:wuqiwei Data:2014-07-03 AddReason:一般用户和企业用户不许登陆后台*/
			if (!StringUtils.isEmpty(refered)&&refered.contains("/admin/login.jhtml")) {
				if(sessionUser instanceof TcomUser||sessionUser instanceof TentUser){
					String uri="/admin/login.jhtml";
					Location.uri(response,uri);
					return false;
				}
			}
			/**End Author:wuqiwei Data:2014-07-03 AddReason:一般用户和企业用户不许登陆后台*/
			// 用户名不存在
			if(StringUtils.isEmpty(sessionUser)){
				// 通过后台登录
				if (!StringUtils.isEmpty(refered)&&refered.contains("/admin/login.jhtml")) {
					String uri="/admin/login.jhtml";
					Location.uri(response,uri);
					return false;
				// 从前台登录
				}else {
					return super.onAccessDenied(request, response);
				}
			}
			if (!StringUtils.isEmpty(refered)&&refered.contains("/admin/login.jhtml")) {
				if(!(sessionUser instanceof Tadmin)){
					String uri="/admin/login.jhtml";
					Location.uri(response,uri);
					return false;
				//登录是管理员
				}else if((sessionUser instanceof Tadmin)){
					// 密码md5加密
					password=DigestUtils.md5Hex(password);
					if(!password.equals(sessionUser.getPassword())){
						String uri="/admin/login.jhtml";
						Location.uri(response,uri);
						return false;
					}
				}
			}
			/**End Author:wuqiwei Data:2014-07-03 AddReason:后台登录如果使用的不是管理员帐号登录跳转到管理员登录页面*/
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
		String username=httpRequest.getParameter("loginName");
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
		session.setAttribute("sessionUser",sessionUser);
		
		// 更新登录时间
		TbaseUser baseUser=(TbaseUser)etechService.findObjectByProperty(TbaseUser.class, "loginName", username);
		baseUser.setLastLoginData(System.currentTimeMillis());
		etechService.merge(baseUser);
		return super.onLoginSuccess(token, subject, servletRequest, servletResponse);
	}
}
