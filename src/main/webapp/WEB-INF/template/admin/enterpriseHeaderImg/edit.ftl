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
			title: "required",
			adPositionId: "required",
			path: "required",
			order: "digits",
			alink: "required"
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
		<input type="hidden" name="type" value="${type}"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>企业名称:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" value="${dataCenter.title}"/>
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					<span class="requiredField">*</span>企业电子图:
				</th>
				<td>
					<script type="text/javascript">
					function loadImgFast(img,i){
							if (img.files && img.files[0]){
								var reader = new FileReader();
								reader.onload = function(evt){$(".brandImg:eq("+i+") img")[0].src = evt.target.result;}
					            reader.readAsDataURL(img.files[0]);	
							}else if(window.navigator.userAgent.indexOf("MSIE")>=1){
							   	file.select(); 
					   			path = document.selection.createRange().text;
					   			$(".brandImg:eq("+i+") img")[0].src = path;
					   		} 
						}
					</script>
					
					<div>
						<span style="float:left">
							<div class="brandImg">
								<span>
									<a onclick="file0.click()" href="javascript:return false;">点击上传图片</a>
								</span>
								<input type="hidden" name="imgpath" value="${dataCenter.imgpath}">
								<img style="width:190px;height:120px" [#if dataCenter.imgpath?exists] src="/${dataCenter.imgpath}" [#else]src="/resource/public/images/bg.png"[/#if] name="img"/>
							</div>
							<input type="file" style="display:none" id="file0" name="file0" onchange="filename0.value=this.value;loadImgFast(this,0)">
							<input type="hidden" id="filename0" name="filename0">
						</span>
						<label style="color:#0000FF;position:relative;top:100px;left:10px;">(建议尺寸：宽195px*高33px)</label>
					</div>
					<style type="text/css">
						.brandImg span{
							display:block;
							position:absolute;
							top:0px;left:0px;
							width:200px;
							height:130px;
						}
						
						.brandImg{
							border-color: #B8B8B8 #DCDCDC #DCDCDC #B8B8B8;
						    border-radius: 2px 2px 2px 2px;
						    border-style: solid;
						    border-width: 1px;
						    background-color: #666666;
						    width:192px;height:122px;
						    position:relative;
						}
						
						.brandImg span:hover{
							background-color:#FFFFFF;
						    opacity: 0.7;
						    filter:alpha(opacity=50);
						    -moz-opacity:0.5;
						    -khtml-opacity: 0.5;
						}
						
						.brandImg span a{
							display:block;
							position:absolute;
							top:50px;left:50px;
						}
						
						.deleteProductImage:hover{
							color:#C9033B !important;
						}
					</style>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>企业链接:
				</th>
				<td>
					<input type="text" name="alink" class="text" maxlength="200" value="${dataCenter.alink}"/>
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