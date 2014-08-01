<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dth">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>求职者 - Powered By e3dmall</title>
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
	$("#password").val("");
	$("#sex").val("${user.sex}");
	$("#eduLevel").val("${user.eduLevel}");
	$("#polity").val("${user.polity}");
	$("#marriage").val("${user.marriage}");
	
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
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml" target="_parent">首页</a> &raquo; 编辑内容
	</div>
	<form id="inputForm" novalidate="novalidate"  action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${user.id}">
		<input type="hidden" name="freeTrain" value="${user.freeTrain}" id="freeTrain"/>
		<input type="hidden" name="freeIntro" value="${user.freeTrain}" id="freeIntro"/>
		<input type="hidden" name="imgHead" value="${user.imgHead}" id="imgHead"/>
		<table class="input">
				<tr>
					<th>姓名:</th>
					<td><input type="text" id="trueName" name="trueName" value="${user.trueName}"></td>
				</tr>
				<tr>
					<th>登录名:</th>
					<td><input type="text" id="loginName" name="loginName" value="${user.loginName}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>年龄:</th>
					<td><input type="text" id="age" name="age" value="${user.age}" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="3"></td>
				</tr>
				<tr>
					<th>民族:</th>
					<td><input type="text" id="nation" name="nation" value="${user.nation}"></td>
				</tr>
				<tr>
					<th>政治面貌:</th>
					<td>
						<select id="polity" name="polity" style="width:158px;">
							<option value="">请选择..</option>
							<option value="中共党员">中共党员</option>
							<option value="共青团员">共青团员</option>
							<option value="民主党派">民主党派</option>
							<option value="普通公民">普通公民</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>婚姻状况:</th>
					<td>
						<select id="marriage" name="marriage" style="width:158px;">
							<option value="">请选择..</option>
							<option value="未婚">未婚</option>
							<option value="已婚">已婚</option>
							<option value="离异">离异</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>视力:</th>
					<td><input type="text" id="eyesight" name="eyesight" value="${user.eyesight}"></td>
				</tr>
				<tr>
					<th>个人特长:</th>
					<td><input type="text" id="strongPoint" name="strongPoint" value="${user.strongPoint}"></td>
				</tr>
				<tr>
					<th>手机号码:</th>
					<td><input type="text" id="phoneNum" name="phoneNum" value="${user.phoneNum}"></td>
				</tr>
				<tr>
					<th>二女户:</th>
					<td>
						<input type="radio"  name="twoGirl" value="1" [#if user.twoGirl=="1"]checked="true"[#elseif user.twoGirl!="0"]checked="true"[/#if] style="width:10px">是
						<input type="radio"  name="twoGirl" value="0" [#if user.twoGirl=="0"]checked="true"[/#if]style="width:10px">否
					</td>
				</tr>
				<tr>
					<th>性别:</th>
					<td>
						<select id="sex" name="sex" style="width:158px;">
							<option value="">请选择..</option>
							<option value="man">男</option>
							<option value="woman">女</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>密码:</th>
					<td><input type="text" id="password"  name="password" placeholder="不填" readonly="readonly"></td>
				</tr>
				<tr>
					<th>身份证号:</th>
					<td><input type="text" id="idcard" name="idcard" value="${user.idcard}"  onkeyup="value=this.value.replace(/\D+x/g,'')" minlength="15" minlength="18"></td>
				</tr>
				<tr>
					<th>文化程度:</th>
					<td>
						<select id="eduLevel" name="eduLevel" style="width:158px;">
							<option value="">请选择..</option>
							<option value="博士">博士</option>
							<option value="硕士">硕士</option>
							<option value="大学">大学</option>
							<option value="大专">大专</option>
							<option value="中专中技">中专中技</option>
							<option value="技校">技校</option>
							<option value="高中">高中</option>
							<option value="职高">职高</option>
							<option value="初中">初中</option>
							<option value="小学">小学</option>
							<option value="文盲或半文盲">文盲或半文盲</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>身高:</th>
					<td><input type="text" id="height" name="height" value="${user.height}"><span style="margin-left:-25px;">cm</span></td>
				</tr>
				<tr>
					<th>健康状况:</th>
					<td>
						<select id="health" name="health" style="width:158px;">
							<option value="">请选择..</option>
							<option value="健康">健康</option>
							<option value="患病">患病</option>
							<option value="残疾">残疾</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>家庭地址:</th>
					<td><input type="text" id="address" name="address" value="${user.address}"></td>
				</tr>
				<tr>
					<th style="font-size: 12px;">原工作单位:</th>
					<td><input type="text"  id="workspace" name="workspace" value="${user.workspace}"></td>
				</tr>
				<tr>
					<th style="font-size: 12px;">就失业证号:</th>
					<td><input type="text" id="jobId" name="jobId" value="${user.jobId}"onkeyup="value=this.value.replace(/\D+/g,'')"></td>
				</tr>
				<tr>
					<th>独生子女:</th>
					<td>
						<input type="radio" name="singleChild" value="1" [#if user.singleChild=="1"]checked="true"[#elseif user.singleChild!="0"]checked="true"[/#if] style="width:10px">是
						<input type="radio" name="singleChild" value="0" [#if user.singleChild=="0"]checked="true"[/#if]style="width:10px	">否
					</td>
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
			</table>
	</form>
</body>
</html>