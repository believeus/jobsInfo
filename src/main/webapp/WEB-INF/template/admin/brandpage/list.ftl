<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.brand.list")} 管理</title>
<meta name="author" content="ph" />
<meta name="copyright" content="" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/jquery-X-Menu/css/xmenu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript" src="${base}/resources/shop/jquery-X-Menu/js/jquery-xmenu.js"></script> 
<script type="text/javascript" src="${base}/resources/shop/jquery-X-Menu/js/jquery-powerFloat-min.js"></script>

<script type="text/javascript">
$().ready(function() {
  
	[@flash_message /]
	  
    $("#selectpos").xMenu({	
		width :600,	
		eventType: "click", //事件类型 支持focus click hover
		dropmenu:"#m1",//弹出层
		hiddenID : "selectposhidden"//隐藏域ID	
	});
	$("#categoryType").change(function(){ 
	  	var categoryid=this.value;
	 
	      $("#selectpos").xMenu({	
			width :600,	
			eventType: "click", //事件类型 支持focus click hover
			dropmenu:"#m"+categoryid,//弹出层
			hiddenID : "selectposhidden"//隐藏域ID	
		  });
	});
	$("#merge").click(function(){   
	     var mergeCategory=$("#selectposhidden")[0].value;
	     var categoryGroup=$("#categoryType")[0].value;
	     if(mergeCategory!="")
	     window.location.href="merge.jhtml?mergeCategory="+mergeCategory+"&categoryGroup="+categoryGroup;
	     else
	     {
	       alert("请选择需要合并的分类");
	     }
    });

}); 
</script>
</head>
<body> 
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 品牌首页管理 
	</div>
	 
		<input type="hidden" id="orderType" name="mergeCategory" value="" />
		<input type="hidden" id="categoryGroup" name="categoryGroup" value="" />
		<div class="path">
	     ${message("admin.brandpage.mergeCategory")}操作
	    </div>
		<table class="input">
			<tr>
				<th>
					${message("admin.productCategory.root")}:
				</th>
				<td >
					<select id="categoryType" name="buildType">
					 [@product_category_root_list]
						[#list productCategories as productCategoryRoot]
						 
							<option value="${productCategoryRoot.id}">${productCategoryRoot.name}</option>
						[/#list]
					 [/@product_category_root_list]
					</select>
				</td>
				<td></td>
			</tr>
			
			<tr>
				<th>
					${message("admin.productCategory.children")}:
				</th>
				<td style="width:200px>
					<input type="hidden" value="" id="selectposhidden" name="productCategoryList" />
					<div class="topnav">
						<a id="selectpos" href="javascript:void(0);" class="as">
							<span>选择商品类别</span>			
						</a>				
					</div>
				</td>
				<td></td>
			</tr>
			
			<tr>
				<th>
					&nbsp;
				</th>
				<td style="width:200px"> 
					<input id="merge" type="submit" class="button" value="${message("admin.productCategory.merge")}" /> 
				   
				</td>
				<td> <p>请确认合并后能留下4个分类<p></td>
				 
			</tr>
		</table> 
    
	<form id="formlist" action="list.jhtml" method="post">

		<div class="path">
	     ${message("admin.brandpage.mergedCategory")}列表
	    </div>
		<table id="listTable" class="list">
		<tr>
			<th>
				<span>${message("ProductCategory.name")}</span>
			</th>
			<th>
				<span>${message("admin.common.id")}</span>
			</th>
			<th>
				<span>${message("admin.common.handle")}</span>
			</th> 
		</tr>
		
		
		[@product_category_root_list]
			[#list productCategories as productCategoryRoot]
				  <tr style="background-color: #F5FAFF;">
					<td>
						<span style="margin-left: 20px;">
							${productCategoryRoot.name}
						</span>
					</td>
					<td>
						${productCategoryRoot.id}
					</td>
					<td>
					  </td>
				</tr>
					[@brand_merge_category productCategoryId=productCategoryRoot.id]  
				      	[#list brandmergecategory as itemKey] 
				      	     [#assign i=0]
				      		 [#list itemKey.keySet() as item]
				      		      	<tr class="optionline" style="background-color: #fff;">
										<td>
											<span style="margin-left: 50px;">
												${itemKey[item]}
											</span>
										</td>
										<td>
											${item}
										</td>
										<td>
										   <a id=${item} href="split.jhtml?categoryid=${item}">[${message("admin.common.split")}]</a>
										</td>
									</tr>
				
							 [/#list] 
				      	[/#list] 
				   [/@brand_merge_category]
			[/#list]
		[/@product_category_root_list]
					 
 
	</table> 
	

   	 [@product_category_root_list]
	 [#assign x=0]
	 [#list productCategories  as productCategoryRoot]
	 [#assign x=x+1]
		<div id="m${x}" class="xmenu" style="display: none;">
			<div class="select-info">	
				<label class="top-label">已选类型：</label>
				<ul>					
				</ul>
				<a  name="menu-confirm" href="javascript:void(0);" class="a-btn">
					<span class="a-btn-text">确定</span>
				</a> 
			</div>			
			<dl>
			   
					<dt class="open">${productCategoryRoot.name}</dt>
					<dd>
					<ul>
					  
						[@brand_merge_category productCategoryId=productCategoryRoot.id]  
					      	[#list brandmergecategory as itemKey] 
					      	     [#assign i=0]
					      		 [#list itemKey.keySet() as item]
					      		 
					      		    <li rel="${item}">${itemKey[item]}</li> 
					
								 [/#list] 
					      	[/#list] 
					   [/@brand_merge_category]
					</ul>    
				</dd>
				
			</dl>			
		</div>
	[/#list]
   [/@product_category_root_list]

 
	</form>
	
	
</body>
</html>