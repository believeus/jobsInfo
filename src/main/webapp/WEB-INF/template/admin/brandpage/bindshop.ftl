<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.adPosition.edit")} - Powered By e3dmall</title>
<meta name="Author" content="e3dmall Team" />
<meta name="Copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	 
	[@flash_message /]

	$(".showAllShop").change(function(){ 
	  var shopvalue=$(this)[0].value.split("-");
	  $("#shopname")[0].innerHTML=shopvalue[1];
	  $("#shopid")[0].value=shopvalue[0]; 
	}); 
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 品牌绑定店铺
	</div>
	<form id="inputForm" action="/admin/brandpage/submitbindshop.jhtml?brandid=${brands.id}" enctype="multipart/form-data" method="post">
		<input id="shopid" type="hidden" name="shopid" value="" />
		<table class="input">
			<tr>
				<th>
					品牌编号:
				</th>
				<td>
					<span>${brands.id}</span>
				</td> 
			</tr>
			
			<tr>
				<th>
					品牌名称:
				</th>
				<td>
					<span>${brands.name}</span> 
				</td>
			</tr>
			 
			<tr>
				<th>
					绑定店铺编号:
				</th>
				<td>  
				   	        
				    <select class="showAllShop" value="">
				          <option value="0">无</option>
					      [#list allBrandShop as shop]   
								    <option value="${shop.id}-${shop.name}">${shop.id}</option> 
						  [/#list]  
					 </select>
				</td>
			</tr>
			<tr>
				<th>
					绑定店铺名称:
				</th>
				<td> 
						 <span id="shopname">无</span> 
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
</body>
</html>