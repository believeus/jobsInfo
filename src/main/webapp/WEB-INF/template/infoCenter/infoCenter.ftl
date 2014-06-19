<!DOCTYPE html>
<html>
<head>
    <title>资讯中心</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script src="/resource/public/resources/scripts/jquery-1.10.2.min.js"></script>
    <style type="text/css">
   		.j_main{
    		width:1000px;
    		height:auto;
    		//margin-top:-6px;
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
			overflow:hidden;
			margin-bottom:10px;
		}
		.j_main_right_1{
    		width:730px;
			height:29px;
		}
		.j_main_right_1 p{
			margin:0;
			padding: 5px;
			background: #FFCC00;
		    border: 1px solid;
		    font-size:13px;
		}
		.j_main_right_2{
			width:727px;
			height:290px;
			margin-bottom:10px;
			border:1px solid #E4E4E4;
		}
		.j_main_right_2_1{
			float:left;
			width:350px;
			height:290px;
			margin-right:9px;
			padding:5px;
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
			border: 1px solid #E4E4E4;
		    height: auto;
		    margin-top: 10px;
		    width: 727px;
		}
		.j_main_right_3 td{
			padding:0 20px;
		    text-align: center;
		    width: 104px;
		}
		.j_main_right_3 a{
			font-size:13px;
		}
		.gonggao{
    		width:255px;
    		height:290px;
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
    		height:200px;
    		border:1px solid #e4e4e4;
    		margin-bottom:6px;
    		overflow:hidden;
    	}
    	.tupian_1{
    		float:left;
    		width:249px;
    		height:120px;
    	}
    	.tupian p {
		    margin: 10px 15px;
		    text-align: center;
		}
    </style>
    <style type="text/css">
		#banner {position:relative; width:314px; height:286px; overflow:hidden;}
		#banner_list img {border:0px;}
		#banner_bg {position:absolute; bottom:0;background-color:none;height:50px;filter: Alpha(Opacity=30);opacity:0.3;z-index:1000;
		cursor:pointer; width:314px; }
		#banner_info{position:absolute; bottom:23px; left:5px;height:22px;color:#555;z-index:1001;cursor:pointer}
		#banner_text {position:absolute;width:120px;z-index:1002; right:3px; bottom:3px;}
		#banner ul {position:absolute;list-style-type:none;filter: Alpha(Opacity=80);opacity:0.8; border:1px solid #fff;z-index:1002;
		margin:0; padding:0; bottom:3px; right:5px;}
		#banner ul li { padding:0px 8px;float:left;display:block;color:#FFF;border:#e5eaff 1px solid;background:#6f4f67;cursor:pointer}
		#banner ul li.on { background:#900}
		#banner_list a{position:absolute;} 
	</style>
	<script type="text/javascript">
		var t = n = 0, count;
		$(document).ready(function(){
		count=$("#banner_list a").length;
		$("#banner_list a:not(:first-child)").hide();
		$("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));
		$("#banner_info").click(function(){window.open($("#banner_list a:first-child").attr('href'), "_blank")});
		$("#banner li").click(function() {
		var i = $(this).text() - 1;
		n = i;
		if (i >= count) return;
		$("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));
		$("#banner_info").unbind().click(function(){window.open($("#banner_list a").eq(i).attr('href'), "_blank")})
		$("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
		document.getElementById("banner").style.background="";
		$(this).toggleClass("on");
		$(this).siblings().removeAttr("class");
		});
		t = setInterval("showAuto()", 4000);
		$("#banner").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", 4000);});
		})
		
		function showAuto(){
			n = n >=(count - 1) ? 0 : ++n;
			$("#banner li").eq(n).trigger('click');
		}
	</script>
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
						<li><a href="/publicityInfo.jhtml?id=${notice.id}">
							[#if notice.title?length > 13]
								${notice.title?string?substring(0,13)}...
							[#else]
								${notice.title}
							[/#if]
					</a><span>${notice.createTime?number_to_datetime}</span></li>
					[/#list]
				</ul>
			</div>
			<div class="j_main_left_1" style="margin-top:10px;height:450px;text-align:center;border:1px solid #E4E4E4;">
				<div style="width:99px;float:left;"><img src="/resource/public/images/zhizuo-_03.png" style="padding: 5px;"></div>
				<div style="line-height: 34px; height: 34px; margin-left: 10px; margin-top: 15px; float: left; margin-right: 10px; width: 60px;"><hr style="border:1px dashed #e4e4e4;"></div>
				<div style="width: 70px; float: left; line-height: 45px;"><a href="/specialList.jhtml">更多>></a></div>
				[#list subjectReport as sReport]
					<a href="/special.jhtml?id=${sReport.id}"><img src="${sReport.imgpath}" style="width:222px;height:66px;margin-top:7px;"></a>
				[/#list]
			</div>
		</div>
		<div class="j_main_right">
			<div class="j_main_right_2" style="border:1px solid #E4E4E4;">
				<div class="picshow">
					<!--图片轮播***************************************************************-->
					<div id="banner">
						<div id="banner_bg"></div> 
						<div id="banner_info"></div> 
						<ul>
							<li class="on">1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
						</ul>
						<div id="banner_list">
							[#list imgs as img]
								<a href="/newsInfo.jhtml" target="_blank"><img src="${img.imgpath}" width="314" height="236" title="this is a beautiful girl!" alt="
								[#if img.title?length > 18]
									${img.title?string?substring(0,18)}...
								[#else]
									${img.title}
								[/#if]" /></a>
							[/#list]
							<a href="/newsInfo.jhtml" target="_blank"><img width="314" height="236" src="/resource/public/images/u6_normal_03.gif" title="this is a beautiful girl!" alt="第二届潜江创业培训研讨会召开" /></a>
							<a href="/newsInfo.jhtml" target="_blank"><img width="314" height="236" src="/resource/public/images/u6_normal_03.gif" title="this is a beautiful girl!" alt="第三届潜江创业培训研讨会召开" /></a>
							<a href="/newsInfo.jhtml" target="_blank"><img width="314" height="236" src="/resource/public/images/u6_normal_03.gif" title="this is a beautiful girl!" alt="第四届潜江创业培训研讨会召开" /></a>
						</div>
					</div>
					<!--***************************************************************-->
				</div>
				<div class="xinwen">
					<div style="padding-left: 20px;margin-bottom:20px;">
						[#list news as new]
						[#if new_index==0]
							<h2 style="margin: 0px; font-size: 21px; font-weight: normal;"><a href="/newsInfo.jhtml?id=${new.id}">
							[#if new.title?length > 16]
								${new.title?string?substring(0,16)}...
							[#else]
								${new.title}
							[/#if]
							</a></h2>
							<p style="color:#2B8BDF;margin:0;font-size:12px;">
							[#if new.content?length > 27]
								${new.content?string?substring(0,27)}...
							[#else]
								${new.content}
							[/#if]
							</p>
						[/#if]
						[/#list]
					</div>
					<div style="padding-left: 20px;">
						[#list news as new]
						[#if new_index==1]	
							<h2 style="margin: 0px; font-size: 21px; font-weight: normal;"><a href="/newsInfo.jhtml?id="${new.id}"">
							[#if new.title?length > 16]
								${new.title?string?substring(0,16)}...
							[#else]
								${new.title}
							[/#if]</a></h2>
							<p style="color:#2B8BDF;margin:0;font-size:12px;">
							[#if new.content?length > 27]
								${new.content?string?substring(0,27)}...
							[#else]
								${new.content}
							[/#if]
							</p>
						[/#if]
						[/#list]
					</div>
					<hr style="margin-left: 10px; margin-right: 10px; border: 1px dashed #e4e4e4;">
					<ul class="xinwen_ul" style="padding-left: 25px;">
						[#list news as new]
						[#if new_index > 1]	
							<li><a href="/newsInfo.jhtml?id="${new.id}"">
							[#if new.title?length > 16]
								${new.title?string?substring(0,16)}...
							[#else]
								${new.title}
							[/#if]
							</a></li>
						[/#if]
						[/#list]
					</ul>
				</div>
				
			</div>
			<div class="j_main_right_2" style="width:727px;">
				<div class="j_main_right_2_1" style="margin-right:4px;">
					<p style="margin:0;padding:5px;background:url(/resource/public/images/background.png);border:1px solid #FF7800;">
						<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
						新闻动态<span><a href="/newsList.jhtml">更多>></a></span>
					</p>
					[#list news as new]
					[#if new_index==0]
					<div style="height: 100px; padding: 9px; width: 341px;">
						<img src="${new.imgpath}" style="float:left;width:120px;height:100px">
						<p style="font-size: 13px;float:left;width:195px;margin-left:15px;margin-top:0;font-size:16px;"><a style="color:#C42D3E;" href="/newsInfo.jhtml">
							[#if new.title?length > 22]
								${new.title?string?substring(0,22)}...
							[#else]
								${new.title}
							[/#if]
						</a></p>
						<p style="font-size: 13px;float:left;width:195px;margin-left:15px;margin-top:0;">
						[#if new.content?length > 22]
								${new.content?string?substring(0,22)}...
							[#else]
								${new.content}
							[/#if]
						<span style="text-align: right;float:right;"><a href="/newsInfo.jhtml?id="${new.id}"">[详细]</a></span></p>
					</div>
					[/#if]
					[/#list]
					<div style="width: 320px; height: 0px; margin-left: auto; margin-right: auto; border: 1px dashed #E4E4E4;margin-bottom:15px;"></div>
					<ul style="margin: 0px; padding: 0px 15px;">
						[#list news as new]
							<li><a href="/newsInfo.jhtml?id=${new.id}">
							[#if new.title?length > 22]
								${new.title?string?substring(0,22)}...
							[#else]
								${new.title}
							[/#if]
							</a><span>${new.createTime?number_to_datetime}</span></li>
						[/#list]
					</ul>
				</div>
				<div style="float: left; border: 1px dashed #e4e4e4; width: 0px; margin-top: 6px; height: 273px;"></div>
				<div class="j_main_right_2_1" style="margin-right:0;">
					<p style="margin:0;padding:5px;background:url(/resource/public/images/background.png);border:1px solid #FF7800;">
						<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
						工作动态<span><a href="/workList.jhtml">更多>></a></span>
					</p>
					[#list works as work]
					[#if work_index==0]					
					<div style="height: 100px; padding: 9px; width: 341px;">
						<img src="${work.imgpath}" style="float:left;width:120px;height:100px;">
						<p style="font-size: 13px;float:left;width:195px;margin-left:15px;margin-top:0;font-size:16px;color:#C42D3E;"><a style="color:#C42D3E;" href="/workInfo.jhtml">
						[#if work.title?length > 22]
								${work.title?string?substring(0,22)}...
							[#else]
								${work.title}
							[/#if]
							</a></p>
						<p style="font-size: 13px;float:left;width:195px;margin-left:15px;margin-top:0;">
						[#if work.content?length > 22]
								${work.content?string?substring(0,22)}...
							[#else]
								${work.content}
							[/#if]
						<span style="text-align: right;float:right;"><a href="/workInfo.jhtml">[详细]</a></span></p>
					</div>
					[/#if]
					[/#list]
					<div style="width: 320px; height: 0px; margin-left: auto; margin-right: auto; border: 1px dashed #E4E4E4;margin-bottom:15px;"></div>
					<ul style="margin: 0px; padding: 0px 15px;">
						[#list works as work]
							<li><a href="/workInfo.jhtml">
							[#if work.title?length > 22]
								${work.title?string?substring(0,22)}...
							[#else]
								${work.title}
							[/#if]
							
							</a><span>${work.createTime?number_to_datetime}</span></li>
						[/#list]
					</ul>
				</div>
			</div>
			<div class="j_main_right_3">
				<p style="background:url(/resource/public/images/background.png);margin: 0px; padding: 5px; border: 1px solid #FF7800;">
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					视频新闻<span style="float:right;"><a href="/videosList.jhtml">更多>></a></span>
				</p>
				<table>
					<tr>
						[#list vedios as vedio]
						<td>
							<p>
								<a href="/videosInfo.jhtml"><img src="${vedio.imgpath}" width="104"></a>
							</p>
							<p><a href="/videosInfo.jhtml">
							[#if vedio.title?length > 6]
								${vedio.title?string?substring(0,6)}...
							[#else]
								${vedio.title}
							[/#if]
						
							</a></p>
						</td>
						[/#list]
					</tr>
				</table>
			</div>
		</div>
		<div class="tupian">
			<div style="width:1000px;height:38px;background:url(/resource/public/images/zhizuo-_01.png);">
				<span style="color: #FFD32A;font-size: 20px;font-weight: bold;line-height: 38px;padding-left: 15px;">图片新闻<span style="float:right;"><a style="color:#FAFAFA;font-size:13px;" href="/imagesList.jhtml">更多>></a></span></span>
			</div>
			<div style="width:1000px;height:170px;">
				[#list imgs as img]
					<div class="tupian_1" [#if !img_has_next && img_index= 3] style="margin-top: -3px;"[/#if]>
						<p>
							<a href="/imgShow.jhtml" title="${img.title}">
								<img src="${img.imgpath}" width="220" height="105">
							</a>
						</p>
						<p>
							<a href="/imgShow.jhtml" title="${img.title}">${img.title}</a>
						</p>
					</div>
				[/#list]
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>