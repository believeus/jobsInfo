<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.member.edit")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

  
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 卖场信息
	</div>
    <div class="path"> 
	</div>
	<form id="inputForm" action="update.jhtml?id=${experience.id}" method="get">
		<input type="hidden" name="id" value="${experience.id}" />
		 
		<table class="input tabContent">
			<tr>
				<th>
					${message("Member.username")}:
				</th>
				<td>
					${experience.username}
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>卖场名称:
				</th>
				<td>
					${experience.expericeneName}
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>卖场地点:
				</th>
				<td>
					${experience.address}
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Member.email")}:
				</th>
				<td>
					${experience.email}
				</td>
			</tr>
			
			<tr>
				<th>
					${message("admin.common.setting")}:
				</th>
				<td>
 					    [#if experience.isEnabled]
							${message("Member.isEnabled")}:
							<input type="radio" name="isEnabled" checked="checked" value="true"/>${message("admin.member.disabled")} 
							<input type="radio"   name="isEnabled" value="false"/>${message("admin.member.normal")}(针对在该网站上作出不良操作的管理员)</br>
						[#else]
							${message("Member.isEnabled")}:
							<input type="radio"   name="isEnabled"  value="true"/>${message("admin.member.disabled")}
							<input type="radio" name="isEnabled"  checked="checked" value="false"/>${message("admin.member.normal")}(针对在该网站上作出不良操作的管理员)</br>
						[/#if]
					
						[#if experience.isLocked]
							${message("Member.isLocked")}:
							<input type="radio" name="isLocked" checked="checked" value="true"/>${message("admin.member.locked")} 
							<input type="radio"   name="isLocked" value="false"/>${message("admin.member.normal")}(连续登录失败次数5次以上)</br>
						[#else]
							${message("Member.isLocked")}:
							<input type="radio" name="isLocked"  value="true"/>${message("admin.member.locked")} 
							<input type="radio"   name="isLocked" checked="checked" value="false"/>${message("admin.member.normal")}(连续登录失败次数5次以上)</br>
						[/#if] 
				</td>
			</tr>
 
			<tr>
				<th>
					${message("Member.registerIp")}:
				</th>
				<td>
					${experience.registerIp}
				</td>
			</tr>
			<tr>
				<th>
					营业执照 :
				</th>
				<td>
					[#if experience.business_licence!=null]
					<img height="300px" width="400px" src="${experience.business_licence}"/>
					[#else]
					<img src="/resources/admin/images/zhanwu.png"/>
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
				    企业法人身份证 :
				</th>
				<td>
					[#if experience.corporation_img!=null]
					<img height="300px" width="400px" src="${experience.corporation_img}"/>
					[#else]
					<img src="/resources/admin/images/zhanwu.png"/>
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					税务登记证 :
				</th>
				<td>
					[#if experience.tax_registration_img!=null]
					<img height="300px" width="400px" src="${experience.tax_registration_img}"/>
					[#else]
					<img src="/resources/admin/images/zhanwu.png"/>
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					组织机构代码 :
				</th>
				<td>
					[#if experience.institutional_img!=null]
					<img height="300px" width="400px" src="${experience.institutional_img}"/>
					[#else]
					<img src="/resources/admin/images/zhanwu.png"/>
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					负责人身份证 :
				</th>
				<td>
					[#if experience.shop_principal_img!=null]
					<img height="300px" width="400px" src="${experience.shop_principal_img}"/>
					[#else]
					<img src="/resources/admin/images/zhanwu.png"/>
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					${message("Businessman.isPassAuditing")}:
				</th>
				<td>
					[#if experience.currentStatus=="success"]
							<input type="radio" name="currentStatus" checked="checked" value="success" onclick="$('#editorTr').hide()"/>${message("Businessman.passAuditing")} 
							<input type="radio"   name="currentStatus" value="miss" onclick="$('#editorTr').show()"/>${message("Businessman.notPassAuditing")}</br>
					[#else]
							<input type="radio"   name="currentStatus"  value="success" onclick="$('#editorTr').hide()"/>${message("Businessman.passAuditing")}
							<input type="radio" name="currentStatus"   value="miss" onclick="$('#editorTr').show()"/>${message("Businessman.notPassAuditing")}</br>
				    [/#if]
				</td>
			</tr>
		
		
			<tr id="editorTr" style="display:none">
				<th>
					${message("Businessman.notPassCause")}:
				</th>
				<td>
					<textarea id="editor" name="introduction" class="editor" style="width: 70%;"></textarea>
				</td>
			</tr>
		</table>
		 
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