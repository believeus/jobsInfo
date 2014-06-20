<!DOCTYPE html>
<html>
<head>
    <title>个人简历</title>
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
		}
		.gongzuo_div td {
		    text-align: center;
		    width: 118px;
		    padding: 5px 10px;
		}
		.zhiyuan_div td {
		    text-align: center;
		    width: 118px;
		    padding: 5px 10px;
		}
    </style>
</head>
<body>
	[#include "/include/header.ftl" /]
	<div class="j_main w">
		<div class="j_main_left">
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
			<div class="j_main_left_1" style="margin-top:10px;height:auto;text-align:center;border:1px solid #E4630F;border-radius:4px;">
				<p style="background: #EE981F; text-align: center; margin: 5px; padding: 5px; border-radius: 5px; border: 0px none; color: #FFFFFF;">职位推荐</p>
				<div class="j_main_left_1_1">
					<p style="color: blue;font-weight:bold;">室内设计师</p>
					<p style="color: blue;">中南集团营销公司</p>
					<p>薪资待遇：面议</p>
					<p>招聘人数：若干人</p>
					<p>学历要求：中专</p>
				</div>
				<div class="j_main_left_1_1">
					<p style="color: blue;font-weight:bold;">室内设计师</p>
					<p style="color: blue;">中南集团营销公司</p>
					<p>薪资待遇：面议</p>
					<p>招聘人数：若干人</p>
					<p>学历要求：中专</p>
				</div>
				<div class="j_main_left_1_1" style="border-bottom:0;">
					<p style="color: blue;font-weight:bold;">室内设计师</p>
					<p style="color: blue;">中南集团营销公司</p>
					<p>薪资待遇：面议</p>
					<p>招聘人数：若干人</p>
					<p>学历要求：中专</p>
				</div>
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
					<span style="font-size: 20px;">${tcomUser.trueName}</span>
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
									<td>${tcomUser.trueName}</td>
									<td style="background: #EEEEEE; text-align: right;">性别:</td>
									<td>${tcomUser.sex}</td>
								</tr>
								<tr>
									<td style="background: #EEEEEE; text-align: right;">二女户:</td>
									<td>${tcomUser.twoGirl}</td>
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
									<td style="background: #EEEEEE; text-align: right;">政治面貌:</td>
									<td>${tcomUser.polity}</td>
									<td style="background: #EEEEEE; text-align: right;">家庭详细地址:</td>
									<td>${tcomUser.address}</td>
								</tr>
								<tr>
									<td style="background: #EEEEEE; text-align: right;">婚姻状况:</td>
									<td>${tcomUser.marriage}</td>
									<td style="background: #EEEEEE; text-align: right;">原工作单位:</td>
									<td>${tcomUser.workspace}</td>
								</tr>
								<tr>
									<td style="background: #EEEEEE; text-align: right;">视力:</td>
									<td>${tcomUser.eyesight}</td>
									<td style="background: #EEEEEE; text-align: right;">《就失业证》号:</td>
									<td>${tcomUser.jobId}</td>
								</tr>
								<tr>
									<td style="background: #EEEEEE; text-align: right;">个人特长:</td>
									<td>${tcomUser.strongPoint}</td>
									<td style="background: #EEEEEE; text-align: right;">独生子女:</td>
									<td>${tcomUser.singleChild}</td>
								</tr>
								<tr>
									<td style="background: #EEEEEE; text-align: right;">联系电话:</td>
									<td colspan="3">${tcomUser.phoneNum}</td>
								</tr>
							</table>
						</div>
						<div style="width: 150px; float: left; margin-left: 15px; height: auto; margin-top: 15px;">
							<img style="width:122px;height:150px;border:1px solid #e4e4e4;" src="${tcomUser.imgHead}" name="img"/>
						</div>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">选择志愿</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div class="zhiyuan">
						<div class="zhiyuan_div" style="width:690px;height:100px;border:1px solid #e4e4e4;overflow:hidden;margin:0 20px;margin-bottom:15px;">
							<table cellspacing="0">
								<tr style="background:#eeeeee;">
									<td>专业</td>
									<td>工种</td>
									<td>月薪要求</td>
									<td>择业地区</td>
									<td>其他要求</td>
								</tr>
							</table>
						</div>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">具备技能</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div class="jineng">
						<div class="jineng_div" style="width:690px;height:100px;border:1px solid #e4e4e4;overflow:hidden;margin:0 20px;margin-bottom:15px;">
							<table cellspacing="0">
								<tr style="background:#EEEEEE;">
									<td>专业</td>
									<td>工种</td>
									<td>技能等级</td>
									<td>从事年限</td>
									<td>说明</td>
								</tr>
							</table>
						</div>
					</div>
					
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">学习经历</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div class="xuexi">
					<div class="xuexi_div" style="width:690px;height:100px;border:1px solid #e4e4e4;overflow:hidden;margin:0 20px;margin-bottom:15px;">
						<table cellspacing="0">
							<tr style="background:#EEEEEE;">
								<td>时间</td>
								<td>学校</td>
								<td>系别</td>
								<td>专业</td>
							</tr>
						</table>
					</div>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">工作经历</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div class="gongzuo">
					<div class="gongzuo_div" style="width:690px;height:100px;border:1px solid #e4e4e4;overflow:hidden;margin:0 20px;margin-bottom:15px;">
						<table cellspacing="0">
							<tr style="background:#EEEEEE;">
								<td>时间</td>
								<td>工作单位</td>
								<td>职位</td>
								<td>工种</td>
								<td>工作内容</td>
							</tr>
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