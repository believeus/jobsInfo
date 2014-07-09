[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script type="text/javascript" src="/resource/public/js/jquery.js"></script>
<style>
body {
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	margin: 0px;
}
#container
{
	padding:0px;
}
#container h1 {
    color: #233C6F;
    cursor: pointer;
    font-size: 15px;
    font-weight: normal;
    height: 32px;
    line-height: 30px;
    padding-left: 10px;
    margin:0px;
  	padding-left:50px;
  	font-size:16px;
  	background:#dcecf5;
  	border: 1px solid #bdccd4;
  }
.content{
	width: 182px;
	height: 26px;
	
}
 ul {
	background-color: #f0f9fe;
    font-size: 13px;
    margin:0px;
    width:178px;
    padding:0px;
}

ul li {
	list-style-type:none;
    line-height: 25px;
    text-align:center;
}
li a {
    color: #233C6F;
    padding-left: 5px;
}
a
{
	text-decoration: none;
}
.current{
	color:#233c6f;
	font-weight:bold;
	background:url(/resource/public/images/back_current.png);
}
</style>
<script type="text/javaScript">
$(function(){
	$("#container h1").click(function(){
		if($(this).next("ul").is(":hidden"))
		{
			$("#container ul").slideUp(400);
		}
		$(this).next().slideToggle(500);
	});
	
	//alert($(".MM a").length);
	var alist = $(".MM a");
	alist.each(function(){
		$(this).click(function(){
			$(".MM a").parent().removeClass("current");
			$(this).parent().addClass("current");
		});
	});
	
})
	
</script>
</head>

