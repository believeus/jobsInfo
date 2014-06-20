<!DOCTYPE html>
<html>
<head>
    <title>企业信息</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script type="text/javascript" src="/resource/public/js/jquery.js"></script>
    <script type="text/javascript"  src="/resource/public/js/Etech.js"></script>
    <link href="/resource/public/js/jquery-X-Menu/css/xmenu.css" rel="stylesheet" type="text/css" />  
    <link href="/resource/public/js/jquery-X-Menu/css/powerFloat.css" rel="stylesheet" type="text/css" />  
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-xmenu.js"></script> 
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-powerFloat-min.js"></script>
	<script type="text/javascript" src="/resource/public/js/datePicker/WdatePicker.js"></script>
    <script type="text/javascript">
    	$().ready(function(){
    		$("#qiye_xinxi").click(function(){
    			$("#qiye_xinxi").removeClass("currentSwich");
    			$("#zhaopin_xinxi").removeClass("currentSwich");
    			$("#zhiwei").removeClass("currentSwich");
    			$("#qiye_xinxi").addClass("currentSwich");
    			$("#base_xinxi").show();
    			$("#bianji_xinxi").hide();
    			$("#zhiwei_xinxi").hide();
    		});
    		$("#zhaopin_xinxi").click(function(){
    			$("#qiye_xinxi").removeClass("currentSwich");
    			$("#zhaopin_xinxi").removeClass("currentSwich");
    			$("#zhiwei").removeClass("currentSwich");
    			$("#zhaopin_xinxi").addClass("currentSwich");
    			$("#bianji_xinxi").show();
    			$("#base_xinxi").hide();
    			$("#zhiwei_xinxi").hide();
    		});
    		$("#zhiwei").click(function(){
    			$("#qiye_xinxi").removeClass("currentSwich");
    			$("#zhaopin_xinxi").removeClass("currentSwich");
    			$("#zhiwei").removeClass("currentSwich");
    			$("#zhiwei").addClass("currentSwich");
    			$("#zhiwei_xinxi").show();
    			$("#bianji_xinxi").hide();
    			$("#base_xinxi").hide();
    		});
    		
    		//点击职位进入企业信息页面
    		if(window.location.hash == "#zw"){
    			$("#qiye_xinxi").removeClass("currentSwich");
    			$("#zhaopin_xinxi").removeClass("currentSwich");
    			$("#zhiwei").addClass("currentSwich");
    			$("#base_xinxi").css("display","none");
    			$("#bianji_xinxi").css("display","none");
    			$("#zhiwei_xinxi").css("display","block");
    		}
    		//点击招聘信息进入企业信息页面
    		if(window.location.hash == "#zp"){
    			$("#qiye_xinxi").removeClass("currentSwich");
    			$("#zhiwei").removeClass("currentSwich");
    			$("#zhaopin_xinxi").addClass("currentSwich");
    			$("#base_xinxi").css("display","none");
    			$("#bianji_xinxi").css("display","block");
    			$("#zhiwei_xinxi").css("display","none");
    		}
    	});
    </script>
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
			width:175px;
		}
		.j_main_right_2 tr{
			line-height:30px;
		}
		.qiyepic{
			float: left;
		    height: 190px;
		    width: 160px;
		    background:#FFFFFF;
		    margin-right:10px;
		}
		.qiyepic p{
			margin:0;
		}
		.qiyepic img {
		    height: 145px;
		    width: 160px;
		}
		.qiyepic input{
			width:163px;
		}
		.qiyepic a {
		    color: #AE3234;
		    text-decoration: underline;
		}
		.qiyepic textarea{
			border: 0 none;
		    font-size: 13px;
		    height: 39px;
		    resize: none;
		    width: 158px;
		    font-size:13px;
		    overflow:hidden;
		}
		.shipin td {
		    padding: 10px;
		    width:116px;
		}
		.shipin a{
			color: #AE3234;
		    text-decoration: underline;
		}
		.zhaopin th {
		    width: 113px;
		}
		.zhaopin td {
		    font-size: 13px;
		    border-bottom: 1px dashed #E4E4E4;
		}
		.zhaopin a {
		    color: #0000FF;
		    text-decoration: underline;
		}
		.delete_zhaopin {
		    color: #AE3234;
		    text-decoration: underline;
		}
		.currentSwich{
			background:#E36510;
			color:#FFFFFF;
		}
    </style>
    
