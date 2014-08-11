<!DOCTYPE html>
<html>
<head>
    <title>专题详情</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script src="/resource/public/resources/scripts/jquery-1.10.2.min.js"></script>
	 <script type="text/javascript" src="/resource/public/resources/scripts/jquery.validate.js"></script>
	 <script type="text/javascript" src="/resource/public/js/Etech.js"></script>
    <style type="text/css">
    	.j_main{
    		width:1000px;
    		height:auto;
    	}
    	.j_main_1{
    		width:998px;
    		height:30px;
    		background:url(resource/public/images/background_b.png);
    		border:1px solid #e4e4e4;
    		line-height:30px;
    	}
    	.j_main_2{
    		border: 1px solid #E4E4E4;
		    border-radius: 4px;
		    height: auto;
		    margin-top: 2px;
		    width: 998px;
    	}
    	.j_main_2_1{
    		border-bottom: 3px solid #F9B552;
		    height: 70px;
		    margin-left: auto;
		    margin-right: auto;
		    width: 920px;
		    margin-bottom:20px;
		    color:#BA2534;
    	}
    	.zt{
    		background: #FCD45B;
		    border-radius: 2px;
		    float: left;
		    font-size: 18px;
		    height: 30px;
		    line-height: 30px;
		    margin-top: 41px;
		    text-align: center;
		    width: 70px;
    	}
    	.zt_title{
		    float: left;
		    font-size: 20px;
		    height: 30px;
		    line-height: 30px;
		    margin-left: 10px;
		    margin-top: 35px;
		    width: 420px;
    	}
    	.zt_title a{
    		color: #BA2534;
    	}
    	.zt_time{
    		float: left;
		    height: 30px;
		    line-height: 30px;
		    margin-left: 70px;
		    margin-top: 40px;
		    width: 120px;
		    color:#555555;
    	}
    	.zt_img{
    		float: left;
    		
    	}
		.j_main_3{
			width:900px;
			height;auto;
			overflow::hidden;
			margin-left:auto;
			margin-right:auto;
		}
		.j_main_3 p {
		    padding: 0 29px;
		}
    </style>
</head>
<body>
	[#include "/include/header.ftl" /]
	<div style="width:1000px;;height:179px;margin-left:auto;margin-right:auto;">
	[#list paths as path]
	[#if path_index ==0]
		<img src="${path}" width="1000" height="179">
	[/#if]
	[/#list]
	</div>
	<div class="j_main w">
		<div class="j_main_1">
			<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-left: 10px; margin-right: 10px; margin-top: 6px;">
			所在位置 > <a href="/specialList.jhtml" title="专题报道">专题报道</a>
		</div>
		<div class="j_main_2">
			<div class="j_main_2_1">
				<div class="zt" style="">
					专题
				</div>
				<div class="zt_title">
					<a href="/special.jhtml?id=${data.id}" title="${data.title}">
						[#if data.title?length > 20]
							${data.title?string?substring(0,20)}...
						[#else]
							${data.title}
						[/#if]
					</a>
				</div>
				<div class="zt_time">
					[${data.editTime?number_to_datetime}]
				</div>
				<div class="zt_img">
					<a href="">
						[#list paths as path]
						[#if path_index ==1]
							<img style="height:66px;width:222px" src="${path}" >
						[/#if]
						[/#list]
					</a>
				</div>
			</div>
			<div class="j_main_3">
				${data.content}
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>