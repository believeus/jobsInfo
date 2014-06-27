<style type="text/css">
	body{
		margin:0 auto;
		overflow:auto;
		font-size:14px;	
	}
	a{
		text-decoration:none;
		color:#555555;
	}
	input[type="button"]{
		cursor:pointer;
	}
	.w{
		overflow:hidden;
		margin-left:auto;
		margin-right:auto;
		background:#FFFFFF;
	}
	.j_head{
		width:100%;
		height:163px;
		background:url(/resource/public/images/zhuye-img_01.gif);
	}
	.j_head_pic{
		width:1283px;
		height:127px;
		margin-left:auto;
		margin-right:auto;
	}
	.j_head_nav{
		width:100%;
		height:37px;
		background:url(/resource/public/images/nav_pic.png);
	}
	.nav{
		overflow:hidden;
		margin-left:auto;
		margin-right:auto;
		width:1000px;
		height:40px;
	}
	.j_head_nav a{
		color: #FFFFFF;
	    float: left;
	    text-align: center;
	    text-decoration: none;
	    vertical-align: top;
	    width: 90px;
	    margin-left:7px;
	    line-height:37px;
	}
	.nav_current{
		background:url("/resource/public/images/zhuye-img_07.png") repeat-y scroll center 0 rgba(0, 0, 0, 0);
		width:58px;
		height:35px;
		color:#ededa2 !important;
	}
</style>
<!--IE-->
<script type="text/javascript" src="/resource/public/js/jquery.js"></script>
<script type="text/javascript">
	//给所有页面BODY加背景色
	 window.onload=addColor();
	 function addColor(){
	 	document.body.style.background = "#FFFBF6";
	 }

	$().ready(function(){
		//$("body").css("background","#FFFBF6");
		
		//alert(window.location.pathname);
		$(".nav a").each(function(){
			if($(this).attr("href") == window.location.pathname){
				$(this).addClass("nav_current");
			}
		});
		
	});
</script>
<div style="width:100%;margin-bottom:5px;">
	<div class="j_head">
		<div style="width:100%;background:#DC6D0E;">
			<div class="j_head_pic">
				<embed width="100%" height="127" bgcolor="" quality="high" allowfullscreen="true" wmode="transparent" allowscriptaccess="always" allownetworking="all" id="myMovie" src="/resource/public/images/boner2.swf" type="application/x-shockwave-flash" pluginspage="">
			</div>
		</div>
		<div class="j_head_nav">
			<div class="nav">
				<a href="/" title="">首页</a>
				<a href="/infoCenter.jhtml" title="">资讯中心</a>
				<a href="/organization.jhtml" title="">工作指南</a>
				<a href="/jobIntroduce.jhtml" title="">职业介绍</a>
				<a href="/policyAdvice.jhtml" title="">政策咨询</a>
				<a href="/dataChannel.jhtml" title="">数据频道</a>
				<a href="/onlineShow.jhtml" title="">网上展示厅</a>
				<div style="float: right; width: 300px; margin-top: 10px;text-align:right;">
					<form action="/search.jhtml" method="post">
						<span style="color:#FFFFFF;">全文检索：</span>
						<input type="hidden" name="currentpage" value="0"/>
						<input type="hidden" name="perCount" value="15"/>
						<input type="text" style="width:160px" name="key">
						<input type="submit" value="检索"  style="background:#FDFBC8;;border-radius:4px;border:1px solid #909090;">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>