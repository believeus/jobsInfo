<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>新闻列表 - Powered By e3dmall</title>
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
		<a href="/admin/common/main.jhtml">首页</a> &raquo; 内容列表 <span>共${mailBoxList?size}条记录</span>
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
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">标题</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="adPosition">发信人</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="type">发布时间</a>
				</th>
				<th>
					<a href="#"  class="sort">操作</a>
				</th>
			</tr>
			
			[#list mailBoxList as mail]
			<tr>
				<td>
					<input type="checkbox" name="ids" value="${mail.id}" />
				</td>
				<td>
					<span title="${center.id}">${mail.title}</span>
				</td>
				<td>
					${mail.username}
				</td>
				<td>
					${mail.editTime?number_to_datetime} ${mail.editTime?number_to_time}
				</td>
				<td>
					<a href="/admin/mailBox/edit.jhtml?id=${mail.id}">[查看]</a>
					[#if mail.status=="0"]
						<a href="/admin/mailBox/review.jhtml?id=${mail.id}"><font color="red">[点击审核通过]</font></a>
					[#else]
						<font color="green">[审核通过]</font>
					[/#if]
				</td>
			</tr>
			[/#list]
			
		</table>
	</form>
</body>
</html>