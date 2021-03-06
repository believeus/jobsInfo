<!DOCTYPE html>
<html>
<head>
    <title>工作指南-局领导</title>
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
			width:258px;
			height:180px;
    		border:1px solid #e4e4e4;
    		border-radius:4px;
    		background:#FFFFFF;
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
		.j_main_right_1_p{
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
			background:#FFFFFF;
		}
		.j_main_right_2_1{
			float:left;
			width:728px;
			height:auto;
		}
		.j_main_right_2_p{
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
		.zhuanti_list a {
		    margin-left: 0;
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
			<div class="j_main_left_1" style="margin-top: 10px; text-align: center; height: 425px;">
				<div style="width:99px;float:left;"><img src="/resource/public/images/zhizuo-_03.png" style="padding: 5px;"></div>
				<div style="line-height: 34px; height: 34px; margin-left: 10px; margin-top: 15px; float: left; margin-right: 10px; width: 60px;"><hr style="border:1px dashed #e4e4e4;"></div>
				<div style="width: 70px; float: left; line-height: 45px;"><a href="/specialList.jhtml" style="margin-left:0;">更多>></a></div>
				<div class="zhuanti_list">
				[#list subjectReport as sReport]
				[#if sReport_index <5]
					<a href="/special.jhtml?id=${sReport.id}"><img src="${sReport.imgpath?string?split("#")[1]}" style="width:222px;height:62px;margin-top:7px;"></a>
				[/#if]
				[/#list]
				</div>
			</div>
		</div>
		<div class="j_main_right">
			<div class="j_main_right_1">
				<p class="j_main_right_1_p">
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					所在位置 > <a href="/organization.jhtml" title="工作指南">工作指南</a> > <a href="/leader.jhtml" title="局领导">局领导</a>(<span>共${datas.total}条记录</span>)
				</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;">
			<form id="listForm" action="leader.jhtml">
				<div class="j_main_right_2_1">
					[#list datas.content as data]
					<div class="j_main_right_2_1_1" style="margin-bottom:10px;">
						<div class="" style="height: 130px; float: left; margin-left: 25px; width: 100px; margin-top: 10px;">
							<img src="${data.imgpath}" width="95" height="130">
						</div>
						<div class="" style="height: 130px; float: left; margin-left: 10px; width: 585px; margin-top: 10px;">
							<p class="j_main_right_2_p"><font style="font-weight:bold;margin-left:28px;">姓名：</font>${data.author}</p>
							<p class="j_main_right_2_p"><font style="font-weight:bold;margin-left:28px;">职务：</font>${data.title}</p>
							<p class="j_main_right_2_p"><font style="font-weight:bold;">分管范围：</font>
								<span title="${data.content}">[#if data.content?length >100]
									${data.content?string?substring(0,100)}...
								[#else]
									${data.content}
								[/#if]</span>
							</p>
						</div>
					</div>
					[/#list]
				</div>
				[@pagination pageNumber = datas.pageNumber totalPages = datas.totalPages]
					[#include "/include/pagination.ftl"]
				[/@pagination]
			</form>
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>