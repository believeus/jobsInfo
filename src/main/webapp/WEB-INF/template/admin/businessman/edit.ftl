[#-- hdb
	 对商家进行编辑的页面	
--]
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

	var $inputForm = $("#inputForm");
	var $areaId = $("#areaId");
	
	[@flash_message /]
	
	// 地区选择
	$areaId.lSelect({
		url: "${base}/admin/common/area.jhtml"
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			password: {
				pattern: /^[^\s&\"<>]+$/,
				minlength: ${setting.passwordMinLength},
				maxlength: ${setting.passwordMaxLength}
			},
			rePassword: {
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true
				[#if !setting.isDuplicateEmail]
					,remote: {
						url: "check_email.jhtml?previousEmail=${businessman.email?url}",
						cache: false
					}
				[/#if]
			},
			
			}
			
		},
		messages: {
			password: {
				pattern: "${message("admin.validate.illegal")}"
			}
			[#if !setting.isDuplicateEmail]
				,email: {
					remote: "${message("admin.validate.exist")}"
				}
			[/#if]
		}
	});
	
	$("")
	

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.member.edit")}
	</div>
	<form id="inputForm" action="update.jhtml?id=${businessman.id}" method="post">
		<input type="hidden" name="id" value="${businessman.id}" />
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("admin.member.base")}" />
			</li>
			[#if memberAttributes?has_content]
				<li>
					<input type="button" value="${message("admin.member.profile")}" />
				</li>
			[/#if]
			<li>
				<input type="button" value="${message("admin.member.point")}" />
			</li>
			<li>
				<input type="button" value="${message("admin.member.deposit")}" />
			</li>
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
					<span class="requiredField">*</span>${message("Member.email")}:
				</th>
				<td>
					${businessman.email}
				</td>
			</tr>
			
			<tr>
				<th>
					${message("admin.common.setting")}:
				</th>
				<td>
						[#if businessman.isEnabled]
							${message("Member.isEnabled")}:
							<input type="radio" name="isEnabled" checked="checked" value="true"/>${message("admin.member.disabled")} 
							<input type="radio"   name="isEnabled" value="false"/>${message("admin.member.normal")}(针对在该网站上作出不良行为的商家)</br>
						[#else]
							${message("Member.isEnabled")}:
							<input type="radio"   name="isEnabled"  value="true"/>${message("admin.member.disabled")}
							<input type="radio" name="isEnabled"  checked="checked" value="false"/>${message("admin.member.normal")}(针对在该网站上作出不良行为的商家)</br>
						[/#if]
					
						[#if businessman.isLocked]
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
				<th>VIP状态</th>
				<td>
					[#if businessman.isVIPBus]
						<input type="radio" name="isVIPBus" checked="checked" value="true"/>开启
						<input type="radio"   name="isVIPBus" value="false"/>关闭</br>
					[#else]
						<input type="radio" name="isVIPBus"  value="true"/>开启
						<input type="radio"   name="isVIPBus" checked="checked" value="false"/>关闭</br>
					[/#if]
				</td>
			</tr>
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
					${message("Member.registerIp")}:
				</th>
				<td>
					${businessman.registerIp}
				</td>
			</tr>
			<tr>
				<th>
					${message("Businessman.licence")}:
				</th>
				<td>
				
					[#if businessman.business_licence!=null]
					<img src="/${businessman.business_licence}"/>
					[#else]
					<img src="/resources/admin/images/zhanwu.png"/>
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					${message("Businessman.corporationImg")}:
				</th>
				<td>
					[#if businessman.corporation_img!=null]
					<img src="/${businessman.corporation_img}"/>
					[#else]
					<img src="/resources/admin/images/zhanwu.png"/>
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					${message("Businessman.taxRegistrationImg")}:
				</th>
				<td>
					[#if businessman.tax_registration_img!=null]
					<img src="/${businessman.tax_registration_img}"/>
					[#else]
					<img src="/resources/admin/images/zhanwu.png"/>
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					${message("Businessman.institutionalImg")}:
				</th>
				<td>
					[#if businessman.institutional_img!=null]
					<img src="/${businessman.institutional_img}"/>
					[#else]
					<img src="/resources/admin/images/zhanwu.png"/>
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					${message("Businessman.shopPrincipalImg")}:
				</th>
				<td>
					[#if businessman.shop_principal_img!=null]
					<img src="/${businessman.shop_principal_img}"/>
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
					[#if businessman.currentStatus=="success"]
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
					<textarea id="editor" name="introduction" class="editor" style="width: 100%;"></textarea>
				</td>
			</tr>
		</table>
		[#if memberAttributes?has_content]
			<table class="input tabContent">
				[#list memberAttributes as memberAttribute]
					<tr>
						<th>
							[#if memberAttribute.isRequired]<span class="requiredField">*</span>[/#if]${memberAttribute.name}:
						</th>
						<td>
							[#if memberAttribute.type == "name"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${businessman.name}" maxlength="200" />
							[#elseif memberAttribute.type == "gender"]
								<span class="fieldSet">
									[#list genders as gender]
										<label>
											<input type="radio" name="memberAttribute_${memberAttribute.id}" value="${gender}"[#if gender == businessman.gender] checked="checked"[/#if] />${message("Member.Gender." + gender)}
										</label>
									[/#list]
								</span>
							[#elseif memberAttribute.type == "birth"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text Wdate" value="${businessman.birth}" onfocus="WdatePicker();" />
							[#elseif memberAttribute.type == "area"]
								<span class="fieldSet">
									<input type="hidden" id="areaId" name="memberAttribute_${memberAttribute.id}" value="${(businessman.area.id)!}" treePath="${(member.area.treePath)!}" />
								</span>
							[#elseif memberAttribute.type == "address"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${businessman.address}" maxlength="200" />
							[#elseif memberAttribute.type == "zipCode"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${businessman.zipCode}" maxlength="200" />
							[#elseif memberAttribute.type == "phone"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${businessman.phone}" maxlength="200" />
							[#elseif memberAttribute.type == "mobile"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${businessman.mobile}" maxlength="200" />
							[#elseif memberAttribute.type == "text"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${businessman.getAttributeValue(memberAttribute)}" maxlength="200" />
							[#elseif memberAttribute.type == "select"]
								<select name="memberAttribute_${memberAttribute.id}">
									<option value="">${message("admin.common.choose")}</option>
									[#list memberAttribute.options as option]
										<option value="${option}"[#if option == member.getAttributeValue(memberAttribute)] selected="selected"[/#if]>
											${option}
										</option>
									[/#list]
								</select>
							[#elseif memberAttribute.type == "checkbox"]
								<span class="fieldSet">
									[#list memberAttribute.options as option]
										<label>
											<input type="checkbox" name="memberAttribute_${memberAttribute.id}" value="${option}"[#if (businessman.getAttributeValue(memberAttribute)?seq_contains(option))!] checked="checked"[/#if] />${option}
										</label>
									[/#list]
								</span>
							[/#if]
						</td>
					</tr>
				[/#list]
			</table>
		[/#if]
		<table class="input tabContent">
			<tr>
				<th>
					${message("admin.member.currentPoint")}:
				</th>
				<td>
					
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.member.modifyPoint")}:
				</th>
				<td>
					<input type="text" name="modifyPoint" class="text" maxlength="9" title="${message("admin.member.modifyPointTitle")}" />
				</td>
			</tr>
		</table>
		<table class="input tabContent">
			<tr>
				<th>
					${message("admin.member.currentBalance")}:
				</th>
				<td>
				
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.member.modifyBalance")}:
				</th>
				<td>
					<input type="text" name="modifyBalance" class="text" maxlength="16" title="${message("admin.member.modifyBalanceTitle")}" />
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.member.depositMemo")}:
				</th>
				<td>
					<input type="text" name="depositMemo" class="text" maxlength="200" />
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