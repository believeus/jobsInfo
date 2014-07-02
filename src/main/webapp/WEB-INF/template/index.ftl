[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]

<!DOCTYPE html>
<html>
<head>
    <title>潜江公共就业服务网</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script src="/resource/public/resources/scripts/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="/resource/public/resources/scripts/jquery.validate.js"></script>
	<script type="text/javascript" src="/resource/public/js/Etech.js"></script>
    
    <style type="text/css">
    	.j_mian{
    		width:1000px;
    		height:auto;
    	}
    	.j_mian_left{
    		width:720px;
    		height:842px;
    		float:left;
    	}
    	.j_mian_right{
    		width:260px;
    		height:840px;
    		float:left;
    		margin-left:15px;
    		margin-bottom:6px;
    	}
    	.gonggao{
    		width:260px;
    		height:285px;
    		border:1px solid #EED9C8;
    		margin-bottom:5px;
    	}
		.gonggao_li{
			margin-right:10px;
			line-height:29px;
			font-size:12px;
		}
		.gonggao_span{
    		float:right;
    	}
    	.denglu{
    		width:260px;
    		height:220px;
    		border:1px solid #EED9C8;
    		margin-bottom:5px;
    		background:#FFFFFF;
    	}
    	.denglu_tr{
    		line-height:35px;
    	}
    	.jiuye{
    		width:260px;
    		height:320px;
    		border:1px solid #EED9C8;
    		margin-bottom:5px;
    	}
    	.jiuye_1{
    		background:url(/resource/public/images/zhuye-img_12.png);
    		width:216px;
    		height:272px;
    		margin-left:auto;
    		margin-right:auto;
    	}
    	.jiuye input{
    		background: #5396E4;
		    border: 1px solid #E4E4E4;
		    border-radius: 4px;
		    color: #FFFFFF;
		    cursor: pointer;
		    height: 30px;
		    margin: 8px;
		    width:105px;
		    font-size:13px;
    	}
    	.ad{
    		background: url("/resource/public/images/zhuye-img_04.png");
		    height: 55px;
		    margin-bottom: 8px;
		    width: 726px;
    	}
    	.ad div{
		    float: left;
		    height: 58px;
		    margin-right: 5px;
		    width: 237px;
    	}
    	.zhuanti{
    		width:998px;
    		height:130px;
    		border:1px solid #e4e4e4;
    		overflow:hidden;
    		margin-bottom:6px;
    		background:#FFFFFF;
    	}
    	.tupian{
    		width:998px;
    		height:186px;
    		border:1px solid #e4e4e4;
    		margin-bottom:6px;
    	}
    	.youqing{
    		width:998px;
    		height:auto;
    		border:1px solid #e4e4e4;
    		background:#FFFFFF;
    		overflow:hidden;
    	}
    	.picshow{
    		width:314px;
    		height:285px;
    		border:1px solid #e4e4e4;
    		float:left;
    	}
    	.xinwen{
    		float:left;
			width:396px;
			height:285px;    		
    		margin-left:5px;
    		background:#FFFFFF;
    	}
    	.xinwen_li{
    		line-height:20px;
    	}
    	.xinwen_ul_li{
    		line-height:30px;
    	}
    	.biaoti{
    		border: 1px solid #E4E4E4;
		    display: inline-block;
		    height: 85px;
		    margin-bottom: 5px;
		    margin-top: 5px;
		    width: 720px;
    	}
    	.xinxi{
    		border: 1px solid #E4E4E4;
		    height: 392px;
		    width: 720px;
		    background:#FFFFFF;
    	}
    	.xinxi_1{
		    height: 180px;
		    margin-left: 7px;
		    margin-top: 5px;
		    width: 340px;
    	}
    	.xinxi_1_p{
    		background: url(/resource/public/images/jianbian.png);
		    color: #FF0000;
		    margin: 0;
		    padding: 8px;
		    height:14px;
    	}
    	.xinxi_1_li{
    		font-size:12px;
    		line-height:23px;
    		list-style:none;
    	}
    	.xinxi_1_span{
    		float:right;
    		margin-right:10px;
    	}
    	.tupian_1{
    		float:left;
    		width:249px;
    		height:120px;
    	}
    	.tupian_p {
		    margin: 10px 15px;
		    text-align: center;
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
		.yqlj{
			 float: left;
			 margin-right: 10px; 
			 line-height: 30px;
		}
		.yqlj_a {
		    color: #0000ff;
		    text-decoration: underline;
		}
		#loginForm tr {
		    line-height: 35px;
		}
    </style>
    <style type="text/css">
		#banner {position:relative; width:314px; height:286px; overflow:hidden;}
		#banner_list img {border:0px;}
		#banner_bg {position:absolute; bottom:0;background-color:none;height:50px;filter: Alpha(Opacity=30);opacity:0.3;z-index:1000;
		cursor:pointer; width:314px; }
		#banner_info{position:absolute; bottom:23px; left:5px;height:22px;color:#555;z-index:1001;cursor:pointer}
		#banner_text {position:absolute;width:120px;z-index:1002; right:3px; bottom:3px;}
		#banner ul {position:absolute;list-style-type:none;filter: Alpha(Opacity=80);opacity:0.8; border:1px solid #fff;z-index:1002;
		margin:0; padding:0; bottom:3px; right:5px;}
		#banner ul li { padding:0px 8px;float:left;display:block;color:#FFF;border:#e5eaff 1px solid;background:#6f4f67;cursor:pointer}
		#banner ul li.on { background:#900}
		#banner_list a{position:absolute;} 
	</style>
	<script type="text/javascript">
		var t = n = 0, count;
		$(document).ready(function(){
		count=$("#banner_list a").length;
		$("#banner_list a:not(:first-child)").hide();
		$("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));
		$("#banner_info").click(function(){window.open($("#banner_list a:first-child").attr('href'), "_blank")});
		$("#banner li").click(function() {
		var i = $(this).text() - 1;
		n = i;
		if (i >= count) return;
		$("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));
		$("#banner_info").unbind().click(function(){window.open($("#banner_list a").eq(i).attr('href'), "_blank")})
		$("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
		document.getElementById("banner").style.background="";
		$(this).toggleClass("on");
		$(this).siblings().removeAttr("class");
		});
		t = setInterval("showAuto()", 4000);
		$("#banner").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", 4000);});
		})
		
		function showAuto(){
			n = n >=(count - 1) ? 0 : ++n;
			$("#banner li").eq(n).trigger('click');
		}
	</script>
</head>
<body>
	[#include "/include/header.ftl" /]
	<script type="text/javascript">
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
	<div class="j_mian w">
		<div class="j_mian_left">
			<div class="picshow">
				<!--图片轮播***************************************************************-->
				<div id="banner">
					<div id="banner_bg"></div> 
					<div id="banner_info"></div> 
					<ul>
						<li class="on">1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
					</ul>
					<div id="banner_list">
						[#list news as new]
							<a href="/newsInfo.jhtml?id=${new.id}" target="_blank"><img src="${new.imgpath}" width="314" height="236" title="${new.title}" alt="
							[#if new.title?length > 18]
								${new.title?string?substring(0,18)}...
							[#else]
								${new.title}
							[/#if]" /></a>
						[/#list]
					</div>
				</div>
				<!--***************************************************************-->
				
			</div>
			<div class="xinwen">
				<div style="padding-left: 20px;margin-bottom:20px;margin-top:10px;">
					[#list news as new]
						[#if new_index==0]
							<h2 style="margin: 0px; font-size: 21px; font-weight: bold;"><a href="/newsInfo.jhtml?id=${new.id}" title="${new.title}">
							[#if new.title?length > 15]
								${new.title?string?substring(0,15)}...
							[#else]
								${new.title}
							[/#if]
							</a></h2>
							<p style="color:#2B8BDF;font-size:13px;">
								${new.title}
							</p>
						[/#if]
						[/#list]
				</div>
				<div style="padding-left: 20px;">
					[#list news as new]
						[#if new_index==1]	
							<h2 style="margin: 0px; font-size: 21px; font-weight: bold;"><a href="/newsInfo.jhtml?id=${new.id}">
							[#if new.title?length > 15]
								${new.title?string?substring(0,15)}...
							[#else]
								${new.title}
							[/#if]</a></h2>
							<p style="color:#2B8BDF;font-size:12px;">
							${new.title}
							</p>
						[/#if]
						[/#list]
				</div>
				<hr style="margin-left: 10px; margin-right: 10px; border: 1px dashed #e4e4e4;">
				<ul class="xinwen_ul" style="padding-left: 25px;">
					[#list news as new]
					[#if new_index > 1 && new_index <6]	
						<li class="xinwen_ul_li"><a href="/newsInfo.jhtml?id=${new.id}">
						[#if new.title?length > 16]
							${new.title?string?substring(0,16)}...
						[#else]
							${new.title}
						[/#if]
						</a></li>
					[/#if]
					[/#list]
				</ul>
			</div>
			<div class="biaoti">
				[#list slide as slide]
					[#if slide_index<2]
					<a href="${slide.alink}" title="${slide.title}">
						<img src="${slide.imgpath}" [#if slide_index=0] style="width: 543px;height:85px;"[#elseif slide_index=1]style="width: 165px;height:85px;"[/#if]>
					</a>
					[/#if]
				[/#list]
			</div>
			<div class="ad">
				<a href="/mailBox.jhtml" title="局长信箱"><div class=""></div></a>
				<a href="#" title="网站论坛"><div class=""></div></a>
				<a href="/ziliaoList.jhtml" title="相关下载"><div class=""></div></a>
			</div>
			<div class="xinxi">
				<table>
					<tr>
						<td>
							<div class="xinxi_1">
								<p class="xinxi_1_p"><span style="margin-left:30px;float:none;">招聘信息</span></p>
								<ul style="padding-left:25px;">
									[#list zhaopList as zhaop]
									[#if zhaop_index <6]
										<li class="xinxi_1_li">
											<a href="/enterpriseInformation.jhtml?id=${zhaop.entUser.id}">${zhaop.company}</a>&nbsp;&nbsp;
											<a href="/enterpriseInformation.jhtml?id=${zhaop.entUser.id}#zw">[#if zhaop.workType.name?length >13]${zhaop.workType.name?string?substring(0,13)}...[#else]${zhaop.workType.name}[/#if]</a>
											<span class="xinxi_1_span">${zhaop.editTime?number_to_datetime}</span>

										</li>
									[/#if]
									[/#list]
								</ul>
							</div>
						</td>
						<td>
							<div class="xinxi_1">
								<p class="xinxi_1_p"><span style="margin-left:30px;float:none;">政策信息</span></p>
								<ul style="padding-left:25px;">
									[#list countryLawDataList as countryLawData]
										[#if countryLawData_index <6]
											<li  class="xinxi_1_li">
												<a href="/countryLaw.jhtml?id=${countryLawData.id}">
													[#if countryLawData.title?length > 15]
														${countryLawData.title?string?substring(0,15)}...
													[#else]
														${countryLawData.title}
													[/#if]
												</a>
												<span class="xinxi_1_span" style="">${countryLawData.editTime?number_to_datetime}</span>
											</li>
										[/#if]
									[/#list]
								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="xinxi_1">
								<p class="xinxi_1_p"><span style="margin-left:30px;float:none;">求职信息</span></p>
								<ul style="padding-left:25px;">
									[#list qiuzhiList as qiuzhi]
									[#if qiuzhi_index <6]
										<li class="xinxi_1_li">
											<a href="/personalResume.jhtml?id=${qiuzhi.id}">${qiuzhi.trueName}&nbsp;&nbsp;[#if qiuzhi.sex == 'man']男[#else]女[/#if]&nbsp;&nbsp;${qiuzhi.eduLevel}&nbsp;&nbsp;${qiuzhi.workType.name}</a>
											<span class="xinxi_1_span">${qiuzhi.createDate?number_to_datetime}</span>
										</li>
									[/#if]
									[/#list]
								</ul>
							</div>
						</td>
						<td>
							<div class="xinxi_1">
								<p class="xinxi_1_p"><span style="margin-left:30px;float:none;">工作动态</span></p>
								<ul style="padding-left:25px;">
								[#list works as work]
									[#if work_index <6]
										<li  class="xinxi_1_li">
											<a href="/workInfo.jhtml?id=${work.id}">
												[#if work.title?length > 15]
													${work.title?string?substring(0,15)}...
												[#else]
													${work.title}
												[/#if]
											</a>
											<span class="xinxi_1_span">${work.editTime?number_to_datetime}</span>
										</li>
									[/#if]
								[/#list]
								</ul>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="j_mian_right">
			<div id="" class="gonggao">
				<p style="margin:0;padding:5px;padding-left:20px;background:url(/resource/public/images/111.png);">
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					公告公示<span style="float:right;"><a href="/publicityList.jhtml">更多</a></span>
				</p>
				<ul id="" style="padding-left:25px;">
					[#list notices as notice]
						[#if notice_index <8]
						<li class="gonggao_li"><a href="/publicityInfo.jhtml?id=${notice.id}">
							[#if notice.title?length > 13]
								${notice.title?string?substring(0,13)}...
							[#else]
								${notice.title}
							[/#if]
							</a><span class="gonggao_span">${notice.createTime?number_to_datetime}</span>
						</li>
						[/#if]
					[/#list]
				</ul>
			</div>
			
			[#if sessionUser?exists]
				<div class="denglu" id="denglu2">
				<table style="padding:19px;">
					<tr class="denglu_tr">
						<td colspan="2" align="center" style="background:url(/resource/public/images/beijingse.png);line-height:28px;color:#FFFFFF;border-radius:4px;">用户登录</td>
					</tr>
					<tr class="denglu_tr">
						<td colspan="2"><font color="red" size="2">${sessionUser.loginName}</font>，欢迎您登录！</td>
					</tr>
					<tr class="denglu_tr">
						<td colspan="2">上次登录时间:
						  <span style="font-size:13px">
							${sessionUser.lastLoginData?number_to_datetime}&nbsp;${sessionUser.lastLoginData?number_to_time}
						  </span>
						 </td>
					</tr>
					<tr class="denglu_tr">
						<td align="center" colspan="2" style="padding-top: 5px;">
							<input type="button" style="margin-right: 10px;background: none repeat scroll 0 0 #6DBE3A;border: 1px solid #1C960C;border-radius: 4px;color: #FFFFFF; width: 90px;" 
							value="[#if sessionUser.class.name == "com.etech.entity.TcomUser"]个人中心[#elseif sessionUser.class.name == "com.etech.entity.TentUser"]企业中心[#else]管理员后台[/#if]"
							onclick="javascript:[#if sessionUser.class.name == "com.etech.entity.TcomUser"]window.location.href='/common-user/center.jhtml';[#elseif sessionUser.class.name == "com.etech.entity.TentUser"] window.location.href='/enterprise-user/center.jhtml';[#else]window.location.href='/admin/common/main.jhtml';[/#if]" 
							>
							<input id="logout" type="button" style="background: none repeat scroll 0 0 #6DBE3A;border: 1px solid #1C960C;border-radius: 4px;color: #FFFFFF; width: 90px;" value="退出">
						</td>
					</tr>
				</table>
			</div>
			[#else]
				<div class="denglu" id="denglu1">
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
			
			<div class="jiuye">
				<p style="margin:0;padding:5px;padding-left:20px;background:url(/resource/public/images/111.png);margin-bottom:10px;">
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					就业业务办理
				</p>
				<div class="jiuye_1">
					<table>
						<tr>
							<td><div style=""></div></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>	
			</div>
		</div>
		<div class="zhuanti">
			<div>
				<div style="width:99px;float:left;"><img src="/resource/public/images/zhizuo-_03.png" style="padding: 5px;"></div>
				<div style="line-height: 34px; height: 34px; margin-left: 10px; margin-top: 15px; float: left; margin-right: 10px; width: 808px;"><hr style="border:1px dashed #e4e4e4;"></div>
				<div style="width: 70px; float: left; line-height: 45px;"><a href="/specialList.jhtml">更多>></a></div>
				<!--
				
				<div id="zhuanti_pic" style="display:inline-block;">
					<div style="width:225px;height:70px;float:left;margin-left:30px;border:1px solid;">
						<a href="/special.jhtml"><img src="/resource/public/images/01.png" style="width: 225px; height: 70px;"></a>
					</div>
					<div style="width:225px;height:70px;float:left;margin-left:10px;border:1px solid;">
						<a href="/special.jhtml"><img src="/resource/public/images/01.png" style="width: 225px; height: 70px;"></a>
					</div>
					<div style="width:225px;height:70px;float:left;margin-left:10px;border:1px solid;">
						<a href="/special.jhtml"><img src="/resource/public/images/01.png" style="width: 225px; height: 70px;"></a>
					</div>
					<div style="width:225px;height:70px;float:left;margin-left:10px;border:1px solid;">
						<a href="/special.jhtml"><img src="/resource/public/images/01.png" style="width: 225px; height: 70px;"></a>
					</div>
					<a href="/" style="background: url(/resource/public/images/u6_normal_33.gif); height: 62px; width: 14px; position: absolute;left:150px;margin-top:3px;"></a>
					<a href="/" style="background: url(/resource/public/images/222.png); height: 62px; width: 13px; position: absolute;right:150px;margin-top:3px;"></a>
				</div>
				
				-->
				<style type="text/css">
					.box{ width:980px;position:relative; overflow:hidden; height:100%;right:0;top:0;}
					.picbox{ width:980px; height:70px; overflow:hidden; position:relative;}
					.picbox li{list-style:none;}
					.piclist{ height:70px;position:absolute; left:0px; top:0px;padding:0;margin:0;}
					.piclist li{ background:#eee; margin-right:20px; padding:5px; float:left;}
					.swaplist{ position:absolute; left:-3000px; top:0px}
					.og_prev,.og_next{ width:30px; height:50px; background:url(http://www.codefans.net/jscss/demoimg/201401/icon.png) no-repeat; background:url(http://www.codefans.net/jscss/demoimg/201401/icon_ie6.png) no-repeat\9; position:absolute; top:10px; z-index:99; cursor:pointer;filter:alpha(opacity=70); opacity:0.7;}
					.og_prev{ background-position:0 -60px; left:4px;}
					.og_next{ background-position:0 0; right:4px;}
				</style>
				<script type="text/javascript">
					$(document).ready(function(e) {
						/***不需要自动滚动，去掉即可***/
						time = window.setInterval(function(){
							$('.og_prev').click();
						},5000);
						/***不需要自动滚动，去掉即可***/
						linum = $('.mainlist li').length;//图片数量
						w = linum * 250;//ul宽度
						$('.piclist').css('width', w + 'px');//ul宽度
						$('.swaplist').html($('.mainlist').html());//复制内容
						$('.og_next').click(function(){
							if($('.swaplist,.mainlist').is(':animated')){
								$('.swaplist,.mainlist').stop(true,true);
							}
							if($('.mainlist li').length>4){//多于4张图片
								ml = parseInt($('.mainlist').css('left'));//默认图片ul位置
								sl = parseInt($('.swaplist').css('left'));//交换图片ul位置
								if(ml<=0 && ml>w*-1){//默认图片显示时
									$('.swaplist').css({left: '1000px'});//交换图片放在显示区域右侧
									$('.mainlist').animate({left: ml - 1000 + 'px'},'slow');//默认图片滚动
									if(ml==(w-1000)*-1){//默认图片最后一屏时
										$('.swaplist').animate({left: '0px'},'slow');//交换图片滚动
									}
								}else{//交换图片显示时
									$('.mainlist').css({left: '1000px'})//默认图片放在显示区域右
									$('.swaplist').animate({left: sl - 1000 + 'px'},'slow');//交换图片滚动
									if(sl==(w-1000)*-1){//交换图片最后一屏时
										$('.mainlist').animate({left: '0px'},'slow');//默认图片滚动
									}
								}
							}
						})
						$('.og_prev').click(function(){
					
							if($('.swaplist,.mainlist').is(':animated')){
								$('.swaplist,.mainlist').stop(true,true);
							}
							if($('.mainlist li').length>4){
								ml = parseInt($('.mainlist').css('left'));
								sl = parseInt($('.swaplist').css('left'));
								if(ml<=0 && ml>w*-1){
									$('.swaplist').css({left: w * -1 + 'px'});
									$('.mainlist').animate({left: ml + 1000 + 'px'},'slow');
									if(ml==0){
										$('.swaplist').animate({left: (w - 1000) * -1 + 'px'},'slow');
									}
								}else{
									$('.mainlist').css({left: (w - 1000) * -1 + 'px'});
									$('.swaplist').animate({left: sl + 1000 + 'px'},'slow');
									if(sl==0){
										$('.mainlist').animate({left: '0px'},'slow');
									}
								}
							}
						})
					});
					$(document).ready(function(){
						$('.og_prev,.og_next').hover(function(){
								$(this).fadeTo('fast',1);
							},function(){
								$(this).fadeTo('fast',0.7);
						})
					})
					</script>
				<div class="box" id="box">
					<div class="picbox">
						<ul class="piclist mainlist">
							[#list subjectReport as sReport]
								<li>
									<a href="/special.jhtml?id=${sReport.id}">
										<img src="${sReport.imgpath}" width="220" height="62">
									</a>
								</li>
							[/#list]
						</ul>
				        <ul class="piclist swaplist"></ul>
					</div>
					<div class="og_prev"></div>
					<div class="og_next"></div>
				</div>
				
			</div>
		</div>
		<div class="tupian">
			<div style="width:1000px;height:38px;background:url(/resource/public/images/zhizuo-_01.png);">
				<span style="color: #FFD32A;font-size: 20px;font-weight: bold;line-height: 38px;padding-left: 15px;">图片新闻</span>
				<span style="float: right; line-height: 35px; margin-right: 10px;"><a style="color:#FFFFFF;" href="/imagesList.jhtml">更多>></a></span>
			</div>
			<div style="width:1000px;height:148px;background:#FFE7DB;">
				[#list imgs as img]
					[#if img_index <=3]
					<div class="tupian_1" [#if !img_has_next && img_index= 3] style="margin-top: -3px;"[/#if]>
						<p class="tupian_p">
							<a href="/imgShow.jhtml?id=${img.id}" title="${img.title}">
								<img src="${img.imgpath}" width="220" height="105">
							</a>
						</p>
						<p class="tupian_p">
							<a href="/imgShow.jhtml?id=${img.id}" title="${img.title}">
								[#if img.title?length >10]
		                    		${img.title?string?substring(0,10)}...
		                    	[#else]
		                    		${img.title}
		                    	[/#if]
							</a>
						</p>
					</div>
					[/#if]
				[/#list]
			</div>
		</div>
		<div class="youqing">
			<span style="line-height: 55px; padding-left: 15px;">友情链接</span>
			<div style="width: 850px; float: right; margin-right: 25px;margin-top:11px;">
				[#list links as links]
					<span class="yqlj">
						<a class="yqlj_a" href="http://${links.alink}" title="${links.title}" target="_blank">${links.title}</a>
					</span>
				[/#list]
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
<script type="text/javascript">
	$().ready(function(){
		var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
		var isOpera = userAgent.indexOf("Opera") > -1;
		
		if (isOpera){return "Opera"}; //判断是否Opera浏览器
		if (userAgent.indexOf("Firefox") > -1){//判断是否Firefox浏览器
			//alert("Firefox浏览器");
			$("#box").css("right","988px");
			$("#box").css("top","50px");
			return "FF";
		} 
		if (userAgent.indexOf("Safari") > -1){return "Safari";} //判断是否Safari浏览器
		if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera){return "IE";} ; //判断是否IE浏览器
	});
</script>
</body>
</html>
