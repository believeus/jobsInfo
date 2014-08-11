<!DOCTYPE html>
<html>
<head>
    <title>搜索</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script src="/resource/public/resources/scripts/jquery-1.10.2.min.js"></script>
     <link href="/resource/public/css/common.css" rel="stylesheet" type="text/css" />
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
			width:258px;
			height:290px;
    		border:1px solid;
		}
		.j_main_left_1 p{
			background: #FFCC00;
		    border-bottom: 1px solid;
		    margin: 0;
		    text-align:left;
		    padding: 5px;
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
			margin-bottom:10px;
		}
		.j_main_right_1{
    		width:728px;
			height:auto;
		}
		.j_main_right_2{
			width:727px;
			height:auto;
			margin-top:10px;
			border:1px solid #E4E4E4;
		}
		.j_main_right_2_1{
			width:660px;
			height:auto;
			margin-left:auto;
			margin-right:auto;
			margin-bottom:20px;
		}
		.j_main_right_2_1 p a{
			color: #3586F2;
		    margin-right: 10px;
		}
		.j_main_right_2_1 li{
			font-size: 12px;
		    line-height: 30px;
		    list-style: none;
		}
		.j_main_right_2_1 span {
		    color: #555555;
		    float: right;
		}
		.j_main_right_3{
			height: auto;
		    margin-bottom: 20px;
		    margin-left: auto;
		    margin-right: auto;
		    width: 660px;
		}
		.j_main_right_3 td{
			padding:0 20px;
		    text-align: center;
		    width: 104px;
		}
		.j_main_right_3 a{
			font-size:13px;
		}
		.j_main_right_3 p {
		    line-height: 16px;
		    margin: 5px 0;
		}
		.gonggao{
    		width:255px;
    		height:350px;
    		border:1px solid #EED9C8;
    		margin-bottom:5px;
    	}
		.gonggao li{
			margin-right:10px;
			line-height:30px;
			font-size:12px;
		}
		.gonggao span{
    		float:right;
    	}
    	.picshow{
    		width:320px;
    		height:285px;
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
    	.tupian{
    		width:998px;
    		height:167px;
    		border:1px solid #e4e4e4;
    		margin-bottom:6px;
    		overflow:hidden;
    	}
    </style>
</head>
<body>
	[#include "/include/header.ftl" /]
	<div class="j_main w">
		<div class="j_main_left">
			<div class="gonggao">
				<p style="margin:0;padding:5px;padding-left:20px;background:url(/resource/public/images/111.png);">
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					公告公示<span style="float:right;"><a href="/publicityList.jhtml">更多</a></span>
				</p>
				<ul style="padding-left:25px;">
					[#list notices as notice]
					[#if notice_index <8]
						<li><a href="/publicityInfo.jhtml?id=${notice.id}">
							[#if notice.title?length > 8]
								${notice.title?string?substring(0,8)}...
							[#else]
								${notice.title}
							[/#if]
						</a><span>${notice.editTime?number_to_datetime}</span></li>
					[/#if]
					[/#list]
				</ul>
			</div>
			<div class="j_main_left_1" style="margin-top:10px;height:435px;text-align:center;border:1px solid #E4E4E4;">
				<div style="width:99px;float:left;"><img src="/resource/public/images/zhizuo-_03.png" style="padding: 5px;"></div>
				<div style="line-height: 34px; height: 34px; margin-left: 10px; margin-top: 15px; float: left; margin-right: 10px; width: 60px;"><hr style="border:1px dashed #e4e4e4;"></div>
				<div style="width: 70px; float: left; line-height: 45px;"><a href="/specialList.jhtml">更多>></a></div>
				[#list spceilas as sReport]
				[#if sReport_index <5]
					<a style="margin-left:0;" href="/special.jhtml?id=${sReport.id}"><img src="${sReport.imgpath?string?split("#")[1]}" style="width:222px;height:66px;margin-top:6px;"></a>
				[/#if]
				[/#list]
			</div>
		</div>
		<div class="j_main_right">
			<div class="j_main_right_1">
				<p style="background: url(/resource/public/images/background_b.png);border: 1px solid #E4E4E4;font-size: 13px;line-height: 28px;margin: 5px 0;">
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-left: 2px; margin-top: 2px; margin-right: 5px;">
					所在位置 > 全文检索(共${tdataCenterList.total}条记录)
				</p>
				<div class="j_main_right_2">
				<form method="post" action="/search.jhtml" id="listForm">
					<input type="hidden" name="key" value="${key}">
					<div class="j_main_right_2_1">
						<h2 style="margin-top: 10px; margin-bottom: 0px; font-weight: normal;">全文检索</h2>
						<img style="width: 660px;" src="/resource/public/images/line.png">
						[#list tdataCenterList.content as datacenter]
						<div class="j_main_right_3">
							<p><a href="/newsInfo.jhtml?id=${datacenter.id}" style="color:#0017ff;text-decoration:underline;">${datacenter.title}</a></p>
							[#if datacenter.content?length > 100]
								${datacenter.content?string?substring(0,100)}...
							[#else]
							<p>${datacenter.content}</p>
							[/#if]
							
						</div>
						[/#list]
						<img style="width: 660px;" src="/resource/public/images/line.png">
						[@pagination pageNumber = tdataCenterList.pageNumber totalPages = tdataCenterList.totalPages]
							[#include "/include/pagination.ftl"]
						[/@pagination]
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>