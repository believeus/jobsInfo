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

<style type="text/css">
	strong{
		color:red;
		margin-right:10px;
	}
	
</style>
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
				${message("Member.username")}:
			</th>
			<td>
				${member.username}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.email")}:
			</th>
			<td>
				${member.email}
			</td>
		</tr>
		<tr>
			<th>
				分销商数量:
			</th>
			<td>
				<span>
					一级分销商数量:<strong>${member.memberDetail.distributorCount_a}个</strong>
					一级分销商数量:<strong>${member.memberDetail.distributorCount_b}个</strong>
					一级分销商数量:<strong>${member.memberDetail.distributorCount_c}个</strong>
				</span>
			</td>
		</tr>
		<tr>
			<th>
				市场状况:
			</th>
			<td>
				<span>
					个人订单量:<strong>${member.memberDetail.orderCount}个</strong>
					市场订单量:<strong>${member.memberDetail.teamOrderCount}个</strong>
					<br>
					个人销售额:<strong>${member.memberDetail.salesAmount}个</strong>
					市场总销售额:<strong>${member.memberDetail.teamSalesAmount}个</strong>
					<br>
					个人商品销售奖金:<strong>${member.memberDetail.salesBonus}个</strong>
					市场总销售奖金:<strong>${member.memberDetail.teamSalesBonus}个</strong>
					<br>
					个人商品推广奖金:<strong>${member.memberDetail.promotionBonus}个</strong>
					市场总推广奖金:<strong>${member.memberDetail.teamPromotionBonus}个</strong>
				</span>
			</td>
		</tr>
		<tr>
			<th>
				${message("admin.member.status")}:
			</th>
			<td>
				[#if member.isEnabled]
					<span class="red">${message("admin.member.disabled")}</span>
				[#elseif member.isLocked]
					<span class="red"> ${message("admin.member.locked")} </span>
				[#else]
					<span class="green">${message("admin.member.normal")}</span>
				[/#if]
			</td>
		</tr>
		[#if member.isLocked]
			<tr>
				<th>
					${message("Member.lockedDate")}:
				</th>
				<td>
					${member.lockedDate?string("yyyy-MM-dd HH:mm:ss")}
				</td>
			</tr>
		[/#if]
		<tr>
			<th>
				${message("Member.amount")}:
			</th>
			<td>
				${currency(member.amount, true)}
			</td>
		</tr>
		<tr>
			<th>
				${message("admin.common.createDate")}:
			</th>
			<td>
				${member.createDate?string("yyyy-MM-dd HH:mm:ss")}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.loginDate")}:
			</th>
			<td>
				${(member.loginDate?string("yyyy-MM-dd HH:mm:ss"))!"-"}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.registerIp")}:
			</th>
			<td>
				${member.registerIp}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.loginIp")}:
			</th>
			<td>
				${(member.loginIp)!"-"}
			</td>
		</tr>
		<tr>
			<th>
				${message("admin.member.reviewCount")}:
			</th>
			<td>
				${member.reviews?size}
			</td>
		</tr>
		<tr>
			<th>
				${message("admin.member.favoriteProductCount")}:
			</th>
			<td>
				${member.favoriteProducts?size}
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
							${member.name}
						[#elseif memberAttribute.type == "gender"]
							${message("Member.Gender" + member	.gender)}
						[#elseif memberAttribute.type == "birth"]
							${member.birth}
						[#elseif memberAttribute.type == "area"]
							[#if member.area??]
								${member.area}
							[#else]
								${member.areaName}
							[/#if]
						[#elseif memberAttribute.type == "address"]
							${member.address}
						[#elseif memberAttribute.type == "zipCode"]
							${member.zipCode}
						[#elseif memberAttribute.type == "phone"]
							${member.phone}
						[#elseif memberAttribute.type == "mobile"]
							${member.mobile}
						[#elseif memberAttribute.type == "text"]
							${member.getAttributeValue(memberAttribute)}
						[#elseif memberAttribute.type == "select"]
							${member.getAttributeValue(memberAttribute)}
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