<style type="text/css">
	*{margin:0;padding:0;}
	body{
		margin:0 auto;
		overflow:auto;
		font-size:14px;	
		font-family:"黑体"; /*2014-07-18 北科*/
	}
	img{
		border:0;
	}
	a{
		text-decoration:none;
		color:#555555;
	}
	a:hover{
		text-decoration:underline;
		color:#FF6600;
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
		height:198px;
		background:url(/resource/public/images/zhuye-img_01.gif);
	}
	.j_head_pic{
		width:1283px;
		height:127px;
		height:162px;
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
	.j_main_right_2_p img{
		width:640px;
	}
</style>
<!--IE-->
<script type="text/javascript">
	
	$().ready(function(){
		//$("body").css("background","#FFFBF6");
		
		$(".nav a").each(function(){
			if($(this).attr("href") == window.location.pathname){
				$(this).addClass("nav_current");
			}
		});
		
	});
</script>
<div style="width:100%;margin-bottom:5px;">
	<div class="j_head" style="">
		<div style="width:100%;background:#DC6D0E;">
			<div class="j_head_pic">
				<embed  width="100%" height="162px" bgcolor="" quality="high" allowfullscreen="true" wmode="transparent" allowscriptaccess="always" allownetworking="all" id="myMovie" src="/resource/public/images/boner2.swf" type="application/x-shockwave-flash" pluginspage="">
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