<body style="overflow-y:scroll;" bgcolor="#F0F9FE">
<table width="100%" height="280" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="182" valign="top">
	   	<div id="container">
	   		<div style="height:auto;width:180px;">
	   		<p style="height:20px;background: #3f97c9;font-size: 16px;margin: 0;padding: 8px;text-align: center;font-size:19px;color:#ffffff;">
	   			网站内容管理
   			</p>
   			​[@shiro.hasPermission name="infocenter:view"]
		  	<h1 id="h1_1" style="margin-top: -16px; margin-bottom: -15px;">资讯中心</h1>
    		<ul id="ul_1" style="display: none;margin-top:15px;" class="MM">
				<li>
					<a target="main" href="/admin/news/newsList.jhtml">新闻动态</a>
				</li>
				<li>
					<a target="main" href="/admin/work/list.jhtml">工作动态</a>
				</li>
				<li>
					<a target="main" href="/admin/publicity/list.jhtml">公告公示</a>
				</li>
				<li>
					<a target="main" href="/admin/imagesNews/list.jhtml">图片新闻</a>
				</li>
				<li>
					<a target="main" href="/admin/vedioNews/list.jhtml">视频新闻</a>
			    </li>
				<li>
					<a target="main" href="/admin/specialReport/list.jhtml">专题报道</a>
			    </li>
        	</ul>
     	   [/@shiro.hasPermission]
     	   ​[@shiro.hasPermission name="workguide:view"]
		   <h1>工作指南</h1>
        		<ul class="MM" style="display: none;">
					<li>
						<a target="main" href="/admin/introduction/list.jhtml">机构简介</a>
					</li>
					<li>
						<a target="main" href="/admin/mainFunction/list.jhtml">主要职能</a>
					</li>
					<li>
						<a target="main" href="/admin/leader/list.jhtml">局领导</a>
					</li>
        		</ul>
    		[/@shiro.hasPermission]
    		[@shiro.hasPermission name="jobserver:view"]
			 <h1>就业服务</h1>
       			 <ul style="display: none;" class="MM">
					<li>
						<a target="main" href="/admin/zhaopinhuiService/list.jhtml">招聘会</a>
					</li>
					<li>
						<a target="main" href="/admin/mianshibaodianService/list.jhtml">面试宝典</a>
					</li>
					<li>
						<a target="main" href="/admin/qiuzhizhidaoService/list.jhtml">求职指导</a>
					</li>
					<li>
						<a target="main" href="/admin/jianlizhinanService/list.jhtml">简历指南</a>
					</li>
      			</ul>
     		[/@shiro.hasPermission]
     		[@shiro.hasPermission name="policy:view"]
			 <h1>政策咨询</h1>
        		<ul style="display: none;" class="MM">
					<li>
						<a target="main" href="/admin/countryLaw/list.jhtml">国家法律法规</a>
					</li>
					<li>
						<a target="main" href="/admin/cityLaw/list.jhtml">地方法律法规</a>
					</li>
					<li>
						<a target="main" href="/admin/countryFile/list.jhtml">国家相关文件</a>
					</li>
					<li>
						<a target="main" href="/admin/cityFile/list.jhtml">地方相关文件</a>
					</li>
       			</ul>
   			[/@shiro.hasPermission]
   			[@shiro.hasPermission name="datachannel:view"]
		    <h1>数据频道</h1>
        		<ul style="display: none;" class="MM">
					<li>
						<a target="main" href="/admin/analysisreport/list.jhtml">供求分析报告</a>
					</li>
					<li>
						<a target="main" href="/admin/wagePriceGuide/list.jhtml">工资指导价位</a>
					</li>
					<li>
						<a target="main" href="/admin/monthlyDemandList/list.jhtml">需求排行</a>
					</li>
					<li>
						<a target="main" href="/admin/monthSupplyList/list.jhtml">供给排行</a>
					</li>
       			 </ul>
    		[/@shiro.hasPermission]
    		[@shiro.hasPermission name="datachannel:view"]
    		<h1>下载专区</h1>
    		<ul style="display: none;" class="MM">
					<li>
						<a target="main" href="/admin/ziliaoDownLoad/list.jhtml">资料下载</a>
					</li>
					<li>
						<a target="main" href="/admin/biaogeDownLoad/list.jhtml">表格下载</a>
					</li>
					<li>
						<a target="main" href="/admin/ruanjianDownLoad/list.jhtml">软件下载</a>
					</li>
       			 </ul>
   			 [/@shiro.hasPermission] 
   			 [@shiro.hasPermission name="slide:view"]
			 <h1>幻灯片</h1>
        		<ul style="display: none;" class="MM">
					<li>
						<a target="main" href="/admin/slide/list.jhtml">幻灯片</a>
					</li>
   			 	</ul>
   			 [/@shiro.hasPermission]
   			[@shiro.hasPermission name="service:view"]
			<h1>服务功能</h1>
        	<ul style="display: none;" class="MM">
			  <li>
				 <a target="main" href="/admin/busHandle/list.jhtml">业务办理</a>
			  </li>
			  <li>
				<a target="main" href="/admin/mailBox/list.jhtml">局长信箱</a>
			  </li>
			  <li>
			<!--	<a target="main" href="javascript:void(0);" onClick="alert('论坛暂未开放')">网站论坛</a> -->
				<a target="main" href="/admin/forum/list.jhtml">网站论坛</a>
			  </li>
			  <li>
				<a target="main" href="/admin/links/list.jhtml">友情链接</a>
			  </li>
      		</ul>
      		[/@shiro.hasPermission]
  			</div>
  			<div style="height:auto;width:180px;">
	   		<p style="height:17px;background: #3f97c9;font-size: 16px;margin: 0;padding: 8px;text-align: center;font-size:19px;color:#ffffff;">
	   			人力资源业务管理
   			</p>
   			
   			[@shiro.hasPermission name="content:view"]
			<h1>内容审核</h1>
        	<ul style="display: none;" class="MM">
			  <li>
				<a target="main" href="/admin/enterpriseAudit/list.jhtml">企业审核列表</a>
			  </li>
			  <li>
				<a target="main" href="/admin/stationAudit/list.jhtml">招聘岗位审核列表</a>
			  </li>
      		</ul>
      		[/@shiro.hasPermission]
      		
      	    [@shiro.hasPermission name="resource:view"]
			<h1>资源管理</h1>
        	<ul style="display: none;" class="MM">
			  <li>
				 <a target="main" href="/admin/enterpriseList/list.jhtml">企业列表</a>
			  </li>
			  <li>
				 <a target="main" href="/admin/enterpriseHeaderImg/list.jhtml">企业电子图列表</a>
			  </li>
			  <li>
				 <a target="main" href="/admin/jobSeekersList/list.jhtml">求职者列表</a>
			  </li>
			  <li>
				<a target="main" href="/admin/stationList/list.jhtml">招聘岗位列表</a>
			  </li>
      		</ul>
      		[/@shiro.hasPermission]
  			</div>
  			<div style="height:auto;width:180px;">
	   		<p style="height:17px;background: #3f97c9;font-size: 16px;margin: 0;padding: 8px;text-align: center;font-size:19px;color:#ffffff;">系统管理</p>
  			[@shiro.hasPermission name="systemSetting:view"]
  			<h1>系统设置</h1>
   			<ul style="display: none;" class="MM">
			  <li>
				<a target="main" href="/admin/list.jhtml">管理员管理</a>
			  </li>
			  [#if sessionUser.loginName=="admin"]
			  <li>
				<a target="main" href="/admin/power/list.jhtml">权限分组</a>
			  </li>
			  [/#if]
   			</ul>
   			[/@shiro.hasPermission]
			</div>
		</div>
    </td>
  </tr>
</table>
</body>
</html>
