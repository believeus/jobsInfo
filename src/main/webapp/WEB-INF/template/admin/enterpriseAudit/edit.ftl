<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>企业审核 - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="/resource/public/js/admin/common.css" rel="stylesheet" type="text/css" />
<link href="/resource/public/js/admin/themes/default/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resource/public/js/admin/jquery.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/jquery.validate.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/kindeditor.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/common.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/input.js"></script>
<script type="text/javascript">
$().ready(function() {
	$("#relationship").val("${tentUsers.relationship}")
	$("#economicType").val("${tentUsers.economicType}");
	$("#unitType").val("${tentUsers.unitType}")
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
	$inputForm.validate({
		rules: {
			title: "required",
			adPositionId: "required",
			path: "required",
			order: "digits"
		}
	});F
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml">首页</a> &raquo; 编辑内容
	</div>			
		<table class="input">
			<form id="inputForm" novalidate="novalidate"  action="/admin/enterpriseAudit/update.jhtml"   method="post">
				<input type="hidden" name="id" value="${tentUsers.id}">
				<input type="hidden" name="status" value="${tentUsers.status}">
				<input type="hidden" name="loginName" value="${tentUsers.loginName}">
				<input type="hidden" name="password" value="${tentUsers.password}">
				<input type="hidden" name="idcard" value="${tentUsers.idcard}"/>
				<input type="hidden" name="email" value="${tentUsers.email}"/>
					<tr>
						<td>单位全称:</td>
						<td style="padding-right: 80px;"><input type="text" value="${tentUsers.fullName}" id="fullName" name="fullName"></td>
						<td>单位性质:</td>
						<td>
							<select id="unitType" name="unitType" style="width: 182px;">
								<option value="">请选择..</option>
								<option value="企业">企业</option>
								<option value="党政机关">党政机关</option>
								<option value="事业单位">事业单位</option>
								<option value="社会团体">社会团体</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>单位简称:</td>
						<td><input type="text" id="shorName" value="${tentUsers.shorName}" name="shorName"></td>
						<td>隶属关系:</td>
						<td>
							<select id="relationship" name="relationship" style="width: 182px;">
								<option value="">请选择..</option>
								<option value="中央">中央</option>
								<option value="省">省</option>
								<option value="市">市</option>
								<option value="县">县</option>
								<option value="街道">街道</option>
								<option value="居委会">居委会</option>
								<option value="其它">其它</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>经济类型:</td>
						<td>
							<select id="economicType" name="economicType" style="width: 182px;">
								<option value="">请选择..</option>
								<option value="国有">国有</option>
								<option value="集体">集体</option>
								<option value="联营">联营</option>
								<option value="股份制">股份制</option>
								<option value="私营">私营</option>
								<option value="个体">个体</option>
								<option value="外商">外商</option>
								<option value="港澳台">港澳台</option>
								<option value="其它">其它</option>
							</select>
						</td>
						<td>法人代表:</td>
						<td><input type="text" value="${tentUsers.legalMan}" id="legalMan" name="legalMan"></td>
					</tr>
					<tr>
						<td>所属地区:</td>
						<td><input type="text"  value="${tentUsers.area}" id="area" name="area"></td>
						<td>行业:</td>
						<td><input type="text"  value="${tentUsers.trade}" id="trade" name="trade"></td>
					</tr>
					<tr>
						<td>注册资金:</td>
						<td><input type="text"  value="${tentUsers.regMoney}" id="regMoney" name="regMoney"></td>
						<td>详细地址:</td>
						<td><input type="text"  value="${tentUsers.detailAddress}"id="detailAddress" name="detailAddress"></td>
					</tr>
					<tr>
						<td>联系人:</td>
						<td><input type="text"  value="${tentUsers.contacts}" id="contacts" name="contacts"></td>
						<td>通讯地址:</td>
						<td><input type="text"  value="${tentUsers.address}" id="address" name="address"></td>
					</tr>
					<tr>
						<td>邮编:</td>
						<td><input type="text"  value="${tentUsers.zip}" id="zip" name="zip"></td>
						<td>手机:</td>
						<td><input type="text"  value="${tentUsers.phoneNum}" id="phoneNum" name="phoneNum"></td>
					</tr>
					<tr>
						<td>电话/传真:</td>
						<td><input type="text"  value="${tentUsers.phoneFax}" id="phoneFax" name="phoneFax"></td>
						<td>网址:</td>
						<td><input type="text"  value="${tentUsers.webSite}" id="webSite" name="webSite"></td>
					</tr>
					<tr>
						<td style="vertical-align: top;">单位简介:</td>
						<td colspan="3"><textArea cols="50" rows="5"  name="introduce" id="introduce" style="resize:none;">${tentUsers.introduce}</textArea></td>
					</tr>
					<tr>
						<th>
							&nbsp;
						</th>
						<td colspan="3">
							<input type="submit" class="button" value="确定" />
							<input type="button" id="backButton" class="button" value="返回" />
						</td>
					</tr>
				</form>
			</table>
</body>
</html>