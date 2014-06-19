<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台登陆页面</title>

<style>
body{
	margin:0px;
	font-family:Arial, Helvetica, sans-serif;
	font-size:13px;	
}
#_back{
	background-image:url(/resource/public/images/bage.jpg);
	height:409px;
	padding-top:110px;
}
#midd {
	height:245px;
	width:640px;
	margin-left:auto;
	margin-right:auto;
	background-image:url(/resource/public/images/midd.png);
	border:1px solid #ccc;
}
.putuser{
	margin:70px auto auto 305px; 
	border:1px solid #CCC; 
	height:30px; 
	width:280px;
	background-color:#EEF4FE;
}
#midd img {
	height:18px; 
	width:20px; 
	margin:5px;
	float:left;
}
.userabout {
	vertical-align:top;
	height:28px;
	width:245px;
	border:0px none;
	padding:0px;
	font-size:16px;
	font-weight:bold;
	background-color:#EEF4FE;
}
#butt {
	display:inline-block;
	background-color:#3C96CB;
	width:75px;
	height:28px;
	font-size:14px;
	color:#fff;
	letter-spacing:8px;
	padding:0px 0px 0px 12px;
}
</style>

</head>

<body>
<div>
	<div style="height:35px; background-color:#4577BE; color:#fff;">
    	<span style="margin:7px 30px; display:inline-block;">
        	潜江公共就业服务网站后台管理系统登录界面
        </span>
        <div style="float:right; margin:7px 30px;">
        	<a>回首页</a>
            <a>关于</a>
        </div>
    </div>
    <div id="_back">
    	<div>
        	<div style="margin-left:auto; margin-right:auto; width:470px;">
            	<img src="/resource/public/images/title.png" />
            </div>
            <shiro:guest>
            <div id="midd">
            	<form action="/" method="post">
	            	<div class="putuser">
	                	<img src="/resource/public/images/user.png" />
	                    <input class="userabout" type="text" name="loginName" />
	                </div>
	                <div class="putuser" style="margin-top:27px;">
	                	<img src="/resource/public/images/password.png" />
	                    <input class="userabout" type="password" name="password" style="font-weight:100; font-size:inherit;"/>
	                </div>
                	<c:out value="${LoginError }" escapeXml="false"/>
	                <div style="margin:27px auto auto 305px;">
	                	<input id="butt" type="submit" value="登录" style="cursor:pointer;"/>
	                    <input type="checkbox" style="margin-left:28px;">记住账号</input>
	                    <a style="display:inline-block;margin-left:30px;">忘记密码？</a>
	                </div>
                </form>
            </div>
            </shiro:guest>
        </div>
    </div>
</div>
</body>
</html>




<!--

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后台管理系统</title>
<style>
body{ background:url("/resource/public/images/adminbg.gif") top center no-repeat #fff; text-align:center; margin:0; padding:0; line-height:50px}
.loginbox{ width:400px; height:300px;  text-align:center; font-size:14px; color:#333; margin:0 auto; margin-top:100px}
.logintxt{ width:200px; height:25px; line-height:25px; border:3px solid #ccc; background:#f5f5f5}
.loginbtn{ width:100px; height:30px; background:#00E100; color:#fff; font-size:14px; font-weight:bold; line-height:30px; border:1px solid #06C; padding:0; cursor:pointer; margin-top:10px;margin-left: 170px;}
</style>
</head>
<body>
<div class="loginbox">
	<shiro:guest>
	 <div>
		<div style="position: fixed; top: 100px; left:180px; "><label><font style="color: Green;font-size: 30px; font-family: cursive;">Admin</font></label></div>
	   	<div style="position: fixed; top: 150px; left:300px; "><label><font style="color: Green;font-size: 30px; font-family: cursive;">后台管理</font></label></div>
	    <form action="/" method="post">
	      <label>用户名：</label><input type="text" class="logintxt" name="loginName"/><br/>
		  <label>密<font style="margin-left:1em"> </font>码：</label><input type="password" name="password" class="logintxt"/><br/>
		  <c:out value="${LoginError }" escapeXml="false"/>
	      <input type="submit" class="loginbtn" value="登录"/>
	   </form>
   	 </div>
	</shiro:guest>
</div>
</body>
</html>



-->







