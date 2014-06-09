<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.review.list")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="/resources/admin/js/list.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {

	[@flash_message /]
	
	var $moreButton = $("#moreButton");
	
	// 更多选项
	$moreButton.click(function() {
		$.dialog({
			title: "${message("admin.product.moreOption")}",
			[@compress single_line = true]
				content: '
				<form id="filterForm" action="" method="get">
				<table id="moreTable" class="moreTable">
					<tr>
						<th>
							打款方式
						<\/th>
						<td>
							<select name="type">
								<option value="">${message("admin.common.choose")}<\/option>
								<option value="alipay">支付宝<\/option>
								<option value="bank">银行汇款<\/option>
							<\/select>
						<\/td>
					</tr>
					<tr>	
						<th>
							排序方式
						<\/th>
						<td>
							<select name="order">
								<option value="">${message("admin.common.choose")}<\/option>
								<option value="createDate">时间<\/option>
								<option value="amount">金额<\/option>
							<\/select>
						<\/td>
					</tr>
					<tr>	
						<th>
							是否开户行分组
						<\/th>
						<td>
							<input type="checkbox" name="groupByBank" checked="true" value="bank">
						<\/td>
					</tr>
					<tr>	
						<th>
							状态
						<\/th>
						<td>
							<label><input type="radio" name="status" value="ok" checked>已汇款</label>
							<label><input type="radio" name="status" value="no"><span style="color:red">没有汇款</span></label>
						<\/td>
					<\/tr>
					<tr>
						<th>
							${message("admin.purchaseRanking.beginDate")}:
						<\/th>
						<td>
							<input type="text" id="beginDate" name="beginDate" class="text Wdate" value="${(beginDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: \'#F{$dp.$D(\\\'endDate\\\')}\'});" />
						</td>
					<\/tr>
					<tr>
						<th>
							${message("admin.purchaseRanking.endDate")}:
						<\/th>
						<td>
 
							<input type="text" id="endDate" name="endDate" class="text Wdate" value="${(endDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: \'#F{$dp.$D(\\\'beginDate\\\')}\'});" />
						</td>
					<\/tr>
				<\/table>
				<\/form>',
			[/@compress]
			width: 400,
			modal: true,
			ok: "确定",
			cancel: "取消",
			onOk: function() {
				var $filterForm = $("#filterForm");
				$filterForm.submit();
				return false;
			}
		});
	});
});

function downloadExcel(){
	var ids = new Array();
	$("input[name=ids]:checked").each(function(){
		ids.push($(this).val());
	});
	if(ids.length <= 0){
		alert("请选择至少一条数据！");
		return;
	}
	window.open ('/admin/draw/download.jhtml?ids=' + ids);
}

function updateStatus(id){
	if(!confirm("是否确定跟新！")){
		return ;
	}
	var ids = new Array();
	ids.push(id);
	updateStatusDefault(ids);
}

function updateStatusDefault(ids){
	$("input[name=ids]").val(ids);
	$("input[name=url]").val(window.location.href);
	$("#updateForm").submit();
}

</script>
<style type="text/css">
	.moreTable{
		margin:20px;
	}
	.moreTable{
		margin:5px;
	}
</style>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 佣金体现申请 <span>(共有${size}条记录)</span>
	</div>
	<form id="updateForm" action="/admin/draw/updateStatus.jhtml" method="post">
		<input type="hidden" name="ids">
		<input type="hidden" name="url">
	</form>
	<form id="listForm" action="" method="get">
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<a href="javascript:downloadExcel();" id="downloadButton" class="button">
					<span class="refreshIcon">&nbsp;</span>下载excel
				</a>
				
				<a href="javascript:;" id="moreButton" class="button">${message("admin.product.moreOption")}</a>
				<div class="menuWrap">
					
				</div>
			</div>
		</div>
		
		
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll"/>
				</th>
				
				<th>
					<a href="javascript:;" class="sort" name="id">ID</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="member">用户</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">提取时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="amount">提取金额</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="type">打款方式</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="bankAccount">账户</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="bankAccountName">账户名</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="bank">开户行</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="status">状态</a>
				</th>
				<th>
					操作
				</th>
			</tr>
			[#list page.content as drawContent]
				[#if drawContent.type = "bank"]
					<tr>
						<td>
							<input type="checkbox" name="ids" value="${drawContent.id}" [#if drawContent.status = "ok"]disabled=true[/#if]/>
						</td>
						<td>
							${drawContent.id}
						</td>
						<td>
							${drawContent.member.username}
						</td>
						<td>
							${drawContent.createDate}
						</td>
						<td>
							${drawContent.amount}
						</td>
						<td>
							银行汇款
						</td>
						<td>
							${drawContent.bankAccount}
						</td>
						<td>
							${drawContent.bankAccountName}
						</td>
						<td>
							${drawContent.bank}
						</td>
						[#if drawContent.status = "ok"]
							<td>
								已汇款
							</td>
							<td>
								——
							</td>
						[#else]
							<td>
								未汇款
							</td>
							<td>
								<a href="#" onclick="updateStatus('${drawContent.id}')">跟新</a>
							</td>
						[/#if]
					</tr>
				[#else]
					<tr>
						<td>
							<input type="checkbox" name="ids" value="${drawContent.id}" [#if drawContent.status = "ok"]disabled=true[/#if] />
						</td>
						<td>
							${drawContent.id}
						</td>
						<td>
							${drawContent.member.username}
						</td>
						<td>
							${drawContent.createDate}
						</td>
						<td>
							${drawContent.amount}
						</td>
						<td>
							支付宝
						</td>
						<td>
							${drawContent.bankAccount}
						</td>
						<td>
							——
						</td>
						<td>
							——
						</td>
						[#if drawContent.status = "ok"]
							<td>
								已汇款
							</td>
							<td>
								——
							</td>
						[#else]
							<td>
								未汇款
							</td>
							<td>
								<a href="#" onclick="updateStatus('${drawContent.id}')">跟新</a>
							</td>
						[/#if]
					</tr>
				[/#if]
			[/#list]
			
		</table>
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>