<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.brand.edit")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/shop/imgblowup/js/jquery.fancyzoom.min.js"></script>
<script type="text/javascript" src="${base}/resources/shop/imgblowup/js/jquery.shadow.js"></script>
<script type="text/javascript" src="${base}/resources/shop/imgblowup/js/jquery.ifixpng.js"></script>
<style type="text/css">
.selecta{
	border:1px solid red;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $type = $("#type");
	var $logo = $("#logo");
	var $browserButton = $("#browserButton");
	
	[@flash_message /]
	
	$browserButton.browser();
	
	$type.change(function() {
		if ($(this).val() == "text") {
			$logo.val("").prop("disabled", true);
			$browserButton.prop("disabled", true);
		} else {
			$logo.prop("disabled", false);
			$browserButton.prop("disabled", false);
		}
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			logo: "required",
			order: "digits"
		}
	});
	
	$("input[name='currentstatus']").click(function(){
		if($(this).val() == '1'){
			$("textarea[name='reason']").parent().parent().show();
		}else{
			$("textarea[name='reason']").parent().parent().hide();
		}
	});
	
	$("#brandLicense").fancyzoom();
	$("#logo").fancyzoom();
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.brand.edit")}
	</div>
	<form id="inputForm"  action="authenticationed.jhtml" method="get">
		<input type="hidden" name="id" value="${brandReview.id}" />
		<table class="input">
			<tr>
				<th>
					${message("Brand.name")}:
				</th>
				<td>
					${brandReview.name}
				</td>
			</tr>
			<tr>
				<th>
					用户：
				</th>
				<td>
					<a href="/admin/businessman/edit.jhtml?id=${brandReview.businessman.id}">${brandReview.businessman.username}</a>
				</td>
			</tr>
			<tr>
				<th>
					${message("Brand.logo")}:
				</th>
				<td>
					<img id="logo" style="width:190px;height:120px;" src="${brandReview.logo}"></img>
				</td>
			</tr>
			<tr>
				<th>
					品牌经营许可证:
				</th>
				<td>
					<img id="brandLicense" style="width:190px;height:120px;" src="${brandReview.brandLicense}"></img>
				</td>
			</tr>
			<tr>
				<th>
					审核：
				</th>
				<td>
				    <label><input type="radio" name="currentstatus" value="0" [#if brandReview.currentstatus == "success"]checked[/#if] />审核通过</label>
				    <label><input type="radio" name="currentstatus" value="1" [#if brandReview.currentstatus == "miss"]checked[/#if]/>审核不通过</label>
				    <label><input type="radio" name="currentstatus" value="2" [#if brandReview.currentstatus == "examining"]checked[/#if]/>正在审核中</label>
				</td>
			</tr>
			<tr [#if brandReview.currentstatus != "miss"]style="display:none"[/#if]>
				<th>
					理由：
				</th>
				<td>
				    <textarea name="reason">${brandReview.reason}</textarea>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" id="backButton" class="button" value="${message("admin.common.back")}" />
				</td>
			</tr>
		</table>
	</form>
</body>

</html>