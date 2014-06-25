<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加新闻 - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="/resource/public/js/admin/common.css" rel="stylesheet" type="text/css" />
<link href="/resource/public/js/admin/themes/default/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resource/public/js/jquery.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/jquery.validate.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/kindeditor.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/common.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/input.js"></script>

<!--  引入文件上传组件-->
<link href="/resource/public/js/uploadify3.2.1/uploadify.css" rel="stylesheet"/>
<script src="/resource/public/js/uploadify3.2.1/jquery.uploadify.js" charset="utf-8"></script>

<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $type = $("#type");
	var $contentTr = $("#contentTr");
	var $pathTr = $("#pathTr");
	var $path = $("#path");
	var $browserButton = $("#browserButton");
	
	upload();
	
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
		},
		submitHandler: function(form) {
			$('#uploadify').uploadify('upload','*');	
		}
		
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml">首页</a> &raquo; 添加内容
	</div>
	<form id="inputForm" action="save.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="type" value="${type}">
		<input type="hidden" name="imgPaths" value="" id="vedios">
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
			<tr>
				<th>
					是否置顶:
				</th>
				<td colspan="3">
					<input type="checkbox" name="top" value="0">
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					<span class="requiredField">*</span>相关图片:
				</th>
			<td colspan="3">
        	<div>
        	视频上传说明：支持图片格式为：swf,flv。
			</div>
			<br>
			<div id="uploader-demo" class="wu-example">
		    <!--用来存放图片列表-->
		    <div id="fileQueue"></div>  
			    <input type="file" name="uploadify" id="uploadify" />  
			    <p>  
			        <a href="javascript:$('#uploadify').uploadify('cancel','*')">&nbsp;&nbsp;取消所有上传</a>  
			    </p>  
    		<script type="text/javascript" charset="UTF-8">
				function upload(){
			       	$("#uploadify").uploadify({  
			            'swf' : '/resource/public/js/uploadify3.2.1/uploadify.swf', 
			            'uploader' : '/upload.jhtml',  
			            'queueID' : 'fileQueue',//与div的id对应  
			            'queueSizeLimit' : 20,  
			            'fileTypeDesc' : '支持类型:',  
			            'fileTypeExts' : '*.swf;*.flv;', //控制可上传文件的扩展名，启用本项时需同时声明fileDesc  
			            'auto' : false,  
			            'multi' : true,  
			            'simUploadLimit' : 5,  
			            'removeCompleted' : false, 
			            'buttonText' : '选择图片',  
			            'buttonCursor' : 'hand', 
			            //返回一个错误，选择文件的时候触发    
				        'onSelectError':function(file, errorCode, errorMsg){  
				        },    
				        //检测FLASH失败调用    
				        'onFallback':function(){    
				            alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");    
				        },    
				        // 选中图片的时候。
				        'onSelect': function(file){  
				        },  
				        'onCancel':function(file){  
				        }, 
				        //上传到服务器，服务器返回相应信息到data里    
				        'onUploadSuccess':function(file, data, response){    
				        	var vedios = $("#vedios");
					        $("#vedios").val(vedios.val()+"#"+data);
				        },  
				        'onQueueComplete': function(queueData){ 
				        	 document.getElementById("inputForm").submit();
				        }
			        });  
			       }
			
			
			</script>
        </td>
			</tr>
			<tr id="contentTr">
				<th>
					内容:
				</th>
				<td colspan="3">
					<textarea id="editor" name="content" class="editor"></textarea>
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