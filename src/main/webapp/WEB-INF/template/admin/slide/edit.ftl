<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>编辑幻灯片 - Powered By e3dmall</title>
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
			title1: "required",
			title2: "required",
			alink1:"required",
			alink2:"required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml">首页</a> &raquo; 添加内容
	</div>
	<form id="inputForm" action="update.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${dataCenter.id}">
		<input type="hidden" name="imgpath" value="${dataCenter.imgpath}"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>标题1:
				</th>
				<td>
					<input type="text" name="title1" class="text" maxlength="200" value="${dataCenter.title?string?split("#")[0]}"/>
				</td>
				<th>
					<span class="requiredField">*</span>标题2:
				</th>
				<td>
					<input type="text" name="title2" class="text" maxlength="200" value="${dataCenter.title?string?split("#")[1]}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>图片1:
				</th>
				<td>
					<input type="file" name="img1">
					<br/>
					<a href="/${dataCenter.imgpath?string?split("#")[0]}" title="点击查看">
						<img src="/${dataCenter.imgpath?string?split("#")[0]}" style="width:192px;height:30px">
					</a>
					<br/><label style="color:#0000FF;">宽543px*高85px</label>
				</td>
				<th><span class="requiredField">*</span>图片2</th>
				<td>
					<input type="file" name="img2">
					<br/>
					<a href="/${dataCenter.imgpath?string?split("#")[1]}" title="点击查看">
						<img src="/${dataCenter.imgpath?string?split("#")[1]}" style="width:192px;height:30px">
					</a>
					<br/><label style="color:#0000FF;">宽165px*高85px</label>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>外链接1:
				</th>
				<td>
					<input type="text" name="alink1" class="text" maxlength="200" value="${dataCenter.alink?string?split("#")[0]}"/>
				</td>
				<th>
					<span class="requiredField">*</span>外链接2:
				</th>
				<td>
					<input type="text" name="alink2" class="text" maxlength="200" value="${dataCenter.alink?string?split("#")[1]}"/>
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