[#--
	hdb
	对某个商店的信息展示以及操作
 --]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.member.view")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.member.view")}
	</div>
		<form id="inputForm" action="/admin/shop/shopupdate.jhtml?id=${shop.id}" method="post">
	<ul id="tab" class="tab">
		<li>
			<input type="button" value="${message("admin.member.base")}" />
		</li>
		[#if memberAttributes?has_content]
			<li>
				<input type="button" value="${message("admin.member.profile")}" />
			</li>
		[/#if]
	</ul>
	<table class="input tabContent">
		<tr>
			<th>
				${message("admin.shopname")}:
			</th>
			<td>
				${shop.name}
			</td>
		</tr>
		<tr>
			<th>
				${message("admin.shoptype")}:
			</th>
			<td>
				${shop.type}
			</td>
		</tr>
		<tr>
			<th>
				${message("admin.shopadd")}:
			</th>
			<td>
				${shop.address}
			</td>
		</tr>
		<tr>
		     <th>
				${message("admin.member.status")}:
			</th>
		  <td>
						[#if shop.islocked]
							<input type="radio" name="islocked" checked="checked" value="true"/>${message("admin.member.locked")} 
							<input type="radio"   name="islocked" value="false"/>${message("admin.member.normal")}
							[#else]
							<input type="radio" name="islocked"  value="true"/>${message("admin.member.locked")} 
							<input type="radio"   name="islocked" checked="checked" value="false"/>${message("admin.member.normal")}
							[/#if]
		   </td>
		</tr>
		<tr>
			<th>
				${message("admin.common.createDate")}:
			</th>
			<td>
				${shop.createDate?string("yyyy-MM-dd HH:mm:ss")}
			</td>
		</tr>
		
	</table>
	
	<table class="input">
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