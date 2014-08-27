<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>权限列表 - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="/resource/public/js/admin/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resource/public/js/admin/jquery.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/common.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/list-role.js"></script>
<script type="text/javascript">
$().ready(function() {


});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml" target="_parent">首页</a> &raquo; 权限列表 <span>共${roles.total}条记录</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<div class="bar">
			<a href="add.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a>
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
							<a href="javascript:;" class="current" val="title">角色名称</a>
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
					<a href="javascript:;" class="sort" name="adPosition">管理员分组</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="adPosition">角色说明</a>
				</th>
				<th>
					<a href="#"  class="sort">操作</a>
				</th>
			</tr>
			[#list roles.content as role]
			 [#if role.id >3]
				<tr>
				<td>
					 <input type="checkbox"  [#if role.id ==4] disabled="disabled" [/#if] name="ids" value="${role.id}" />
				</td>
				<td>
					${role.roleName}
				</td>
				<td>${role.description}</td>
				<td>
					  <a href="[#if role.id ==4]javascript:void(0);[#else] edit.jhtml?id=${role.id}[/#if]">[#if role.id ==4]该权限不允许修改[#else]修改[/#if]</a>
				</td>
			    </tr>
			 [/#if]
			[/#list]
		</table>
		[@pagination pageNumber = roles.pageNumber totalPages = roles.totalPages]
			[#include "/include/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>