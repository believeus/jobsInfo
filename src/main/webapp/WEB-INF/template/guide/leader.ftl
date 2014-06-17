<!DOCTYPE html>
<html>
<head>
    <title>工作指南-局领导</title>
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
			height:180px;
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
		.j_main_left_1 a {
		    font-size: 17px;
		    margin-left: 40px;
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
			float:left;
			width:728px;
			height:auto;
		}
		.j_main_right_2_1 p a{
			color: #3586F2;
		    margin-right: 10px;
		    text-decoration: underline;
		}
		.j_main_right_2_1 li{
			border-bottom: 1px solid #000000;
    		line-height: 25px;
		}
		.j_main_right_2 p{
			padding:0 30px;
			font-size:13px;
			line-height:20px;
		}
		.j_main_right_2_1_1{
			float:left;
			width:728px;
			height:auto;
			margin-right:10px;
		}
		.j_main_right_2_1_2{
			float:left;
			width:700px;
			height:230px;
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
					<li><a href="/organization.jhtml">机构简介</a></li>
					<li><a href="/mainFunction.jhtml">主要职能</a></li>
					<li class="current_li"><a href="/leader.jhtml">局领导</a></li>
				</ul>
			</div>
			<div class="j_main_left_1" style="margin-top:10px;height:400px;text-align:center;">
				<div style="width:99px;float:left;"><img src="/resource/public/images/zhizuo-_03.png" style="padding: 5px;"></div>
				<div style="line-height: 34px; height: 34px; margin-left: 10px; margin-top: 15px; float: left; margin-right: 10px; width: 60px;"><hr style="border:1px dashed #e4e4e4;"></div>
				<div style="width: 70px; float: left; line-height: 45px;"><a href="/specialList.jhtml" style="margin-left:0;">更多>></a></div>
				[#list subjectReport as sReport]
					<a href="/special.jhtml?id=${sReport.id}"><img src="${sReport.imgpath}" style="width:222px;height:66px;margin-top:7px;"></a>
				[/#list]
			</div>
		</div>
		<div class="j_main_right">
			<div class="j_main_right_1">
				<p>
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					所在位置 > 工作指南 > 局领导
				</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;">
				<div class="j_main_right_2_1">
				
					[#list datas as data]
					<div class="j_main_right_2_1_1" style="margin-bottom:10px;">
						<div class="" style="height: 130px; float: left; margin-left: 25px; width: 100px; margin-top: 10px;">
							<img src="/resource/public/images/meinv.png" width="95" height="130">
						</div>
						<div class="" style="height: 130px; float: left; margin-left: 10px; width: 585px; margin-top: 10px;">
							<p>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：${data.author}</p>
							<p>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：局长，党组书记</p>
							<p>分管范围：主持局全局工作，分管局综合处、省职业介绍中心、省就业训练中心。</p>
						</div>
					</div>
					[/#list]
				</div>
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>