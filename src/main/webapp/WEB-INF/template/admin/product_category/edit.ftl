<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.productCategory.edit")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/datePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/jquery-X-Menu/css/xmenu.css" rel="stylesheet" type="text/css" />  
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/shop/datePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${base}/resources/shop/jquery-X-Menu/js/jquery-xmenu.js"></script> 
<script type="text/javascript" src="${base}/resources/shop/jquery-X-Menu/js/jquery-powerFloat-min.js"></script>

<style type="text/css">
.brands label {
	width: 150px;
	display: block;
	float: left;
	padding-right: 6px;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	[@flash_message /]

	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			order: "digits"
		}
	});
	//品牌
	$("#selectbrans").xMenu({	
		width :600,	
		eventType: "click", //事件类型 支持focus click hover
		dropmenu:"#xmenuBrand",//弹出层
		hiddenID : "selectbrandshidden",//隐藏域ID	
		value : "${brandIds}"
	});
	//材质
	$("#selectmaterials").xMenu({	
		width :600,	
		eventType: "click", //事件类型 支持focus click hover
		dropmenu:"#xmenuMaterials",//弹出层
		hiddenID : "selectmaterialshidden",//隐藏域ID	
		value : "${materialIds}"
	});
	//风格
	$("#selectstyles").xMenu({	
		width :600,	
		eventType: "click", //事件类型 支持focus click hover
		dropmenu:"#xmenuStyles",//弹出层
		hiddenID : "selectstyleshidden",//隐藏域ID	
		value : "${styleIds}"
	});
	//大小
	$("#selectsizes").xMenu({	
		width :600,	
		eventType: "click", //事件类型 支持focus click hover
		dropmenu:"#xmenuSizes",//弹出层
		hiddenID : "selectsizeshidden",//隐藏域ID	
		value : "${sizeIds}"
	});
	//价格区
	$("#selectprices").xMenu({	
		width :600,	
		eventType: "click", //事件类型 支持focus click hover
		dropmenu:"#xmenuPrices",//弹出层
		hiddenID : "selectpriceshidden",//隐藏域ID	
		value : "${priceIds}"
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.productCategory.edit")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${productCategory.id}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("ProductCategory.name")}:
				</th>
				<td>
					<input type="text" id="name" name="name" class="text" value="${productCategory.name}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("ProductCategory.parent")}:
				</th>
				<td>
					<select name="parentId">
						<option value="0-0">${message("admin.productCategory.root")}</option>
						[#list productCategoryTree as category]
							[#if category.grade !=2]
								<option value="${category.categoryID}-${category.id}" [#if category == productCategory.parent] selected="selected"[/#if]>
									[#if category.grade != 0]
										[#list 1..category.grade as i]
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										[/#list]
									[/#if]
									${category.name}
								</option>
							[/#if]
						[/#list]
						
					</select>
				</td>
			</tr>
			<tr class="brands">
				<th>
					${message("ProductCategory.brands")}:
				</th>
				<td>
				<input type="hidden" value="" id="selectbrandshidden" name="brandIds" value="${brandIds}"/>
				<div class="topnav">
					<a id="selectbrans" href="javascript:void(0);" class="as">
						<span  title="${brandName}">
							[#if brandName?string?length > 0]
									[#if brandName?string?length > 10]
											${brandName?string?substring(0,10)}...
									[#else]
											${brandName}
									[/#if]
							[#else]
									选择绑定品牌
							[/#if]
						</span>		
					</a>	
				</div>
			</td>
			</tr>
			<tr class="materials">
				<th>
					筛选材质:
				</th>
				<td>
				<input type="hidden" value="" id="selectmaterialshidden" name="materialIds" value="${materialIds}"/>
				<div class="topnav">
					<a id="selectmaterials" href="javascript:void(0);" class="as">
						<span  title="${materialName}">
							[#if materialName?string?length > 0]
									[#if materialName?string?length > 10]
											${materialName?string?substring(0,10)}...
									[#else]
											${materialName}
									[/#if]
							[#else]
									选择绑定材质
							[/#if]
						</span>		
					</a>	
				</div>
			</td>
			</tr>
			<tr class="styles">
				<th>
					筛选风格:
				</th>
				<td>
				<input type="hidden" value="" id="selectstyleshidden" name="styleIds" value="${styleIds}"/>
				<div class="topnav">
					<a id="selectstyles" href="javascript:void(0);" class="as">
						<span  title="${styleName}">
							[#if styleName?string?length > 0]
									[#if styleName?string?length > 10]
											${styleName?string?substring(0,10)}...
									[#else]
											${styleName}
									[/#if]
							[#else]
									选择绑定风格
							[/#if]
						</span>		
					</a>	
				</div>
			</td>
			</tr>
			<tr class="sizes">
				<th>
					筛选大小区:
				</th>
				<td>
				<input type="hidden" value="" id="selectsizeshidden" name="sizeIds" value="${sizeIds}"/>
				<div class="topnav">
					<a id="selectsizes" href="javascript:void(0);" class="as">
						<span  title="${sizeName}">
							[#if sizeName?string?length > 0]
									[#if sizeName?string?length > 10]
											${sizeName?string?substring(0,10)}...
									[#else]
											${sizeName}
									[/#if]
							[#else]
									选择绑定大小区
							[/#if]
						</span>		
					</a>	
				</div>
			</td>
			</tr>
			<tr class="prices">
				<th>
					筛选价格区:
				</th>
				<td>
				<input type="hidden" value="" id="selectpriceshidden" name="priceIds" value="${priceIds}"/>
				<div class="topnav">
					<a id="selectprices" href="javascript:void(0);" class="as">
						<span  title="${priceName}">
							[#if priceName?string?length > 0]
									[#if priceName?string?length > 10]
											${priceName?string?substring(0,10)}...
									[#else]
											${priceName}
									[/#if]
							[#else]
									选择绑定价格区
							[/#if]
						</span>		
					</a>	
				</div>
			</td>
			</tr>
			<tr>
				<th>
					${message("ProductCategory.seoTitle")}:
				</th>
				<td>
					<input type="text" name="seoTitle" class="text" value="${productCategory.seoTitle}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("ProductCategory.seoKeywords")}:
				</th>
				<td>
					<input type="text" name="seoKeywords" class="text" value="${productCategory.seoKeywords}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("ProductCategory.seoDescription")}:
				</th>
				<td>
					<input type="text" name="seoDescription" class="text" value="${productCategory.seoDescription}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.order")}:
				</th>
				<td>
					<input type="text" name="order" class="text" value="${productCategory.order}" maxlength="9" />
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
	<div id="xmenuBrand" class="xmenu" style="display: none;">
		<div class="select-info">	
			<label class="top-label">已选项：</label>
			<ul>		
				[#list brandsSet as brand]
					<li class="current" rel="${brand.id}">${brand.name}</li>
				[/#list]
			</ul>
			<a  name="menu-confirm" href="javascript:void(0);" class="a-btn">
				<span class="a-btn-text">确定</span>
			</a> 
		</div>			
		<dl>
		<dt class="open">所有品牌</dt>
		<dd>
			<ul>
				[#list brands as brand]
				<li rel="${brand.id}">
						${brand.name}
				</li>
				[/#list]
			</ul>    
		</dd>
		</dl>			
	</div>
	
	<div id="xmenuMaterials" class="xmenu" style="display: none;">
		<div class="select-info">	
			<label class="top-label">已选项：</label>
			<ul>		
				[#list materialsSet as material]
					<li class="current" rel="${material.id}">${material.name}</li>
				[/#list]
			</ul>
			<a  name="menu-confirm" href="javascript:void(0);" class="a-btn">
				<span class="a-btn-text">确定</span>
			</a> 
		</div>			
		<dl>
		<dt class="open">所有材质</dt>
		<dd>
			<ul>
				[#list materials as material]
				<li rel="${material.id}">
						${material.name}
				</li>
				[/#list]
			</ul>    
		</dd>
		</dl>			
	</div>
	<div id="xmenuSizes" class="xmenu" style="display: none;">
		<div class="select-info">	
			<label class="top-label">已选项：</label>
			<ul>		
				[#list sizesSet as size]
					<li class="current" rel="${size.id}">${size.name}</li>
				[/#list]
			</ul>
			<a  name="menu-confirm" href="javascript:void(0);" class="a-btn">
				<span class="a-btn-text">确定</span>
			</a> 
		</div>			
		<dl>
		<dt class="open">所有大小</dt>
		<dd>
			<ul>
				[#list sizes as size]
				<li rel="${size.id}">
						${size.name}
				</li>
				[/#list]
			</ul>    
		</dd>
		</dl>			
	</div>
	<div id="xmenuStyles" class="xmenu" style="display: none;">
		<div class="select-info">	
			<label class="top-label">已选项：</label>
			<ul>		
				[#list stylesSet as style]
					<li class="current" rel="${style.id}">${style.name}</li>
				[/#list]
			</ul>
			<a  name="menu-confirm" href="javascript:void(0);" class="a-btn">
				<span class="a-btn-text">确定</span>
			</a> 
		</div>			
		<dl>
		<dt class="open">所有风格</dt>
		<dd>
			<ul>
				[#list styles as style]
				<li rel="${style.id}">
						${style.name}
				</li>
				[/#list]
			</ul>    
		</dd>
		</dl>			
	</div>
	<div id="xmenuPrices" class="xmenu" style="display: none;">
		<div class="select-info">	
			<label class="top-label">已选项：</label>
			<ul>		
				[#list pricesSet as price]
					<li class="current" rel="${price.id}">${price.name}</li>
				[/#list]
			</ul>
			<a  name="menu-confirm" href="javascript:void(0);" class="a-btn">
				<span class="a-btn-text">确定</span>
			</a> 
		</div>			
		<dl>
		<dt class="open">所有价格</dt>
		<dd>
			<ul>
				[#list prices as price]
				<li rel="${price.id}">
						${price.name}
				</li>
				[/#list]
			</ul>    
		</dd>
		</dl>			
	</div>
</body>
</html>