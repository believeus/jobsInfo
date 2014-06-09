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
	background-color: #EEF2FB;
	margin: 0px;
}
#container
{
	padding:0px;
}
#container h1 {
	//background: url(/resources/shop/images/bg_1126.png) no-repeat scroll 0 -40px ;
    border-bottom: 1px solid #D8D8D8;
    border-top: 1px solid #FFFFFF;
    color: #3586F2;
    cursor: pointer;
    font-size: 15px;
    font-weight: bold;
    height: 36px;
    line-height: 36px;
    padding-left: 10px;
    margin:0px;
  	padding-left:55px;
  }
.content{
	width: 182px;
	height: 26px;
	
}
 ul {
	 background-color: #F1F1F1;
    border-bottom: 1px solid #D0D0D0;
    font-size: 13px;
    margin:0px;
    width:182px;
    padding:0px;
}

ul li {
	list-style-type:none;
    border-bottom: 1px solid #EBEBEB;
    line-height: 36px;
    margin-left:50px;
}
li a {
    color: #333333;
    padding-left: 5px;
}
a
{
	text-decoration: none;
}
</style>
<script type="text/javaScript">
$(function(){
	$("#container>h1").click(function(){
		if($(this).next("ul").is(":hidden"))
		{
			$("#container>ul").slideUp(400);
		}
		$(this).next().slideToggle(500);
	});
})
	
</script>
</head>

<body>
<table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
  <tr>
    <td width="182" valign="top">
	   	<div id="container">
		  	<h1>资讯中心</h1>
    		<ul style="display: block;" class="MM">
				<li>
					<a target="main" href="../product_category/list.jhtml">新闻动态</a>
				</li>
				<li>
					<a target="main" href="../parameter_group/list.jhtml">工作动态</a>
				</li>
				<li>
					<a target="main" href="../specification/list.jhtml">公告公示</a>
				</li>
				<li>
					<a target="main" href="../product/list.jhtml">图片新闻</a>
				</li>
				<li>
					<a target="main" href="../condition/list.jhtml">视频新闻</a>
			    </li>
				<li>
					<a target="main" href="../condition/list.jhtml">专题报道</a>
			    </li>
        	</ul>
     
		   <h1>工作指南</h1>
        		<ul style="display: none;">
					<li>
						<a target="main" href="../order/list.jhtml">机构简介</a>
					</li>
					<li>
						<a target="main" href="../payment/list.jhtml">主要职能</a>
					</li>
					<li>
						<a target="main" href="../refunds/list.jhtml">局领导</a>
					</li>
        		</ul>
    
			 <h1>就业服务</h1>
       			 <ul style="display: none;" class="MM">
					<li>
						<a target="main" href="../member/list.jhtml">就业服务</a>
					</li>
      			</ul>
     
			 <h1>政策咨询</h1>
        		<ul style="display: none;" class="MM">
					<li>
						<a target="main" href="../serviceFeeInfo/list.jhtml">国家法律法规</a>
					</li>
					<li>
						<a target="main" href="../serviceFeeInfo/list.jhtml">地方法律法规</a>
					</li>
					<li>
						<a target="main" href="../serviceFeeInfo/list.jhtml">国家相关文件</a>
					</li>
					<li>
						<a target="main" href="../serviceFeeInfo/list.jhtml">地方相关问题</a>
					</li>
       			</ul>
   
		    <h1>数据频道</h1>
        		<ul style="display: none;" class="MM">
					<li>
						<a target="main" href="../navigation/list.jhtml">供求分析报告</a>
					</li>
					<li>
						<a target="main" href="../article/list.jhtml">工资指导价位</a>
					</li>
					<li>
						<a target="main" href="../article_category/list.jhtml">本月需求排行</a>
					</li>
					<li>
						<a target="main" href="../tag/list.jhtml">本月供给排行</a>
					</li>
					<li>
						<a target="main" href="../friend_link/list.jhtml">下载专区</a>
					</li>
       			 </ul>
    
			 <h1>网上展示厅</h1>
       			 <ul style="display: none;" class="MM">
					<li>
						<a target="main" href="../promotion/list.jhtml">视频新闻</a>
					</li>
					<li>
						<a target="main" href="../coupon/list.jhtml">图片新闻</a>
					</li>
        		</ul>
  
			<h1>幻灯片</h1>
        		<ul style="display: none;" class="MM">
					<li>
						<a target="main" href="../statistics/view.jhtml">幻灯片</a>
					</li>
   			 	</ul>
			<h1>基本信息</h1>
    			<ul style="display: none;" class="MM">
					<li>
						<a target="main" href="/admin/asset/bonuspond.jhtml">基本信息</a>
					</li>
				</ul>
			<h1>服务功能</h1>
        		<ul style="display: none;" class="MM">
					<li>
						<a target="main" href="/admin/draw/member.jhtml">业务办理</a>
					</li>
					<li>
						<a target="main" href="/admin/balance.jhtml">局长信箱</a>
					</li>
					<li>
						<a target="main" href="/admin/draw/member.jhtml">网站论坛</a>
					</li>
					<li>
						<a target="main" href="/admin/balance.jhtml">友情链接</a>
					</li>
      			</ul>
  			<h1>系统设置</h1>
       			 <ul style="display: none;" class="MM">
						<li>
							<a target="main" href="../setting/edit.jhtml">系统信息</a>
						</li>
						<li>
							<a target="main" href="../area/list.jhtml">后台登录记录</a>
						</li>
						<li>
							<a target="main" href="../payment_method/list.jhtml">管理员管理</a>
						</li>
						<li>
							<a target="main" href="../shipping_method/list.jhtml">权限分组</a>
						</li>
						<li>
							<a target="main" href="../delivery_corp/list.jhtml">备份数据</a>
						</li>
						<li>
							<a target="main" href="../payment_plugin/list.jhtml">支上传文件管理</a>
						</li>
						<li>
							<a target="main" href="../storage_plugin/list.jhtml">静态化</a>
						</li>
       			 </ul>
		</div>
    </td>
  </tr>
</table>
</body>
</html>
