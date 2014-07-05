<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>修改图片新闻 - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="/resource/public/js/admin/common.css" rel="stylesheet" type="text/css" />
<link href="/resource/public/js/admin/themes/default/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resource/public/js/admin/jquery.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/jquery.validate.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/kindeditor.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/common.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/input.js"></script>

<style type="text/css">
			.delete_pic{
				color:#FFFFFF;
				font-size:16px;
			}
			.brandImg a{
				text-decoration:underline;
			}
			.brandImg span{
				display:block;
				position:absolute;
				top:0px;left:0px;
				width:200px;
				height:130px;
			}
			
			.brandImg{
				border-color: #B8B8B8 #DCDCDC #DCDCDC #B8B8B8;
			    border-radius: 2px 2px 2px 2px;
			    border-style: solid;
			    border-width: 1px;
			    background-color: #666666;
			    width:192px;
			    height:150px;
			    text-align:center;
			    position:relative;
			}
			
			.brandImg span:hover{
				background-color:#FFFFFF;
			    opacity: 0.7;
			    filter:alpha(opacity=50);
			    -moz-opacity:0.5;
			    -khtml-opacity: 0.5;
			}
			
			.brandImg span a{
				display:block;
				position:absolute;
				top:50px;left:50px;
			}
			
			.deleteProductImage:hover{
				color:#C9033B !important;
			}
		</style>
					
	<script type="text/javascript">
		function loadImgFast(img,i){
				// 获取修改之前的图片链接。
				var srcx=$(".brandImg:eq("+i+") img")[0].src;
				if(srcx.indexOf("/resource/public/images/bg.png") < 0 && srcx.indexOf("data:image/jpeg;") < 0)
				{
				    // 不包含
					deleteImg($(".brandImg:eq("+i+") input")[0].value);									    
				}
				if (img.files && img.files[0]){
					var reader = new FileReader();
					reader.onload = function(evt){$(".brandImg:eq("+i+") img")[0].src = evt.target.result;}
		            reader.readAsDataURL(img.files[0]);	
				}else if(window.navigator.userAgent.indexOf("MSIE")>=1){
				   	file.select(); 
		   			path = document.selection.createRange().text;
		   			$(".brandImg:eq("+i+") img")[0].src = path;
		   		} 
			}
		</script>
					
<script type="text/javascript">

	
	function deleteImg(value){
			var deleteImgs = $("#deleteImgs");
			if (deleteImgs.length > 0) { 
		     	//对象存在的处理逻辑
	            $("#deleteImgs").val(deleteImgs.val()+"#"+value);
		    } else {
		      	//对象不存在的处理逻辑
		      	var html='<input id="deleteImgs" type="hidden" name="ids" value="'+value+'"/>';
				$("#inputForm").append(html);
		   }
		}
		
		function delete_pic(object,value){		
			if ($(".delete_pic").size() <= 1) {
				alert("必须至少保留一张空图片");				
				// 获取图片是否有值
				if($(object).closest("div").parent().find("img").attr("src")!="/resource/public/images/bg.png"){
					// 清空图片和描述
					$(object).closest("div").parent().find("img").attr("src","/resource/public/images/bg.png");
					if(value!="none"){
						deleteImg(value);					
					}
				}					
			} else {
				if(value!="none"){
						deleteImg(value);					
				}
				$(object).closest("div").parent().parent().remove();
				a--;
			}
		}
		
	var a = 0;
$().ready(function() {

		

	var $inputForm = $("#inputForm");
	var $type = $("#type");
	var $contentTr = $("#contentTr");
	var $pathTr = $("#pathTr");
	var $path = $("#path");
	var $browserButton = $("#browserButton");
	
	
	
	// "类型"修改
	$type.change(function() {
		if ($type.val() == "text") {
			$contentTr.show();
			$pathTr.hide();
			$path.prop("disabled", true)
		} else {
			$contentTr.hide();
			$pathTr.show();
			$path.prop("disabled", false)
			$browserButton.unbind().browser({
				type: $type.val()
			});
		}
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			title: "required",
			adPositionId: "required",
			path: "required",
			order: "digits"
		}
	});
	
	
	[#list dataCenter.imgpath?string?split("#") as url]   
		[#if url!=""]
			a++;
		[/#if]
	[/#list]
	
	$("#add_imgs").click(function(){
		[@compress single_line = true]
			var html =
				'<div class="img_list">
					<span style="float:left">
						<div class="brandImg">
							<span>
								<a class="click_upimgs" onclick="file'+a+'.click()" href="javascript:void(0);">点击上传图片</a>
							</span>
							<img style="width:190px;height:120px" src="/resource/public/images/bg.png" name="img"/>
							<a class="delete_pic" href="javascript:void(0);" onclick="delete_pic(this,no)">删除</a>
						</div>
						<input type="file" style="display:none" id="file'+a+'" name="file'+a+'" onchange="filename'+a+'.value=this.value;loadImgFast(this,'+a+')">
						<input type="hidden" id="filename'+a+'" name="filename'+a+'">
					</span>
				</div>';
		[/@compress]
		$(".img_list").parent().append(html);
		a++;
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml">首页</a> &raquo; 编辑内容
	</div>
	<form id="inputForm" action="update.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${dataCenter.id}"/>
		<input type="hidden" name="type" value="${type}"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>标题:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" value="${dataCenter.title}"/>
				</td>
				<th>
					<span class="requiredField">*</span>作者:
				</th>
				<td>
					<input type="text" name="author" class="text" maxlength="200" value="${dataCenter.author}" />
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					<span class="requiredField">*</span>相关图片:<br/>
					<input id="add_imgs" type="button" value="添加图片" style="font-size: 10px; width: 52px;cursor:pointer;">
				</th>
				<td colspan="3">
					[#list dataCenter.imgpath?string?split("#") as url]   
					[#if url!=""]
					<div class="img_list">
						<span style="float:left">
							<div class="brandImg">
								<span>
									<a onclick="file${url_index}.click()" href="javascript:void(0)">点击上传图片</a>
								</span>
								<input type="hidden" name="imgpath" value="${url}"/>
								<img style="width:190px;height:120px" [#if url?exists] src="/${url}" [#else]src="/resource/public/images/bg.png"[/#if] value="${url}"/>
								<a class="delete_pic" href="javascript:void(0);" onclick="delete_pic(this,'${url}')">删除</a>
							</div>
							<input type="file" style="display:none" id="file${url_index}" name="file${url_index}" onchange="filename${url_index}.value=this.value;loadImgFast(this,${url_index})">
							<input type="hidden" id="filename${url_index}" name="filename${url_index}">
						</span>
					</div>
					[/#if]
					[/#list]
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					内容:
				</th>
				<td colspan="3">
					<textarea id="editor" name="content" class="editor">${dataCenter.content}</textarea>
				</td>
			</tr>
			<tr>
				<th>
					排序编号:
				</th>
				<td colspan="3">
					<input type="text" name="order" class="text" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="submit" class="button" value="确定" />
					<input type="button" id="backButton" class="button" value="返回" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>