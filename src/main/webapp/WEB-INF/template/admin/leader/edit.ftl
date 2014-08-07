<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>修改 - Powered By e3dmall</title>
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
			author: "required",
			img: "required",
			content: "required"
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
					<span class="requiredField">*</span>职务:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" value="${dataCenter.title}"/>
				</td>
				<th>
					<span class="requiredField">*</span>姓名:
				</th>
				<td>
					<input type="text" name="author" class="text" maxlength="200" value="${dataCenter.author}" />
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					<span class="requiredField">*</span>相关图片:
				</th>
				<td colspan="3">
					
					<div>
						<span style="float:left">
							<div id="preview_wrapper">    
						        <div id="preview_fake" >  
						        	<input type="hidden" name="imgpath" value="${dataCenter.imgpath}"/>  
						            <img id="preview" onload="onPreviewLoad(this,190,120)" src="[#if dataCenter.imgpath!="/resource/public/images/6551-A40C-4FDA-8D55-87265167B506.jpg"]/[/#if]${dataCenter.imgpath}"/>
						        </div>    
						    </div>    
						    <br/>    
						    <input id="upload_img" type="file" name="upload_img" onchange="filename0.value=this.value;onUploadImgChange(this,190,120,'preview','preview_fake','preview_size_fake');"/>  
						    <input type="hidden" id="filename0" name="filename0">
						    <br/>    
						    <img id="preview_size_fake"/> 
						</span>
					</div>
					
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					分管范围:
				</th>
				<td colspan="3">
					<textarea id="" name="content" class="" style="width: 730px; height: 100px;">${dataCenter.content}</textarea>
				</td>
			</tr>
			<tr>
				<th>
					排序编号:
				</th>
				<td colspan="3">
					<input type="text" name="order" class="text" maxlength="9" value="${dataCenter.id}" />
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