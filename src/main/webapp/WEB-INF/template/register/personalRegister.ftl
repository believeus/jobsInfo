<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人注册</title>
<script type="text/javascript" src="/resource/public/js/jquery.js"></script>
<style type="text/css">
body {
	font-family:Arial, Helvetica, sans-serif;
	font-size:13px;
	font-family:"黑体";/*2014-07-17 北科*/
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
.xingx span {
	width:170px;	
	display:inline-block;
	color:red;
	/*font-size:13px;*/
	
	line-height:50px;
}
.xingx input {
	height:32px;
	/*width:268px;*/
	width:200px;
	border:1px solid #C0C0C0;
	padding:0px 7px;
	font: 14px 'Arial';
	border-radius:3px;
	line-height:32px;
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
th{
    font-weight: normal;
    line-height: 25px;
    padding: 5px 10px 5px 0;
    text-align: right;
    white-space: nowrap;
    width: 100px;
    line-height:40px;
}
</style></head>


<body>
[#include "/include/header.ftl" /]
	<script type="text/javascript">
		    $().ready(function() {
		    
					// ajax 提交验证和注册。
		    		function submitF(submitx){
						$.ajax({
							url: "/ajaxComValidReg.jhtml",
							type: "POST",
							data: {
								loginName: $("#loginName").val(),
								idcard:$("#idcard").val(),
								password:$("#password").val(),
								comfirmPwd:$("#comfirmPwd").val(),
								trueName:$("#trueName").val(),
								phoneNum:$("#phoneNum").val(),
								email:$("#email").val(),
								sex:$('input:radio[name="sex"]:checked').val(),
								submit:submitx
								},
							dataType: "json",
							cache: false,
							success: function(data) {
									// 如果注册成功，则进行跳转
									if(data.message=="success"){
										$("#registerForm").attr("action","/");
										$("#registerForm").submit();
									}else{
										if(data.sex == "man"){
											$("#girl").parent().hide();
											$("#boy").parent().show();
											$("#boy").attr("checked",true);
										}else if(data.sex == "woman"){
											$("#boy").parent().hide();
											$("#girl").parent().show();
											$("#girl").attr("checked",true);
										}else{
											$("#girl").parent().show();
											$("#boy").parent().show();
											$("#girl").attr("checked",true);
										}
										// 先删除上一个错误
										$("#Error").remove();
										$("#"+data.property).parent().parent().append("<span id='Error'><font color='red'>*</font>"+data.message+"</span>");
									}
								}
							});
					}
					
				// 用户名验证。
				$("#loginName,#idcard,#password,#comfirmPwd,#phoneNum,#trueName").change(function(){
					submitF("nosubmit");
				});
				
				// 注册。
				$("#register").click(function() {
					var loginName= $("#loginName").val();
					var password=$("#password").val();
					var comfirmPwd=$("#comfirmPwd").val();
					var trueName=$("#trueName").val();
					var phoneNum=$("#phoneNum").val();
					if(loginName==""&&password==""&&comfirmPwd==""){
						alert("用户名和密码和确认密码不能为空！");
					}else if(trueName==""){
						alert("真实姓名不能为空！");
					}else if(phoneNum==""){
						alert("手机号码不能为空！");
					}else{
						submitF("submit");
					}
				});
				
				$("#enterpriseReg").click(function() {
					// 需要跳转到注册页面
					window.location.href="/enterpriseReg.jhtml";
				});
				$("input[value='重填']").click(function (){
				    $("#Error").hide();
				});
			})
	</script>

<div class="qiyezhuce" >
	<div class="top_title" style="background: #E5E5E5;border-bottom: 3px solid #E36510;height: 30px;width: 1000px;">
    	<input type="button" value="个人用户"  style="background: #E36510;color: #FFFFFF;cursor: pointer;"/>
   		<input type="button" id="enterpriseReg" value="企业用户" style="color:#000; margin-left:0px;cursor:pointer;margin-left:-5px;"/>
	</div>
    <form id="registerForm" action="/submitpersonalReg.jhtml" method="post">
    <div style="margin-top: 30px; padding: 0px 130px 0px 270px; width: 600px; text-align: left;">
    	<div class="xingx">
    		<p style="color: rgb(211, 54, 49); font-size: 20px; margin-bottom: 20px; margin-top: 0px; text-align: left;">欢迎个人用户注册</p>
            <table>
            	<tr>
            		<th><font color="red">*</font>用户名：</th>
            		<td><input type="text"  id="loginName" name="loginName"/></td>
            	</tr>
            	<tr>
            		<th><font color="red">*</font>密码：</th>
            		<td><input type="password" id="password" name="password"/></td>
            	</tr>
            	<tr>
            		<th><font color="red">*</font>重复密码：</th>
            		<td><input type="password" id="comfirmPwd" /></td>
            	</tr>
            	<tr>
            		<th><font color="red">*</font>真实姓名：</th>
            		<td><input type="text" id="trueName" name="trueName" /></td>
            	</tr>
            	<tr>
            		<th><font color="red">*</font>手机号码：</th>
            		<td>
            			<input type="" id="phoneNum" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="11" minlegnth="11"/>
            		</td>
            	</tr>
            	<tr>
            		<th>身份证号：</th>
            		<td><input type="text" name="idcard" id="idcard" /></td>
            	</tr>
            	<tr>
            		<th>性别：</th>
            		<td>
            			<label><input type="radio" id="boy" name="sex"  value="man" checked="true" style="width: 10px;height: 12px;border:0;"/>&nbsp;&nbsp;男&nbsp;&nbsp;</label>
                		<label><input type="radio" id="girl" name="sex" value="woman" checked="false" style="width: 10px;height: 12px;border:0;"/>&nbsp;&nbsp;女</label>
            		</td>
            	</tr>
            	
            	<tr>
            		<th>电子邮箱：</th>
            		<td>
            			<input type="email" id="email" />
            		</td>
            	</tr>
            </table>
    	</div>
    </div>
	<div class="register" style="">
    	<input type="button" id="register" value="注册" style="cursor:pointer;background:#FFFDE8;border:1px solid #DBAF72;border-radius:4px;"/>
        <input type="reset" name="" value="重填" style="cursor:pointer;background:#FFFDE8;border:1px solid #DBAF72;border-radius:4px;" />
    </div>
    </form>
</div>
[#include "/include/footer.ftl" /]
</body>
</html>