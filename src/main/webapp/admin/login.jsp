<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="java.util.UUID"%>
<%@page import="java.security.interfaces.RSAPublicKey"%>
<%@page import="org.apache.commons.lang.ArrayUtils"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.tdgogou.util.UtilsSetting"%>
<%@page import="com.tdgogou.util.UtilsSpring"%>
<%@page import="com.tdgogou.service.ServiceRSA"%>
<%@page import="com.tdgogou.E3DSetting"%>
<%@page import="com.tdgogou.E3DSetting.CaptchaType"%>
<%@page import="com.tdgogou.E3DSetting.AccountLockType"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String base = request.getContextPath();
String captchaId = UUID.randomUUID().toString();
ApplicationContext applicationContext = UtilsSpring.getApplicationContext();
E3DSetting setting = UtilsSetting.get();
if (applicationContext != null) {
%>
<shiro:authenticated>
<%
	response.sendRedirect(base + "/admin/common/main.jhtml");
%>
</shiro:authenticated>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%
	if (applicationContext != null) {
	ServiceRSA rsaService = UtilsSpring.getBean("implRsaService", ServiceRSA.class);
	RSAPublicKey publicKey = rsaService.generateKey(request);
	String modulus = Base64.encodeBase64String(publicKey.getModulus().toByteArray());
	String exponent = Base64.encodeBase64String(publicKey.getPublicExponent().toByteArray());
	
	String message = null;
	String loginFailure = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
	if (loginFailure != null) {
		if (loginFailure.equals("org.apache.shiro.authc.pam.UnsupportedTokenException")) {
	message = "admin.captcha.invalid";
		} else if (loginFailure.equals("org.apache.shiro.authc.UnknownAccountException")) {
	message = "admin.login.unknownAccount";
		} else if (loginFailure.equals("org.apache.shiro.authc.DisabledAccountException")) {
	message = "admin.login.disabledAccount";
		} else if (loginFailure.equals("org.apache.shiro.authc.LockedAccountException")) {
	message = "admin.login.lockedAccount";
		} else if (loginFailure.equals("org.apache.shiro.authc.IncorrectCredentialsException")) {
	if (ArrayUtils.contains(setting.getAccountLockTypes(), AccountLockType.admin)) {
		message = "admin.login.accountLockCount";
	} else {
		message = "admin.login.incorrectCredentials";
	}
		} else if (loginFailure.equals("org.apache.shiro.authc.AuthenticationException")) {
	message = "admin.login.authentication";
		}
	}
%>
<title><%=UtilsSpring.getMessage("admin.login.title")%> - Powered By e3dmall</title>
<meta http-equiv="expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link  rel="stylesheet" type="text/css" href="/resources/admin/css/admin_login.css">
<link href="<%=base%>/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=base%>/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/jsbn.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/prng4.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/rng.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/rsa.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/base64.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/common.js"></script>
<script type="text/javascript">
	$().ready( function() {
		
		var $e3d_loginForm = $("#e3d_loginForm");
		var $e3d_enPassword = $("#enPassword");
		var $e3d_username = $("#e3d_username");
		var $e3d_password = $("#e3d_password");
		var $e3d_captcha = $("#e3d_captcha");
		var $e3d_captchaImage = $("#captchaImage");
		var $e3d_isRememberUsername = $("#isRememberUsername");
		
		// 记住用户名
		if(getCookie("adminUsername") != null) {
			$e3d_isRememberUsername.prop("checked", true);
			$e3d_username.val(getCookie("adminUsername"));
			$e3d_password.focus();
		} else {
			$e3d_isRememberUsername.prop("checked", false);
			$e3d_username.focus();
		}
		
		// 更换验证码
		$e3d_captchaImage.click( function() {
			$e3d_captchaImage.attr("src", "<%=base%>/admin/common/captcha.jhtml?captchaId=<%=captchaId%>&timestamp=" + (new Date()).valueOf());
		});
		
		// 表单验证、记住用户名
		$e3d_loginForm.submit( function() {
			if ($e3d_username.val() == "") {
				$.message("warn", "<%=UtilsSpring.getMessage("admin.login.usernameRequired")%>");
				return false;
			}
			if ($e3d_password.val() == "") {
				$.message("warn", "<%=UtilsSpring.getMessage("admin.login.passwordRequired")%>");
				return false;
			}
			if ($e3d_captcha.val() == "") {
				$.message("warn", "<%=UtilsSpring.getMessage("admin.login.captchaRequired")%>");
				return false;
			}
			
			if ($e3d_isRememberUsername.prop("checked")) {
				addCookie("adminUsername", $username.val(), {expires: 7 * 24 * 60 * 60});
			} else {
				removeCookie("adminUsername");
			}
			
			var rsaKey = new RSAKey();
			rsaKey.setPublic(b64tohex("<%=modulus%>"), b64tohex("<%=exponent%>"));
			var enPassword = hex2b64(rsaKey.encrypt($e3d_password.val()));
			$e3d_enPassword.val(enPassword);
		});
		
		<%if (message != null) {%>
			$.message("error", "<%=UtilsSpring.getMessage(message, setting.getAccountLockCount())%>");
		<%}%>
	});
</script>
<%
	} else {
%>
<title>提示信息 - Powered By e3dmall</title>
<link href="<%=base%>/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<%
	}
%>
</head>
</head>
<body style="background-color: #1D3647;">
	<%
		if (applicationContext != null) {
	%>
		<div class="login_top_bg"></div>
	<div class="center">
		<div  class="logo">
			<ul>
				<li style="height:80px;text-align: right;"><img width="279" height="68" src="/resources/admin/images/logo.gif"></li>
				<li class="left_txt">1- 地区商家信息网门户站建立的首选方案...</li>
				<li class="left_txt">2- 一站通式的整合方式，方便用户使用...</li>
			</ul>
		</div>
		<div class="login">
			<form id="e3d_loginForm" action="login.jsp" method="post">
				<input type="hidden" id="enPassword" name="enPassword" />
				<%
					if (ArrayUtils.contains(setting.getCaptchaTypes(), CaptchaType.adminLogin)) {
				%>
					<input type="hidden" name="captchaId" value="<%=captchaId%>" />
				<%
					}
				%>
				<span class="login_txt_bt">后台管理员登录</span>
				<table>
					<tr >
						<td class="login_txt" style="width:50px;">管理员:</td>
						<td><input type="text" id="e3d_username" name="username" class="text" maxlength="20" /></td>
					</tr>
					<tr>
						<td class="login_txt">密码:</td>
						<td>
							<input type="password" id="e3d_password" class="text" maxlength="20" autocomplete="off" />
							<img width="19" height="18" src="/resources/admin/images/luck.gif">
						</td>
					</tr>
					<%
						if (ArrayUtils.contains(setting.getCaptchaTypes(), CaptchaType.adminLogin)) {
					%>
					<tr>
						<td class="login_txt" >验证码:</td>
						<td style="position:relative ">
							<input type="text" style=" width:95px;margin-right:5px;" id="e3d_captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off" /><img id="captchaImage" class="captchaImage" src="<%=base%>/admin/common/captcha.jhtml?captchaId=<%=captchaId%>" title="<%=UtilsSpring.getMessage("admin.captcha.imageTitle")%>" />
						</td>
					</tr>
					<%
						}
					%>
					<tr>
					<td class="login_txt"></td>
						<td >
							<input type="submit" value="登录" style="margin-right:20px;"><input type="reset" value="重置">
						</td>
					
					</tr>
				</table>
			</form>
			<div class="weclome"></div>
		</div>
	</div>
	<div class="login-buttom-txt" style="text-align:center">
		COPYRIGHT © 2005-2013 e3dmall.NET ALL RIGHTS RESERVED.
	</div>
	<div class="bottom" style="text-align:center">
					<a href="<%=base%>/"><%=UtilsSpring.getMessage("admin.login.home")%></a> |
					<a href="http://www.e3dmall.com"><%=UtilsSpring.getMessage("admin.login.official")%></a> |
					<a href="http://www.e3dmall.com"><%=UtilsSpring.getMessage("admin.login.bbs")%></a> |
					<a href="http://www.e3dmall.com"><%=UtilsSpring.getMessage("admin.login.about")%></a> |
					<a href="http://www.e3dmall.com"><%=UtilsSpring.getMessage("admin.login.contact")%></a> |
					<a href="http://www.e3dmall.com"><%=UtilsSpring.getMessage("admin.login.license")%></a>
				</div>
	
	<%} else {%>
		<fieldset>
			<legend>系统出现异常</legend>
			<p>请检查e3dmall程序是否已正确安装 [<a href="<%=base%>/install/">点击此处进行安装</a>]</p>
			<p>
				<strong>提示: e3dmall安装完成后必须重新启动WEB服务器</strong>
			</p>
		</fieldset>
	<%}%>
</body>
</html>