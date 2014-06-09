<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.review.edit")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	[@flash_message /]
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.review.edit")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${e3dReferrer.id}" />
		<input type="hidden" name="reviewContent" value="" />
		<table class="input">
			<tr>
							<th>
								公司名
							</th>
							<td>
								${e3dReferrer.companyName}
							</td>
						</tr>
						<tr>
							<th>
								联系方式
							</th>
							<td>
								${e3dReferrer.mobile}
							</td>
						</tr>
						<tr>
							<th>
								公司负责人姓名
							</th>
							<td>
								${e3dReferrer.companyLegalPerson}
							</td>
						</tr>
						<tr>
							<th>
								联系人QQ
							</th>
							<td>
								${e3dReferrer.qq}
							</td>
						</tr>
						<tr>
							<th> 审核状态: </th>
							<td>
								<input type="radio" onclick="$('#editorTr').hide()" value="success" name="currentStatus">
								通过审核
								<input type="radio" onclick="$('#editorTr').show()" value="miss" name="currentStatus">
								未通过审核
								<br>
							</td>
						</tr>
						<tr id="editorTr" style="display:none">
							<th>
								审核并不通过原因
							</th>
							<td>
								<textarea id="editor" name="introduction" class="editor" style="width:60%;"></textarea>
							</td>
						</tr>
						<tr>
							<th>
								&nbsp;
							</th>
							<td>
								<input type="submit" class="button" value="${message("shop.member.submit")}" />
								<input type="button" class="button" value="${message("shop.member.back")}" onclick="location.href='list.jhtml'" />
							</td>
						</tr>
		</table>
	</form>
</body>
</html>