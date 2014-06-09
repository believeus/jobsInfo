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
<script type="text/javascript" src="${base}/resources/shop/js/jquery.validate.js"></script>
<style type="text/css">
.moreTable th {
	width: 80px;
	line-height: 25px;
	padding: 5px 10px 5px 0px;
	text-align: right;
	font-weight: normal;
	color: #333333;
	background-color: #f8fbff;
}

.moreTable td {
	line-height: 25px;
	padding: 5px;
	color: #666666;
}

.promotion {
	color: #cccccc;
}
</style>
<script type="text/javascript">
$().ready(function() {
   
   $(".showspecial").change(function(){ 
        if(this.value==2)
        {
	       if(${AA}<1 || (${AA}==1 && this.value==1)) {
	         window.location.href="/admin/brandpage/save.jhtml?brandid="+this.name+"&special=${thisItem}:"+this.value;
	       }
	       else{
	         alert("最优级已经存在，请确认后修改！");
	       }
	    }else if(this.value==1)
	    {
	       if(${AB}<8 ||(${AB}==8 && this.value==2)){
	          window.location.href="/admin/brandpage/save.jhtml?brandid="+this.name+"&special=${thisItem}:"+this.value;
	       }
	       else{
	         alert("优级数量已经达到最大值，请确认后修改！");
	       }
	    }else{
	        window.location.href="/admin/brandpage/save.jhtml?brandid="+this.name+"&special=0:"+this.value;
	    }
   });
    
   $("#CategorySelect").click(function(){ 
        $.dialog({
			title: "设置品牌分类",
			[@compress single_line = true]
				content: '
				<table id="moreTable" class="moreTable">
					 <tr>
						<th>
							&nbsp;选择分类模块:
						<\/th>
						<td>
							<select name="shopId" id="chooseCategory"> 
									
									[@product_category_root_list]
										[#list productCategories as productCategoryRoot]
										  
										    <option  value="/admin/brandpage/show.jhtml?category=a-${productCategoryRoot.id}-b-0-c-0-d-0">
													[#if productCategoryRoot.id=a]
													 <font size=2 style="color:#ff0000">${productCategoryRoot.name}</font>
													[#else]
													 <font size=2>${productCategoryRoot.name}</font>
													[/#if]
												  
											<\/option>
											  
											   
												[@brand_merge_category productCategoryId=productCategoryRoot.id] 
						 
											      	[#list brandmergecategory as itemKey]  
											      		 [#list itemKey.keySet() as item]  
											      		    <option value="/admin/brandpage/show.jhtml?category=a-${productCategoryRoot.id}-b-${item}-c-0-d-0">
																    [#if item==b]
																	 <font size=2 style="color:#ff0000">&nbsp;&nbsp;&nbsp;&nbsp;${itemKey[item]}</font>
																	[#else]
																	 <font size=2> &nbsp;&nbsp;&nbsp;&nbsp;${itemKey[item]} </font>
																	[/#if] 
															 <\/option>
														 [/#list] 
														 
											      	[/#list] 
										        [/@brand_merge_category]  
										[/#list]
									 [/@product_category_root_list]  
							<\/select>
						<\/td>
					<\/tr>  
				</table>',
			[/@compress]
			width: 470,
			modal: true,
			ok: "确定",
				cancel: "取消",
			onOk: function() { 
					window.location.href=$("#chooseCategory")[0].value; 
			}
		});
   });
   
}); 
</script>
<script>
       function choosefiled(thisid){ 
         $("#brandfiled")[0].value=thisid;
       }
</script>
</head>
<body> 
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.brandpage.show")} 
	</div>
	 
		 
    <div class="bar">
			<a href="add.jhtml" class="iconButton" style="display:none">
				<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a> 
				<a href="javascript:;" id="CategorySelect" class="button">
					选择分类<span class="arrow">&nbsp;</span>
				</a> 
				<a href="javascript:;" id="moreButton" class="button disabled"">${message("admin.product.moreOption")}</a>
				 
			</div>
			<div class="menuWrap">
				<div class="search">
				  <form id="JS_search_brandlist" action="/admin/brandpage/searchbrand.jhtml" method='GET' enctype='multipart/form-data' accept-charset="utf-8">
					<span id="searchPropertySelect"  name="s" class="arrow">&nbsp;</span>
					<input id="brandfiled" type="hidden" name="brandfiled" value="brandid"/>
					<input id="category" type="hidden" name="category" value="${b}"/>
					<input type="text" id="searchValue" name="brandvalue" value="" maxlength="200" />
					<button id="searchbtn" onclick="javascript:JS_search_brandlist.submit();" type="submit">&nbsp;</button>
					 			 
				  </from>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;" onclick="choosefiled('brandid')" class="current" id="brandid"  val="brandid">品牌ID</a>
						</li>
						<li>
							<a href="javascript:;" onclick="choosefiled('brandname')" id="brandname"  val="brandname">品牌名称</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	<form id="formlist" action="list.jhtml" method="post">

		<div class="path">
	      选择品牌的宣传级别<font color="#0000ff">（品牌需对应唯一的次级分类，否则页面可能会重复显示）</font>
	    </div>
		<table id="listTable" class="list">
		<tr>
			 
			 
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
				<span>绑定店铺</span>
			</th> 
			<th>
				<span>宣传图片</span>
			</th> 
		</tr>  
		[#if b!="0"] 
				 [#list page.content as brand] 
				<tr>
					 
					<td>
						${brand.id}
					</td> 
					<td>
						${brand.name}
					</td>
					<td>
					   <select class="showspecial" value="" name = "${brand.id}">
					    
						[#if brand.grade=="1"] 
						    <option value="0">无</option>
						    <option value="2" >最优级</option>
						    <option value="1"  selected="selected">优级</option>
						[#elseif brand.grade=="2"] 
						    <option value="0">无</option>
						    <option value="2"  selected="selected">最优级</option>
						    <option value="1">优级</option>
						[#else] 
						  	<option value="0"  selected="selected">无</option>
						    <option value="2">最优级</option>
						    <option value="1">优级</option>
						[/#if]
						</select>
					</td>
					<td>   
							   [#if brand.currentstatus == 'success']
							     
							        [@brand_find_shop brandid=brand.id] 
							          [#assign isbind=0]
							           
							              [#list brandtoshop as shop] 
										    <a class="bFlil-link" target="_blank" title="${brand.name}" href="/shop/index/${shop.id}.jhtml">
										    [查看店铺]</a>
										    [#assign isbind=1]
									      [/#list]
									      
									  [#if isbind==0] 
							              <font style="color:#ff0000">[旗舰店待建设]</font>
							          [/#if] 
								    [/@brand_find_shop]
							   [#else] 
							     [审核未通过]
							   
							   [/#if]
							   
					</td>
					<td>
					         [#if brand.grade=="2"] 
								 <a href="edit.jhtml?brandid=${brand.id}">[${message("admin.common.edit")}]</a>  
						     [#else]
						         <span>无</span>
							 [/#if]
					</td>
				</tr>
			   [/#list]
			   
		 
		 [#else]
		 
				   [#assign grede=0]
				   [@brandTd_list productCategoryId="${a}" isBigImg="5" ] 
						 [#list brands as brand] 
						   
							 [#if brand.grade!=0]
							   [#assign grede=1]
								<tr>
									 
									<td>
										${brand.id}
									</td> 
									<td>
										${brand.name}
									</td>
									<td> 
										[#if brand.grade=="1"] 优级
										[#elseif brand.grade=="2"] 最优级
										[#else] 无
										[/#if]
									</td>
									<td>
									     无操作
									</td>
									<td>
									     无操作
									</td>
								</tr> 
							[/#if]
					   [/#list]
				   [/@brandTd_list] 
				    
							 [#if grede==0]
							    <tr>
								    <td colspan="5">
								      <font color="#ff0000">当前没有宣传的品牌,请选择次级分类进行选择.</font>
								    </td>
							    </tr> 
							 [/#if]
					    
		 [/#if]
 
	   </table> 
	
          [#if b!=0]
                [@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern="?category=a-${a}-b-${b}-c-${c}-d-${d}"]
			       [#include "/admin/brandpage/pagination.ftl"]
	    	    [/@pagination] 
	      [/#if]
	</form>
	
	
</body>
</html>