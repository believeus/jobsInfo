<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>求职者 - Powered By e3dmall</title>
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
		<a href="/admin/common/main.jhtml" target="_parent">首页</a> &raquo; 内容列表 <span>共${recruitList.total}条记录</span>
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
							<a href="javascript:;" class="current" val="title">工种全称</a>
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
					<a href="javascript:;" class="sort" name="title">排序编号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="adPosition">内容标题</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="type">工作地点</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="endDate">工种</a>
				</th>
				<th>
					<a href="#"  class="sort">操作</a>
				</th>
			</tr>
			
			<tr>
			[#list recruitList.content as recruit]
				<td>
					<input type="checkbox" name="ids" value="${recruit.id}" />
				</td>
				<td>
					<span>${recruit.id}</span>
				</td>
				<td>
					${recruit.company}
				</td>
				<td>
					${recruit.workspace}
				</td>
				<td>
					${recruit.workType.name}
				</td>
				<td>
					<a href="edit.jhtml?id=${recruit.id}">[修改]</a>
					[#if recruit.status ==0 ]
					 <a href="review.jhtml?id=${recruit.id}"><font color="red">[未审核]</font></a>
					[#else]
					  <font color="green">[审核通过]</font>
					[/#if]
				</td>
			</tr>
			[/#list]
		</table>
		[@pagination pageNumber = recruitList.pageNumber totalPages = recruitList.totalPages]
			[#include "/include/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>