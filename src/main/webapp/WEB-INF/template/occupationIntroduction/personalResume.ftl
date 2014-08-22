<!DOCTYPE html>
<html>
<head>
    <title>个人简历</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script type="text/javascript" src="/resource/public/js/jquery.js"></script>
    <script type="text/javascript"  src="/resource/public/js/Etech.js"></script>
    <link href="/resource/public/js/jquery-X-Menu/css/xmenu.css" rel="stylesheet" type="text/css" />  
    <link href="/resource/public/js/jquery-X-Menu/css/powerFloat.css" rel="stylesheet" type="text/css" />  
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-xmenu.js"></script> 
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-powerFloat-min.js"></script>
	<script type="text/javascript" src="/resource/public/js/datePicker/WdatePicker.js"></script>
	
	<style type="text/css">
	.brandImg{
		border-color: #B8B8B8 #DCDCDC #DCDCDC #B8B8B8;
	    border-radius: 2px 2px 2px 2px;
	    border-style: solid;
	    border-width: 1px;
	    background-color: #666666;
	    width:122px;height:150px;
	    position:relative;
	}
	
	.brandImg span{
		display:block;
		position:absolute;
		top:0px;left:0px;
		width:100px;
		height:150px;
	}
	
	.brandImg span:hover{
		background-color:#FFFFFF;
	    opacity: 0.7;
	    filter:alpha(opacity=50);
	    -moz-opacity:0.5;
	    -khtml-opacity: 0.5;
	}
	
	.brandImg span a{
		display:block;
		position:absolute;
		top:65px;
		left:20px;
	}
	
	</style>
    <style type="text/css">
   		.j_main{
    		width:1000px;
    		height:auto;
    	}
		.j_main_left{
    		float:left;
    		width:260px;
    		height:auto;
    		overflow:hidden;
    		margin-right:6px;
		}
		.j_main_left_1{
			width:258px;
			height:290px;
    		border:1px solid;
		}
		
		.j_main_left_1 span{
			float:right;
		}
		.j_main_left_1 li{
			line-height:28px;
		}
		.j_main_right{
			float:left;
    		width:730px;
    		height:auto;
			overflow:hidden;		
		}
		.j_main_right_1{
    		width:730px;
			height:29px;
		}
		.j_main_right_1 p{
			margin:0;
			padding: 5px;
			background: url(/resource/public/images/background_b.png);
		    border: 1px solid #e4e4e4;
		    font-size:13px;
		}
		.j_main_right_2{
			width:728px;
			height:auto;
			margin-top:10px;
			overflow:hidden;
		}
		.j_main_right_2_1{
			width:728px;
			height:30px;
			background:#E5E5E5;
			border-bottom:3px solid #E36510;
		}
		.j_main_right_2_1_1{
		    font-size: 16px;
		    height: 30px;
		    line-height: 30px;
		    text-align: center;
		    width: 130px;
		    float:left;
		}
		.j_main_right_2_1_2{
		    text-align: center;
		    line-height: 30px;
		    font-size: 16px;
			height: 30px;
			width: 130px;
		    float:left;
		}
		.j_main_right_2 span {
		    color: #E26511;
		    padding-left: 20px;
		}
		.j_main_left_1 td{
			line-height:30px;
		}
		.j_main_left_1_1{
			border-bottom: 1px dashed #F6B37F;
		    height: 130px;
		    margin-left: auto;
		    margin-right: auto;
		    width: 245px;
		}
		.j_main_left_1_1 p{
			margin: 7px 10px;
    		padding: 0 10px;
    		text-align:left;
		}
		.j_main_right_2 input{
			width:150px;
		}
		.currentSwich{
			background:#E36510;
			color:#FFFFFF;
		}
		.jiben td {
		    border-bottom: 1px solid #E4E4E4;
		    padding: 5px 10px;
		}
		.jineng_div td {
		    text-align: center;
		    width: 118px;
		    padding: 5px 10px;
		}
		.xuexi_div td {
		    text-align: center;
		    width: 153px;
		    padding: 5px 10px;
		    font-size:12px;
		    border-bottom:1px dashed #E4E4E4;
		}
		.xuexi_div span{
			color:#000000;
			padding:0;
		}
		.gongzuo_div td {
		    text-align: center;
		    width: 118px;
		    padding: 5px 10px;
		}
		.zhiyuan_div th {
		    text-align: center;
		    width: 118px;
		    padding: 5px 10px;
		}
		.zhiyuan_div td {
		    font-size: 12px;
		    padding: 5px;
		    text-align: center;
		    border-bottom:1px dashed #E4E4E4;
		}
		.btn_login {
		    background: none repeat scroll 0 0 #6dbe3a;
		    border: 1px solid #3eae44;
		    border-radius: 4px;
		    color: #fbfbfb;
		    cursor: pointer;
		    margin-right: 10px;
		    width: 60px;
		}
		.xuexi_div th{
			text-align: center;
		    width: 153px;
		    padding: 5px 10px;
		}
		.zhiyuan_div span{
			color:#000000;
			padding:0;
		}
    </style>
