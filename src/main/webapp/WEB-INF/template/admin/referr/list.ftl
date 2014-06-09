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
	var $listForm = $("#listForm");
	var $filterSelect = $("#filterSelect");
	var $filterOption = $("#filterOption a");
	var $print = $("select[name='print']");
	// 订单筛选
	$filterSelect.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	// 筛选选项
	$filterOption.click(function() {
		var $this = $(this);
		var $dest = $("#" + $this.attr("name"));
		if ($this.hasClass("checked")) {
			$dest.val("");
		} else {
			$dest.val($this.attr("val"));
		}
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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 推荐供应商审核
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		 <input type="hidden" id="currentStatus" name="currentStatus" value="${currentStatus}" />
		<div class="bar">
			<div class="buttonWrap">
			
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
							<a href="javascript:;" id="filterSelect" class="button">
								审核状态筛选<span class="arrow">&nbsp;</span>
							</a>
							<div class="popupMenu">
								<ul id="filterOption" class="check">
									<li>
										<a href="javascript:;" name="currentStatus" val="success" [#if currentStatus == "success"] class="checked"[/#if]>通过审核</a>
									</li>
									<li>
										<a href="javascript:;" name="currentStatus" val="miss" [#if currentStatus == "miss"] class="checked"[/#if]>审核不通过</a>
									</li>
									<li>
										<a href="javascript:;" name="currentStatus" val="untried" [#if currentStatus == "untried"] class="checked"[/#if]>未审核</a>
									</li>
								</ul>
							</div>
						</div>
				<div class="menuWrap">
					
				</div>
			</div>
			
		</div>
		
		
		<table id="listTable" class="list">
			<tr>
				<th>
					<a href="javascript:;" class="sort" >推荐人万维店号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="companyName">公司名</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="mobile">公司联系方式</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="companyLegalPerson">公司负责人姓名</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="id">联系人qq</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="qq">审核状态</a>
				</th>
				<th>
					<span  class="sort">操作<span>
				</th>
			</tr>
			[#if page??]
			[#list page.content as refferrer]
					<tr[#if !receiver_has_next] class="last"[/#if]>
							<td>
								${refferrer.member.wwmallid}
							</td>
							<td>
								<input type="hidden" name="id" value="${refferrer.id}" />
								${refferrer.companyName}
							</td>
							<td>
								${refferrer.mobile}
							</td>
							<td>
								${refferrer.companyLegalPerson}
							</td>
							<td>
								${refferrer.qq}
							</td>
							<td>
								[#if refferrer.currentStatus=="untried"]未审核[/#if]
								[#if refferrer.currentStatus=="miss"]审核不通过[/#if]
								[#if refferrer.currentStatus=="success"]审核通过[/#if]
							</td>
							<td>
								<a href="edit.jhtml?id=${refferrer.id}">[${message("shop.member.handle.edit")}]</a>
								<a href="view.jhtml?id=${refferrer.id}">[查看]</a>
							</td>
						</tr>
				[/#list]
				[/#if]
			
			
		</table>
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>