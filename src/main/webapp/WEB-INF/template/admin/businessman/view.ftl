[#--
	hdb
	显示某个商家的信息
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
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.member.view")}
	</div>
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
				供应商名称:
			</th>
			<td>
				${businessman.username}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.email")}:
			</th>
			<td>
				${businessman.email}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.memberRank")}:
			</th>
			<td>
				
			</td>
		</tr>
		<tr>
			<th>
				${message("admin.member.status")}:
			</th>
			<td>
				[#if businessman.isEnabled]
					<span class="red">${message("admin.member.disabled")}</span>
				[#elseif businessman.isLocked]
					<span class="red"> ${message("admin.member.locked")} </span>
				[#else]
					<span class="green">${message("admin.member.normal")}</span>
				[/#if]
			</td>
		</tr>
		[#if businessman.isLocked]
			<tr>
				<th>
					${message("Member.lockedDate")}:
				</th>
				<td>
					${businessman.lockedDate?string("yyyy-MM-dd HH:mm:ss")}
				</td>
			</tr>
		[/#if]
		
		
		<tr>
			<th>
				${message("admin.common.createDate")}:
			</th>
			<td>
				${businessman.createDate?string("yyyy-MM-dd HH:mm:ss")}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.loginDate")}:
			</th>
			<td>
				${(businessman.loginDate?string("yyyy-MM-dd HH:mm:ss"))!"-"}
			</td>
		</tr>
		
		<tr>
			<th>
				${message("Member.loginIp")}:
			</th>
			<td>
				${(businessman.loginIp)!"-"}
			</td>
		</tr>
		<tr>
			<th>
				${message("admin.member.reviewCount")}:
			</th>
			<td>
				
			</td>
		</tr>
	</table>
	[#if memberAttributes?has_content]
		<table class="input tabContent">
			[#list memberAttributes as memberAttribute]
				<tr>
					<th>
						${memberAttribute.name}:
					</th>
					<td>
						[#if memberAttribute.type == "name"]
							${businessman.name}
						[#elseif memberAttribute.type == "gender"]
							[#if businessman.gender!=""]
							${message("Member.Gender." + businessman.gender)}
							[/#if]
						[#elseif memberAttribute.type == "birth"]
							${businessman.birth}
						[#elseif memberAttribute.type == "area"]
							[#if businessman.area??]
								${businessman.area}
							[#else]
								${businessman.areaName}
							[/#if]
						[#elseif memberAttribute.type == "address"]
							${businessman.address}
						[#elseif memberAttribute.type == "zipCode"]
							${businessman.zipCode}
						[#elseif memberAttribute.type == "phone"]
							${businessman.phone}
						[#elseif memberAttribute.type == "mobile"]
							${businessman.mobile}
						[#elseif memberAttribute.type == "text"]
							${businessman.getAttributeValue(memberAttribute)}
						[#elseif memberAttribute.type == "select"]
							${businessman.getAttributeValue(memberAttribute)}
						[#elseif memberAttribute.type == "checkbox"]
							[#list member.getAttributeValue(memberAttribute) as option]
								${option}
							[/#list]
						[/#if]
					</td>
				</tr>
			[/#list]
		</table>
	[/#if]
	<table class="input">
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input type="button" id="backButton" class="button" value="${message("admin.common.back")}" />
			</td>
		</tr>
	</table>
</body>
</html>