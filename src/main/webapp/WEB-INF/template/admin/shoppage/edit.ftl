<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.adPosition.edit")} </title> 
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/imguploadajax/imguploadajax.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/imguploadajax/imguploadajax.js"></script> 
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script> 
<script type="text/javascript">
$().ready(function() {
	 $().ready(function() {
	   $("input[name=name]").uploadImg(190,120,"/admin/shoppage/upload.jhtml?shopid=${shop.id}");
	   
	  });
	   $("#backButton").click(function(){
	      history.go(-1);
	   });
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.adPosition.edit")}
	</div>
	 	<table class="input">
			<tr>
				<th>
					店铺编号:
				</th>
				<td>
					<span>${shop.id}</span>
				</td>
			</tr>
			
			<tr>
				<th>
					店铺名称:
				</th>
				<td>
					<span>${shop.name}</span> 
				</td>
			</tr> 
			<tr>
				<th>
					上传背景图:
				</th>
				<td> 
						 <div name="fileform"> 
							<input type="file" name="name" src=${shop.background}>
					     </div>
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
</body>
</html>