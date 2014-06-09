[#-- 
	hdb
	保证金
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
<script type="text/javascript">
$().ready(function() {

	[@flash_message /]

});
</script>
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.member.list")} <span>(${message("admin.page.total",page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
	 
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
							<a href="javascript:;"[#if page.searchProperty == ""] class="current"[/#if] val="">供应商</a>
						</li>
						<li>
							<a href="javascript:;"[#if page.searchProperty == "bankNo"] class="current"[/#if] val="bankNo">银行卡号</a>
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
					<a href="javascript:;" class="sort" name="businessman">供应商</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="bankName">支付银行</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="bankNo">支付卡号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="zhifuDate">支付日期</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="securitydDeposit">保证金额</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="serviceFees">服务费金额</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="ispass">是否审核</a>
				</th>
				<th>
					<a href="javascript:;"  name="">操作</a>
				</th>
			</tr>
			[#list page.content as serviceInfo]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${serviceInfo.id}" />
					</td>
					<td>
						${serviceInfo.businessman.username}
					</td>
					<td>
						${serviceInfo.bankName}
					</td>
					<td>
						${serviceInfo.bankNo}
					</td>
					
					<td>
						${serviceInfo.zhifuDate?string("yyyy-MM-dd")}
					</td>
					
					<td>
						${serviceInfo.securitydDeposit}
					</td>
					<td>
						${serviceInfo.serviceFees}
					</td>
					<td>
						[#if serviceInfo.ispass]
							<font color="green">已确认</font>
						[#else]
							<font color="red">未确认</font>
						[/#if]
					</td>
					<td>
						[#if serviceInfo.ispass]
							
						[#else]
							<a href="edit.jhtml?id=${serviceInfo.id}">审核</a>
						[/#if]
						
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