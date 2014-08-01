<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>管理员列表 - Powered By e3dmall</title>
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
		<a href="/admin/common/main.jhtml" target="_parent">首页</a> &raquo; 管理员列表 <span>共${admins.total}条记录</span>
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
					<input type="text" id="searchValue" name="searchValue" value="" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;" class="current" val="username">管理员登录名</a>
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
					<a href="javascript:;" class="sort" name="username">用户名</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="email">电子邮件</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="loginDate">最后登录日期</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">创建日期</a>
				</th>
				<th>
					<span>操作</span>
				</th>
			</tr>
			[#list admins.content as admin]
				<tr>
					<td>
					    [#if admin.id !=1]
						 <input type="checkbox" name="ids" value="${admin.id}" />
						[/#if]
					</td>
					<td>
						${admin.loginName}
					</td>
					<td>
						${admin.email}
					</td>
					<td>
						${admin.lastLoginData?number_to_date}&nbsp${admin.lastLoginData?number_to_time}
					</td>
					<td>
						<span>${admin.createDate?number_to_date}</span>
					</td>
					<td>
						<a href="edit.jhtml?id=${admin.id}">[编辑]</a>
					</td>
				</tr>
			[/#list]
		</table>
		[@pagination pageNumber = admins.pageNumber totalPages = admins.totalPages]
			[#include "/include/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>