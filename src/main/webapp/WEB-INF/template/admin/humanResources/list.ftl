<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>企业审核 - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="/resource/public/js/admin/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resource/public/js/admin/jquery.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/common.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/list.js"></script>
<script type="text/javascript">
$().ready(function() {


});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml" target="_parent">首页</a> &raquo; 内容列表 <span>共${enterpriseTentUsers.total}条记录</span>
	</div>
	<form id="listForm" action="list.jhtml" method="post">
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>删除
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"class="current" val="title">单位全称</a>
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
					<a href="javascript:;" class="sort" name="fullName">单位全称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="legalMan">法人代表</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="regMoney">注册资金</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="unitType">单位性质</a>
				</th>
				<th>
					<a href="#"  class="sort">操作</a>
				</th>
			</tr>
			
			[#list enterpriseTentUsers.content as user]
			<tr>
				<td>
					<input type="checkbox" name="ids" value="${user.id}" />
				</td>
				<td>
					<span>${user.fullName}</span>
				</td>
				<td>
					${user.legalMan}
				</td>
				<td>
					${user.regMoney}
				</td>
				<td>
					${user.unitType}
				</td>
				<td>
					<a href="/admin/enterpriseList/edit.jhtml?id=${user.id}">[修改]</a>
				</td>
			</tr>
			[/#list]
		</table>
		[@pagination pageNumber = enterpriseTentUsers.pageNumber totalPages = enterpriseTentUsers.totalPages]
			[#include "/include/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>