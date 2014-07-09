<!DOCTYPE html>
<html>
<head>
    <title>国家相关文件</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
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
		    height: 215px;
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
			background: url(resource/public/images/background_b.png);
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
				<p>政策咨询<span>Policy Advice</span></p>
				<ul style="padding-left:0;margin:0;">
					<li><a href="/countryLawList.jhtml">国家法律法规</a></li>
					<li><a href="/cityLawList.jhtml">地方法律法规</a></li>
					<li class="current_li"><a href="/countryFileList.jhtml">国家相关文件</a></li>
					<li><a href="/cityFileList.jhtml">地方相关文件</a></li>
				</ul>
			</div>
			<div class="j_main_left_1" style="margin-top: 10px; text-align: center; height: 445px;">
				<div style="width:99px;float:left;"><img src="/resource/public/images/zhizuo-_03.png" style="padding: 5px;"></div>
				<div style="line-height: 34px; height: 34px; margin-left: 10px; margin-top: 15px; float: left; margin-right: 10px; width: 60px;"><hr style="border:1px dashed #e4e4e4;"></div>
				<div style="width: 70px; float: left; line-height: 45px;"><a href="/specialList.jhtml" style="margin-left:0;">更多>></a></div>
				[#list spceilas as sReport]
				[#if sReport_index <5]
					<a style="margin-left:0;" href="/special.jhtml?id=${sReport.id}"><img src="${sReport.imgpath?string?split("#")[1]}" style="width:222px;height:66px;margin-top:7px;"></a>
				[/#if]
				[/#list]
			</div>
		</div>
		<div class="j_main_right">
			<div class="j_main_right_1">
				<p>
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					所在位置 > <a href="/policyAdvice.jhtml" title="政策咨询">政策咨询</a>(<span>共${dataCenterList.total}条记录</span>)
				</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;">
			<form id="listForm" action="countryFileList.jhtml">
				<ul>
				[#list dataCenterList.content as dataCenter]
					<li>
						<a href="/countryFile.jhtml?id=${dataCenter.id}">${dataCenter.title}</a><span>${dataCenter.editTime?number_to_datetime}</span>
					</li>
				[/#list]	
				</ul>
				[@pagination pageNumber = dataCenterList.pageNumber totalPages = dataCenterList.totalPages]
					[#include "/include/pagination.ftl"]
				[/@pagination]
			</form>
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>