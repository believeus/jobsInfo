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
		<input type="hidden" name="id" value="${review.id}" />
		<table class="input">
			<tr>
				<th>
					${message("Review.product")}:
				</th>
				<td>
					<a href="${base}${review.product.path}" target="_blank">${review.product.name}</a>
				</td>
			</tr>
			<tr>
				<th>
					商品分类:
				</th>
				<td>
					${review.product.productCategory.name}
				</td>
			</tr>
			<tr>
				<th>
					${message("Review.member")}:
				</th>
				<td>
					[#if review.member??]
						<a href="../member/view.jhtml?id=${review.member.id}">${review.member.username}</a>
					[#else]
						${message("admin.review.anonymous")}
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					${message("Review.ip")}:
				</th>
				<td>
					${review.ip}
				</td>
			</tr>
			<tr>
				<th>
					所在城市:
				</th>
				<td>
					[#if review.city?exists]
						${review.city}
					[#else]
						暂无显示
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					商品${message("Review.score")}:
				</th>
				<td>
					${review.score}
				</td>
			</tr>
			<tr>
				<th>
					服务态度:
				</th>
				<td>
					${review.serviceScore}
				</td>
			</tr>
			<tr>
				<th>
					描述相符:
				</th>
				<td>
					${review.desScore}
				</td>
			</tr>
			<tr>
				<th>
					${message("Review.content")}:
				</th>
				<td>
					${review.content}
				</td>
			</tr>
			<tr>
				<th>
					评论主题:
				</th>
				<td>
					[#if size !=0]
						[#if review.reviewContents?exists]
							[#list review.reviewContents as reviewContent]
								<span name="reviewContent">[${reviewContent.content}]</span>
							[/#list]
						[/#if]
					[#else]
						<span name="reviewContent">暂无</span>
					[/#if]
				</td>
			</tr>
			<!-- 
				<tr>
					<th>
						${message("Review.isShow")}:
					</th>
					<td>
						<input type="checkbox" name="isShow" value="true"[#if review.isShow] checked="checked"[/#if] />
					</td>
				</tr>
			 -->
			
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