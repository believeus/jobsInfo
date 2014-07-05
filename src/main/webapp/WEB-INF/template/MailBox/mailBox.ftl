<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>局长信箱</title>
<style type="text/css">
body {
	font-size:14px;	
}
a:link{
	text-decoration:none;
}
.left_{
	width:240px; 
	height:285px;
}
.left_top{
	height:35px; 
	border-bottom: 1px solid #e4e4e4; 
	background:url(/resource/public/images/background_b.png);
}
.zti_im{
	margin:3px 10px 10px;
	width:220px;
	height:60px;	
}
.gg ul{	
	font-family:'微软雅黑';
	line-height:28px;
	font-size:13px;
	color:#000;
	padding-left:30px;
	margin-top:10px;
}
table {
	border:solid #DCD1E8; 
	border-width:1px 0px 0px 1px;
	width:670px;
}
.tab_1 td , th{
	border:solid #DCD1E8; 
	border-width:0px 1px 1px 0px;
	width:235px;	
}
.tab_1 tr{
	height:35px;	
}
.tab_1 th{
	width:90px;	
	background-color:#EFEAF4;
	color:#7B62B1;
	font-weight:100;
	text-align:right;
}
.tab_1 th span:first-child{
	color:#C00;
}
.tab_1 input{
	height:20px; 
	margin-left:20px;	
	font-size:14px;
	padding-left:7px;
}
#shangc, .tab_1 td > span{
	color:#7B62B1;
	display:inline-block; 
	vertical-align:top; 
	margin:6px 2px;
}
select{
	height:24px;
	width:130px;
	margin-right:30px;	
	color:#999;
}
select option:first-child{
	color:#999;
}
select > option + option {
	color:#333;
}
::-webkit-input-placeholder { /* WebKit browsers */
    color:    #999;
	font-size: 12px;
}
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
    color:    #999;
	font-size: 12px;
}
::-moz-placeholder { /* Mozilla Firefox 19+ */
    color:    #999;
	font-size: 12px;
}
:-ms-input-placeholder { /* Internet Explorer 10+ */
    color:    #999;
	font-size: 12px;
}
#tab_2 th{
	width:82px;	
}
#tab_2 td > input{
	width:480px;	
}
#tab_2 tr{
	height:40px;	
}
.butt_ {
	font-size:14px;
	border:1px solid #999;
	color:#06C;
	height:25px;
	margin-left:20px;
	border-radius:2px;
	display:inline-block;
}
textarea{
	margin:5px 20px; 
	font-size:14px; 
	color:#666; 
	width:340px;
	height:120px;
	min-width:340px;
	max-width:465px;
	min-height:120px;
}
.j_main_left_1{
	width:240px;
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
.gonggao{
	width:240px;
	height:285px;
	border:1px solid #EED9C8;
	margin-bottom:5px;
}
.gonggao li{
	margin-right:10px;
	line-height:29px;
	font-size:12px;
}
.gonggao span{
	float:right;
}
</style>

</head>
<body>
[#include "/include/header.ftl" /]
<div style="width:1002px; height:auto; margin:auto;overflow:hidden;">
	<div style="width:240px; float:left;">
        <div class="left_">  
           <div id="" class="gonggao">
				<p style="margin:0;padding:5px;padding-left:20px;background:url(/resource/public/images/111.png);">
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					公告公示<span style="float:right;"><a href="/publicityList.jhtml">更多</a></span>
				</p>
				<ul id="" style="padding-left:25px;">
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
        </div>
        <div class="j_main_left_1" style="margin-top:10px;height:auto;text-align:center;border:1px solid #E4E4E4;">
			<div style="width:99px;float:left;"><img src="/resource/public/images/zhizuo-_03.png" style="padding: 5px;"></div>
			<div style="line-height: 34px; height: 34px; margin-left: 10px; margin-top: 15px; float: left; margin-right: 10px; width: 45px;"><hr style="border:1px dashed #e4e4e4;"></div>
			<div style="width: 70px; float: left; line-height: 45px;"><a href="/specialList.jhtml">更多>></a></div>
			<div class="zhuanti_list" style="height:425px;">
				[#list subjectReport as sReport]
				[#if sReport_index <5]
					<a style="margin-left:0;" href="/special.jhtml?id=${sReport.id}"><img src="${sReport.imgpath}" style="width:222px;height:66px;margin-top:7px;"></a>
				[/#if]
				[/#list]
			</div>
		</div>
    </div>
    <div style="width:750px; float:left; margin-left:10px;">
    	<div style="width:750px; height:30px;line-height:30px;border:1px solid #e4e4e4; background:url(/resource/public/images/background_b.png);">
        	<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-left: 10px; margin-top: 7px; margin-right: 10px;">
        	<span>所在位置</span>
            <span>></span>
        	<span>服务功能</span>
            <span>></span>
			<span>局长信箱</span>
        </div>
        <div style="width:750px;height:678px;border:1px solid #E4E4E4;margin-top:10px;">
        	<div style="height: 40px; font-size: 16px; width: 540px; padding: 10px; margin: 30px;">
        	[#list mailbox as mailbox]
        		局长信箱地址:<span style="color:#0000FF;text-decoration:underline;">${mailbox.alink}</span>
        	[/#list]
        	</div>
        </div>
	</div>
</div>
[#include "/include/footer.ftl" /]
</body>
</html>
