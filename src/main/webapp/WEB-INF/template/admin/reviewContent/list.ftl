<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.review.list")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="/resources/admin/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {
	
	var $listForm = $("#listForm");
	var $type = $("#type");
	var $typeSelect = $("#typeSelect");
	var $typeOption = $("#typeOption a");
	var $moreButton = $("#moreButton");

	[@flash_message /]
	
	// 更多选项
	$moreButton.click(function() {
		$.dialog({
			title: "${message("admin.product.moreOption")}",
			[@compress single_line = true]
				content: '
				<table id="moreTable" class="moreTable">
					<tr>
						<th>
							${message("Product.productCategory")}:
						<\/th>
						<td>
							<select name="productCategoryId">
								<option value="">${message("admin.common.choose")}<\/option>
								[#list productCategoryTree as productCategory]
									<option value="${productCategory.id}-${productCategory.grade}"[#if productCategory.id == productCategoryId] selected="selected"[/#if]>
										[#if productCategory.grade != 0]
											[#list 1..productCategory.grade as i]
												&nbsp;&nbsp;
											[/#list]
										[/#if]
											${productCategory.name}
									<\/option>
								[/#list]
							<\/select>
						<\/td>
					<\/tr>
				<\/table>',
			[/@compress]
			width: 470,
			modal: true,
			ok: "确定",
			cancel: "取消",
			onOk: function() {
				$("#moreTable :input").each(function() {
					var $this = $(this);
					$("#" + $this.attr("name")).val($this.val());
				});
				$listForm.submit();
			}
		});
	});
	
	
	$typeSelect.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	$typeOption.click(function() {
		var $this = $(this);
		$type.val($this.attr("val"));
		$listForm.submit();
		return false;
	});

});
</script>
<style type="text/css">
.moreTable th {
	width: 80px;
	line-height: 25px;
	padding: 5px 10px 5px 0px;
	text-align: right;
	font-weight: normal;
	color: #333333;
	background-color: #f8fbff;
}

.moreTable td {
	line-height: 25px;
	padding: 5px;
	color: #666666;
}
</style>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 评论主题列表 <span>(共有${size}条记录)</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" id="productCategoryId" name="productCategoryId" value="${productCategoryId}" />
		<input type="hidden" id="grade" name="grade" value="${grade}" />
		<input type="hidden" id="type" name="type" value="${type}" />
		<input type="hidden" id="id" name="id" value="${id}" />
		<div class="bar">
			<div class="buttonWrap">
				<a href="add.jhtml?id=${id}" class="iconButton">
					<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
				</a>
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					<div class="popupMenu">
						<ul id="typeOption">
							<li>
								<a href="javascript:;"[#if type == null] class="current"[/#if] val="">${message("admin.review.allType")}</a>
							</li>
							[#assign currentType = type]
							[#list types as type]
								<li>
									<a href="javascript:;"[#if type == currentType] class="current"[/#if] val="${type}">${message("Review.Type." + type)}</a>
								</li>
							[/#list]
						</ul>
					</div>
				</div>
				
				<a href="javascript:;" id="moreButton" class="button">${message("admin.product.moreOption")}</a>
				<div class="menuWrap">
					
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					
					<button type="submit">&nbsp;</button>
				</div>
				
			</div>
		</div>
		
		
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				
				<th>
					<a href="javascript:;" class="sort" name="id">ID</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="content">评论主题</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="productCategory">商品类别</a>
				</th>
				<!--
				<th>
					<a href="javascript:;" class="sort" name="isShow">${message("Review.isShow")}</a>
				</th>
				-->
				<th>
					<a href="javascript:;" class="sort" name="createDate">创建日期</a>
				</th>
				<th>
					<span>操作</span>
				</th>
			</tr>
			 [#if !page?exists]
				[#list reviewContents as reviewContent] 
					<tr>
						<td>
							<input type="checkbox" name="ids" value="${reviewContent.id}" />
						</td>
						<td>
							${reviewContent.id}
						</td>
						<td>
							<span title="${reviewContent.content}">${abbreviate(reviewContent.content, 50, "...")}</span>
						</td>
						<td>
							[#if reviewContent.productCategory??]
								${reviewContent.productCategory.name}
							[#else]
								暂无
							[/#if]
						</td>
						<td>
							<span title="${reviewContent.createDate?string("yyyy-MM-dd HH:mm:ss")}">${reviewContent.createDate?string("yyyy-MM-dd")}</span>
						</td>
						<td>
							<a href="edit.jhtml?id=${reviewContent.id}">[${message("admin.common.edit")}]</a>
						</td>
					</tr>
				[/#list]
			[#else]
				[#list page.content as reviewContent]
					<tr>
						<td>
							<input type="checkbox" name="ids" value="${reviewContent.id}" />
						</td>
						<td>
							${reviewContent.id}
						</td>
						<td>
							<span title="${reviewContent.content}">${abbreviate(reviewContent.content, 50, "...")}</span>
						</td>
						<td>
							[#if reviewContent.productCategory??]
								${reviewContent.productCategory.name}
							[#else]
								暂无
							[/#if]
						</td>
						<td>
							<span title="${reviewContent.createDate?string("yyyy-MM-dd HH:mm:ss")}">${reviewContent.createDate?string("yyyy-MM-dd")}</span>
						</td>
						<td>
							<a href="edit.jhtml?id=${reviewContent.id}">[${message("admin.common.edit")}]</a>
						</td>
					</tr>
				[/#list]
			[/#if]
			
		</table>
		
	</form>
</body>
</html>