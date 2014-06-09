<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.brand.list")} 管理</title>
<meta name="author" content="ph" />
<meta name="copyright" content="" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script> 

<script type="text/javascript">
$().ready(function() {
 <!--	
 var Str="";
    [@product_category_root_list]
		[#list productCategories as productCategoryRoot]
		   Str=Str+"<select id='categoryType${productCategoryRoot.id}'  name='buildType'>";
			   [@brand_merge_category productCategoryId=productCategoryRoot.id] 
		 
			      	[#list brandmergecategory as itemKey]  
			      		 [#list itemKey.keySet() as item] 
							Str=Str+"<option value=${item}>${itemKey[item]}</option>";
						 [/#list] 
			      	[/#list] 
			   [/@brand_merge_category] 
		   Str=Str+"</select>;";
	 	[/#list]
	[/@product_category_root_list]
	
	[@flash_message /] 
    $("#categoryType").change(function(){ 
           var categroytypes=Str.split(";");
           var thisValue=$(this)[0].value; 
           $("#mergecategory")[0].innerHTML="";
           $("#mergecategory").append(categroytypes[thisValue-1]);
    });
-->
}); 
</script>
</head>
<body> 
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.brandpage.show")} 
	</div>
	 
		 <form id="inputForm" action="merge.jhtml" method="post">  
		<div class="path">
	     ${message("admin.brandpage.mergeCategory")}
	    </div>
		<table class="input">
		
			<tr>
				<th>
				<font size=2>
					${message("admin.productCategory.root")}:
				</font>
				</th>
				<td > 
					 [@product_category_root_list]
						[#list productCategories as productCategoryRoot]
						  <a href="/admin/brandpage/show.jhtml?category=a-${productCategoryRoot.id}-b-0-c-0">
							<font size=2>${productCategoryRoot.name}</font>
						  </a>
						   &nbsp; &nbsp;
						[/#list]
					 [/@product_category_root_list] 
				</td> 
				<td></td>
			</tr>
			
			<tr>
				<th>
				<font size=2>
					${message("admin.productCategory.children")}:
				</font>
				</th>
				<td >
				
					[@brand_merge_category productCategoryId=a] 
		 
				      	[#list brandmergecategory as itemKey]  
				      		 [#list itemKey.keySet() as item]  
								<a href="/admin/brandpage/show.jhtml?category=a-${a}-b-${item}-c-0">
									<font size=2>	${itemKey[item]} 
									</font>
								</a>
								 &nbsp; &nbsp;
							 [/#list] 
							 
				      	[/#list] 
			        [/@brand_merge_category] 
				</td> 
				<td></td>
			</tr>
 
		</table>
	</form>
    
	<form id="formlist" action="list.jhtml" method="post">

		<div class="path">
	     ${message("admin.brandpage.mergedCategory")}
	    </div>
		<table id="listTable" class="list">
		<tr>
			<th class="check">
				<input type="checkbox" id="selectAll" />
			</th>
			<th>
				<span>品牌ID</span>
			</th>
			<th>
				<span>品牌名称</span>
			</th>
			<th>
				<span>宣传级别</span>
			</th>
			<th>
				<span>${message("admin.common.handle")}</span>
			</th> 
		</tr>  
		[#if b!="0"]
			[@brandTd_list productCategoryId=b isBigImg=2 ] 
				 [#list brands as brand] 
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${brand.id}" />
					</td>
					<td>
						${brand.id}
					</td> 
					<td>
						${brand.name}
					</td>
					<td>
						[#if brand.special=="0"]
						   <span style="color:#ff0000">二级</span>
						[#elseif brand.special=="1"]
						   <span style="color:#00ff00">一级</span>
						[#else]
						   <span style="color:#0000ff">无</span>
						[/#if]
					</td>
					<td>
						<a href="edit.jhtml?brandid=${brand.id}">[${message("admin.common.edit")}]</a> 
					</td>
				</tr>
			   [/#list]
		   [/@brandTd_list]
		 [#else]
		    [@product_category_children_list productCategoryId = "${a}"]
				[#list productCategories as productCategory]
				   [@brandTd_list productCategoryId=productCategory.id isBigImg=2 ] 
						 [#list brands as brand] 
						<tr>
							<td>
								<input type="checkbox" name="ids" value="${brand.id}" />
							</td>
							<td>
								${brand.id}
							</td> 
							<td>
								${brand.name}
							</td>
							<td> 
								[#if brand.special=="0"]
								   <span style="color:#ff0000">二级</span>
								[#elseif brand.special=="1"]
								   <span style="color:#00ff00">一级</span>
								[#else]
								   <span style="color:#0000ff">无</span>
								[/#if]
							</td>
							<td>
								<a href="edit.jhtml?brandid=${brand.id}">[${message("admin.common.edit")}]</a> 
							</td>
						</tr>
					   [/#list]
				   [/@brandTd_list]
				[/#list]
			[/@product_category_children_list]
		 [/#if]
 
	   </table> 
	
 
 
	</form>
	
	
</body>
</html>