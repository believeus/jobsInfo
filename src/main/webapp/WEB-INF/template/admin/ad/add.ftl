<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.ad.add")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $type = $("#type");
	var $contentTr = $("#contentTr");
	var $pathTr = $("#pathTr");
	var $path = $("#path");
	var $browserButton = $("#browserButton");
	
	[@flash_message /]
	
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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.ad.add")}
	</div>
	<form id="inputForm" action="save.jhtml" method="post" enctype="multipart/form-data">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Ad.title")}:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.type")}:
				</th>
				<td>
					<select id="type" name="type">
						[#list types as type]
							<option value="${type}">${message("Ad.Type." + type)}</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.adPosition")}:
				</th>
				<td>
					<select name="adPositionId">
						[#list adPositions as adPosition]
							<option value="${adPosition.id}">${adPosition.name} [${adPosition.width} × ${adPosition.height}]</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					${message("Article.content")}:
				</th>
				<td>
					<textarea id="editor" name="content" class="editor"></textarea>
				</td>
			</tr>
			<tr id="pathTr" class="hidden">
				<th>
					<span class="requiredField">*</span>${message("Ad.path")}:
				</th>
				<td>
					<!--
						<span class="fieldSet">
							<input type="text" id="path" name="path" class="text" maxlength="200" disabled="disabled" />
							<input type="button" id="browserButton" class="button" value="${message("admin.browser.select")}" />
						</span>
					-->
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
								<img style="width:190px;height:120px" src="" name="img"/>
							</div>
							<input type="file" style="display:none" id="file0" name="file0" onchange="filename0.value=this.value;loadImgFast(this,0)">
							<input type="hidden" id="filename0" name="filename0">
						</span>
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
					${message("Ad.beginDate")}:
				</th>
				<td>
					<input type="text" id="beginDate" name="beginDate" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'endDate\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.endDate")}:
				</th>
				<td>
					<input type="text" id="endDate" name="endDate" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'beginDate\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.url")}:
				</th>
				<td>
					<input type="text" name="url" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.order")}:
				</th>
				<td>
					<input type="text" name="order" class="text" maxlength="9" />
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