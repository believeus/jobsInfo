<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>修改视频新闻 - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="/resource/public/js/admin/common.css" rel="stylesheet" type="text/css" />
<link href="/resource/public/js/admin/themes/default/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resource/public/js/admin/jquery.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/jquery.validate.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/kindeditor.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/common.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/input.js"></script>
<script type="text/javascript" src="/resource/public/js/waitamoment.js"></script>
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
		},
		submitHandler: function(form) {
			 	showdiv();
			 	form.submit();	
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
					<span class="requiredField">*</span>标题:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" value="${dataCenter.title}"/>
				</td>
				<th>
					<span class="requiredField">*</span>作者:
				</th>
				<td>
					<input type="text" name="author" class="text" maxlength="200" value="${dataCenter.author}" />
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					<span class="requiredField">*</span>视频截图:
				
				</th>
				<td colspan="3">
					<input type="file" name="fileImg" onchange="checkI(this)">
					已上传截图:
					[#assign num=0]
					[#list dataCenter.imgpath?string?split("#") as value]   
					 [#if num==0]	
					 		<a href="/${value}" title="点击查看" target="_blank">点击查看</a>		 	
					 [/#if]
					 [#assign num=num+1]					
					[/#list]
					<script type="text/javascript">
				 	function checkI(file) {
 				  	 if(!(/(?:gif|jpg|jpeg|bmp|png)$/i.test(file.value))) {
      				  alert("只允许上传 gif/jpg/jpeg/bmp/png 格式的视频截图");
       				  if(window.ActiveXObject) {//for IE
        					file.select();//select the file ,and clear selection
          				    document.selection.clear();
       						} else if(window.opera) {//for opera
       	   						file.type="text";file.type="file";
       						} else file.value="";//for FF,Chrome,Safari
   					  }else{
   						$("#suffix").val("0");	
   					  } 
				  }
				</script>
				</td>
			</tr>
			<tr>
				<th><span class="requiredField">*</span>视频文件:</th>
				<td>
				<input type="file" name="fileV" onchange="checkV(this)">
				已上传视频：
				[#list dataCenter.imgpath?string?split("#") as value]   
					 [#assign num=num-1]					
					 [#if num==0]	
					 	<a href="/${value}" title="点击查看" target="_blank">点击查看</a>		 	
					 [/#if]
				[/#list]
				<script type="text/javascript">
				 function checkV(file) {
 				   if(!(/(?:flv)$/i.test(file.value))) {
      				  alert("只允许上传swf和flv 格式的视频");
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
					内容:
				</th>
				<td colspan="3">
					<textarea id="" name="content" class="" style="width: 727px; height: 100px;">${dataCenter.content}</textarea>
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