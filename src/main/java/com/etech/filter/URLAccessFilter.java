package com.etech.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;

import com.etech.entity.TUser;

/**
 * 链接访问控制，指定哪些链接根据规则不允许访问哪些页面
 * Begin Author:wuqiwei Data:2014-05-27 Email:1058633117@qq.com
 * */
public class URLAccessFilter implements Filter{
	List<String> denyUrlList;
	@Override
	public void init(FilterConfig config) throws ServletException {
		String[] denyurls = config.getInitParameter("denyurl").split(",");
		denyUrlList = Arrays.asList(denyurls);
	}
	/**Begin 
	 * Author:wuqiwei 
	 * Data:2014-05-27 
	 * Email:1058633117@qq.com
	 * AddReason:指定哪些链接根据规则不允许访问哪些页面
	 * */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest httpRequest=(HttpServletRequest)request;
		HttpServletResponse httpResponse=(HttpServletResponse)response;
		String currenturi=httpRequest.getRequestURI();
		if(denyUrlList.contains(currenturi)){
			TUser sessionUser=(TUser)httpRequest.getSession().getAttribute("sessionUser");
			if(StringUtils.isEmpty(sessionUser)){
				//没有权限跳转到主页面
				httpResponse.sendRedirect("/");
				return;
			}
			filterChain.doFilter(request, response);
		}
		filterChain.doFilter(request, response);
	}
	/**End 
	 * Author:wuqiwei 
	 * Data:2014-05-27 
	 * Email:1058633117@qq.com
	 * AddReason:指定哪些链接根据规则不允许访问哪些页面
	 * */
	@Override
	public void destroy() {
		
	}

	/**
	 * 链接访问控制，指定哪些链接不允许访问哪些页面
	 * End Author:wuqiwei Data:2014-05-27 Email:1058633117@qq.com
	 * */	

	
}
