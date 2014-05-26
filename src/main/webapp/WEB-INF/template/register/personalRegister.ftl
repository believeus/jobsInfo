<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人注册</title>
<style type="text/css">
body {
	font-family:Arial, Helvetica, sans-serif;
	font-size:13px;	
}
.top_title input{
	font-size:16px;
	font-weight:bold;
	background:none;
	border:none;
	color:#06C;
	width:105px;
	height:35px;
	margin-top:10px;
	margin-left:15px;	
}

::-webkit-input-placeholder { /* WebKit browsers */
    color:    #999;
}
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
    color:    #999;
}
::-moz-placeholder { /* Mozilla Firefox 19+ */
    color:    #999;
}
:-ms-input-placeholder { /* Internet Explorer 10+ */
    color:    #999;
}

.xingx div{
	height:55px;	
}
.xingx span:first-of-type {
	font-size:16px;
	display:inline-block;
	width:100px;	
}
.xingx input {
	height:32px;
	width:285px;
	border:1px solid #C0C0C0;
	padding:0px 7px;
	font: 14px 'Arial';
	border-radius:3px;
}
.register input {
	font-size:12px;
	color:#666;
	width:55px;
	height:35px;
	border:1px solid #CCC;
	margin-right:20px;
	border-radius:3px;
}
</style></head>

<body>
[#include "/include/header.ftl" /]
<div style="margin-left:auto;margin-right:auto;margin-top:10px; height:auto; width:715px; overflow:hidden;">
	<div class="top_title" style="width:715px;height:42px; background-image:url(/resource/public/images/register_1.gif)">
    	<input type="button" value="个人用户" name="" />
   		<input type="button" value="企业用户" name="" style="color:#000; margin-left:0px;"/>
	</div>
    <div style="margin-top:15px;padding-left:15px;width:695px; height:85px; border:1px solid #ccc;background-color:#F9F9F9">
    	<p style="font-family:'微软雅黑'; font-size:18px;">尊敬的用户：</p>
        <p>请填写您现在所办社保的信息</p>
    </div>
    <div style="margin-top:60px; margin-left:30px;">
    	<div class="xingx">
            <div>
            	<span>身份证号：</span>
                <span><input type="text" placeholder="请填写真实身份证号..."/></span>
            </div>
            <div>
            	<span>密码：</span>
                <span><input type="password" placeholder="输入密码..."/></span>
            </div>
            <div>
            	<span>确认密码：</span>
                <span><input type="password" placeholder="确认输入..."/></span>
            </div>
            <div>
            	<span>姓名：</span>
                <span><input placeholder="输入姓名..."/></span>
            </div>
            <div>
            	<span>手机号：</span>
                <span><input type="" placeholder="输入电话号码（含区号）"/></span>
            </div>
            <div>
            	<span>邮箱：</span>
                <span><input type="email" placeholder="输入邮箱地址..."/></span>
            </div>
    	</div>
    </div>
	<div class="register" style="margin-left:130px;">
    	<input type="button" name="" value="注册"/>
        <input type="button" name="" value="重填" />
    </div>
</div>
[#include "/include/footer.ftl" /]
</body>
</html>
