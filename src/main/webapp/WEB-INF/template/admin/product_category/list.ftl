<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.productCategory.list")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $delete = $("#listTable a.delete");
	
	[@flash_message /]

	// 删除
	$delete.click(function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "${message("admin.dialog.deleteConfirm")}",
			onOk: function() {
				$.ajax({
					url: "delete.jhtml",
					type: "POST",
					data: {id: $this.attr("val")},
					dataType: "json",
					cache: false,
					success: function(message) {
						$.message(message);
						if (message.type == "success") {
							$this.closest("tr").remove();
						}
					}
				});
			}
		});
		return false;
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.productCategory.list")}
	</div>
	<form id="listForm" action="list.jhtml" method="get">
	<div class="bar">
		<a href="add.jhtml" class="iconButton">
			<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
		</a>
		<a href="javascript:;" id="refreshButton" class="iconButton">
			<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
		</a>
		[#if !productCategoryRoot??]
			<input type="button" class="button" value="${message("admin.common.back")}" onclick="javascript:window.history.back();"/>
		[/#if]
		[#if ishasChildren??]
			<a href="javascript:void(0);" class="iconButton" title="${ishasChildren}">
				<span style="color:blue">${ishasChildren}</span>
			</a>
		[/#if]
	</div>
	<table id="listTable" class="list">
		<tr>
			<th>
				<span>${message("ProductCategory.name")}</span>
			</th>
			<th>
				<span>${message("admin.common.order")}</span>
			</th>
			<th>
				<span>${message("admin.common.handle")}</span>
			</th>
		</tr>
		[#if productCategoryRoot??]
			[#list productCategoryRoot as productCategory]
				<tr>
					<td>
						<span style="margin-left: ${productCategory.grade * 20}px;[#if productCategory.grade == 0] color: #000000;[/#if]">
							<a href="/admin/product_category/queryChildren.jhtml?parentId=${productCategory.id}" >${productCategory.name}</a>
						</span>
					</td>
					<td>
						${productCategory.order}
					</td>
					<td>
						<a href="${base}${productCategory.path}" target="_blank">[${message("admin.common.view")}]</a>
						<a href="edit.jhtml?id=${productCategory.id}">[${message("admin.common.edit")}]</a>
						<a href="javascript:;" class="delete" val="${productCategory.id}">[${message("admin.common.delete")}]</a>
					</td>
				</tr>
			[/#list]
		[/#if]
		
		[#if productCategorychildren??]
			[#list productCategorychildren as productCategory]
				<tr>
					<td>
						<span style="margin-left: ${productCategory.grade * 20}px;[#if productCategory.grade == 0] color: #000000;[/#if]">
							<a href="/admin/product_category/queryChildren.jhtml?parentId=${productCategory.id}" >${productCategory.name}</a>
						</span>
					</td>
					<td>
						${productCategory.order}
					</td>
					<td>
						<a href="${base}${productCategory.path}" target="_blank">[${message("admin.common.view")}]</a>
						<a href="edit.jhtml?id=${productCategory.id}">[${message("admin.common.edit")}]</a>
						<a href="javascript:;" class="delete" val="${productCategory.id}">[${message("admin.common.delete")}]</a>
					</td>
				</tr>
			[/#list]
		[/#if]
		
		[#if msg??]
			<tr>
				<td colspan="3" style="text-align:center;">
					${msg}
				</td>
			</tr>
		[/#if]
		
	</table>
	</form>
</body>
</html>