</head>
<body>
	[#include "/include/header.ftl" /]
	<script style="text/javascript">
		    $().ready(function() {
		    
		    	$("#gangwei").click(function(){
		    		$("#gongsi").removeClass("current");
		    		$("#gangwei").addClass("current");
		    	});
		    	$("#gongsi").click(function(){
		    		$("#gangwei").removeClass("current");
		    		$("#gongsi").addClass("current");
		    	});
		    	
		    
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
		<div class="j_main_left">
			[#if sessionUser?exists]
			<div class="j_main_left_1" style="border:0;height:auto;border:1px solid #E4630F;border-radius:4px;">
				<table style="padding: 6px 19px 19px;">
					<tr>
						<td colspan="2" align="center" style="background:#EE981F;color:#FFFFFF;border-radius:4px;">用户登录</td>
					</tr>
					<tr>
						<td colspan="2"><font color="red" size="2">${sessionUser.loginName}</font><br/>欢迎您登录！</td>
					</tr>
					<tr>
						<td colspan="2">上次登录时间:<br/>
							<span style="font-size:13px;float:left;">
								${sessionUser.lastLoginData?number_to_datetime}&nbsp;${sessionUser.lastLoginData?number_to_time}
							</span>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2" style="padding-top: 20px;">
							<input type="button" style="margin-right: 10px;background: none repeat scroll 0 0 #6DBE3A;border: 1px solid #1C960C;border-radius: 4px;color: #FFFFFF; width: 83px;height:27px;" 
							value="[#if sessionUser.class.name == "com.etech.entity.TcomUser"]个人中心[#elseif sessionUser.class.name == "com.etech.entity.TentUser"]企业中心[#else]管理员后台[/#if]"
							onclick="javascript:[#if sessionUser.class.name == "com.etech.entity.TcomUser"]window.location.href='/common-user/center.jhtml';[#elseif sessionUser.class.name == "com.etech.entity.TentUser"] window.location.href='/enterprise-user/center.jhtml';[#else]window.location.href='/admin/common/main.jhtml';[/#if]" 
							>
							<input type="button" onclick="Etech.logout();" style="background: none repeat scroll 0 0 #6DBE3A;border: 1px solid #1C960C;border-radius: 4px;color: #FFFFFF; width: 75px;height:27px;" value="退出">
						</td>
					</tr>
				</table>
			</div>
			[#else]
			<div class="j_main_left_1" style="border:0;height:auto;border:1px solid #E4630F;border-radius:4px;">
				<p style="margin:0;padding:5px;padding-left:20px;background:url(/resource/public/images/111.png);">
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					会员登录
				</p>
				<form id="loginForm" action="/" method="post">
				<table style="padding:19px;">
					<tr>
						<td>用户名:</td>
						<td><input id="loginName" type="text" name="loginName"  autocomplete="off" style="width:150px"></td>
					</tr>
					<tr>
						<td>密&nbsp;&nbsp;&nbsp;码:</td>
						<td><input id="password" type="password" name="password" autocomplete="off" style="width:150px"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<label><input type="radio" name="userType" checked="ture" value="commonUser">个人用户</label>
							<label><input type="radio" name="userType" value="enterpriseUser">企业用户</label>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input class="btn_login" type="button" id="login" value="登录" style="margin-right: 10px;">
							<input class="btn_login" type="button" id="register" value="注册">
						</td>
					</tr>
				</table>
				</form>
			</div>
			
			[/#if]
			<div class="j_main_left_1" style="margin-top:10px;height:auto;text-align:center;border:1px solid #E4630F;border-radius:4px;">
				<p style="background: #EE981F; text-align: center; margin: 5px; padding: 5px; border-radius: 5px; border: 0px none; color: #FFFFFF;">职位推荐</p>
				[#list recommendTrecruit as recruit]
				<div class="j_main_left_1_1">
					<p style="color: blue;font-weight:bold;">${recruit.workType.name}</p>
					<p style="color: blue;">公司:${recruit.company}</p>
					<p>薪资待遇:${recruit.salary}</p>
					<p>招聘人数：${recruit.worknum}</p>
					<p>学历要求：${recruit.eduLevel}</p>
				</div>
				[/#list]
			</div>
		</div>
		<div class="j_main_right" id="conentDiv">
			<div class="j_main_right_1">
				<p>
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-left: 2px; margin-top: 2px; margin-right: 5px;">
					所在位置 > 个人中心
				</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;">
				<div class="j_main_right_2_1">
					<div id="personal_xinxi" class="j_main_right_2_1_1 currentSwich" style="cursor:pointer;">个人简历</div>
				</div>
				<p>
					<span style="font-size: 20px;">[#if tcomUser.trueName?exists] ${tcomUser.trueName} [#else]匿名[/#if]</span>
				</p>
				
				<div id="base_xinxi" style="width::728px;height:auto;overflow:hidden;">
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">基本信息</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 600px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div style="width:690px;height:auto;overflow:hidden;margin:0 20px;margin-bottom:15px;">
						<div class="jiben" style="height: auto; overflow: hidden; float: left; width: 500px;margin-top: 10px;margin-right:10px;">
							<table cellspacing="0" width="500px">
								<tr>
									<td style="background: #EEEEEE; text-align: right;">姓名:</td>
									<td>[#if tcomUser.trueName?exists] ${tcomUser.trueName} [#else]匿名[/#if]</td>
									<td style="background: #EEEEEE; text-align: right;">性别:</td>
									<td>[#if tcomUser.sex == "woman"] 女 [#else]男[/#if]</td>
								</tr>
								<tr>
									<td style="background: #EEEEEE; text-align: right;">二女户:</td>
									<td>
										[#if tcomUser.twoGirl = 1]
											是
										[#elseif tcomUser.twoGirl = 0]
											否
										[/#if]
									</td>
									<td style="background: #EEEEEE; text-align: right;">文化程度:</td>
									<td>${tcomUser.eduLevel}</td>
								</tr>
								<tr>
									<td style="background: #EEEEEE; text-align: right;">年龄:</td>
									<td>${tcomUser.age}</td>
									<td style="background: #EEEEEE; text-align: right;">身高:</td>
									<td>${tcomUser.height}</td>
								</tr>
								<tr>
									<td style="background: #EEEEEE; text-align: right;">民族:</td>
									<td>${tcomUser.nation}</td>
									<td style="background: #EEEEEE; text-align: right;">健康状况:</td>
									<td>${tcomUser.health}</td>
								</tr>
								<tr>
									<td style="background: #EEEEEE; text-align: right;width:65px">政治面貌:</td>
									<td>${tcomUser.polity}</td>
									<td style="background: #EEEEEE; text-align: right;width: 106px;">家庭详细地址:</td>
									<td>${tcomUser.address}</td>
								</tr>
								<tr>
									<td style="background: #EEEEEE; text-align: right;">婚姻状况:</td>
									<td>${tcomUser.marriage}</td>
									<td style="background: #EEEEEE; text-align: right;width: 106px;">原工作单位:</td>
									<td>${tcomUser.workspace}</td>
								</tr>
								<tr>
									<td style="background: #EEEEEE; text-align: right;">视力:</td>
									<td>${tcomUser.eyesight}</td>
									<td style="background: #EEEEEE; text-align: right;width: 106px;">《就失业证》号:</td>
									<td>${tcomUser.jobId}</td>
								</tr>
								<tr>
									<td style="background: #EEEEEE; text-align: right;">个人特长:</td>
									<td>${tcomUser.strongPoint}</td>
									<td style="background: #EEEEEE; text-align: right;">独生子女:</td>
									<td>
										[#if tcomUser.singleChild = 1]
											是
										[#elseif tcomUser.singleChild = 0]
											否
										[/#if]
									</td>
								</tr>
								<tr>
									<td style="background: #EEEEEE; text-align: right;">联系电话:</td>
									<td colspan="3">
										[#if (sessionUser?exists && sessionUser?string?contains("TentUser") && sessionUser.status==1 )||(sessionUser?exists && sessionUser?string?contains("Tadmin"))]
											${tcomUser.phoneNum}
										[#else]
											<a style="color:red;" href="/" title="企业审核通过后可以查看联系方式">企业审核通过后可以查看联系方式</a>
										[/#if]
									</td>
								</tr>
							</table>
						</div>
						<div style="width: 150px; float: left; margin-left: 15px; height: auto; margin-top: 15px;">
							<img style="width:122px;height:150px;border:1px solid #e4e4e4;" src="[#if tcomUser.imgHead!=""]${tcomUser.imgHead}[#else]/resource/public/images/bg1.png[/#if]" name="img"/>
						</div>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">选择志愿</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div class="zhiyuan">
						<div class="zhiyuan_div" style="width:690px;height:auto;border:1px solid #e4e4e4;overflow:hidden;margin:0 20px;margin-bottom:15px;">
							<table cellspacing="0">
								<tr style="background:#eeeeee;">
									<th>专业</th>
									<th>工种</th>
									<th>月薪要求</th>
									<th>择业地区</th>
									<th>其他要求</th>
								</tr>
								[#list tcomUser.comInfo as comInfo]
								[#if comInfo.infoType == 4]
								<tr>
									<td><span title="${comInfo.majorType.name}">
										[#if comInfo.majorType.name?length > 8]
											${comInfo.majorType.name?string?substring(0,8)}...
										[#else]
											${comInfo.majorType.name}
										[/#if]
									</span></td>
									<td><span title="${comInfo.workType.name}">
										[#if comInfo.workType.name?length > 8]
											${comInfo.workType.name?string?substring(0,8)}...
										[#else]
											${comInfo.workType.name}
										[/#if]
									</span></td>
									<td><span title="${comInfo.expectSalary}">${comInfo.expectSalary}</span></td>
									<td><span title="${comInfo.expectArea}">
										[#if comInfo.expectArea?length > 8]
											${comInfo.expectArea?string?substring(0,8)}...
										[#else]
											${comInfo.expectArea}
										[/#if]
									</span></td>
									<td>
										[#if comInfo.note?exists && comInfo.infoType==4]
											<span title="${comInfo.note}">
												[#if comInfo.note?length > 10]
													${comInfo.note?string?substring(0,10)}...
												[#else]
													${comInfo.note}
												[/#if]
											</span>
										[#else]
											无
										[/#if]
									</td>
								</tr>
								[/#if]
								[/#list]
							</table>
						</div>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">具备技能</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div class="jineng">
						<div class="zhiyuan_div" style="width:690px;height:auto;border:1px solid #e4e4e4;overflow:hidden;margin:0 20px;margin-bottom:15px;">
							<table cellspacing="0">
								<tr style="background:#EEEEEE;">
									<th>专业</th>
									<th>工种</th>
									<th>技能等级</th>
									<th>从事年限</th>
									<th>说明</th>
								</tr>
								[#list tcomUser.comInfo as comInfo]
								[#if comInfo.infoType == 1]
								<tr>
									<td><span title="${comInfo.majorType.name}">
										[#if comInfo.majorType.name?length > 8]
											${comInfo.majorType.name?string?substring(0,8)}...
										[#else]
											${comInfo.majorType.name}
										[/#if]
									</span></td>
									<td><span title="${comInfo.workType.name}">
										[#if comInfo.workType.name?length > 8]
											${comInfo.workType.name?string?substring(0,8)}...
										[#else]
											${comInfo.workType.name}
										[/#if]
									</span></td>
									<td><span title="${comInfo.skillLevel}">
										[#if comInfo.skillLevel?length > 8]
											${comInfo.skillLevel?string?substring(0,8)}...
										[#else]
											${comInfo.skillLevel}
										[/#if]
									</span></td>
									<td><span title="${comInfo.workingLife}">${comInfo.workingLife}</span></td>
									<td>
										[#if comInfo.note?exists && comInfo.infoType==1]
											<span title="${comInfo.note}">
												[#if comInfo.note?length > 8]
													${comInfo.note?string?substring(0,8)}...
												[#else]
													${comInfo.note}
												[/#if]
											</span>
										[#else]
											无
										[/#if]
									</td>
								</tr>
								[/#if]
								[/#list]
							</table>
						</div>
					</div>
					
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">学习经历</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div class="xuexi">
					<div class="xuexi_div" style="width:690px;height:auto;border:1px solid #e4e4e4;overflow:hidden;margin:0 20px;margin-bottom:15px;">
						<table cellspacing="0">
							<tr style="background:#EEEEEE;">
								<th>时间</th>
								<th>学校</th>
								<th>系别</th>
								<th>专业</th>
							</tr>
							[#list tcomUser.comInfo as comInfo]
							[#if comInfo.infoType == 2]
							<tr>
								<td>
									[#if comInfo.beginData = 0]
										求职者未填写
									[#else]
										${comInfo.beginData?number_to_datetime}---${comInfo.endData?number_to_datetime}
									[/#if]
								</td>
								<td><span title="${comInfo.workspace}">
									[#if comInfo.workspace?length > 8]
										${comInfo.workspace?string?substring(0,8)}...
									[#else]
										${comInfo.workspace}
									[/#if]
								</span></td>
								<td><span title="${comInfo.dept}">
									[#if comInfo.dept?length > 8]
										${comInfo.dept?string?substring(0,8)}...
									[#else]
										${comInfo.dept}
									[/#if]
								</span></td>
								<td><span title="${comInfo.majorType.name}">
									[#if comInfo.majorType.name?length > 8]
										${comInfo.majorType.name?string?substring(0,8)}...
									[#else]
										${comInfo.majorType.name}
									[/#if]
								</span></td>
							</tr>
							[/#if]
							[/#list]
						</table>
					</div>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">工作经历</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div class="gongzuo">
					<div class="zhiyuan_div" style="width:690px;height:auto;border:1px solid #e4e4e4;overflow:hidden;margin:0 20px;margin-bottom:15px;">
						<table cellspacing="0">
							<tr style="background:#EEEEEE;">
								<th>时间</th>
								<th>工作单位</th>
								<th>职位</th>
								<th>工种</th>
								<th>工作内容</th>
							</tr>
							[#list tcomUser.comInfo as comInfo]
							[#if comInfo.infoType == 3]
							<tr>
								<td>
									[#if comInfo.beginData = 0]
										求职者未填写
									[#else]
										${comInfo.beginData?number_to_datetime}---${comInfo.endData?number_to_datetime}
									[/#if]
								</td>
								<td><span title="${comInfo.workspace}">
									[#if comInfo.workspace?length > 8]
										${comInfo.workspace?string?substring(0,8)}...
									[#else]
										${comInfo.workspace}
									[/#if]
								</span></td>
								<td><span title="${comInfo.duty}">
									[#if comInfo.duty?length > 8]
										${comInfo.duty?string?substring(0,8)}...
									[#else]
										${comInfo.duty}
									[/#if]
								</span></td>
								<td><span title="${comInfo.workType.name}">
									[#if comInfo.workType.name?length > 8]
										${comInfo.workType.name?string?substring(0,8)}...
									[#else]
										${comInfo.workType.name}
									[/#if]
								</span></td>
								<td>
									[#if comInfo.note?exists && comInfo.infoType==3]
										<span title="${comInfo.note}">
											[#if comInfo.note?length > 8]
												${comInfo.note?string?substring(0,8)}...
											[#else]
												${comInfo.note}
											[/#if]
										</span>
									[#else]
										无
									[/#if]
								</td>
							</tr>
							[/#if]
							[/#list]
						</table>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	[#include "/include/footer.ftl" /]
</body>
</html>