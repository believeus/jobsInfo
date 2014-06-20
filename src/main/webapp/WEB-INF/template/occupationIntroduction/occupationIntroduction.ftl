<!DOCTYPE html>
<html>
<head>
    <title>职业介绍</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script src="/resource/public/resources/scripts/jquery-1.10.2.min.js"></script>
	 <script type="text/javascript" src="/resource/public/resources/scripts/jquery.validate.js"></script>
	 <script type="text/javascript" src="/resource/public/js/Etech.js"></script>
    <style type="text/css">
    	.j_main{
    		width:1000px;
    		height:auto;
    	}
    	.j_main_1{
    		width:998px;
    		height:30px;
    		background:#FFF1DA;
    		border:1px solid #F9CEAC;
    	}
    	.j_main_2{
    		border: 1px solid #E4E4E4;
		    border-radius: 4px;
		    height: 30px;
		    margin-top: 2px;
		    width: 998px;
		    color:#BA2534;
    	}
    	.j_main_2 td{
    		padding-right: 20px; 
    		padding-left: 10px;
    	}
    	.j_main_3{
    		width:998px;
    		height:200px;
    		margin-top: 2px;
    	}
    	.j_main_3_1{
    		border: 1px solid #E4630F;
		    border-radius: 4px;
		    height: 198px;
		    width: 260px;
		    float: left;
    	}
    	.j_main_3_1 td{
    		line-height:30px;
    	}
    	.j_main_3_2{
		    float: left;
		    height: 198px;
		    margin-left: 12px;
		    width: 460px;
    	}
    	.j_main_3_2 .current{
    		 background:#FFF1DA;
    	}
    	.j_main_3_2 span{
    		font-size:13px;
    	}
    	.j_main_3_2 a{
    		color:#FF7800;
    	}
    	.j_main_3_2_p1{
    		border-right: 1px solid #E4630F;
		    border-top: 3px solid #E4630F;
		    color: #E45A00;
		    margin: 0;
		    padding: 10px;
		    width: 65px;
		    float:left;
    	}
    	.j_main_3_3{
    		width:250px;
    		height:198px;
    		float:left;
    		border: 1px solid #E4630F;
    		border-radius:4px;
    		margin-left:10px;
    	}
    	.j_main_3_3 li{
    		list-style:none;
    		line-height:25px;
    		font-size:13px;
    	}
    	.j_main_3_3 span{
    		float:right;
    		margin-right:10px;
    	}
    	.j_main_3_3 p{
    		background: #EE981F;
		    border-radius: 4px;
		    color: #FFFFFF;
		    margin: 8px 20px 5px;
		    padding: 7px;
		    text-align: center;
    	}
    	.j_main_4{
    		width:998px;
    		height:200px;
    		margin-top: 10px;
    	}
    	.j_main_4_1{
    		width:260px;
    		height:200px;
    		float:left;
    		background:url(/resource/public/images/weixinpingtai.png);
    	}
    	.j_main_4_2{
    		float:left;
    		width:240px;
    		height:200px;
    		margin-left:15px;
    	}
    	.j_main_4_3{
    		width:480px;
    		height:200px;
    		float:left;
    	}
    	.xinwen_ul > li{
    		font-size: 13px;
    		line-height: 23px;
    	}
    	.xinwen_ul span{
    		float:right;
    	}
    	.j_main_5{
    		width:998px;
    		height:auto;
    		margin-top: 10px;
    	}
    	.j_main_6{
    		width:998px;
    		height:auto;
    		overflow:hidden;
    		margin-top: 10px;
		}
		.j_main_6 a:hover{
			text-decoration:underline;
		}
    	.j_main_6_1{
    		width:998px;
    		height:38px;
    		border:1px solid #E4E4E4;
    	}
    	.j_main_6 td{
    		text-align: center;
    		width: 260px;
    		padding-bottom:20px;
		}
    	.j_main_6 span{
    		color:#FF7800;
    	}
    	.j_main_7{
    		width:998px;
    		height:auto;
    		overflow:hidden;
    		margin-top: 10px;
    	}
    	.j_main_7_1{
    		width:320px;
    		height:178px;
    		float:left;
    		margin-right:15px;
    		border:1px solid #e4e4e4;
    	}
    	.j_main_7_1 li{
    		font-size: 13px;
		    line-height: 23px;
		    list-style: none outside none;
		}
		.zuixinjianli td {
		    width: 330px;
		}
		.zuixinjianli li {
		    line-height: 35px;
		}
		.jianli_name span {
		    color: #FF7800;
		    font-size: 16px;
		    margin-right: 15px;
		}
		.jianli_xinxi{
			color:#003872;
		}
		.zuixinjianli a:hover{
			text-decoration:underline;
		}
		.j_main_5 img{
			width:194px;
		}
		.btn_login{
			background:#b2e85c;
		    border: 1px solid #3eae44;
		    border-radius: 4px;
		    color: #fbfbfb;
		    margin-right: 10px;
		    width: 60px;
		    cursor:pointer;
		}
    </style>
