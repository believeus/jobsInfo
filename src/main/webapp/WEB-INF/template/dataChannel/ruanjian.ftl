<!DOCTYPE html>
<html>
<head>
    <title>下载中心</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script type="text/javascript" src="/resource/public/js/jquery.js"></script>
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
		
		
		[#--左边菜单样式begin--]
	   .j_main_left_1{
			border: 1px solid #CDCDCD;
		    border-radius: 4px;
		    height: auto;
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
	[#--左边菜单样式end--]
	
		
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
		.j_main_right_2_p{
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
    <script type="text/javascript">
    	$().ready(function(){
    		$("#xiazai_center").click(function(){
    			$("#xiazai_list").toggle(500);
    		});
    	});
    </script>
</head>
<body>
	[#include "/include/header.ftl" /]
	<div class="j_main w">
		<div class="j_main_left">
			<div class="j_main_left_1" style="background:#F3F3F3;">
				<p>数据频道<span>Data Channel</span></p>
				<ul style="padding-left:0;margin:0;">
					<li><a href="/fenxibaogaoList.jhtml">供求分析报告</a></li>
					<li><a href="/zhidaojiaweiList.jhtml">全市工资指导价位</a></li>
					<li><a href="/xuqiupaihangList.jhtml">职业需求排行</a></li>
					<li><a href="/gongjipaihangList.jhtml">职业供给排行</a></li>
					<li><a id="xiazai_center" href="javascript:void(0);">下载中心</a></li>
				</ul>
				<div id="xiazai_list" class="j_main_left_1" style="background:#F3F3F3;height:111px;border:0;">
					<ul style="padding-left:0;margin:0;">
						<li ><a style="margin-left:80px;" href="/ziliaoList.jhtml">资料下载</a></li>
						<li><a style="margin-left:80px;" href="/biaogeList.jhtml">表格下载</a></li>
						<li class="current_li"><a style="margin-left:80px;" href="/ruanjianList.jhtml">软件下载</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="j_main_right">
			<div class="j_main_right_1">
				<p>
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					所在位置 > <a href="/dataChannel.jhtml" title="数据频道">数据频道</a>
				</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;">
				<h2 style="text-align:center;font-weight:normal;">${data.title}</h2>
				<p style="text-align:center;">来源：[#if data.title?exists]${data.author}[#else]潜江公共就业服务网[/#if] 发布时间：${data.editTime?number_to_datetime} </p>
				<img src="/resource/public/images/line.png" style="padding: 0px 20px; width: 675px;">
				<div class="j_main_right_2_p">
					${data.content}
				</div>
				<p><a href="${data.imgpath?string?split("#")[1]}" title="点击下载" style="color:#0000FF;">附件下载：${data.imgpath?string?split("#")[0]}</a></p>
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>