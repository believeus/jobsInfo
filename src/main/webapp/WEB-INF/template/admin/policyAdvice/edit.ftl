<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>修改新闻 - Powered By e3dmall</title>
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
	$("#powerLevel").val("${dataCenter.powerLevel}");
	$("#powerProperty").val("${dataCenter.powerProperty}");
	var $inputForm = $("#inputForm");
	var $type = $("#type");
	var $contentTr = $("#contentTr");
	var $pathTr = $("#pathTr");
	var $path = $("#path");
	var $browserButton = $("#browserButton");
	
	var editor = new UE.ui.Editor();
    editor.render('editor');
    editor.addListener('contentchange',function(){
        this.sync();
        $('textarea').valid();
    });
	
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
			author: "required",
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
	<form id="inputForm" action="update.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${dataCenter.id}">
		<input type="hidden" name="type" value="${type}"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>标题:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" value="${dataCenter.title}"/>
				</td>
				<th>
					<span class="requiredField">*</span>作者:
				</th>
				<td>
					<input type="text" name="author" class="text" maxlength="200" value="${dataCenter.author}"/>
				</td>
			</tr>
			<tr>
				<th>效力等级:</th>
				<td>
					<select style="width: 192px;" name="powerLevel" id="powerLevel">
						<option value="0">全部</option>
						<option value="1">法律</option>
						<option value="2">行政法规</option>
						<option value="3">地方法规</option>
						<option value="4">规章</option>
						<option value="5">规范性文件</option>
						<option value="6">省厅文件</option>
					</select>
				</td>
				<th>效率属性</th>
				<td>
					<select style="width: 192px;" name="powerProperty" id="powerProperty">
						<option value="0">全部</option>
						<option value="1">有效</option>
						<option value="2">失效</option>
						<option value="3">废止</option>
					</select>
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					内容:
				</th>
				<td colspan="3">
					<textarea id="editor" name="content" class="editor">${dataCenter.content}</textarea>
				</td>
			</tr>
			<tr>
				<th>
					排序编号:
				</th>
				<td colspan="3">
					<input type="text" name="order" class="text" maxlength="9" value="${dataCenter.id}"/>
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