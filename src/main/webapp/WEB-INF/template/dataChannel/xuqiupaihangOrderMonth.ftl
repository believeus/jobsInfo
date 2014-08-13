<!DOCTYPE html>
<html>
<head>
    <title>职位需求排行列表</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="/resource/public/css/common.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/resource/public/js/admin/jquery.js"></script>
	<script type="text/javascript" src="/resource/public/js/admin/list.js"></script>
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
				<p>数据频道<span>Data Channel</span></p>
				<ul style="padding-left:0;margin:0;">
					<li><a href="/fenxibaogaoList.jhtml">供求分析报告</a></li>
					<li><a href="/zhidaojiaweiList.jhtml">全市工资指导价位</a></li>
					<li class="current_li"><a href="/xuqiupaihangList.jhtml">职业需求排行</a></li>
					<li><a href="/gongjipaihangList.jhtml">职业供给排行</a></li>
					<li style=""><a href="/ziliaoList.jhtml">下载中心</a></li>
				</ul>
			</div>
		</div>
		<div class="j_main_right">
			<div class="j_main_right_1">
				<p>
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					所在位置 > <a href="/dataChannel.jhtml" title="数据频道">数据频道</a>(<span>共${monthlyDemandList.total}条记录</span>)
				</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;">
			<form id="listForm" action="/xuqiupaihangOrderMonth.jhtm">
				<ol>
					[#list monthlyDemandList.content as supply]
						<li>
							${supply.jobPost}
						</li>
					[/#list]
				</ol>
				<input type="hidden" name="month" value="${month}"/>
				<input type="hidden" name="year" value="${year}"/>
				[@pagination pageNumber = monthlyDemandList.pageNumber totalPages = monthlyDemandList.totalPages]
					[#include "/include/pagination.ftl"]
				[/@pagination]
			</form>
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>