<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.payment.view")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {
	
	[@flash_message /]
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.payment.view")}
	</div>
	<table class="input">
		<tr>
			<th>
				${message("Payment.sn")}:
			</th>
			<td>
				${payment.sn}
			</td>
			<th>
				${message("admin.common.createDate")}:
			</th>
			<td>
				${payment.createDate?string("yyyy-MM-dd HH:mm:ss")}
			</td>
		</tr>
		<tr>
			<th>
				${message("Payment.status")}:
			</th>
			<td>
				${message("Payment.Status." + payment.status)}
			</td>
			<th>
				${message("Payment.paymentDate")}:
			</th>
			<td>
				${(payment.paymentDate?string("yyyy-MM-dd HH:mm:ss"))!"-"}
			</td>
		</tr>
		<tr>
			<th>
				${message("Payment.type")}:
			</th>
			<td>
				${message("Payment.Type." + payment.type)}
			</td>
			<th>
				${message("Payment.method")}:
			</th>
			<td>
				${message("Payment.Method." + payment.method)}
			</td>
		</tr>
		<tr>
			<th>
				${message("Payment.paymentMethod")}:
			</th>
			<td>
				${payment.paymentMethod}
			</td>
			<th>
				订单受理人:
			</th>
			<td>
				${(payment.operator)!message("admin.payment.member")}
			</td>
		</tr>
		
		
		<tr>
			<th>
				付款银行:
			</th>
			<td>
				${(payment.bank)!"-"}
			</td>
			<th>
				付款帐号:
			</th>
			<td>
				${(payment.account)!"-"}
			</td>
		</tr>
		<tr>
			<th>
				${message("Payment.member")}:
			</th>
			<td>
				${(payment.order.member.username)!"-"}
			</td>
			<th>
				${message("Payment.amount")}:
			</th>
			<td>
				${currency(payment.amount, true)}
				[#if payment.fee > 0]
					(${message("admin.payment.withPoundage")}: ${currency(payment.fee, true)})
				[/#if]
			</td>
		</tr>
		<tr>
			
			<th>
				${message("Payment.order")}:
			</th>
			<td>
				${(payment.order.sn)!"-"}
			</td>
			<th>联系方式</th>
			<td>${(payment.order.member.mobile)!"-"}</td>
		</tr>
		<tr>
			<th>
				${message("Payment.memo")}:
			</th>
			<td>
				${payment.memo}
			</td>
			<th>
				供应商帐号:
			</th>
			<td>
				${payment.order.operator.username}
			</td>
		</tr>
		<tr>
			<th>
				&nbsp;
			</th>
			<td colspan="3">
				<input type="button" id="backButton" class="button" value="${message("admin.common.back")}" />
			</td>
		</tr>
	</table>
</body>
</html>