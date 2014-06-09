<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.index.build")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/imguploadpreview/imgpreview.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/shop/imguploadpreview/imgpreview.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/waitamoment.js"></script>

<script type="text/javascript">
$().ready(function() {
	$("input[name=file]").previewImg(190,120);
	
	$("#fileForm").validate({
			rules: {
				file: "required",
				minlength: 15
			}
	});
	
	$("#deleteForm").validate({
			rules: {
				path: "required"
			}
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 上传图片
	</div>
	<form id="fileForm" action="uploadImage.jhtml" method="post" enctype="multipart/form-data">
		<table class="input">
			<tr>
				<th>
					<b>上传图片</b>
				</th>
				<td>
					<input name="file" type="file">
				</td>
				<th><b>图片路径</b></th>
				<td>
					<textarea type="text" name="path" cols="60" rows="3">${path}</textarea>
				</td>
				
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td colspan="4">
					<input class="button" type="submit" value="提 交" />
				</td>
			</tr>
		</table>
	</form>
	<form id="deleteForm" action="delete.jhtml" method="post"  enctype="multipart/form-data">
		<table class="input">
			<tr>
				<th>
					<b>删除图片</b>
				</th>
				<td>
					<textarea type="text" name="path" cols="60" rows="3"></textarea>&nbsp;&nbsp;&nbsp;&nbsp;<label><font color="blue">(请输入图片路径)</font></label>
				</td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>