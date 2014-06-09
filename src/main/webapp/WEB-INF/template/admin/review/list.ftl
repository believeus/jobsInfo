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
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
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
							商品分类:
						<\/th>
						<td>
							<select name="productCategoryId">
								<option value="">${message("admin.common.choose")}<\/option>
								[#list productCategoryTree as productCategory]
									<option value="${productCategory.id}"[#if productCategory.id == productCategoryId] selected="selected"[/#if]>
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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.review.list")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" id="type" name="type" value="${type}" />
		<input type="hidden" id="reviewContentId" name="reviewContentId" value="${reviewContentId}" />
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<a href="javascript:;" id="moreButton" class="button">${message("admin.product.moreOption")}</a>
				<div class="menuWrap">
					<a href="javascript:;" id="typeSelect" class="button">
						${message("admin.review.type")}<span class="arrow">&nbsp;</span>
					</a>
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
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						${message("admin.page.pageSize")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li>
								<a href="javascript:;"[#if page.pageSize == 10] class="current"[/#if] val="10">10</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 20] class="current"[/#if] val="20">20</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 50] class="current"[/#if] val="50">50</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 100] class="current"[/#if] val="100">100</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${page.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if page.searchProperty == "content"] class="current"[/#if] val="content">${message("Review.content")}</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				
				<th>
					<a href="javascript:;" class="sort" name="product">商品名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="score">商品${message("Review.score")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="serviceScore">服务态度</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="desScore">描述相符</a>
				</th>
				
				<th>
					<a href="javascript:;" class="sort" name="content">评论${message("Review.content")}</a>
				</th>
				<th>
					<span>评论主题</span>
				</th>
				<th>
					<span>商品分类</span>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="member">${message("Review.member")}</a>
				</th>
			<!--
				<th>
					<a href="javascript:;" class="sort" name="isShow">${message("Review.isShow")}</a>
				</th>
			-->
				<th>
					<a href="javascript:;" class="sort" name="createDate">${message("admin.common.createDate")}</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as review]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${review.id}" />
					</td>
					<td>
						<a href="/product/${review.product.id}.jhtml" target="_blank" title="${review.product.fullName}">${abbreviate(review.product.fullName, 30, "...")}</a>
					</td>
					<td>
						${review.score}
					</td>
					<td>
						${review.serviceScore}
					</td>
					<td>
						${review.desScore}
					</td>
					<td>
						<span title="${review.content}">${abbreviate(review.content, 50, "...")}</span>
					</td>
					<td>
						[#list review.reviewContents as reviewContent]
							[#if reviewContent?string !=null]
								<span name="reviewContent">[${reviewContent.content}]</span>
							[#else]
								<span name="reviewContent">[暂无]</span>
							[/#if]
						[/#list]
					</td>
					<td>
						<span name="reviewContent">${review.product.productCategory.name}</span>
					</td>
					<td>
						[#if review.member??]
							${review.member.username}
						[#else]
							${message("admin.review.anonymous")}
						[/#if]
					</td>
				<!--  
					<td>
						<span class="${review.isShow?string("true", "false")}Icon">&nbsp;</span>
					</td>
				-->
					<td>
						<span title="${review.createDate?string("yyyy-MM-dd HH:mm:ss")}">${review.createDate}</span>
					</td>
					<td>
						<a href="edit.jhtml?id=${review.id}">[${message("admin.common.edit")}]</a>
						<a href="${base}${review.path}" target="_blank">[${message("admin.common.view")}]</a>
						<!-- <a href="return.jhtml?id=${review.id}" target="_blank">[回复]</a> --> 
					</td>
				</tr>
			[/#list]
		</table>
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>