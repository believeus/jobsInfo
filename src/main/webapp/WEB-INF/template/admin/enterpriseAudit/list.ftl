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
	$("input:radio[name^='status']").change(function(){
		var group=$(this).attr("group");
		var status=$("input:radio[group='"+group+"']:checked").val(); 
		var id=$(this).attr("id");
		location.href="/admin/enterpriseAudit/review.jhtml?id="+id+"&status="+status;
	})

});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml">首页</a> &raquo; 内容列表 <span>共${enterpriseTentUsers.total}条记录</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<div class="bar">
			<div class="buttonWrap">
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
							<a href="javascript:;" class="current" val="title">单位全称</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
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
					<a href="/admin/enterpriseAudit/edit.jhtml?id=${user.id}">[修改]</a>
					<input type="radio"  name="status_${user_index}" group="${user_index}" value="0" id="${user.id}" [#if user.status=="0"]checked="true"[/#if]>审核中
					<input type="radio"  name="status_${user_index}" group="${user_index}" value="1" id="${user.id}" [#if user.status=="1"]checked="true"[/#if]>审核通过
					<input type="radio"  name="status_${user_index}" group="${user_index}" value="2" id="${user.id}" [#if user.status=="2"]checked="true"[/#if]>审核驳回
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