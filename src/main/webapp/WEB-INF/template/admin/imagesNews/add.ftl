<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加图片新闻 - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="/resource/public/js/admin/common.css" rel="stylesheet" type="text/css" />
<link href="/resource/public/js/admin/themes/default/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resource/public/js/jquery.js"></script>
<script type="text/javascript" src="/resource/public/js/jquery.form.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/jquery.validate.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/ueditor1_2_6_2/ueditor.config.js"></script><script type="text/javascript" src="/resource/public/js/admin/ueditor1_2_6_2/ueditor.all.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/common.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/input.js"></script>
<script type="text/javascript">
		function delete_pic(object,id){		
			if ($(".img_list").size() <= 1) {
				alert("必须至少保留一张空图片");				
				// 获取图片是否有值
				if($(object).closest("div").parent().find("img").attr("src")!="/resource/public/images/bg.png"){
					// 清空图片和描述
					$(object).closest("div").parent().find("img").attr("src","/resource/public/images/bg.png");
					// 清空文件
					var file = $(object).closest("div").parent().find("[name^='upload_img']");
					file.after(file.clone().val(""));
					file.remove();
					
					var filename = $(object).closest("div").parent().find("[name^='filename']");
					filename.after(filename.clone().val(""));
					filename.remove();
				}					
			} else {
				$(object).closest("div").parent().parent().remove();
				//a--; 不需要减少，图片会出现错误。
			}
		}

