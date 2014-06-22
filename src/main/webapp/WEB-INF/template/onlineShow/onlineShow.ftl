<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上展示厅</title>
<script src="/resource/public/resources/scripts/jquery-1.10.2.min.js"></script>
<style type="text/css">
body {
	font-family:Arial, Helvetica, sans-serif;
	font-size:14px;	
}
a:link{
	text-decoration:none;
	color:#B92636;
}
#tab_1 td:first-child , #tab_1 td:nth-child(3) {
	color:#666;
	width:50px;
}
#ul_1 {
	list-style:none;
	padding-left:10px;
	margin:5px auto;
	height:auto;
	overflow:hidden
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
.vcontent{
 	color: #666;
    font-size: 12px;
    margin: 10px 0 0;
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
#tab_2 {
	border-spacing:20px;
	empty-cells:hide;
}
#tab_2 p{
	width:140px;
	height:85px;
	text-align:center;
	margin:0px;
}
#tab_2 td > p + p{
	height: 30px;
	margin-top:5px;
	font-size:13px;
	color:#666;	
	font-weight:bold;
}
.tup{
	width:960px;
	height:auto;
	overflow:hidden;
	margin-left: auto;
    margin-right: auto;
}
.tup_list{
	width:140px;
	height:160px;
	margin:0 10px;
	float:left;
}
</style></head>

<body>
[#include "/include/header.ftl" /]
<div style="border:1px solid #DCDCDC; border-top-style:none; width:1000px; margin:auto;">
	<div style="border-bottom:1px solid #DCDCDC;">
    	<div style="float:left; margin:10px auto; border-right:1px solid #DCDCDC; width:600px;">
        	<h2 style="margin-left:30px;">中国研制超级磁悬浮列车 速度为飞机的三倍</h2>
            <div style="width:585px; margin:0px auto;">
            	<embed width="585" height="432" bgcolor="#000000" allowfullscreen="true" wmode="transparent" allowscriptaccess="always" allownetworking="all" src="http://p.you.video.sina.com.cn/swf/bokePlayer20140616_V4_1_42_49.swf"  type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>
            </div>
            <div style="padding:20px 29px;">
            	<div style="float:left; width:465px;">
                	<table id="tab_1" style="width:100%; border-collapse:collapse;">
                      <tr>
                        <td>发布：</td>
                        <td style="width:235px;">2014-05-18  18:30</td>
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
                        <td colspan="3">中国研制的磁悬浮列车，速度为飞机的三倍......</td>
                      </tr>
                    </table>
                </div>
                <div style="float:left; margin-top:25px; color:#666;">
                	<p>展开信息<img src="/resource/public/images/jiantou.jpg" /></p>
                </div>
                <div style="clear:left;"></div>
            </div>
        </div>
      	<div style="float:left; margin-top:15px; width:399px;">
        	<h3 style="margin-left:15px;">视频列表</h3>
            <div>
              <ul id="ul_1">
              	[#list vedios as vedio]
              	[#if vedio_index<=4]
	                <li>
	                  <div class="div1">
	                  	<a href="/videosInfo.jhtml?id=${vedio.id}">
	                  		<img src="${vedio.imgpath}" width="120" height="90"/>
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
	            [/#if]
                [/#list]
              </ul>
          </div>
        </div>
        <div style="clear:left;"></div>
    </div>
    <div>
    	<div style="margin:10px 10px 0px; height:30px; border:1px solid #F6C078; background:url(/resource/public/images/background.png) repeat-x scroll 0 0 #FFFFFF;">
        	<div style="margin:5px 10px;">
            	<img style="height:20px; width:20px;" src="/resource/public/images/sanjiaojian.png"/>
                <div style="width:900px; vertical-align:top; display:inline-block; font-size:16px; font-weight:bold;">图片新闻</div>
                <a style="vertical-align:top" href="/imagesList.jhtml">更多</a>
            </div>
        </div>
        <div class="tup">
        	[#list imgs as img]
	        	[#if img_index <=11]
	        	<div class="tup_list">
	        		<p>
	        			<a href="/imgShow.jhtml?id=${img.id}">
	        				<img src="${img.imgpath}" width="135" height="85"/>
	    				</a>
	    			</p>
	                <p>
	                	<a href="/imgShow.jhtml?id=${img.id}">
	                		[#if img.title?length >35]
	                			${img.title?string?substring(0,35)}...
	                		[#else]
	                			${img.title}
	                		[/#if]
	                	</a>
	            	</p>
	        	</div>
	        	[/#if]
        	[/#list]
        	<div class="tup_list">
        		<p>
        			<a href="/imgShow.jhtml">
        				<img src="/resource/public/images/news_image.jpg" />
    				</a>
    			</p>
                <p>
                	<a href="/imgShow.jhtml">人社部副部长何鲜来鄂调研普查</a>
            	</p>
        	</div>
        	<div class="tup_list">
        		<p>
        			<a href="/imgShow.jhtml">
        				<img src="/resource/public/images/news_image.jpg" />
    				</a>
    			</p>
                <p>
                	<a href="/imgShow.jhtml">人社部副部长何鲜来鄂调研普查</a>
            	</p>
        	</div>
        	
        </div>
    </div>
</div>
[#include "/include/footer.ftl" /]
</body>
</html>