</head>
<body>
	[#include "/include/header.ftl" /]
	<div class="j_main w">
		<div class="j_main_left">
			[#if sessionUser?exists]
			<div class="j_main_left_1" style="border:0;height:auto;border:1px solid #E4630F;border-radius:4px;">
				<table style="padding: 6px 19px 19px;">
					<tr>
						<td colspan="2" align="center" style="background:#EE981F;color:#FFFFFF;border-radius:4px;">用户登录</td>
					</tr>
					<tr>
						<td colspan="2"><font color="red" size="2">${sessionUser.loginName}</font>，欢迎您登录！</td>
					</tr>
					<tr>
						<td colspan="2">上次登录时间:
							<span style="font-size:13px;float:left;">
								${sessionUser.lastLoginData?number_to_datetime}&nbsp;${sessionUser.lastLoginData?number_to_time}
							</span>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2" style="padding-top: 20px;">
							<input type="button" style="margin-right: 10px;background: none repeat scroll 0 0 #6DBE3A;border: 1px solid #1C960C;border-radius: 4px;color: #FFFFFF; width: 75px;height:27px;" value="个人中心">
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
				<p style="background: #EE981F; text-align: center; margin: 5px; padding: 5px; border-radius: 5px; border: 0px none; color: #FFFFFF;">人才推荐</p>
				<div class="j_main_left_1_1">
					<p style="color: blue;">王小利</p>
					<p style="color: blue;font-weight:bold;">室内设计师</p>
					<p>薪资待遇：面议</p>
					<p>招聘人数：若干人</p>
					<p>学历要求：中专</p>
				</div>
				<div class="j_main_left_1_1">
					<p style="color: blue;">王小利</p>
					<p style="color: blue;font-weight:bold;">室内设计师</p>
					<p>薪资待遇：面议</p>
					<p>招聘人数：若干人</p>
					<p>学历要求：中专</p>
				</div>
				<div class="j_main_left_1_1" style="border-bottom:0;">
					<p style="color: blue;">王小利</p>
					<p style="color: blue;font-weight:bold;">室内设计师</p>
					<p>薪资待遇：面议</p>
					<p>招聘人数：若干人</p>
					<p>学历要求：中专</p>
				</div>
			</div>
		</div>
		<div class="j_main_right">
			<div class="j_main_right_1">
				<p>
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-left: 2px; margin-top: 2px; margin-right: 5px;">
					所在位置 > 企业中心
				</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;">
				<div class="j_main_right_2_1">
					<div id="qiye_xinxi" class="j_main_right_2_1_1 currentSwich" style="cursor:pointer;">企业信息</div>
					<div id="zhaopin_xinxi" class="j_main_right_2_1_2" style="cursor:pointer;">招聘信息</div>
					<div id="zhiwei" class="j_main_right_2_1_2" style="cursor:pointer;">职位信息</div>
				</div>
				
				<div id="base_xinxi" style="width::728px;height:auto;overflow:hidden;">
					<p>
						<span style="font-size:20px;color:#000000;">${trecruit.company}</span>
					</p>
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">基本信息</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 600px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div style="width:690px;height:auto;overflow:hidden;margin:0 20px;margin-bottom:15px;">
						<div class="" style="height: auto; overflow: hidden; float: left; width: 660px; margin-left: 30px; margin-top: 10px;margin-right:10px;">
							<table>
								<tr>
									<td>单位全称:</td>
									<td style="padding-right: 80px;">${trecruit.entUser.fullName}</td>
									<td rowspan="2" colspan="2">
										<img src="/resource/public/images/zt_topImg.png" width="260px" height="30px"/>
									</td>
								</tr>
								<tr>
									<td>单位性质:</td>
									<td>${trecruit.entUser.unitType}</td>
								</tr>
								<tr>
									<td>单位简称:</td>
									<td>${trecruit.entUser.shorName}</td>
									<td>隶属关系:</td>
									<td>${trecruit.entUser.relationship}</td>
								</tr>
								<tr>
									<td>经济类型:</td>
									<td>${trecruit.entUser.economicType}</td>
									<td>法人代表:</td>
									<td>${trecruit.entUser.legalMan}</td>
								</tr>
								<tr>
									<td>所属地区:</td>
									<td>${trecruit.entUser.area}</td>
									<td>行业:</td>
									<td>${trecruit.entUser.trade}</td>
								</tr>
								<tr>
									<td>注册资金:</td>
									<td>${trecruit.entUser.regMoney}</td>
									<td>详细地址:</td>
									<td>${trecruit.entUser.detailAddress}</td>
								</tr>
								<tr>
									<td>联系人:</td>
									<td>${trecruit.entUser.contacts}</td>
									<td>通讯地址:</td>
									<td>${trecruit.entUser.detailAddress}</td>
								</tr>
								<tr>
									<td>邮编:</td>
									<td>${trecruit.entUser.zip}</td>
									<td>手机:</td>
									<td>${trecruit.entUser.phoneFax}</td>
								</tr>
								<tr>
									<td>电话/传真:</td>
									<td>${trecruit.entUser.phoneFax}</td>
									<td>网址:</td>
									<td>${trecruit.entUser.webSite}</td>
								</tr>
								<tr>
									<td style="vertical-align: top;">单位简介:</td>
									<td colspan="3">
										<p style="margin: 0px; width: 570px; line-height: 22px;">
											${trecruit.entUser.introduce} 
										</p>
									</td>
								</tr>
							</table>
						</div>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">企业图片</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div style="width:670px;height:auto;overflow:hidden;margin:0 20px;margin-bottom:15px;padding:10px;">
						[#list trecruit.entUser.imgVedios as imgVedio]
						<div class="qiyepic">
							<p><img src="${imgVedio.url}" width="160" height="130"/></p>
							<p style="margin-top: -5px;background:#EEEEEE;padding:5px;color:#555555;">
								${imgVedio.descption}
							</p>
						</div>
						[/#list]
						<div class="qiyepic">
							<p><img src="/resource/public/images/qiyeshuoming.png" width="160" height="130"/></p>
							<p style="margin-top: -5px;background:#EEEEEE;padding:5px;color:#555555;">
								每一个人工作都是为了获得合理的报酬
							</p>
						</div>
						<div class="qiyepic">
							<p><img src="/resource/public/images/qiyeshuoming.png" width="160" height="130"/></p>
							<p style="margin-top: -5px;background:#EEEEEE;padding:5px;color:#555555;">
								每一个人工作都是为了获得合理的报酬
							</p>
						</div>
						<div class="qiyepic" style="margin-right:0;">
							<p><img src="/resource/public/images/qiyeshuoming.png" width="160" height="130"/></p>
							<p style="margin-top: -5px;background:#EEEEEE;padding:5px;color:#555555;">
								每一个人工作都是为了获得合理的报酬
							</p>
						</div>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">企业视频</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div class="shipin_parent">
						<div style="width:600px;height:auto;margin-left:auto;margin-right:auto;">
							<img src="/resource/public/images/shipin.jpg" width="580" height="430">
							<p>视频简介：</p>
							<p>每一个人工作都是为了获得合理的报酬，所以广大面试者不需要任何心理负担，或者有任何难以启齿的感觉。工资是每一个员工的正常收益，只有在面试的过程中得到恰当的定位，那么让员工在工作中有更好的积极性，也让企业获得最恰当的员工。</p>
						</div>
						<div class="shipin" style="width:690px;height:auto;overflow:hidden;margin:0 20px;margin-bottom:15px;">
							<table>
								<tr>
									[#list vedios as vedio]
									<td>
										<a href="/videosInfo.jhtml?id=${vedio.id}">
											<img src="${vedio.url}" width="100" height="70">
										</a>
									</td>
									[/#list]
									<td>
										<a href=""><img src="/resource/public/images/shipin.jpg" width="100" height="70"></a>
									</td>
									<td>
										<a href=""><img src="/resource/public/images/shipin.jpg" width="100" height="70"></a>
									</td>
									<td>
										<a href=""><img src="/resource/public/images/shipin.jpg" width="100" height="70"></a>
									</td>
									<td>
										<a href=""><img src="/resource/public/images/shipin.jpg" width="100" height="70"></a>
									</td>
								</tr>
							</table>
						</div>
					</div>
					
				</div>
				
				<div id="bianji_xinxi" style="width:728px;height:auto;;overflow:hidden;display:none;">
					<p>
						<span style="font-size:20px;color:#000000;">${trecruit.company}</span>
					</p>
					<div class="zhaopin" style="height: auto; text-align: center; border: 1px solid #e4e4e4; margin: 5px 20px; width: 685px;">
						<table cellspacing="0">
							<tr style="background:#F0F0F0;">
								<th>职位名称</th>
								<th>招聘人数</th>
								<th>工作地区</th>
								<th>学历要求</th>
								<th>刷新日期</th>
								<th>截至日期</th>
							</tr>
							
							<tr>
								<td>${trecruit.workType.name}</td>
								<td>${trecruit.worknum}人</td>
								<td>${trecruit.workspace}</td>
								<td>${trecruit.eduLevel}</td>
								<td>2天前</td>
								<td>2014-07-01</td>
							</tr>
						</table>
					</div>
				</div>
				
				<div id="zhiwei_xinxi" style="width:728px;height:auto;;overflow:hidden;display:none;">
					<p>
						<span style="font-size:20px;">${trecruit.workType.name}</span>
					</p>
					<div style="width:690px;height:auto;overflow:hidden;margin:0 20px;margin-bottom:15px;">
						<div class="" style="height: auto; overflow: hidden; float: left; width: 660px; margin-left: 30px; margin-top: 10px;margin-right:10px;">
							<table>
								<tr>
									<td>招聘单位:</td>
									<td style="padding-right: 80px;">${trecruit.company}</td>
									<td>专业:</td>
									<td>${trecruit.majorType.name}</td>
								</tr>
								<tr>
									<td>工种:</td>
									<td>${trecruit.workType.name}</td>
									<td>性别:</td>
									<td>${trecruit.sex}</td>
								</tr>
								<tr>
									<td>人数:</td>
									<td>${trecruit.worknum}</td>
									<td>技术等级:</td>
									<td>${trecruit.eteLevel}</td>
								</tr>
								<tr>
									<td>从事年限:</td>
									<td>${trecruit.workyear}</td>
									<td>文化程度:</td>
									<td>${trecruit.eduLevel}</td>
								</tr>
								<tr>
									<td>工作地点:</td>
									<td>${trecruit.workspace}</td>
									<td>年龄:</td>
									<td>${trecruit.age}</td>
								</tr>
								<tr>
									<td>身高:</td>
									<td>${trecruit.height}</td>
									<td>视力:</td>
									<td>${trecruit.eyesight}</td>
								</tr>
								<tr>
									<td>薪资待遇:</td>
									<td>${trecruit.salary}</td>
									<td>用工形式:</td>
									<td>${trecruit.workWay}</td>
								</tr>
								<tr>
									<td>招聘期限:</td>
									<td>${trecruit.worklimit}</td>
									<td>面试时间:</td>
									<td>${trecruit.viewData}</td>
								</tr>
							</table>
							<h4>职位描述：</h4>
							<p style="margin: 0px; width: 570px; line-height: 22px;">
								${trecruit.note} 
							</p>
							<h4>联系方式：</h4>
							<p style="margin: 0px; width: 570px; line-height: 22px;">
								${trecruit.entUser.phoneFax}
							</p>
							<h4>公司地点：</h4>
							<p style="margin: 0px; width: 570px; line-height: 22px;">
								${trecruit.entUser.detailAddress}
							</p>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>