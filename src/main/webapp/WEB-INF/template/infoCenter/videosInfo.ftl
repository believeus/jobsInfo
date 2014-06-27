<!DOCTYPE html>
<html>
<head>
    <title>视频新闻详情</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <style type="text/css">
   		#ul_1 {
			list-style:none;
			padding-left:10px;
			margin:5px auto;
			height:160px;
		}
		#ul_1 li > div:first-child {
			float:left;	
			border-top:1px solid #DCDCDC;
			padding-top:20px;
			cursor:pointer;
		}
		#ul_1 li > div + div {
			float:left;
			width:250px;
			border-top:1px solid #DCDCDC;
			padding:0px 0px 20px 10px;	
		}
		#ul_1 a {
			display:inline-block;
			text-decoration:none;
			font-size:14px;
			font-weight:bold;
			color:#000;
			margin:15px 0px 0px;	
		}
		#ul_1 div > p{
			font-size:12px;
			color:#666;	
			margin:10px 0px 0px;	
		}
		#ul_1 li{
			line-height:16px;	
		}
		.div1 {
			float:left;	
			border-top:1px solid #DCDCDC;
			padding-top:20px;
			cursor:pointer;
		}
		.div1 a {
		    margin-top: 0 !important;
		}
		.div2{
			float:left;
			width:250px;
			height:100px;
			border-top:1px solid #DCDCDC;
			padding:0px 0px 20px 10px;	
		}
    </style>
</head>
<body>
	[#include "/include/header.ftl" /]
	<div style="border-width: 1px; border-right: 1px solid rgb(220, 220, 220); border-style: none solid solid; border-color: rgb(220, 220, 220); -moz-border-top-colors: none; -moz-border-right-colors: none; -moz-border-bottom-colors: none; -moz-border-left-colors: none; border-image: none; width: 1000px; margin: -5px auto auto;">
	<div style="">
    	<div style="float:left; margin:10px auto; border-right:1px solid #DCDCDC; width:600px;">
        	<h2 style="margin-left:30px;">${imgVedio.title}</h2>
        	[#list pathList as pl]
        	[#if pl_index>0]
            <div style="width:585px; margin:0px auto;">
            	<embed width="585" height="432" flashvars="" bgcolor="#000000" quality="high" allowfullscreen="true" wmode="transparent" allowscriptaccess="always" allownetworking="all" id="myMovie" [#if pl?exists] src="/${pl}"[#else]src="http://p.you.video.sina.com.cn/swf/bokePlayer20140616_V4_1_42_49.swf"[/#if] type="application/x-shockwave-flash" pluginspage="">
            </div>
            [/#if]
            [/#list]
            <div style="padding:20px 29px;">
            	<div style="float:left; width:465px;">
                	<table style="width:100%; border-collapse:collapse;" id="tab_1">
                      <tbody><tr>
                        <td>发布：</td>
                        <td style="width:235px;">${imgVedio.createTime?number_to_datetime}</td>
                        <td>标签：</td>
                        <td>磁悬浮列车</td>
                      </tr>
                      <tr>
                        <td>来源：</td>
                        <td>潜江市公共就业服务网</td>
                        <td>时长：</td>
                        <td>5分26秒</td>
                      </tr>
                      <tr>
                        <td>简介：</td>
                        <td colspan="3">
                        	[#if imgVedio.content?length >20]
	                    		${imgVedio.content?string?substring(0,20)}...
	                    	[#else]
	                    		${imgVedio.content}
	                    	[/#if]
                        </td>
                      </tr>
                    </tbody></table>
                </div>
                <div style="float:left; margin-top:25px; color:#666;">
                	<p>展开信息<img src="/resource/public/images/jiantou.jpg"></p>
                </div>
                <div style="clear:left;"></div>
            </div>
        </div>
      	<div style="float:left; margin-top:15px; width:399px;">
        	<h3 style="margin-left:15px;">视频列表</h3>
            <div>
              <ul id="ul_1">
      			[#list vedios as vedio]
	                <li>
	                  <div class="div1">
	                  	<a href="/videosInfo.jhtml?id=${vedio.id}">
	                  		[#list vedio.imgpath?string?split("#") as path]
	                  			[#if path_index==0]
	                  				<img src="${path}" width="120" height="90"/>
                  				[/#if]
                  			[/#list]
                  		</a>
	                  </div>
	                  <div class="div2">
	                  	<a href="/videosInfo.jhtml?id=${vedio.id}" title="${vedio.title}">${vedio.title}</a>
	                    <div class="vcontent">
	                    	[#if vedio.content?length >20]
	                    		${vedio.content?string?substring(0,15)}...
	                    	[#else]
	                    		${vedio.content}
	                    	[/#if]
                		 </div>
	                    <p>
	                    	<span>${vedio.editTime?number_to_datetime}</span>
	                        <span>播放：</span>
	                        <span>426.467</span>
	                    </p>
	                  </div>
	                </li>
                [/#list]
              </ul>
          </div>
        </div>
        <div style="clear:left;"></div>
    </div>
</div>
	[#include "/include/footer.ftl" /]
</body>
</html>