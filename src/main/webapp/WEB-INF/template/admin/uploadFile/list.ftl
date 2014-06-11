<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>上传文件管理 - Powered By e3dmall</title>
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
		<a href="/admin/common/main.jhtml">首页</a> &raquo; 上传文件列表 <span>共99条记录</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>删除
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						每页显示<span class="arrow">&nbsp;</span>
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
					<input type="text" id="searchValue" name="searchValue" value="" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if page.searchProperty == "username"] class="current"[/#if] val="username">用户名</a>
						</li>
						<li>
							<a href="javascript:;"[#if page.searchProperty == "email"] class="current"[/#if] val="email">电子邮件</a>
						</li>
						<li>
							<a href="javascript:;"[#if page.searchProperty == "name"] class="current"[/#if] val="name">姓名</a>
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
					<a href="javascript:;" class="sort" name="id">编号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="username">文件预览</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="email">文件路径</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="loginDate">文件大小</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="loginIp">上传时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">上传者</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">被引用位置</a>
				</th>
			</tr>
				<tr>
					<td>
						<input type="checkbox" name="ids" value="1" />
					</td>
					<td>
						1
					</td>
					<td>
						<img src="" width="40" height="40">
					</td>
					<td>
						/upfile/2014517145843_22222.jpg
					</td>
					<td>
						50KB
					</td>
					<td>
						2014-5-17 14:58:43
					</td>
					<td>
						<span title="admin">admin</span>
					</td>
					<td>
						图片新闻
					</td>
				</tr>
		</table>
	</form>
</body>
</html>