</head>
<body>
	[#include "/include/header.ftl" /]
	<script style="text/javascript">
		    $().ready(function() {
		    	// ajax 提交验证和登录。
		    	function submitF(or,flag){
					 	if($("#loginName").val()==""){
					 	  return false;
					 	}
						$.ajax({
							url: "/ajaxLoginValid.jhtml",
							type: "POST",
							data: {
								loginName: $("#loginName").val(),
								password:$("#password").val(),
								userType: $('input:radio[name="userType"]:checked').val()
									},
							dataType: "json",
							cache: false,
							success: function(data) {
									// 如果登录成功，则显示成功
									if(data.message=="success"){
										if(or=="no"){
											return false;
										}else{
											// 提交信息到shiro验证，刷新页面
											$("#loginForm").submit();
										}
									}else{
										if(data.message == "请输入密码"){
											if(flag !="true"){
												alert(data.message);										
											}
										}else{
											alert(data.message);		
										}
										
									}
								}
							});
					}
		    	// 用户名验证。
				$("#loginName,input:radio[name='userType']").change(function(){
					submitF("no","true");
				});
				
				// 登录。
				$("#login").click(function() {
					var loginName=$("#loginName").val();
					var password=$("#password").val();
					if(loginName==""&&password==""){
						alert("用户名和密码不能为空！");
					}else{
						submitF("yes","false");
					}
				});
				$("#register").click(function() {
					var type=$('input:radio[name="userType"]:checked').val();
					// 需要跳转到注册页面
					if(type=="commonUser"){
						window.location.href="/personalReg.jhtml";
					}else{		
						window.location.href="/enterpriseReg.jhtml";			
					}
				});
				
				$("#logout").click(function() {
					// 需要跳转到注册页面
					Etech.logout();
				});
				
				
			})
	</script>
	<div class="j_main w">
		<div class="j_main_1">
			<table align="left"  style="font-size: 13px; padding: 4px;">
				<tr>
					<td style="padding-right: 20px; padding-left: 10px;">最新消息：</td>
					<td style="padding-right: 20px;">05月21日</td>
					<td style="padding-right: 40px;">潜江人才招聘会第二期.....</td>
					<td style="padding-right: 20px;">05月21日</td>
					<td style="padding-right: 40px;">潜江人才招聘会第二期.....</td>
					<td style="padding-right: 20px;">05月21日</td>
					<td style="padding-right: 40px;">潜江人才招聘会第二期.....</td>
				</tr>
			</table>
		</div>
		<div class="j_main_2">
			<table align="left"  style="font-size: 13px; padding: 4px;">
				<tr>
					<td style="padding-right: 10px;">地区频道：</td>
					<td style="">湖北</td>
					<td style="">武汉</td>
					<td style="">潜江</td>
					<td style="">荆州</td>
					<td style="">天门</td>
					<td style="">十堰</td>
					<td style="">黄石</td>
					<td style="">襄阳</td>
				</tr>
			</table>	
		</div>
		<div class="j_main_3" >
		[#if sessionUser?exists]
			<!--登录后的界面begin-->
			<div class="j_main_3_1" style="display:block;">
				<table style="padding: 6px 19px 19px;">
					<tr>
						<td colspan="2" align="center" style="background:url(/resource/public/images/beijingse.png);color:#FFFFFF;border-radius:4px;">用户登录</td>
					</tr>
					<tr>
						<td colspan="2"><font color="red" size="2">${sessionUser.loginName}</font>，欢迎您登录！</td>
					</tr>
					<tr>
						<td colspan="2">上次登录时间:
						 <span style="font-size:13px">
						  	${sessionUser.lastLoginData?number_to_datetime}&nbsp;${sessionUser.lastLoginData?number_to_time}
						 </span>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2" style="padding-top: 20px;">
							<input type="button" style="margin-right: 10px;background: none repeat scroll 0 0 #6DBE3A;border: 1px solid #1C960C;border-radius: 4px;color: #FFFFFF; width: 90px;" value="个人中心"
							onclick="javascript:[#if sessionUser.class.name == "com.etech.entity.TcomUser"]window.location.href='/common-user/center.jhtml';[#else] window.location.href='/enterprise-user/center.jhtml';[/#if]" 
							>
							<input id="logout" type="button" style="background: none repeat scroll 0 0 #6DBE3A;border: 1px solid #1C960C;border-radius: 4px;color: #FFFFFF; width: 90px;" value="退出">
						</td>
					</tr>
				</table>
			</div>
			<!--登录后的界面end-->
		[#else]
			<div class="j_main_3_1" style="display:block;">
				<form id="loginForm" action="/" method="post">
				<table style="padding: 6px 19px 19px;">
					<tr>
						<td colspan="2" align="center" style="background:url(/resource/public/images/beijingse.png);color:#FFFFFF;border-radius:4px;">用户登录</td>
					</tr>
					<tr>
						<td>用户名:</td>
						<td><input id="loginName" type="text" autocomplete="off" style="width:150px" name="loginName"></td>
					</tr>
					<tr>
						<td>密&nbsp;&nbsp;&nbsp;码:</td>
						<td><input id="password" type="password" autocomplete="off" style="width:150px" name="password"></td>
					</tr>
					<tr>
						<td align="center" colspan="2">
							<label><input type="radio" name="userType" checked="ture" value="commonUser">个人用户</label>
							<label><input type="radio" name="userType" value="enterpriseUser">企业用户</label>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2">
							<input class="btn_login" type="button" id="login" style="margin-right: 10px;" value="登录">
							<input class="btn_login" type="button" id="register" value="注册">
						</td>
					</tr>
				</table>
				</form>
			</div>
			
		[/#if]
			
			
			<div class="j_main_3_2">
				<div style="width:460px;height:42px;">
					<div id="" class="current" style="border:1px solid #E45900;border-bottom:0;cursor:pointer;height: 42px; float: left; text-align: center; line-height: 42px; font-size: 20px;width: 228px;color:#E45900;cursor:point;">岗位搜索</div>
					<div id="" class="" style="border-bottom:1px solid #E45900;cursor:pointer;height: 42px; float: left; text-align: center; line-height: 42px; font-size: 20px;width: 229px;color:#E45900;cursor:point;">公司搜索</div>
				</div>
				<div style="width:460px;height:156px;background:#FFF1DA;border:1px solid #E45900;">
					<form action="">
						<div style="width: 380px; margin-left: auto; margin-right: auto; margin-top: 20px;">
							<input type="text" value="" placeholder="请输入查询内容..." style="width: 360px;">
							<select style="margin-top: 20px;">
								<option value="">选择区域</option>
								<option value="">北京</option>
								<option value="">上海</option>
								<option value="">广州</option>
								<option value="">深圳</option>
								<option value="">南京</option>
								<option value="">重庆</option>
								<option value="">武汉</option>
							</select>
							<input type="button" value="搜索" style="cursor:pointer;border-radius:4px;width:100px;height:25px;background:#6DBE3A;color:#FFFFFF;border:1px solid #1C960C;">
							<input type="button" value="高级搜索" onclick="javascript:window.location.href='/advancedSearch.jhtml'" style="cursor:pointer;border-radius:4px;width:100px;height:25px;background:#6DBE3A;color:#FFFFFF;border:1px solid #1C960C;">
							<p>搜索热词：
								<span><a href="">软件工程师</a></span>
								<span><a href="">建筑工程师</a></span>
								<span><a href="">厨师</a></span>
								<span><a href="">出租车司机</a></span>
							</p>
						</div>
					</form>
				</div>
			</div>
			<div class="j_main_3_3">
				<p style="background:url(/resource/public/images/beijingse.png)">招聘会</p>
				<ul style="padding-left:15px;margin:0;">
					[#list zhaopinhuiService as zph]
						<li><a href="/zhaopinhui.jhtml?id=${zph.id}">${zph.title}</a><span>${zph.createTime?number_to_datetime}</span></li>
					[/#list]
				</ul>
			</div>
		</div>
		<!--
			<div class="j_main_4">
				<div class="j_main_4_1">
					<a href="" title="高校毕业生专题"><div style="height: 60px; width: 259px;margin-bottom:6px;"></div></a>
					<a href="" title="微信平台"><div style="height: 60px; width: 259px;margin-bottom:6px;"></div></a>
					<a href="" title="下载中心"><div style="height: 60px; width: 259px;"></div></a>
				</div>
				<div class="j_main_4_2">
					<img src="/resource/public/images/tup.png">
				</div>
				<div class="j_main_4_3">
					<div style="padding-left: 20px;margin-bottom:20px;">
						<h2 style="margin: 0px; font-size: 21px; font-weight: normal;">表彰全市创业就业先进个人</h2>
						<p style="color:#2B8BDF;font-size:12px;">xx市人力资源和社会保障局关于表彰全市创业就业先进个人的决定</p>
						<p style="color:#2B8BDF;margin:0;font-size:12px;">昨日，国务院总理李克强主持召开国务院常务会议，对于如何做..</p>
					</div>
					<hr style="margin-left: 10px; margin-right: 10px; border: 1px dashed #e4e4e4;">
					<ul class="xinwen_ul" style="padding-left: 25px; margin: 0px;">
						<li><a href="">推陈出新的巧克力蛋糕店创业计划书</a><span>[06-24]</span></li>
						<li><a href="">创业计划书的六个概念</a><span>[06-24]</span></li>
						<li><a href="">赢动运城创业大赛报名表</a><span>[06-24]</span></li>
						<li><a href="">毕业季里的创业课</a><span>[06-24]</span></li>
					</ul>
				</div>
			</div>
		-->
		<div class="j_main_5">
			<img src="/resource/public/images/zhaopin.png" style="width:998px;">
			
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad05.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad01.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad03.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad04.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad02.png"></a>
			
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad01.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad03.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad04.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad02.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad05.png"></a>
			
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad03.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad01.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad02.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad05.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad04.png"></a>
			
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad04.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad03.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad05.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad02.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad01.png"></a>
			
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad05.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad01.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad03.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad04.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad02.png"></a>
			
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad01.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad03.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad04.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad02.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad05.png"></a>
			
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad03.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad01.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad02.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad05.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad04.png"></a>
			
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad04.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad03.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad05.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad02.png"></a>
			<a href="/enterpriseInformation.jhtml"><img src="/resource/public/images/ad01.png"></a>
		</div>
		<div class="j_main_6">
			<div class="j_main_6_1">
				<img src="/resource/public/images/jieshao.png">
			</div>
			<table style="border:1px solid #e4e4e4;">
				<tr>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
				</tr>
				<tr>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
				</tr>
				<tr>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
				</tr>
				<tr>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
				</tr>
				<tr>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
				</tr>
				<tr>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
					<td>
						<p><a href="/enterpriseInformation.jhtml">云科科技有限公司</a></p>
						<p style="margin:0">招聘：<span><a style="color:#FF7800;" href="/enterpriseInformation.jhtml#zw">java程序员</a></span></p>
					</td>
				</tr>
			</table>
		</div>
		
		<div style="width:998px;height:60px;margin-top:5px;margin-bottom:5px;">
			<a href="/personalReg.jhtml"><img src="/resource/public/images/zhiyejieshao.png"></a>
		</div>
		
		<div class="zuixinjianli" style="width:997px;height:auto;border:1px solid #e4e4e4;">
			<img src="/resource/public/images/zuixinjianli.png">
			<table>
				<tr>
					<td>
						<ul>
							[#list qiuzhiList as qiuzhi]
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml?id=${qiuzhi.id}">${qiuzhi.trueName}</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;${qiuzhi.sex}&nbsp;&nbsp;&nbsp;${qiuzhi.eduLevel}&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							[/#list]
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
						</ul>
					</td>
					<td>
						<ul>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
						</ul>
					</td>
					<td>
						<ul>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
							<li><span class="jianli_name"><a style="color:#FF7800;" href="/personalResume.jhtml">张三</a></span><span class="jianli_xinxi">&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;本科&nbsp;&nbsp;&nbsp;中学教师，小学教师</span></li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="j_main_7">
			<div class="j_main_7_1">
				<div style="line-height:31px;background:url(/resource/public/images/background_b.png);width:322px;height:35px;">
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-top: 7px; margin-left: 10px;">
					<span style="color:#BC2131;margin-left: 10px;">求职指导</span>
					<a href="/qiuzhizhidaoList.jhtml">
						<span style="float:right;margin-right:10px;line-height:29px;">更多>></span>
					</a>
				</div>
				<div style="width: 320px; height: 150px;border:1px solid #e4e4e4;margin-top:-5px;">
					<img style="float: left; margin-top: 2px;" src="/resource/public/images/meinv.png">
					<ul  style="float: left; padding-left: 10px; margin: 5px;width:175px;">
						[#list qiuzhizhidaoService as qzzd]
							<li><a href="/qiuzhizhidao.jhtml?id=${qzzd.id}">${qzzd.title}</a>
							<span style="float:right;">${qzzd.createTime?number_to_datetime}</span></li>
						[/#list]
					</ul>
				</div>
			</div>
			<div class="j_main_7_1">
				<div style="line-height:31px;background:url(/resource/public/images/background_b.png);width:322px;height:35px;">
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-top: 7px; margin-left: 10px;">
					<span style="color:#BC2131;margin-left: 10px;">简历指南</span>
					<a href="/jianlizhinanList.jhtml">
						<span style="float:right;margin-right:10px;line-height:29px;">更多>></span>
					</a>
				</div>
				<div style="width: 320px; height: 150px;border:1px solid #e4e4e4;margin-top:-5px;">
					<img style="float: left; margin-top: 2px;" src="/resource/public/images/meinv.png">
					<ul  style="float: left; padding-left: 10px; margin: 5px;width:175px;">
						[#list jianlizhinanService as jlzn]
							<li><a href="/jianlizhinan.jhtml?id=${jlzn.id}">${jlzn.title}</a>
							<span style="float:right;">${jlzn.createTime?number_to_datetime}</span></li>
						[/#list]
					</ul>
				</div>
			</div>
			<div class="j_main_7_1" style="margin-right:0px;">
				<div style="line-height:31px;background:url(/resource/public/images/background_b.png);width:322px;height:35px;">
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-top: 7px; margin-left: 10px;">
					<span style="color:#BC2131;margin-left: 10px;">面试宝典</span>
					<a href="/mianshibaodianList.jhtml">
						<span style="float:right;margin-right:10px;line-height:29px;">更多>></span>
					</a>
				</div>
				<div style="width: 320px; height: 150px;border:1px solid #e4e4e4;margin-top:-5px;">
					<img style="float: left; margin-top: 2px;" src="/resource/public/images/meinv.png">
					<ul  style="float: left; padding-left: 10px; margin: 5px;width:175px;">
						[#list mianshibaodianService as msbd]
							<li><a href="/mianshibaodian.jhtml?id=${msbd.id}">${msbd.title}</a>
							<span style="float:right;">${msbd.createTime?number_to_datetime}</span></li>
						[/#list]
					</ul>
				</div>
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>