var a = 2;
		
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
			author: "required",
			path: "required",
			order: "digits"
		}
	});
	
	$("#add_imgs").click(function(){
		var filenameV=$("input[name='filename"+(a-1)+"']").val();
		if(filenameV==""){
			alert("请选择上传图片!");
			return false;
		}
		[@compress single_line = true]
			var html =
				'<div class="img_list">
					<span style="float:left;border:1px solid #E4E4E4;width: 190px;">
								 <div id="preview_wrapper'+a+'">    
								        <div id="preview_fake'+a+'" style="border:1px solid;">  
								            <img id="preview'+a+'" onload="onPreviewLoad(this,188,120)" src="/resource/public/images/bg.png"/>
								        </div>    
								    </div>    
								    <br/>    
								    <input id="upload_img'+a+'" type="file" oldvalue="" name="upload_img'+a+'" onchange="filename'+a+'.value=this.value;onUploadImgChange(this,188,120,\'preview'+a+'\',\'preview_fake'+a+'\',\'preview_size_fake'+a+'\');"/>  
								    <input type="hidden" id="filename'+a+'" name="filename'+a+'">
								    <br/>    
								    <img id="preview_size_fake'+a+'"/> 
								</p>
								<div style="text-align: right; border-top: 1px dashed #E4E4E4; height: 24px; line-height: 24px; margin-right: 3px;"><a onclick="delete_pic(this,'+a+')" href="javascript:void(0);">删除</a></div>
							</span>
				</div>';
		[/@compress]
		if($(".img_list").size() < 12){
			$(".img_list").parent().append(html);
		}else{
			alert("最多添加12图片");
		}
		a++;
	});
});
</script>

	<!-- 预览图片 -->
	<style type="text/css">
		#preview_fake1{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake1{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
		}  
		#upload_img1{
			width: 188px;
		} 
		
		#preview_fake2{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake2{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
		}  
		#upload_img2{
			width: 188px;
		} 
		
		#preview_fake3{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake3{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
		}  
		#upload_img3{
			width: 188px;
		} 
		
		#preview_fake4{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake4{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
		}  
		#upload_img4{
			width: 188px;
		} 
		
		#preview_fake5{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake5{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
		}  
		#upload_img5{
			width: 188px;
		} 
		
		#preview_fake6{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake6{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
		}  
		#upload_img6{
			width: 188px;
		} 
		
		#preview_fake7{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake7{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
		}  
		#upload_img7{
			width: 188px;
		} 
		
		#preview_fake8{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake8{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
		} 
		#upload_img8{
			width: 188px;
		} 
		
		#preview_fake9{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake9{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
		} 
		#upload_img9{
			width: 188px;
		} 
		
		#preview_fake10{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake10{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
		} 
		#upload_img10{
			width: 188px;
		} 
		
		#preview_fake11{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake11{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
		} 
		#upload_img11{
			width: 188px;
		} 
		
		#preview_fake12{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake12{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
		} 
		 #upload_img12{
			width: 188px;
		} 
	
	</style>
	<script type="text/javascript">    
		function onUploadImgChange(sender,offsetWidth,offsetHeight,preview,preview_fake,preview_size_fake){     
		    if( !sender.value.match( /.jpg|.gif|.png|.bmp/i ) ){     
		        alert('图片格式无效！');     
		         $(sender).after($(sender).clone().val(""));
				$(sender).remove(); 	
		        return false;     
		    }     
		         
		    
		    var objPreview = document.getElementById( preview );     
		    var objPreviewFake = document.getElementById( preview_fake );     
		    var objPreviewSizeFake = document.getElementById( preview_size_fake );    
		         
		    if( sender.files &&  sender.files[0] ){  
		        var reader = new FileReader();
				reader.onload = function(evt){objPreview.src = evt.target.result;}
		        reader.readAsDataURL(sender.files[0]);	   
		        
		    }else if( objPreviewFake.filters ){    
		        // IE7,IE8 在设置本地图片地址为 img.src 时出现莫名其妙的后果     
		        //（相同环境有时能显示，有时不显示），因此只能用滤镜来解决     
		             
		        // IE7, IE8因安全性问题已无法直接通过 input[file].value 获取完整的文件路径     
		        sender.select();     
		        var imgSrc = document.selection.createRange().text;     
		        
		        objPreviewFake.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = imgSrc;     
		        objPreviewSizeFake.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = imgSrc;     
		        autoSizePreview( objPreviewFake,offsetWidth,offsetHeight );     
		        objPreview.style.display = 'none';     
		    }     
		}     
		    
		function onPreviewLoad(sender,offsetWidth,offsetHeight){    
		    autoSizePreview( sender, offsetWidth, offsetHeight );     
		}     
		    
		function autoSizePreview( objPre, originalWidth, originalHeight ){     
		    var zoomParam = clacImgZoomParam( originalWidth, originalHeight, originalWidth, originalHeight );     
		    objPre.style.width = zoomParam.width + 'px';     
		    objPre.style.height = zoomParam.height + 'px';     
		}     
		    
		function clacImgZoomParam( maxWidth, maxHeight, width, height ){     
		    var param = { width:width, height:height, top:0, left:0 };     
		         
		    if( width>maxWidth || height>maxHeight ){     
		        rateWidth = width / maxWidth;     
		        rateHeight = height / maxHeight;     
		             
		        if( rateWidth > rateHeight ){     
		            param.width =  maxWidth;     
		            param.height = height / rateWidth;     
		        }else{     
		            param.width = width / rateHeight;     
		            param.height = maxHeight;     
		        }     
		    }     
		         
		    param.left = (maxWidth - param.width) / 2;     
		    param.top = (maxHeight - param.height) / 2;     
		         
		    return param;     
		}      
	</script>   
	
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml" target="_parent">首页</a> &raquo; 添加内容
	</div>
	<form id="inputForm" action="save.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="type" value="${type}"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>新闻标题:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" />
				</td>
				<th>
					<span class="requiredField">*</span>作者:
				</th>
				<td>
					<input type="text" name="author" class="text" maxlength="200" />
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					<span class="requiredField">*</span>相关图片:<br/>
					<input id="add_imgs" type="button" value="添加图片" style="font-size: 10px; width: 52px;cursor:pointer;">
				</th>
				<td colspan="3">
						<div class="img_list">
							<span style="float:left;border:1px solid #E4E4E4;width: 190px;">
								 <div id="preview_wrapper1">    
								        <div id="preview_fake1" style="border:1px solid;">  
								            <img id="preview1" onload="onPreviewLoad(this,188,120)" src="/resource/public/images/bg.png"/>
								        </div>    
								    </div>    
								    <br/>    
								    <input id="upload_img1" type="file" oldvalue="" name="upload_img1" onchange="filename1.value=this.value;onUploadImgChange(this,188,120,'preview1','preview_fake1','preview_size_fake1');"/>  
								    <input type="hidden" id="filename1" name="filename1">
								    <br/>    
								    <img id="preview_size_fake1"/> 
								</p>
								<div style="text-align: right; border-top: 1px dashed #E4E4E4; height: 24px; line-height: 24px; margin-right: 3px;"><a onclick="delete_pic(this,0)" href="javascript:void(0);">删除</a></div>
							</span>
						</div>
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					内容:
				</th>
				<td colspan="3">
					<textarea id="editor" name="content" class="" style="width:80%;height:90px;"></textarea>
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
					<input id="submit_tijiao" type="submit" class="button" value="确定" />
					<input type="button" id="backButton" class="button" value="返回" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>