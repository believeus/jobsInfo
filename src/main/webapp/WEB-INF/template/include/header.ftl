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
	.w{
		overflow:hidden;
		margin-left:auto;
		margin-right:auto;
	}
	.j_head{
		width:100%;
		height:172px;
	}
	.j_head_pic{
		width:100%;
		height:126px;
	}
	.j_head_nav{
		width:100%;
		height:40px;
		background:url(/resource/public/images/zhizuo-_07.png);
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
	    margin-top: 12px;
	    text-align: center;
	    text-decoration: none;
	    vertical-align: top;
	    width: 90px;
	}
</style>
 <script src="/resource/public/resources/scripts/jquery-1.10.2.min.js"></script>
 
			 <script style="text/javascript">
		    $().ready(function() {
		    	// ajax 提交验证和登录。
		    	function submitF(or,flag){
						var loginName=$("#username").val();
						var password=$("#password").val();						
						var userType=$('input:radio[name="userType"]:checked').val();
					 	if(loginName==""){
					 	  return false;
					 	}
						$.ajax({
							url: "/ajaxLoginValid.jhtml",
							type: "POST",
							data: {
								loginName: loginName,
								password:password,
								userType: userType
									},
							dataType: "json",
							cache: false,
							success: function(data) {
									
									// 如果登录成功，则显示成功
									if(data.success=="success"){
										if(or=="no"){
											return false;
										}else{
											// 刷新页面
											window.location.href="/";
										}
									}else{
										if(data.errorLoginName=="用户不存在，请注册"){
											alert(data.errorLoginName);										
										}
										if(flag !="true"){
											if(data.errorPwd=="用户密码错误"){
												alert(data.errorPwd);										
											}
										}
										
									}
								}
							});
					}
		    	// 用户名验证。
				$("#username,input:radio[name='userType']").change(function(){
					submitF("no","true");
				});
				
				// 登录。
				$("#login").click(function() {
					var loginName=$("#username").val();
					var password=$("#password").val();
					if(loginName==""&&password==""){
						alert("用户名和密码不能为空！");
					}else{
						submitF("yes","false");
					}
				});
				$("#register").click(function() {
					// 需要跳转到注册页面
					window.location.href="/personalReg.jhtml";
				});
				
				$("#logout").click(function() {
					// 需要跳转到注册页面
					window.location.href="/logout.jhtml";
				});
				
				
			})
	</script>
	
<div style="width:100%">
	<div class="j_head">
		<div class="j_head_pic">
			<img src="/resource/public/images/1.png" width="100%" height="126px">
		</div>
		<div class="j_head_nav">
			<div class="nav">
				<a href="/" title="">首页</a>
				<a href="/infoCenter.jhtml" title="">资讯中心</a>
				<a href="/guide.jhtml" title="">工作指南</a>
				<a href="/jobIntroduce.jhtml" title="">职业介绍</a>
				<a href="/policyAdvice.jhtml" title="">政策咨询</a>
				<a href="/dataChanel.jhtml" title="">数据频道</a>
				<a href="/onlineShow.jhtml" title="">网上展示厅</a>
				<div style="float: right; width: 330px; margin-top: 10px;text-align:right;">
					<form action="">
						<span style="color:#FFFFFF;">全文检索：</span>
						<input type="test" style="width:160px">
						<input type="button" value="检索" style="background:#FDFBC8;;border-radius:4px;border:1px solid #909090;">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>