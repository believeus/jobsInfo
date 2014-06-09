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
									[#if e3dReferrer.currentStatus=="untried"]未审核[/#if]
									[#if e3dReferrer.currentStatus=="miss"]审核不通过[/#if]
									[#if e3dReferrer.currentStatus=="success"]审核通过[/#if]
							</td>
						</tr>
						[#if e3dReferrer.currentStatus=="miss"]
						<tr id="editorTr" >
							<th>
								审核并不通过原因
							</th>
							<td>
								${e3dReferrer.missReason}
							</td>
						</tr>
						[/#if]
					
		</table>
	</form>
</body>
</html>