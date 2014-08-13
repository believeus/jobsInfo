<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>列表 - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="/resource/public/js/admin/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resource/public/js/admin/jquery.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/common.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/list.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/input.js"></script>
<script type="text/javascript">
$().ready(function() {


});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml" target="_parent">首页</a> &raquo; 内容列表 <span>共${demand?size}条记录</span>
	</div>
	<form id="listForm" action="/admin/monthlyDemandList/monthyDemandList.jhtml method="get">
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
				<input type="button" id="backButton" class="button" style="margin-left: 6px; height: 28px; width: 65px;" value="返回" />
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th>
					<a href="javascript:;" class="sort" name="title">编号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="adPosition">工种</a>
				</th>
			</tr>
			[#list demand.content as center]
			<tr>
				<td>
					<span title="${center.id}">${center_index+1}</span>
				</td>
				<td>
					${center.workType.name}
				</td>
			</tr>
			[/#list]
			<input type="hidden" name="month" value="${month}"/>
		    <input type="hidden" name="year" value="${year}"/>
			[@pagination pageNumber = demand.pageNumber totalPages = demand.totalPages]
					[#include "/include/pagination.ftl"]
			[/@pagination]
		</table>
	</form>
</body>
</html>