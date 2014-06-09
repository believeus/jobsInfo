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
   $(".shopid").click(function(){ 
     if(${selectedNum}<8 || (${selectedNum}==8 && this.checked==false))
     {
       window.location.href="/admin/shoppage/save.jhtml?shopid="+this.value;
     } else
     {
       alert("已经为最大显示数！");
       this.checked=false;     
     }
      
   });
   
   $("#CategorySelect").click(function(){ 
        $.dialog({
			title: "设置店铺分类",
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
										  
										    <option  value="/admin/shoppage/list.jhtml?category=a-${productCategoryRoot.id}-b-0-c-0">
													[#if productCategoryRoot.id=a]
													 <font size=2 style="color:#ff0000">${productCategoryRoot.name}</font>
													[#else]
													 <font size=2>${productCategoryRoot.name}</font>
													[/#if]
												  
											<\/option> 
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
         $("#shopfiled")[0].value=thisid;
       }
</script>
</head>
<body> 
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 店铺首页管理 
	</div>
	 
		<div class="path">
	       选择类型店铺
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
				  <form id="JS_search_brandlist" action="/admin/shoppage/searchshop.jhtml" method="get" accept-charset="utf-8">
					<span id="searchPropertySelect"  name="s" class="arrow">&nbsp;</span>
					<input id="shopfiled" type="hidden" name="shopfiled" value="shopid"/>
					<input id="category" type="hidden" name="category" value="${a}"/>
					<input type="text" id="searchValue" name="shopvalue" value="" maxlength="200" />
					<button id="searchbtn" onclick="javascript:JS_search_brandlist.submit();" type="submit">&nbsp;</button>
					 			 
				  </from>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;" onclick="choosefiled('shopid')" class="current" id="shopid"  val="shopid">店铺ID</a>
						</li>
						<li>
							<a href="javascript:;" onclick="choosefiled('shopname')" id="shopname"  val="shopname">店铺名称</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	<form id="formlist" action="list.jhtml" method="post">

		
		<table id="listTable" class="list">
		<tr>
			<th class="check">
				<input type="checkbox" id="selectAll" />
			</th>
			<th>
				<span>店铺ID</span>
			</th>
			<th>
				<span>店铺名称</span>
			</th> 
			<th>
				<span>查看店铺</span>
			</th> 
			<th>
				<span>上传背景图</span>
			</th> 
		</tr>  
	 
		     
						 [#list page.content as shop] 
						<tr>  
							<td> 
							    [#if shop.special==thisCategory]
								<input type="checkbox" class="shopid" name="ids" checked="true"value="${shop.id},${thisCategory}" />
								[#else]
								<input type="checkbox" class="shopid" name="ids" value="${shop.id},${thisCategory}" />
								[/#if]
							</td>
							<td>
								${shop.id}
							</td> 
							<td>
								${shop.name}
							</td>
							<td>
								<a href="${base}/shop/index/${shop.id}.jhtml"  target="_blank">查看</a>
							</td> 
							<td>
								<a href="edit.jhtml?shopid=${shop.id}">上传背景</a> 
							</td>
						</tr>
					   [/#list]  
 
	   </table> 
				[@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern="?category=a-${a}-b-${b}-c-${c}"]
			       [#include "/admin/brandpage/pagination.ftl"]
	    	    [/@pagination]
 
 
	</form>
	
	
</body>
</html>