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
	border: medium none;
    color: #0066CC;
    font-size: 16px;
    font-weight: bold;
    height: 30px;
    width: 135px;
    padding:0;	
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
.qiyezhuce{
	border: 1px solid #E4E4E4;
    height: auto;
    margin-left: auto;
    margin-right: auto;
    margin-top: 10px;
    overflow: hidden;
    width: 1000px;
}
.register{
	border-top: 1px dashed #E4E4E4;
    margin: 0 50px;
    padding: 20px 0;
    text-align: center;
}
</style></head>


<body>
[#include "/include/header.ftl" /]
<script style="text/javascript">
		    $().ready(function() {
		    	// 表单验证
					$("#registerFormx").validate({
						rules: {
							loginName: {
								required: true,
								minlength:6,
								pattern: /^[0-9a-zA-Z_-]+$/,
								remote: {
									url: "/ajaxComValidReg.jhtml",
									cache: false
								}
							}
							
						},
						messages: {
							loginName: {
								pattern: "格式不对",
								remote: "用户名已经存在"
							}
						},
						
						 errorPlacement: function (error, element) { //指定错误信息位置
						   // error.insertAfter(element);
						    alert(error);
						 },
						submitHandler: function(form) {
							alert("xxx");
							//return false;
							form.submit();	
						}
					});
		    
		    	// ajax 提交验证和登录。
		    	function submitF(){
						var propertyValue=$("#username").val();
						var password=$("#password").val();
						var userType=$('input:radio[name="userType"]:checked').val();
					 	if(propertyValue==""){
					 	  return false;
					 	}
						$.ajax({
							url: "/ajaxLoginValid.jhtml",
							type: "POST",
							data: {
								propertyValue: propertyValue,
								password:password,
								userType: userType
									},
							dataType: "json",
							cache: false,
							success: function(data) {
									// 如果登录成功，则显示成功
									if(data.result=="success"){
										$("#denglu2").attr("style","");
										$("#denglu1").attr("style","display:none;");
									}else{
										alert(data.result);
									}
								}
							});
					}
		    	//验证。
				$("#username,input:radio[name='userType']").change(function(){
					submitF();
				});
				
				// 登录。
				$("#login").click(function() {
					var propertyValue=$("#username").val();
					var password=$("#password").val();
					if(propertyValue==""&&password==""){
						alert("用户名和密码不能为空！");
					}else{
						submitF();
					}
				});
				$("#enterpriseReg").click(function() {
					// 需要跳转到注册页面
					window.location.href="/enterpriseReg.jhtml";
				});
				
			})
	</script>

<div class="qiyezhuce" >
	<div class="top_title" style="background: #E5E5E5;border-bottom: 3px solid #E36510;height: 30px;width: 1000px;">
    	<input type="button" value="个人用户"  style="background: #E36510;color: #FFFFFF;cursor: pointer;"/>
   		<input type="button" id="enterpriseReg" value="企业用户" style="color:#000; margin-left:0px;cursor:pointer;margin-left:-5px;"/>
	</div>
    <form id="registerForm" action="/submitpersonalReg.jhtml" method="post">
    <div style="margin-top: 30px; padding: 0px 300px; text-align: right;">
    	<div class="xingx">
    		<p style="color: rgb(211, 54, 49); font-size: 20px; margin-bottom: 20px; margin-top: 0px; text-align: left;">欢迎个人用户注册</p>
            <div>
            	<span><font color="red">*</font>用户名：</span>
                <span><input type="text" name="username" /></span>
            </div>
            <div>
            	<span><font color="red">*</font>密码：</span>
                <span><input type="password" name="password" /></span>
            </div>
            <div>
            	<span><font color="red">*</font>重复密码：</span>
                <span><input type="password" name="enpassword" /></span>
            </div>
            <div>
            	<span>真实姓名：</span>
                <span><input name="loginName" /></span>
            </div>
            <div>
            	<span>身份证号：</span>
                <span><input type="text" name="idcard" /></span>
            </div>
            <div style="text-align: left; margin-left: 45px;">
            	<span>性别：</span>
                <span>
                	<input type="radio" name="sex"  value="boy" checked="true" style="width: 10px;height: 12px;"/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	<input type="radio" name="sex" value="girl" style="width: 10px;height: 12px;"/>女
            	</span>
            </div>
            <div>
            	<span>联系电话：</span>
                <span><input type="" name="phoneNum" /></span>
            </div>
            <div>
            	<span>电子邮箱：</span>
                <span><input type="email" name="email" /></span>
            </div>
    	</div>
    </div>
	<div class="register" style="">
    	<input type="submit" name="" value="注册" style="cursor:pointer;background:#FFFDE8;border:1px solid #DBAF72;border-radius:4px;"/>
        <input type="reset" name="" value="重填" style="cursor:pointer;background:#FFFDE8;border:1px solid #DBAF72;border-radius:4px;" />
    </div>
    </form>
</div>
[#include "/include/footer.ftl" /]
</body>
</html>
