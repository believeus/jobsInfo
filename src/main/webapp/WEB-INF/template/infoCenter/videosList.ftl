<!DOCTYPE html>
<html>
<head>
    <title>视频新闻列表</title>
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
			border: 1px solid #CDCDCD;
		    border-radius: 4px;
		    height: 251px;
		    width: 258px;
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
		.j_main_right_2 li{
    		margin-right: 30px;
    		font-size: 14px;
    		line-height:35px;
		}
		.j_main_right_2 td{
			padding: 10px 17px;
		}
		.j_main_right_2 span{
			float: right;
			font-size: 14px;
		}
		.j_main_right_2_1{
			float:left;
			width:359px;
			height:290px;
			margin-right:9px;
		}
		.j_main_right_2 a{
			color:#3A71AA;
		}
		.current_li{
			background:url(/resource/public/images/1_02.png) !important;
			color:#FFFFFF;
		}
		.current_li a{
			color:#FFFFFF;
		}
		.middle-money {
		    background: url(/resource/public/images/middle-money_bj.png) repeat-x scroll 0 0 rgba(0, 0, 0, 0);
		    color: #FFFFFF;
		    font-family: "微软雅黑";
		    font-size: 13px;
		    font-weight: bold;
		    height: 32px;
		    line-height: 32px;
		    margin-left: 5px;
		    margin-top: -37px;
		    position: relative;
		    text-align: right;
		    width: 190px;
		}
    </style>
</head>
<body>
	[#include "/include/header.ftl" /]
	<div class="j_main w">
		<div class="j_main_left">
			<div class="j_main_left_1" style="background:#F3F3F3;">
				<p>资讯中心<span>Information Center</span></p>
				<ul style="padding-left:0;margin:0;">
					<li><a href="/newsList.jhtml">新闻动态</a></li>
					<li><a href="/workList.jhtml">工作动态</a></li>
					<li><a href="/publicityList.jhtml">公告公示</a></li>
					<li><a href="/imagesList.jhtml">图片新闻</a></li>
					<li class="current_li" style="border-bottom:1px solid #EBEBEB;"><a href="/videosList.jhtml">视频新闻</a></li>
				</ul>
			</div>
			<div class="j_main_left_1" style="margin-top:10px;height:400px;text-align:center;">
				<div style="width:99px;float:left;"><img src="/resource/public/images/zhizuo-_03.png" style="padding: 5px;"></div>
				<div style="line-height: 34px; height: 34px; margin-left: 10px; margin-top: 15px; float: left; margin-right: 10px; width: 60px;"><hr style="border:1px dashed #e4e4e4;"></div>
				<div style="width: 70px; float: left; line-height: 45px;"><a href="/specialList.jhtml" style="margin-left:0;">更多>></a></div>
				<img src="/resource/public/images/zhuanti.png" style="margin-top:7px;">
			</div>
		</div>
		<div class="j_main_right">
			<div class="j_main_right_1">
				<p>
					<img style="float: left; margin-right: 10px;" src="/resource/public/images/sanjiaojian.png">
					所在位置 > 资讯中心
				</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;">
				<table>
					<tr>
						[#list videos as video]
						<td>
							<div style="width:205px;height:200px;border:1px solid #e4e4e4;text-align:center;">
								<p style="margin-top: 3px; margin-bottom: 0px;">
									<a href="/videosInfo.jhtml"><img src="/resource/public/images/tupxinwen.png" width="195" height="130"></a>
								</p>
								<div class="middle-money">2分30秒</div>
								<p style="padding:3px 5px;text-align:left;color:#3A71AA;font-size:14px;margin:0;"><a href="/videosInfo.jhtml">${video.title}</a></p>
								<p style="margin-top:0;">[${video.createTime?number_to_datetime}]</p>
							</div>
						</td>
						[/#list]
					</tr>
					<tr>
						<td>
							<div style="width:205px;height:200px;border:1px solid #e4e4e4;text-align:center;">
								<p style="margin-top: 3px; margin-bottom: 0px;">
									<a href="/videosInfo.jhtml"><img src="/resource/public/images/tupxinwen.png" width="195" height="130"></a>
								</p>
								<div class="middle-money">2分30秒</div>
								<p style="padding:3px 5px;text-align:left;color:#3A71AA;font-size:14px;margin:0;"><a href="/videosInfo.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a></p>
								<p style="margin-top:0;">[2014-04-19]</p>
							</div>
						</td>
					</tr>
					
				</table>
				<p style="padding-left:25px;">
					<a href="">首页</a>
					<a href="">上一页</a>
					<a href="">下一页</a>
					<a href="">末页</a>
					<select name="">
						<option value="">1</option>
						<option value="">2</option>
						<option value="">3</option>
						<option value="">4</option>
						<option value="">5</option>
					</select>
					共<font color="red">5</font>页<font color="red">51</font>条
				</p>
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>