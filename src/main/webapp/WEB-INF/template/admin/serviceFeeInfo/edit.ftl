<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.seo.edit")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.seo.edit")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" id="id" name="id" value="${feesInfo.id}">
		<table class="input">
			<tr>
				<th>
					供应商:
				</th>
				<td>
					${feesInfo.businessman.username}
				</td>
			</tr>
			<tr>
				<th>
					银行名称：
				</th>
				<td>
					${feesInfo.bankName}
				</td>
			</tr>
			<tr>
				<th>
					银行卡号：
				</th>
				<td>
					${feesInfo.bankNo}
				</td>
			</tr>
			<tr>
				<th>
					转帐日期：
				</th>
				<td>
					${feesInfo.zhifuDate?string("yyyy-MM-dd")}
				</td>
			</tr>
			<tr>
				<th>
					保证金金额：
				</th>
				<td>
					${feesInfo.securitydDeposit}
				</td>
			</tr>
			<tr>
				<th>
					服务费金额：
				</th>
				<td>
					${feesInfo.serviceFees}
				</td>
			</tr>
			<tr>
				<th>
					是否通过审核：
				</th>
				<td>
					<input type="radio" name="ispass"  value="true"/>通过 
					<input type="radio"   name="ispass" value="false"/>未通过
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" id="backButton" class="button" value="${message("admin.common.back")}" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>