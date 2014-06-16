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
		.gonggao li{
			margin-right:10px;
			line-height:29px;
			font-size:12px;
		}
		.gonggao span{
    		float:right;
    	}
    	.denglu{
    		width:260px;
    		height:220px;
    		border:1px solid #EED9C8;
    		margin-bottom:5px;
    	}
    	.denglu tr{
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
    	}
    	.tupian{
    		width:998px;
    		height:186px;
    		border:1px solid #e4e4e4;
    		margin-bottom:6px;
    	}
    	.youqing{
    		width:998px;
    		height:55px;
    		border:1px solid #e4e4e4;
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
    	}
    	.xinwen li{
    		line-height:20px;
    	}
    	.xinwen_ul li{
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
    	}
    	.xinxi_1{
    		border: 1px solid #EED9C8;
		    height: 180px;
		    margin-left: 7px;
		    margin-top: 5px;
		    width: 340px;
    	}
    	.xinxi_1 p{
    		background: url(/resource/public/images/jianbian.png);
		    color: #FF0000;
		    margin: 0;
		    padding: 8px;
		    height:14px;
    	}
    	.xinxi_1 li{
    		font-size:12px;
    		line-height:23px;
    		list-style:none;
    	}
    	.xinxi_1 span{
    		float:right;
    		margin-right:10px;
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
						<a href="/newsInfo.jhtml" target="_blank"><img src="/resource/public/images/u6_normal_03.gif" title="this is a beautiful girl!" alt="第一届潜江创业培训研讨会召开" /></a>
						<a href="/newsInfo.jhtml" target="_blank"><img src="/resource/public/images/u6_normal_03.gif" title="this is a beautiful girl!" alt="第二届潜江创业培训研讨会召开" /></a>
						<a href="/newsInfo.jhtml" target="_blank"><img src="/resource/public/images/u6_normal_03.gif" title="this is a beautiful girl!" alt="第三届潜江创业培训研讨会召开" /></a>
						<a href="/newsInfo.jhtml" target="_blank"><img src="/resource/public/images/u6_normal_03.gif" title="this is a beautiful girl!" alt="第四届潜江创业培训研讨会召开" /></a>
					</div>
				</div>
				<!--***************************************************************-->
				
			</div>
			<div class="xinwen">
				<div style="padding-left: 20px;margin-bottom:20px;">
					<h2 style="margin: 0px; font-size: 21px; font-weight: normal;"><a href="/newsInfo.jhtml">表彰全市创业就业先进个人</a></h2>
					<p style="color:#2B8BDF;margin:0;font-size:12px;">xx市人力资源和社会保障局关于表彰全市创业就业先进个人的决定</p>
				</div>
				<div style="padding-left: 20px;">
					<h2 style="margin: 0px; font-size: 21px; font-weight: normal;"><a href="/newsInfo.jhtml">国务院六大举措力促高校毕业生就业</a></h2>
					<p style="color:#2B8BDF;margin:0;font-size:12px;">昨日，国务院总理李克强主持召开国务院常务会议，对于如何做..</p>
				</div>
				<hr style="margin-left: 10px; margin-right: 10px; border: 1px dashed #e4e4e4;">
				<ul class="xinwen_ul" style="padding-left: 25px;">
					<li><a href="/newsInfo.jhtml">推陈出新的巧克力蛋糕店创业计划书</a></li>
					<li><a href="/newsInfo.jhtml">创业计划书的六个概念</a></li>
					<li><a href="/newsInfo.jhtml">赢动运城创业大赛报名表</a></li>
					<li><a href="/newsInfo.jhtml">毕业季里的创业课</a></li>
					<li><a href="/newsInfo.jhtml">运城启动SIYB免费创业培训</a></li>
				</ul>
			</div>
			<div class="biaoti">
				<a href="/specialList.jhtml"><img src="/resource/public/images/u6_normal_15.gif" style="width: 550px;"></a>
				<a href="/jobIntroduce.jhtml"><img src="/resource/public/images/u6_normal_17.gif"></a>
			</div>
			<div class="ad">
				<a href="/mailBox.jhtml" title="局长信箱"><div class=""></div></a>
				<a href="#" title="网站论坛"><div class=""></div></a>
				<a href="/xiazai.jhtml" title="相关下载"><div class=""></div></a>
			</div>
			<div class="xinxi">
				<table>
					<tr>
						<td>
							<div class="xinxi_1">
								<p><span style="margin-left:30px;float:none;">招聘信息</span></p>
								<ul style="padding-left:25px;">
									<li><a href="/enterpriseInformation.jhtml#zp">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="/enterpriseInformation.jhtml#zp">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="/enterpriseInformation.jhtml#zp">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="/enterpriseInformation.jhtml#zp">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="/enterpriseInformation.jhtml#zp">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="/enterpriseInformation.jhtml#zp">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
								</ul>
							</div>
						</td>
						<td>
							<div class="xinxi_1">
								<p><span style="margin-left:30px;float:none;">政策信息</span></p>
								<ul style="padding-left:25px;">
									<li><a href="/countryLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="/countryLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="/countryLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="/countryLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="/countryLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="/countryLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="xinxi_1">
								<p><span style="margin-left:30px;float:none;">求职信息</span></p>
								<ul style="padding-left:25px;">
									<li><a href="">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
								</ul>
							</div>
						</td>
						<td>
							<div class="xinxi_1">
								<p><span style="margin-left:30px;float:none;">工作动态</span></p>
								<ul style="padding-left:25px;">
									<li><a href="">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
									<li><a href="">2014年医疗、工伤和生育保险工作座谈会召开</a><span>04-19</span></li>
								</ul>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="j_mian_right">
			<div id="demo" class="gonggao">
				<p style="margin:0;padding:5px;padding-left:20px;background:url(/resource/public/images/111.png);">
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					公告公示<span style="float:right;"><a href="/publicityList.jhtml">更多</a></span>
				</p>
				<ul id="demo1" style="padding-left:25px;">
					<li><a href="/publicityInfo.jhtml">工伤职工劳动能力鉴定管理办..</a><span>10-15</span></li>
					<li><a href="/publicityInfo.jhtml">社会保障费申请缴纳管理规定..</a><span>10-15</span></li>
					<li><a href="/publicityInfo.jhtml">人力资源社会保障部关于印发..</a><span>10-15</span></li>
					<li><a href="/publicityInfo.jhtml">社会保障费申请缴纳管理规定..</a><span>10-15</span></li>
					<li><a href="/publicityInfo.jhtml">工伤职工劳动能力鉴定管理办..</a><span>10-15</span></li>
					<li><a href="/publicityInfo.jhtml">人力资源社会保障部关于印发..</a><span>10-15</span></li>
					<li><a href="/publicityInfo.jhtml">人力资源社会保障部关于印发..</a><span>10-15</span></li>
					<li><a href="/publicityInfo.jhtml">工伤职工劳动能力鉴定管理办..</a><span>10-15</span></li>
				</ul>
				<div id="demo2" class="gonggao"></div>
			</div>
			
			[#if sessionUser?exists]
				<div class="denglu" id="denglu2">
				<table style="padding:19px;">
					<tr>
						<td colspan="2" align="center" style="background:url(/resource/public/images/beijingse.png);line-height:28px;color:#FFFFFF;border-radius:4px;">用户登录</td>
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
						<td align="center" colspan="2" style="padding-top: 5px;">
							<input type="button" style="margin-right: 10px;background: none repeat scroll 0 0 #6DBE3A;border: 1px solid #1C960C;border-radius: 4px;color: #FFFFFF; width: 90px;" value="个人中心"
							onclick="javascript:[#if sessionUser.class.name == "com.etech.entity.TcomUser"]window.location.href='/common-user/center.jhtml';[#else] window.location.href='/enterprise-user/center.jhtml';[/#if]" 
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
							<input type="button" id="login" value="登录" style="margin-right: 10px;">
							<input type="button" id="register" value="注册">
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
			</div>
		</div>
		<div class="tupian">
			<div style="width:1000px;height:38px;background:url(/resource/public/images/zhizuo-_01.png);">
				<span style="color: #FFD32A;font-size: 20px;font-weight: bold;line-height: 38px;padding-left: 15px;">图片新闻</span>
				<span style="float: right; line-height: 35px; margin-right: 10px;"><a style="color:#FFFFFF;" href="/imagesList.jhtml">更多>></a></span>
			</div>
			<a href="/imgShow.jhtml"><img src="/resource/public/images/u6_normal_39.gif" style="width: 998px; margin-top: -4px;"></a>
			<a href="/imgShow.jhtml"><img src="/resource/public/images/u6_normal_41.gif" style="width: 998px; margin-top: -4px;"></a>
		</div>
		<div class="youqing">
			<span style="line-height: 55px; padding-left: 15px;">友情链接</span>
			<div style="width: 850px; float: right; margin-right: 25px;">
				<img src="/resource/public/images/u6_normal_43.gif" style="margin-top:5px;">
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
	<script type="text/javascript"> 
		var speed=80;
		var demo=document.getElementById("demo"); 
		var demo2=document.getElementById("demo2"); 
		var demo1=document.getElementById("demo1"); 
		demo2.innerHTML=demo1.innerHTML;
		function Marquee(){ 
			if(demo2.offsetTop-demo.scrollTop<=0) 
				demo.scrollTop-=demo1.offsetHeight; 
			else{ 
			  	demo.scrollTop++;
			} 
		} 
		var MyMar=setInterval(Marquee,speed); 
		demo.onmouseover=function() {clearInterval(MyMar)} 
		demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)} 
	</script>
</body>
</html>
