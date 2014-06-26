<html>
<head>
<title>后台管理系统</title>
<meta http-equiv=Content-Type content=text/html;charset=gb2312>
<meta http-equiv="refresh" content="60">
<script type="text/javascript" src="/resource/public/js/Etech.js"></script>
<base target="main">
</head>
<body leftmargin="0" topmargin="0">
	<div class="back_xinxi" style="width: 100%; height: 100px; text-align: right; float: right;">
		<div style="width:100%;height:116px;">
			<img src="/resource/public/images/back_pic.png" width="100%" height="116px">
		</div>
		<div style="position: relative; width: auto; height: 40px; float: right; right: 40px; top: -105px;">
			<span style="color:#808080;">${sessionUser.loginName}</span>
	    	<span style="color:#808080;">,你好!</span>
	    	<span style="color:#808080;"><a style="color:#808080;" href="/admin/edit.jhtml?id=${sessionUser.id}">[修改密码]</a></span>
	    	<span><a style="color:#808080;" href="/adminLogout.jhtml">[退出]</a></span>
    	</div>
	</div>
</body>
</html>
