<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>岗位审核 - Powered By e3dmall</title>
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
		<a href="/admin/common/main.jhtml">首页</a> &raquo; 编辑内容
	</div>
	
	
	
	<form id="inputForm" novalidate="novalidate"  action="update.jhtml" method="post">
		<input type="hidden" name="status" value="0">
			<table class="input">
				<tr>
					<th>招聘单位:</th>
					<td style="padding-right:80px;"><input type="text" id="company1" name="company"></td>
					<th>人数:</th>
					<td><input type="text" id="worknum1" name="worknum"></td>
				</tr>
				<tr>
					<th>工种:</th>
					<td>
						<input type="text" id="selectJobshidden1" name="workTypeId" value="java"/>
					</td>
					<th>性别:</th>
					<td>
						<select id="sex1" name="sex" style="width: 183px;">
							<option value="">请选择..</option>
							<option value="woman">男</option>
							<option value="man">女</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>专业:</th>
					<td>
					<input type="test" value="计算机系" id="selectSpecialtyhidden1" name="majorTypeId"/>
				</td>
					<th>技术等级:</th>
					<td><input type="text" id="eteLevel1" name="eteLevel"></td>
				</tr>
				<tr>
					<th>从事年限:</th>
					<td><input type="text" id="workyear1" name="workyear"></td>
					<th>文化程度:</th>
					<td>
						<select id="eduLevel1" name="eduLevel" style="width: 183px;">
							<option value="">请选择..</option>
							<option value="研究生以上">研究生以上</option>
							<option value="博士研究生">博士研究生</option>
							<option value="大学本科">大学本科</option>
							<option value="大学专科">大学专科</option>
							<option value="中专技校">中专技校</option>
							<option value="中等专科">中等专科</option>
							<option value="职业高中">职业高中</option>
							<option value="技工学校">技工学校</option>
							<option value="普通高中">普通高中</option>
							<option value="初中及以下">初中及以下</option>
							<option value="初级中学">初级中学</option>
							<option value="小学">小学</option>
							<option value="其他">其他</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>工作地点:</th>
					<td><input type="text" id="workspace1" name="workspace"></td>
					<th>年龄:</th>
					<td><input type="text" id="age1" name="age"></td>
				</tr>
				<tr>
					<th>身高:</th>
					<td><input type="text" id="height1" name="height"></td>
					<th>视力:</th>
					<td><input type="text" id="eyesight1" name="eyesight"></td>
				</tr>
				<tr>
					<th>薪资待遇:</th>
					<td><input type="text" id="salary1" name="salary"></td>
					<th>用工形式:</th>
					<td>
						<select id="workWay1" name="workWay" style="width: 183px;">
							<option value="">请选择..</option>
							<option value="兼职">兼职</option>
							<option value="全职">全职</option>
							<option value="实习">实习</option>
							<option value="...">...</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>招聘期限:</th>
					<td>
						<select id="worklimit1" name="worklimit" style="width: 183px;">
							<option value="">请选择..</option>
							<option value="1年">1年</option>
							<option value="3年">3年</option>
							<option value="5年">5年</option>
							<option value="...">...</option>
						</select>
					</td>
					<th>面试时间:</th>
					<td><input type="text" id="viewData1" name="viewData"></td>
				</tr>
				<tr>
					<th style="vertical-align:top;">其他说明:</th>
					<td colspan="3">
						<textArea cols="30" style="resize:none;" id="note1" name="note"></textArea>
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