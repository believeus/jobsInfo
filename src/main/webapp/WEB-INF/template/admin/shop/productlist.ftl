[#-- 
	hdb
	显示某个商家的一个商店里所有的商品页面	
--]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.member.list")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	[@flash_message /]

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.member.list")} <span>(${message("admin.page.total",productlist?size)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
	[#-- 
		<div class="bar">
			<a href="add.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						${message("admin.page.pageSize")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li>
								<a href="javascript:;"[#if 10 == 10] class="current"[/#if] val="10">10</a>
							</li>
							<li>
								<a href="javascript:;"[#if 20 == 20] class="current"[/#if] val="20">20</a>
							</li>
							<li>
								<a href="javascript:;"[#if 50 == 50] class="current"[/#if] val="50">50</a>
							</li>
							<li>
								<a href="javascript:;"[#if 100 == 100] class="current"[/#if] val="100">100</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if page.searchProperty == "username"] class="current"[/#if] val="username">${message("Member.username")}</a>
						</li>
						<li>
							<a href="javascript:;"[#if page.searchProperty == "email"] class="current"[/#if] val="email">${message("Member.email")}</a>
						</li>
					</ul>
				</div>
				--]
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="sn">${message("Product.sn")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="name">${message("Product.name")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="productCategory">${message("Product.productCategory")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="price">${message("Product.price")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="cost">${message("Product.cost")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="stock">${message("Product.stock")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="isMarketable">${message("Product.isMarketable")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">${message("admin.common.createDate")}</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list productlist as product]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${product.id}" />
					</td>
					<td>
						${product.sn}
					</td>
					<td>
						<span title="${product.fullName}">
							${abbreviate(product.fullName, 50, "...")}
							[#if product.isGift]
								<span class="gray">[${message("admin.product.gifts")}]</span>
							[/#if]
						</span>
						[#list product.validPromotions as promotion]
							<span class="promotion">${promotion.name}</span>
						[/#list]
					</td>
					<td>
						${product.productCategory.name}
					</td>
					<td>
						${currency(product.price)}
					</td>
					<td>
						${currency(product.cost)}
					</td>
					<td>
						[#if product.stock??]
							[#if product.allocatedStock == 0]
								<span[#if product.isOutOfStock] class="red"[/#if]>${product.stock}</span>
							[#else]
								<span[#if product.isOutOfStock] class="red"[/#if] title="${message("Product.allocatedStock")}: ${product.allocatedStock}">${product.stock}</span>
							[/#if]
						[/#if]
					</td>
					<td>
						<span class="${product.isMarketable?string("true", "false")}Icon">&nbsp;</span>
					</td>
					<td>
						<span title="${product.createDate?string("yyyy-MM-dd HH:mm:ss")}">${product.createDate}</span>
					</td>
					<td>
						<a href="/shop/edit.jhtml?id=${product.id}">[${message("admin.common.edit")}]</a>
						[#if product.isMarketable]
							<a href="${base}${product.path}" target="_blank">[${message("admin.common.view")}]</a>
						[#else]
							[${message("admin.product.notMarketable")}]
						[/#if]
					</td>
				</tr>
				[/#list]
				<tr>
				<td colspan="10" align="right">
					<input type="button" id="backButton" class="button" value="${message("admin.common.back")}" />
				</td>
				</tr>
			
		</table>
		[#-- 
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
		 --]
	</form>
</body>
</html>