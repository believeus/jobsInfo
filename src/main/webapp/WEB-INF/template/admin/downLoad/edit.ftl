<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>修改上传文件 - Powered By e3dmall</title>
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
	<form id="inputForm" action="update.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${dataCenter.id}"/>
		<input type="hidden" name="type" value="${type}"/>
		<input type="hidden" name="suffix" value="" id="suffix">
		<input type="hidden" name="oldUrl" value="${dataCenter.imgpath}">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>文件标题:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" value="${dataCenter.title}"/>
				</td>
				<th>
					<span class="requiredField">*</span>上传作者:
				</th>
				<td>
					<input type="text" name="author" class="text" maxlength="200" value="${dataCenter.author}" />
				</td>
			</tr>
			<tr>
				<th><span class="requiredField">*</span>选择文件:</th>
				<td>
				<input type="file" name="fileV" >
				已上传文件：
				[#list dataCenter.imgpath?string?split("#") as value]   
				 	<a href="/${value}" title="点击查看" target="_blank">点击查看</a>		 	
				[/#list]
				<script type="text/javascript">
				 function checkV(file) {
 				   if(!(/(?:rar|zip|7z)$/i.test(file.value))) {
      				  alert("文件格式有误");
       				  if(window.ActiveXObject) {//for IE
        					file.select();//select the file ,and clear selection
          				    document.selection.clear();
       					} else if(window.opera) {//for opera
       	   					file.type="text";file.type="file";
       					} else file.value="";//for FF,Chrome,Safari
   					}else{
   						$("#suffix").val("1");	
   					 }  
				  }
				</script>
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					文件说明:
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