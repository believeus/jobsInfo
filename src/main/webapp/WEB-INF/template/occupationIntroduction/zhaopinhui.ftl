<!DOCTYPE html>
<html>
<head>
    <title>招聘会</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
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
			height:251px;
    		border:1px solid #e4e4e4;
    		border-radius:4px;
		}
		.j_main_left_1 p{
		    color: #BF0906;
		    font-size: 20px;
		    margin: 0;
		    padding: 20px;
		    text-align: left;
		}
		.j_main_left_1 span{
			color: #000000;
		    float: right;
		    font-size: 13px;
		    margin-top: 7px;
		}
		.j_main_left_1 li{
			line-height:35px;
			list-style:none;
			background:url(/resource/public/images/1_07.png);
		}
		.j_main_left_1 a{
			margin-left:40px;
			font-size:17px;
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
			width:727px;
			height:auto;
			margin-top:10px;
		}
		.j_main_right_2 p{
			padding:0 40px;
			font-size:13px;
		}
		.j_main_right_2_1{
			float:left;
			width:359px;
			height:290px;
			margin-right:9px;
		}
		.current_li{
			background:url(/resource/public/images/1_02.png) !important;
			color:#FFFFFF;
		}
		.current_li a{
			color:#FFFFFF;
		}
    </style>
</head>
<body>
	[#include "/include/header.ftl" /]
	<div class="j_main w">
		<div class="j_main_left">
			<div class="j_main_left_1" style="background:#F3F3F3;">
				<p>工作指南<span>Work Instructions</span></p>
				<ul style="padding-left:0;margin:0;">
					<!--<li><a href="/jiuyegonggaoList.jhtml">就业公告</a></li>-->
					<li class="current_li"><a href="/zhaopinhuiList.jhtml">招聘会</a></li>
					<li><a href="/qiuzhizhidaoList.jhtml">求职指导</a></li>
					<li><a href="/jianlizhinanList.jhtml">简历指南</a></li>
					<li><a href="/mianshibaodianList.jhtml">面试宝典</a></li>
				</ul>
			</div>
			<div class="j_main_left_1" style="margin-top: 10px; text-align: center; height: 445px;">
				<div style="width:99px;float:left;"><img src="/resource/public/images/zhizuo-_03.png" style="padding: 5px;"></div>
				<div style="line-height: 34px; height: 34px; margin-left: 10px; margin-top: 15px; float: left; margin-right: 10px; width: 60px;"><hr style="border:1px dashed #e4e4e4;"></div>
				<div style="width: 70px; float: left; line-height: 45px;"><a href="/specialList.jhtml" style="margin-left:0;">更多>></a></div>
				[#list subjectReport as sReport]
				[#if sReport_index <5]
					<a style="margin-left:0;" href="/special.jhtml?id=${sReport.id}"><img src="${sReport.imgpath}" style="width:222px;height:66px;margin-top:7px;"></a>
				[/#if]
				[/#list]
			</div>
		</div>
		<div class="j_main_right">
			<div class="j_main_right_1">
				<p>
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					所在位置 > 工作指南 > 机构简介
				</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;">
				<h2 style="text-align:center;font-weight:normal;">${data.title}</h2>
				<p style="text-align:center;">来源：[#if data.title?exists]${data.author}[#else]潜江公共就业服务网[/#if] 发布时间：${data.editTime?number_to_datetime} </p>
				<img src="/resource/public/images/line.png" style="padding: 0px 20px; width: 675px;">
				<p style="text-align: center;">
					${data.content}
				</p>
				<!--
					<img src="/resource/public/images/line.png" style="padding: 0px 20px; width: 675px;">
					<p style="padding-left:25px;">
						上一篇：<a href="">面试时是否该化妆</a>
					</p>
					<p style="padding-left:25px;">
						下一篇：<a href="">没有了</a>
					</p>
				-->
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>