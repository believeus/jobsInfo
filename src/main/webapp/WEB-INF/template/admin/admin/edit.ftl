<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>修改管理员 - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="/resource/public/js/admin/common.css" rel="stylesheet" type="text/css" />
<link href="/resource/public/js/admin/themes/default/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resource/public/js/admin/jquery.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/jquery.validate.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/ueditor1_2_6_2/ueditor.config.js"></script><script type="text/javascript" src="/resource/public/js/admin/ueditor1_2_6_2/ueditor.all.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/common.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/input.js"></script>
<script type="text/javascript">
$().ready(function() {
	
	$("#roleId").val('${rolelist.get[0].id}');
	var $inputForm = $("#inputForm");
	var $type = $("#type");
	var $contentTr = $("#contentTr");
	var $pathTr = $("#pathTr");
	var $path = $("#path");
	var $browserButton = $("#browserButton");
	
	
	
	// "类型"修改
	$type.change(function() {
		if ($type.val() == "text") {
			$contentTr.show();
			$pathTr.hide();
			$path.prop("disabled", true)
		} else {
			$contentTr.hide();
			$pathTr.show();
			$path.prop("disabled", false)
			$browserButton.unbind().browser({
				type: $type.val()
			});
		}
	});
	
	// 表单验证
	// 表单验证
	$inputForm.validate({
		rules: {
			email: {
				required:true,
				email:true			
			},
			repass: {
				equalTo:"#password"
			}
		},
		messages: {
			email:{
				email:"格式不正确"
			},
			repass:{
				equalTo:"密码和确认密码一样"
			}
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml" target="_parent">首页</a> &raquo; 修改管理员
	</div>
	<form id="inputForm" action="/admin/update.jhtml" method="post">
		<input type="hidden" name="id" value="${admin.id}"/>
		<table class="input">
			<tr>
				<th colspan="2" style="text-align: left; font-size: 15px; padding-left: 120px;">
				</th>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>用户名:
				</th>
				<td>
						<input type="hidden" name="loginName" value="${admin.loginName}">
						<span>${admin.loginName}</span>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>电子邮件:
				</th>
				<td>
					<input type="text" name="email" class="text" maxlength="200" value="${admin.email}" />
				</td>
			</tr>
			[#if sessionUser.loginName =="admin"]
			<tr>
				<th>
					<span class="requiredField">*</span>请选择角色:
				</th>
				<td>
				<select name="roleId" id="roleId">
					[#list roles as role]
						<option value="${role.id}">${role.roleName}</option>
					[/#list]
				</select>
				</td>
			</tr>
			[/#if]
			<tr>
				<th>
					新密码:
				</th>
				<td>
					<input type="password" name="password" id="password" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					确认新密码:
				</th>
				<td>
					<input type="password" name="repass" class="text" maxlength="200"/>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="submit" class="button" value="提交" />
					<input type="button" id="" class="button" value="返回" onClick="javascript:window.history.back();"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>