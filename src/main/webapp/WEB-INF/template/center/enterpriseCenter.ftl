<!DOCTYPE html>
<html>
<head>
    <title>企业中心</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script type="text/javascript" src="/resource/public/js/jquery.js"></script>
    <script type="text/javascript" src="/resource/public/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/resource/public/js/jquery.form.js"></script>
    <script type="text/javascript"  src="/resource/public/js/Etech.js"></script>
    <link href="/resource/public/js/jquery-ui.css" rel="stylesheet" type="text/css" />  
    <link href="/resource/public/selectArea/css/css.css" type="text/css" rel="stylesheet">
    <link href="/resource/public/selectArea/css/cityLayout.css" type="text/css" rel="stylesheet">
    <link href="/resource/public/js/jquery-X-Menu/css/xmenu.css" rel="stylesheet" type="text/css" />  
    <link href="/resource/public/js/jquery-X-Menu/css/powerFloat.css" rel="stylesheet" type="text/css" />  
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-xmenu.js"></script> 
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-powerFloat-min.js"></script>
	<script type="text/javascript" src="/resource/public/js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="/resource/public/js/waitamoment.js"></script>
	
	<!--[if gte IE 7]> 
		<script type="text/javascript">   
			$().ready(function(){
				$("#baseDiv").css("height","440px");
			});
		</script>
	<![endif]--> 

    <script type="text/javascript">
    	$().ready(function(){
    		$("#qiye_xinxi").click(function(){
    			$("#qiye_xinxi").removeClass("currentSwich");
    			$("#zhaopin_xinxi").removeClass("currentSwich");
    			$("#qiye_xinxi").addClass("currentSwich");
    			$("#base_xinxi").show();
    			$("#bianji_xinxi").hide();
    		});
    		$("#zhaopin_xinxi").click(function(){
    			
    			if(${sessionUser.status} =="1"){//审核通过
    				$("#qiye_xinxi").removeClass("currentSwich");
	    			$("#zhaopin_xinxi").removeClass("currentSwich");
	    			$("#zhaopin_xinxi").addClass("currentSwich");
	    			$("#bianji_xinxi").show();
	    			$("#base_xinxi").hide();
    			}else{
    				alert("审核没有通过");
    				return false;
    			}
    		});
    	});
    </script>
    <style type="text/css">
   		.j_main{
    		width:1000px;
    		height:auto;
    	}
		.j_main_left{
    		float:left;
    		width:260px;
    		height:auto;
    		overflow:hidden;
    		margin-right:6px;
		}
		.j_main_left_1{
			width:258px;
			height:290px;
    		border:1px solid;
		}
		
		.j_main_left_1 span{
			float:right;
		}
		.j_main_left_1 li{
			line-height:28px;
		}
		.j_main_right{
			float:left;
    		width:730px;
    		height:auto;
			overflow:hidden;		
		}
		.j_main_right_1{
    		width:730px;
			height:29px;
		}
		.j_main_right_1 p{
			margin:0;
			padding: 5px;
			background: url(/resource/public/images/background_b.png);
		    border: 1px solid #e4e4e4;
		    font-size:13px;
		    font-family:"黑体"; /*2014-07-18 北科*/
		}
		.j_main_right_2{
			width:728px;
			height:auto;
			margin-top:10px;
			overflow:hidden;
		}
		.j_main_right_2_1{
			width:728px;
			height:30px;
			background:#E5E5E5;
			border-bottom:3px solid #E36510;
		}
		.j_main_right_2_1_1{
		    font-size: 16px;
		    font-family:"黑体"; /*2014-07-18 北科*/
		    height: 30px;
		    line-height: 30px;
		    text-align: center;
		    width: 130px;
		    float:left;
		}
		.j_main_right_2_1_2{
		    text-align: center;
		    line-height: 30px;
		    font-size: 16px;
		    font-family:"黑体"; /*2014-07-18 北科*/
			height: 30px;
			width: 130px;
		    float:left;
		}
		.j_main_right_2 span {
		    color: #E26511;
		    padding-left: 20px;
		}
		.j_main_left_1 td{
			line-height:30px;
		}
		.j_main_left_1_1{
			border-bottom: 1px dashed #F6B37F;
		    height: 130px;
		    margin-left: auto;
		    margin-right: auto;
		    width: 245px;
		}
		.j_main_left_1_1 p{
			margin: 7px 10px;
    		padding: 0 10px;
    		text-align:left;
		}
		.j_main_right_2 input{
			width:175px;
		}
		.j_main_right_2 tr{
			line-height:30px;
		}
		.qiyepic{
			float: left;
		    height: 274px;
		    width: 160px;
		    background:#FFFFFF;
		    margin-right:10px;
		    margin-bottom:10px;
		}
		.qiyepic p{
			margin:0;
		}
		.qiyepic img {
		    height: 0;
		    width: 0;
		}
		.qiyepic input{
			width:163px;
		}
		.qiyepic a {
		    color: #AE3234;
		    text-decoration: underline;
		}
		.qiyepic textarea{
			border: 0 none;
		    font-size: 13px;
		  font-family:"黑体"; /*2014-07-18 北科*/
		    height: 39px;
		    resize: none;
		    width: 158px;
		}
		.shipin td {
		    padding: 0 10px;
		}
		.shipin a{
			color: #AE3234;
		    text-decoration: underline;
		}
		.zhaopin th {
		    width: 100px;
		}
		.zhaopin td {
		    font-size: 12px;
		    border-bottom: 1px dashed #E4E4E4;
		}
		.currentSwich{
			background:#E36510;
			color:#FFFFFF;
		}
		.uploadify {
			margin-top:6px;
		}
		.list li {
		    line-height: 23px;
		}
		.list input {
			width:80px;
		}
		/**修改登录样式*/
		.denglu-div {
		    height: 50px;
		    line-height: 50px;
		    padding: 0 10px;
		    width: auto;
		}
		.denglu-div input{
			float:left;
		}
    </style>
    
	
	<!-- 预览图片 -->
	<style type="text/css">    
		#preview_wrapper{     
		    display:inline-block;     
		   	width:190px;
		   	height:48px;    
		    background-color:#CCC;
		    margin-top: 10px;     
		}     
		#preview_fake{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
		}     
		#preview{ /* 该对象用户在FF下显示预览图片 */     
		  	width:190px;
		   	height:48px;      
		}   
		#upload_img{
			margin-top: 10px;
			width: 160px;
		} 
		
	</style> 
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
		
		#preview_fake2{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake2{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
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
		
		#preview_fake4{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake4{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
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
		
		#preview_fake6{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake6{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
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
		
		#preview_fake8{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake8{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
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
		        window.document.body.focus();    
		        var imgSrc = document.selection.createRange().htmlText;    
		        
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
	
	
     <script type="text/javascript">
     	// 图片上传
		function deleteImg(id){
			var deleteImgs = $("#deleteImgs");
								
			if (deleteImgs.length > 0) { 
		     	//对象存在的处理逻辑
	            $("#deleteImgs").val(deleteImgs.val()+","+id);
		    } else {
		      	//对象不存在的处理逻辑
		      	var html='<input id="deleteImgs" type="hidden" name="ids" value="'+id+'"/>';
				$("#InfoForm").append(html);
		   }
		}
		
	</script>
	
	<script type="text/javascript">
		//检查图片格式
	 	function checkI(file) {
	  	 if(!(/(?:gif|jpg|jpeg|bmp|png)$/i.test(file.value))) {
		  alert("只允许上传 gif/jpg/jpeg/bmp/png 格式的视频截图");
		  if(window.ActiveXObject) {//for IE
				file.select();//select the file ,and clear selection
			    document.selection.clear();
			} else if(window.opera) {//for opera
				file.type="text";file.type="file";
			} else file.value="";//for FF,Chrome,Safari
			} 
	   }
	   
	   // 检查视频格式
	  function checkV(file) {
	   if(!(/(?:flv)$/i.test(file.value))) {
		  alert("只允许上传flv 格式的视频");
		  if(window.ActiveXObject) {//for IE
				file.select();//select the file ,and clear selection
			    document.selection.clear();
			} else if(window.opera) {//for opera
				file.type="text";file.type="file";
			} else file.value="";//for FF,Chrome,Safari
		} 
	  }
	</script>
										
	
	<script type="text/javascript" charset="UTF-8">
				function showDialogSave(){
					if (confirm("修改企业基本信息，需要管理员重新审核\r\n且审核未通过前不能进行聘信的相关操作！\r\n是否要继续保存？") == true) {
						showdiv();
						$("#InfoForm").ajaxSubmit({
			            	 type: "post",
						     url: "/enterprise/submit-account-Info.jhtml",
						     dataType: "json",
						     success: function(data){
						     	submitMap();
						 }
				        });	
					}
					
				}
		
				// 删除企业视频
				function deleteVIds(id){
					var deleteVedios = $("#deleteVedios");
								
					if (deleteVedios.length > 0) { 
				     	//对象存在的处理逻辑
			            $("#deleteVedios").val(deleteVedios.val()+","+id);
				    } else {
				      	//对象不存在的处理逻辑
				      	var html='<input id="deleteVedios" type="hidden" name="vIds" value="'+id+'"/>';
						$("#InfoForm").append(html);
				   }
				
				}
				
	</script>
	
    <script text="text/javascript">

		[@compress single_line = true]
    		var htmlx = '
    				<div class="shipin" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
					<form novalidate="novalidate"  action="/enterprise-user/center/uploadVedio.jhtml" encType="multipart/form-data"  method="post" id="vedioForm1">
	    			<input type="hidden" name="type" value="1">
	    			<input type="hidden" id="size1" value="2"> 
	    			<input type="hidden" id="num1" value="0">
	    			<input name="vedioUrl" type="hidden" value="" id="vedioUrl">
		        	<input name="vedioName" type="hidden" value="" id="vedioName">
		        	<input name="url" type="hidden" value="" id="url">
		        	<input name="originName" type="hidden" value="" id="originName">
						<table width="690">
							<tr id="pathTr">
								<th style="text-align: left; padding-left: 10px;">
									视频截图:
								</th>
								<td >
									<input type="file" name="fileImg" oldvalue="" onchange="checkI(this)">
								</td>
							</tr>
							<tr>
								<th style="text-align: left; padding-left: 10px;">视频文件:</th>
								<td>
								<input type="file" name="fileVedio" oldvalue="" onchange="checkV(this)">
								</td>
							</tr>
							<tr>
								<td colspan="2"><textArea  oldvalue="" style="width:360px;height:60px;resize:none;" onblur="if(this.value ==\'\') this.value = \'添加描述\'" onfocus="if(this.value == \'添加描述\') this.value = \'\'" autocomplete="off"name="descption" name="descption">添加描述</textArea></td>
								<td style="vertical-align: bottom;"><a onclick="delete_vedio(this,1,0)" href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
					</form>		    
					</div>';
			[/@compress]

		//删除企业图片
		[#if Imgs?size>0]
			var c = ${Imgs?size}+1;
		[#else]
			var c = 2;
		[/#if]
		var changpic=false;
		function delete_pic(object,id){		
			if ($(".qiyepic").size() <= 1) {
				changpic=true;
				alert("必须至少保留一张空图片");
				
				// 清空图片,防止a图片删除之后又上传a图片。file会认为是同一个文件。
				var file = $(object).closest("div").parent().find("[name^='upload_img']");
				file.after(file.clone().val(""));
				file.remove(); 	
				
				// 获取图片是否有值
				if($(object).closest("div").parent().find("img").attr("src")!="/resource/public/images/bg.png"){
					// 清空图片和描述
					$(object).closest("div").parent().find("img").attr("src","/resource/public/images/bg.png");
					$(object).closest("div").parent().find("textarea").text("");
					$(object).closest("div").parent().find("input[name='id']").remove();
					$(object).closest("div").parent().find("input[name='url']").remove();
					if(id!=0){
						deleteImg(id);					
					}
				}					
			} else {
				if(id!=0){
					deleteImg(id);					
				}
				//c--;  不需要减少，图片会出现错误。
				$(object).closest("div").parent().parent().remove();
			}
		}
		
		
		// 判断视频是否被清空。
		var visz=false;
		//删除企业视频
		function delete_vedio(object,formId,id){
				if ($(".shipin").size() <= 1) {
					alert("必须至少保留一个空参数");
					if(id!=0){
						visz=true;
						deleteVIds(id);
						//清空，加载一个新的视频。
						$("#vedioForm"+formId).html(htmlx);
						// 监听文本领改变事件
						$("#shipins textarea,#shipins input").change(function() {
							var value=$(this).val();
							// 监听是否发生改变。
							if(value!=""){
								$(this).attr("check",1);
							}else{
								$(this).attr("check",0);
							}
						});
					}else{
						// 清空图片
						var file = $("#vedioForm"+formId).find("[name='fileImg']");
						file.after(file.clone().val(""));
						file.remove(); 
						// 清空视频
						var filev = $("#vedioForm"+formId).find("[name='fileVedio']");
						filev.after(filev.clone().val(""));
						filev.remove(); 
						// 清空文本框
						$("#vedioForm"+formId).find("[name='descption']").val("添加描述");
						
					}
				} else {
					if(id!=0){
						deleteVIds(id);
					}
					$(object).closest("div").remove();
					v--;
				}
		}
		
		
		
		// 删除招聘信息
		function delete_ids(){
			var id=$(object).parent().parent().parent().find("input[name='id']");
			if(id.length > 0){
				id=id.val();
				var deleteids = $("#deleteids");
				
				if (deleteids.length > 0) { 
			     	//对象存在的处理逻辑
		            $("#deleteids").val(deleteids.val()+","+id);
			    } else {
			      	//对象不存在的处理逻辑
			      	var html='<input id="deleteids" type="hidden" name="ids" value="'+id+'"/>';
					$("#JobsForm1").append(html);
			   }
			}
		}
		
		
		
		// ajax 提交验证和保存。
		function submitInfo(){
			var infochange=0;
			$("input,textarea").each(function() {
				var checkstatus=$(this).attr("check");
				if(checkstatus==1){
					infochange=1;				
				}
			})
			if($("#area").val()!=$("#area").attr("oldvalue")){
				infochange=1;
			}
			if(infochange!=0){
			    // 设置弹出框确认保存和取消
				$("#status").val(0);
			    showDialogSave();
			}else{
				showdiv();
	        	$("#InfoForm").ajaxSubmit({
	            	 type: "post",
				     url: "/enterprise/submit-account-Info.jhtml",
				     dataType: "json",
				     success: function(data){
				     	submitMap();
				     }
        		});	
			}
		}
		
		
		// 上传电子图片
		function submitMap(){
			if(changex==1){
				$("#MapForm").ajaxSubmit({
	            	 type: "post",
				     url: "/enterprise-user/center/upload.jhtml",
				     dataType: "json",
				     success: function(data){
				     	submitImgs();
				     }
	    		});	
			}else{
				submitImgs();
			}
		}
		
		var inum=1;
		// 上传企业图片
		[#--function submitImgs(){
			   for(var i=1;i<8;i++){
			      	if($("#ImgForm"+i).length > 0){
			      		$("#ImgForm"+i).ajaxSubmit({
			            	 type: "post",
						     url: "/enterprise-user/center/upload.jhtml",
						     dataType: "json",
						     success: function(data){
						     		inum++;
							     	if(inum==c){
										submitVedio();				     	
						     		}
						    	 }
				    		});	
			      	}
			   }
		}--]
		//huangzhihua
		// 上传企业图片
		function submitImgs(){
			  var total = $(".qiyepic").length;
			   for(var i=1;i<8;i++){
			      	if($("#ImgForm"+i).length > 0){
			      		$("#ImgForm"+i).ajaxSubmit({
			            	 type: "post",
						     url: "/enterprise-user/center/upload.jhtml",
						     dataType: "json",
						     success: function(data){
						     		inum++;
							     	if(inum==total){
										submitVedio();				     	
						     		}
						    	 }
				    		});	
			      	}
			   }
		}
		
		
		var vnum=0;
		// 上传视频
		function submitVedio(){
			 for(var i=1;i<4;i++){
				 if($("#vedioForm"+i).length>0){
				 	$("#vedioForm"+i).ajaxSubmit({
		            	 type: "post",
					     url: "/enterprise-user/center/uploadVedio.jhtml",
					     dataType: "json",
					     success: function(data){
					     		vnum++;
					     		if(vnum==(v-1)){
					     			location.reload(true);
					     		}
					    	 }
			    		});	
				 }
		   		
		  	 }
		}
		
		function showDialog(id,object){
			if (confirm("确定要删除吗？") == true) {
				$.ajax({
							url: "/enterprise-user/center/delete-recruit.jhtml",
							type: "POST",
							data: {'id':id},
							dataType: "json",
							cache: false,
							success: function(data) {
								 if(data.message=="success"){								 
								 	$(object).parent().parent().remove();
								 }
							}
						});
			}
		}
		
		function changeIsview(id){
			$.ajax({
				url: "/enterprise-user/center/change-recruit.jhtml",
				type: "POST",
				data: {'id':id},
				dataType: "json",
				cache: false,
				success: function(data) {
					$("#isview"+id).text(data.message);
				}
			});
		}
		
		
    	var b = 2;
    	[#if Vedios?size>0]
    		var v=${Vedios?size}+1;
    	[#else]
    		var v=2;
    	[/#if]
    	
    	
    	var sum=1;
    	
    	// 查看电子图是否有改变。
    	var changex=0;
    
    $().ready(function(){
    
    	// 监听基本信息文本框的改变事件
    	$("table input,#introduce,#economicType,#unitType,#relationship").change(function() {
    		var oldvalue=$(this).attr("oldvalue");
	    	var value=$(this).val();
	    		// 监听是否发生改变。
	    		if(oldvalue!=value){
	    			$(this).attr("check",1);
	    		}else{
	    			$(this).attr("check",0);
	    		}
    	});

		// 监听企业图片，视频改变事件
		$("#qiyepics textarea,#qiyepics input,#shipins textarea,#shipins input").change(function() {
	    	var value=$(this).val();
    		// 监听是否发生改变。
    		if(value!=""){
    			$(this).attr("check",1);
    		}else{
    			$(this).attr("check",0);
    		}
	    });
		
		
    
    	// 初始化一些值。设置value为用户填写过的项选中。
    	$("#unitType").val("${sessionUser.unitType}");
    	$("#relationship").val("${sessionUser.relationship}");
    	$("#economicType").val("${sessionUser.economicType}");
    	
    	var specialty=$("#Specialty").html();
		var jobs=$("#Jobs").html();
			
		$("#xmenuSpecialty1").html(specialty);
		$("#xmenuJobs1").html(jobs);	
    	
		// 添加弹窗控件。
			$("#selectSpecialty1").xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuSpecialty1",//弹出层
						emptytext:"选择专业",
						hiddenID : "selectSpecialtyhidden1"//隐藏域ID	
			});
			$("#selectJobs1").xMenu({	
						width :1000,
						top:175.5,
						left:145,
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuJobs1",//弹出层
						emptytext:"选择工种",
						hiddenID : "selectJobshidden1"//隐藏域ID	
			});
			
		
		
    	//添加企业图片
    	$("#add_pic").click(function(){
    		
    		[@compress single_line = true]
    		var html = '
    					<div class="qiyepic">
    					<form novalidate="novalidate"  action="/enterprise-user/center/upload.jhtml" encType="multipart/form-data"  method="post" id="ImgForm'+c+'">
						<input type="hidden" name="type" value="0">
							<p>
							 <div id="preview_wrapper'+c+'">    
							        <div id="preview_fake'+c+'" >  
							            <img id="preview'+c+'" onload="onPreviewLoad(this,160,145)" src="/resource/public/images/bg.png" id="0"/>
							        </div>    
							    </div>    
							    <br/>    
							    <input id="upload_img'+c+'" type="file" oldvalue="" name="upload_img'+c+'" onchange="filename'+c+'.value=this.value;onUploadImgChange(this,160,145,\'preview'+c+'\',\'preview_fake'+c+'\',\'preview_size_fake'+c+'\');"/>  
							    <input type="hidden" id="filename'+c+'" name="filename'+c+'">
							    <br/>    
							    <img id="preview_size_fake'+c+'"/> 
							</p>
							<p><textArea maxlength="20" name="descption" oldvalue="" onblur="if(this.value ==\'\') this.value = \'添加描述(20字以内)\'" onfocus="if(this.value == \'添加描述(20字以内)\') this.value = \'\'" autocomplete="off" maxlength="20" >添加描述(20字以内)</textArea></p>
							<div style="text-align: right; border-top: 1px dashed #E4E4E4; height: 24px; line-height: 24px; margin-right: 3px;"><a onclick="delete_pic(this,0)" href="javascript:void(0);">删除</a></div>
						</form>
						</div>
    					';
			[/@compress]
			if($(".qiyepic").size() <8){
				c++;
				$(".qiyepic").parent().append(html);
				var pics = $(".qiyepic");
		    	pics.each(function(){
		    		if(($(this).index()+1)%4==0){
		    			$(this).css("margin-right","0px");
		    		}
		    	});
		    	// 监听文本领改变事件
				$("#qiyepics textarea,#qiyepics input").change(function() {
			    	var value=$(this).val();
		    		// 监听是否发生改变。
		    		if(value!=""){
		    			$(this).attr("check",1);
		    		}else{
		    			$(this).attr("check",0);
		    		}
			    });
			}else{
				alert("最多添加8条数据");
			}
    	});
    	
    	
		
    	//添加企业视频
    	$("#add_vedio").click(function(){
    	    
    	    
    	    
    		[@compress single_line = true]
    		var html = 
    			'<div class="shipin" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
    			<form novalidate="novalidate"  action="/enterprise-user/center/uploadVedio.jhtml"  method="post" id="vedioForm'+v+'">
    			<input type="hidden" name="type" value="1">
    			<input type="hidden" id="size'+v+'" value="2"> 
    			<input type="hidden" id="num'+v+'" value="0">
    			<input name="vedioUrl" type="hidden" value="" id="vedioUrl">
	        	<input name="vedioName" type="hidden" value="" id="vedioName">
	        	<input name="url" type="hidden" value="" id="url">
	        	<input name="originName" type="hidden" value="" id="originName">
					<table width="690">
						<tr id="pathTr">
							<th style="text-align: left; padding-left: 10px;">
							
								视频截图:
							</th>
							<td >
								<input type="file" name="fileImg" oldvalue="" onchange="checkI(this)">
							</td>
						</tr>
						<tr>
							<th style="text-align: left; padding-left: 10px;">视频文件:</th>
							<td>
							<input type="file" name="fileVedio" oldvalue="" onchange="checkV(this)">
							</td>
						</tr>
						<tr>
							<td colspan="2"><textArea style="width:360px;height:60px;resize:none;" oldvalue="" onblur="if(this.value ==\'\') this.value = \'添加描述\'" onfocus="if(this.value == \'添加描述\') this.value = \'\'" autocomplete="off"name="descption" name="descption">添加描述</textArea></td>
							<td style="vertical-align: bottom;"><a onclick="delete_vedio(this,'+v+',0)" href="javascript:void(0);">删除</a></td>
						</tr>
					</table>
					</form>
				</div>';
			[/@compress]
			if($(".shipin").size() <3){
				$(".shipin_parent").append(html);
				// 监听文本领改变事件
				$("#shipins textarea,#shipins input").change(function() {
			    	var value=$(this).val();
		    		// 监听是否发生改变。
		    		if(value!=""){
		    			$(this).attr("check",1);
		    		}else{
		    			$(this).attr("check",0);
		    		}
			    });
			}else{
				alert("最多添加3条数据");
			}
			
			v++;
    	});
    	
    	
		$("#phoneNum").blur(function(){
			var phoneNum =$(this).val();
			var regPartton=/^(?:13\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/; //验证手机号
			if(!regPartton.test(phoneNum)){
				alert("手机格式不正确！");
			}
		});
		
			//封装ajax信息提交
		function submitJobs(value){
			if($("#beginDate").val()!=""){
				var viewData=new Date($("#beginDate").val().replace(/-/g,"/")).getTime();
				$("#viewData").val(viewData);
			}else{
				$("#viewData").remove();
			}
			$("div.zhaopinxinxi").each(function(index){
				index=index+1;
				$("#jobsForm1").ajaxSubmit({
		            	 type: "post",
					     url: "/enterprise-user/center/submit-recruit.jhtml",
					     dataType: "json",
					     success: function(data){
					     	if(data.message=="success"){
						     	location.href="/enterprise-user/center.jhtml#"+value;
						     	location.reload(true);
					     	}
					     }
	        	});	
	        });	
			
		}
    	// 保存信息。
    	$("#savaAll").click(function() {
    		var phoneNum =$("#phoneNum").val();
			var regPartton=/^(?:13\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/; //验证手机号
    		
    		if($("#fullName").val() == ""){
    			alert("请输入单位全称");
    			return false;
    		} else if($("#shorName").val() == ""){
    			alert("请输入单位简称");
    			return false;
    		}else if($("#legalMan").val() == ""){
    			alert("请输入法人代表");
    			return false;
    		}else if($("#area").val() == ""){
    			alert("请输入所属地区");
    			return false;
    		}else if($("#trade").val() == ""){
    			alert("请输入所属行业");
    			return false;
    		}else if($("#regMoney").val() == ""){
    			alert("请输入注册资金");
    			return false;
    		}else if($("#detailAddress").val() == ""){
    			alert("请输入详细地址");
    			return false;
    		}else if($("#contacts").val() == ""){
    			alert("请输入联系人");
    			return false;
    		}else if($("#address").val() == ""){
    			alert("请输入通讯地址");
    			return false;
    		}else if($("#zip").val() == ""){
    			alert("请输入邮政编码");
    			return false;
    		}else if($("#phoneNum").val() == ""){
    			alert("请输入手机号码");
    			return false;
    		}else if($("#phoneFax").val() == ""){
    			alert("请输入电话/传真");
    			return false;
    		}else if($("#introduce").val() == ""){
    			alert("请输入单位简介");
    			return false;
    		}else{
    			var tag=false;
    			var tip=0;
    			var selects = $("#base_xinxi select");//判断下拉框是否选值
	    		selects.each(function(index,obj){
	    			if($(this).val() == ""){
	    				tip++;
	    				tag=true;
	    				$(this).css("color","red");
	    				if(tip == 1){
		    				alert("请选择下拉框信息");
	    				}
	    			}
	    		});
	    		// 判断是否完全被清空过。
	    		if(tag==false){
	    			// 判断上传的视频和截图是否完整。
	    		  if(visz==false){
	    		  	var count=1;
	    			 for(var i=1;i<v;i++){
		   				var id=$("#vedioForm"+i).find(":input[name='id']");
		   				if(id.length==0){
		   					var  fileImg = $("#vedioForm"+i).find(":input[name='fileImg']").val();
		   					var  fileVedio = $("#vedioForm"+i).find(":input[name='fileVedio']").val();
		   					var  descption = $("#vedioForm"+i).find("[name='descption']").val();
		   					    if(descption!="添加描述" || fileImg!="" || fileVedio!=""){
		   					    	if(fileImg==""){
		   					    	    alert("请完整视频的上传：视频截图!");
		   					    		return false;
		   					    	}
		   					    	
		   					    	if(fileVedio==""){
		   					    		alert("请完整视频的上传：视频文件!");
		   					    		return false;
		   					    	}
		   					    }
		   					    
		   					     //当有一个视频信息时 ， 后面的都需要验证
		   					    /* if(i>1){
		   					         if(fileImg==""){
		   					    	    alert("请完整视频的上传：视频截图!");
		   					    		return false;
		   					    	}
		   					    	
		   					    	if(fileVedio==""){
		   					    		alert("请完整视频的上传：视频文件!");
		   					    		return false;
		   					    	}
		   					     }*/
		   					     
		   					    
			   					if(fileImg!=""&&fileVedio==""){
			   						count++;
			   						tag=true;
			   						alert(" 请完整视频的上传：视频文件");
			   						$("#vedioForm"+i).find(":input[name='fileVedio']").css("color","red");
			   						return;
			   					}else if(fileImg==""&&fileVedio!=""){
			   						count++
			   						tag=true;
			   						alert(" 请完整视频的上传：视频截图");
			   						$("#vedioForm"+i).find(":input[name='fileImg']").css("color","red");
			   						return;		   						
			   					}else{
									count++;
									if(tag!=false&&count!=v){
										return;
					   				}   					
			   					}
		   					
		   					
		   					
		   				}else{
		   					count++;
		   				}
		   			}
		   			// 在所有条件通过的条件下提交
	   				if(tag==false&&count==v){
						submitInfo();
	   				}
		   		  }else{
    			  	submitInfo();
		   		  }
    			}
    		}
		});
		
		// 保存招聘信息。
    	$("#savaJobs").click(function() {
    	    var tag=false;
    	    var value = "zhaopin_xinxi";
    		if($("#selectJobshidden1").val() == ""){
    			alert("请选择工种");
    			tag=true;
    		}else if($("#start1").val() == ""){
    			alert("请输入工作地点");
    			tag=true;
    		}else {
	    		if(tag==false){
	    			showdiv();
	    			submitJobs(value);
    			}
    		}
    		
		});
		
		// 修改密码
		$("#btn_pd").click(function(){
			var password=$(".pass_text").val();
			if(password==""){
				alert("请输入新密码");
				return false;
			}
			$("#pdFrom").ajaxSubmit({
            	 type: "post",
			     url: "/user/center/updatepd.jhtml",
			     dataType: "json",
			     success: function(data){
				     $("#need").html("密码修改成功！正在返回页面....");// 这个是渐渐消失 			     		
			     	 setTimeout(function(){ alert_win.style.display='none';},1000);
			     	 location.replace("/enterprise-user/center.jhtml");		
			     }
        	});	
		
		});
		
    
    })
    
    </script>
    <script type="text/javascript">
    	$().ready(function(){
    		if(window.location.hash == "#zhaopin_xinxi" || window.location.hash == "#bj"){
    			$("#qiye_xinxi").removeClass("currentSwich");
    			$("#zhaopin_xinxi").removeClass("currentSwich");
    			$("#zhaopin_xinxi").addClass("currentSwich");
    			$("#base_xinxi").css("display","none");
    			$("#bianji_xinxi").css("display","block");
    		}
    		$("#logout").click(function() {
					// 需要跳转到注册页面
					Etech.logout();
			});
    	});
	</script>
</head>
<body>
	[#include "/include/header.ftl" /]
	<div class="j_main w">
		<div class="j_main_left">
			<div class="j_main_left_1" style="background:url(/resource/public/images/ggwsydl.png) no-repeat; width:258px; height:222px;border:1px solid #f2c49f;">
			<div style="padding: 53px 0 0;">
						<div class="denglu-div">
							<img src="/resource/public/images/dlr.png" />
							<span style="color:#FFC12B;float:none;">${sessionUser.loginName}</span>
							欢迎您登录！
						</div>
						<div class="denglu-div">
							<img src="/resource/public/images/dlsj.png" />
							上次登录
							${sessionUser.lastLoginData?number_to_datetime}&nbsp;${sessionUser.lastLoginData?number_to_time}
						</div>
						<div class="denglu-div">
							<input type="button" style="margin-right:10px;background:url(/resource/public/images/ggw-yhdlh.png) no-repeat; width:113px;height:37px;border:0;color:#ffffff;font-size:16px;font-family:'黑体';font-weight:bold;" 
								value="[#if sessionUser.class.name == "com.etech.entity.TcomUser"]个人中心[#elseif sessionUser.class.name == "com.etech.entity.TentUser"]企业中心[#else]管理员后台[/#if]"
								onclick="javascript:[#if sessionUser.class.name == "com.etech.entity.TcomUser"]window.location.href='/common-user/center.jhtml';[#elseif sessionUser.class.name == "com.etech.entity.TentUser"] window.location.href='/enterprise-user/center.jhtml';[#else]window.location.href='/admin/common/main.jhtml';[/#if]" 
								>
								<input id="logout" type="button" style="background:url(/resource/public/images/tc.png) no-repeat;border:0; width: 104px;height:37px;" value="">
						</div>
					</div>
			</div>
			<div class="j_main_left_1" style="margin-top:10px;height:auto;text-align:center;border:1px solid #E4630F;border-radius:4px;">
				<p style="background: #EE981F; text-align: center; margin: 5px; padding: 5px; border-radius: 5px; border: 0px none; color: #FFFFFF;">人才推荐</p>
				[#list talentRecommend as user]
				<div class="j_main_left_1_1">
					<p><a target="_blank" style="color: blue;" href="/personalResume.jhtml?id=${user.id}">${user.loginName}</a></p>
					<p style="color: blue;font-weight:bold;">${user.comInfo[0].workType.name}</p>
					<p>薪资待遇：面议</p>
					<p>学历：${user.eduLevel}</p>
				</div>
				[/#list]
			</div>
		</div>
		<div class="j_main_right">
			<div class="j_main_right_1">
				<p>
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-left: 2px; margin-top: 2px; margin-right: 5px;">
					所在位置 > 企业中心
				</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;">
				<div class="j_main_right_2_1">
					<div id="qiye_xinxi" class="j_main_right_2_1_1 currentSwich" style="cursor:pointer;">企业信息</div>
					<div id="zhaopin_xinxi" class="j_main_right_2_1_2" style="cursor:pointer;">招聘信息</div>
				</div>
				<p>
					<span>登记编号:0000${sessionUser.id}</span>
					<span style="padding-right: 20px; margin-left: 90px;">更新日期:${sessionUser.editDate?number_to_datetime}&nbsp;${sessionUser.editDate?number_to_time}</span>
					<span style="float: right; padding-right: 20px;">审核状态:[#if sessionUser.status=="0"&&sessionUser.status!="1"]<font color="#FFC12B">审核中</font>[#elseif sessionUser.status=="1"]<font color="green">已通过审核</font>[#else]<font color="red">审核驳回</font>[/#if]</span>
				</p>
				
				<div id="base_xinxi" style="width::728px;height:auto;overflow:hidden;">
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">基本信息</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 525px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input id="update_mima" type="button" value="修改密码" onClick="alert_win.style.display='block';" style="cursor:pointer;width: 80px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div id="baseDiv" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<div class="" style="height: 480px; overflow: hidden; float: left; width: 660px; margin-left: 30px; margin-top: 10px;margin-right:10px;">
						<table>
						<form novalidate="novalidate"  action="/enterprise/submit-account-Info.jhtml" encType="multipart/form-data"  method="post" id="InfoForm">
							<input type="hidden" name="id" value="${sessionUser.id}">
							<input type="hidden" id="status" name="status" value="${sessionUser.status}">
							<input type="hidden" name="loginName" value="${sessionUser.loginName}">
							<input type="hidden" name="password" value="">
								<tr>
									<td><font color="red">*</font>单位全称:</td>
									<td style="padding-right: 80px;"><input type="text" oldvalue="${sessionUser.fullName}" value="${sessionUser.fullName}" id="fullName" name="fullName"></td>
									<td><font color="red">*</font>单位性质:</td>
									<td>
										<select id="unitType" name="unitType" style="width: 182px;" oldvalue="${sessionUser.unitType}">
											<option value="">请选择..</option>
											<option value="企业">企业</option>
											<option value="党政机关">党政机关</option>
											<option value="事业单位">事业单位</option>
											<option value="社会团体">社会团体</option>
										</select>
									</td>
								</tr>
								<tr>
									<td><font color="red">*</font>单位简称:</td>
									<td><input type="text" id="shorName" value="${sessionUser.shorName}" name="shorName" oldvalue="${sessionUser.shorName}"></td>
									<td><font color="red">*</font>隶属关系:</td>
									<td>
										<select id="relationship" name="relationship" style="width: 182px;" oldvalue="${sessionUser.relationship}">
											<option value="">请选择..</option>
											<option value="中央">中央</option>
											<option value="省">省</option>
											<option value="市">市</option>
											<option value="县">县</option>
											<option value="街道">街道</option>
											<option value="居委会">居委会</option>
											<option value="其它">其它</option>
										</select>
									</td>
								</tr>
								<tr>
									<td><font color="red">*</font>经济类型:</td>
									<td>
										<select id="economicType" name="economicType" style="width: 182px;" oldvalue="${sessionUser.economicType}">
											<option value="">请选择..</option>
											<option value="国有">国有</option>
											<option value="集体">集体</option>
											<option value="联营">联营</option>
											<option value="股份制">股份制</option>
											<option value="私营">私营</option>
											<option value="个体">个体</option>
											<option value="外商">外商</option>
											<option value="港澳台">港澳台</option>
											<option value="其它">其它</option>
										</select>
									</td>
									<td><font color="red">*</font>法人代表:</td>
									<td><input type="text" value="${sessionUser.legalMan}" id="legalMan" name="legalMan" oldvalue="${sessionUser.legalMan}"></td>
								</tr>
								<tr>
									<td><font color="red">*</font>所属地区:</td>
									<td>
										<input type="text" id="area" name="area" value="${sessionUser.area}" oldvalue="${sessionUser.area}" class="city_input  inputFocus proCityQueryAll proCitySelAll current2"  autocomplete="off" readonly="readonly">
									<!--////////////////////////////////////////////////////////////////////////-->
										<div class="provinceCityAll">
										  <div class="tabs clearfix">
										    <ul class="">
										      <li><a href="javascript:" class="current" tb="hotCityAll">热门城市</a></li>
										      <li><a href="javascript:" tb="provinceAll">省份</a></li>
										      <li><a href="javascript:" tb="cityAll" id="cityAll">城市</a></li>
										      <li><a href="javascript:" tb="countyAll" id="countyAll">区县</a></li>
										    </ul>
										  </div>
										  <div class="con">
										    <div class="hotCityAll invis">
										      <div class="pre"><a></a></div>
										      <div class="list">
										        <ul>
										         
										        </ul>
										      </div>
										      <div class="next"><a class="can"></a></div>
										    </div>
										    <div class="provinceAll invis">
										      <div class="pre"><a></a></div>
										      <div class="list">
										        <ul>
										        
										        </ul>
										      </div>
										      <div class="next"><a class="can"></a></div>
										    </div>
										    <div class="cityAll invis">
										      <div class="pre"><a></a></div>
										      <div class="list">
										        <ul>
										          
										        </ul>
										      </div>
										      <div class="next"><a class="can"></a></div>
										    </div>
										    <div class="countyAll invis">
										      <div class="pre"><a></a></div>
										      <div class="list">
										        <ul>
										        </ul>
										      </div>
										      <div class="next"><a class="can"></a></div>
										    </div>
										  </div>
										</div>
									<!--////////////////////////////////////////////////////////////////////////-->
									</td>
									<td><font color="red">*</font>行业:</td>
									<td><input type="text"  value="${sessionUser.trade}" id="trade" name="trade" oldvalue="${sessionUser.trade}"></td>
								</tr>
								<tr>
									<td><font color="red">*</font>注册资金:</td>
									<td><input type="text"  value="${sessionUser.regMoney}" oldvalue="${sessionUser.regMoney}" id="regMoney" name="regMoney" ><span style="padding:0;margin-left:-35px;color:#000000;">万元</span></td>
									<td><font color="red">*</font>详细地址:</td>
									<td><input type="text"  value="${sessionUser.detailAddress}" oldvalue="${sessionUser.detailAddress}" id="detailAddress" name="detailAddress"></td>
								</tr>
								<tr>
									<td><font color="red">*</font>联系人:</td>
									<td><input type="text"  value="${sessionUser.contacts}" oldvalue="${sessionUser.contacts}" id="contacts" name="contacts"></td>
									<td><font color="red">*</font>通讯地址:</td>
									<td><input type="text"  value="${sessionUser.address}" oldvalue="${sessionUser.address}" id="address" name="address"></td>
								</tr>
								<tr>
									<td><font color="red">*</font>邮编:</td>
									<td><input type="text"  value="${sessionUser.zip}" oldvalue="${sessionUser.zip}" id="zip" name="zip"></td>
									<td><font color="red">*</font>手机:</td>
									<td><input type="text"  value="${sessionUser.phoneNum}" oldvalue="${sessionUser.phoneNum}" id="phoneNum" name="phoneNum" minlegnth="11" maxlength="11" onkeyup="value=this.value.replace(/\D+/g,'')"></td>
								</tr>
								<tr>
									<td><font color="red">*</font>电话/传真:</td>
									<td><input type="text"  value="${sessionUser.phoneFax}" oldvalue="${sessionUser.phoneFax}" id="phoneFax" name="phoneFax"></td>
									<td><font color="red">&nbsp;&nbsp;</font>网址:</td>
									<td><input type="text"  value="${sessionUser.webSite}" oldvalue="${sessionUser.webSite}" id="webSite" name="webSite"></td>
								</tr>
								<tr>
									<td style="vertical-align: top;"><font color="red">*</font>单位简介:</td>
									<td colspan="3"><textArea cols="50" rows="5"  name="introduce" id="introduce" style="resize:none;" oldvalue="${sessionUser.introduce}">${sessionUser.introduce}</textArea></td>
								</tr>
							</form>
									<tr>
									<td style="vertical-align: top;padding-top: 10px;">企业电子图:</td>
									<td colspan="2">
									<form novalidate="novalidate"  action="/enterprise-user/center/upload.jhtml" encType="multipart/form-data"  method="post" id="MapForm">
									<input type="hidden" name="type" value="2">
										[#if Maps?size>0]
											[#list Maps as map]
											 <div id="preview_wrapper">    
										        <div id="preview_fake" >    
										            <img id="preview" onload="onPreviewLoad(this,190,48)" src="/${map.url}" name="url" id="${map.id}"/>
													<input type="hidden" name="id" value="${map.id}">
										        </div>    
										    </div>    
										    <br/>    
										    <input id="upload_img" type="file" oldvalue="${map.url}" name="upload_img" onchange="filename0.value=this.value;onUploadImgChange(this,190,48,'preview','preview_fake','preview_size_fake');changex=1;"/>  
		             						<div style="height: 2px; position: relative; width: 230px; left: 230px; font-size: 12px; top: -74px;">
												建议图片尺寸：宽190px*高48px
											</div>
										    <input type="hidden" id="filename0" name="filename0">
										    <br/>    
										    <img id="preview_size_fake"/>   
											[/#list]
										[#else]
										 <div id="preview_wrapper">    
									        <div id="preview_fake" >    
									            <img id="preview" onload="onPreviewLoad(this,190,48)" src="/resource/public/images/bg.png"/>
									        </div>    
									    </div>    
									    <br/>    
									    <input id="upload_img" type="file" oldvalue="" name="upload_img" onchange="filename0.value=this.value;onUploadImgChange(this,190,48,'preview','preview_fake','preview_size_fake');changex=1;"/>  
	             						<div style="height: 2px; position: relative; width: 230px; left: 230px; font-size: 12px; top: -74px;">
											建议图片尺寸：宽190px*高48px
										</div>
									    <input type="hidden" id="filename0" name="filename0">
									    <br/>    
									    <img id="preview_size_fake"/>   
										[/#if]
									</form>
									</td>
								</tr>
							</table>
						</div>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">企业图片</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input id="add_pic" type="button" value="添加" style="width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div id="qiyepics" style="width:670px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;padding:10px;">
						
						[#if Imgs?size>0]
						[#list Imgs as img]
						<div class="qiyepic" [#if img_index==3||img_index==7]style="margin-right: 0px;"[/#if]>
						<form novalidate="novalidate"  action="/enterprise-user/center/upload.jhtml" encType="multipart/form-data"  method="post" id="ImgForm${img_index+1}">
						<input type="hidden" name="type" value="0">
						<input type="hidden" name="id" value="${img.id}">
						<input type="hidden" name="url" value="${img.url}">
						<p>
						 <div id="preview_wrapper${img_index+1}">    
						        <div id="preview_fake${img_index+1}" >  
						            <img id="preview${img_index+1}" onload="onPreviewLoad(this,160,145)" src="/${img.url}"/>
						        </div>    
						    </div>    
						    <br/>    
						    <input id="upload_img${img_index+1}" type="file" oldvalue="${img.url}" name="upload_img${img_index+1}" onchange="filename${img_index+1}.value=this.value;onUploadImgChange(this,160,145,'preview${img_index+1}','preview_fake${img_index+1}','preview_size_fake${img_index+1}');"/>  
						    <input type="hidden" id="filename${img_index+1}" name="filename${img_index+1}">
						    <br/>    
						    <img id="preview_size_fake${img_index+1}" style="dispaly:none;"/> 
						</p>
						<p><textArea oldvalue="${img.descption}" maxlength="20" name="descption" onblur="if(this.value =='') this.value = '添加描述(20字以内)'" onfocus="if(this.value == '添加描述(20字以内)') this.value = ''" autocomplete="off" maxlength="20" >[#if img.descption!=""]${img.descption}[#else]添加描述(20字以内)[/#if]</textArea></p>
						<div style="text-align: right; border-top: 1px dashed #E4E4E4; height: 24px; line-height: 24px; margin-right: 3px;"><a onclick="delete_pic(this,${img.id})" href="javascript:void(0);">删除</a></div>
				
						</form>
						</div>
						[/#list]
						[#else]
						<div class="qiyepic">
							<form novalidate="novalidate"  action="/enterprise-user/center/upload.jhtml" encType="multipart/form-data"  method="post" id="ImgForm1">
							<input type="hidden" name="type" value="0">
								<p>
								 <div id="preview_wrapper1">    
								        <div id="preview_fake1" >  
								            <img id="preview1" onload="onPreviewLoad(this,160,145)" src="/resource/public/images/bg.png"/>
								        </div>    
								    </div>    
								    <br/>    
								    <input id="upload_img1" type="file" oldvalue="" name="upload_img1" onchange="filename1.value=this.value;onUploadImgChange(this,160,145,'preview1','preview_fake1','preview_size_fake1');"/>  
								    <input type="hidden" id="filename1" name="filename1">
								    <br/>    
								    <img id="preview_size_fake1"/> 
								</p>
								<p><textArea oldvalue="" maxlength="20" name="descption" onblur="if(this.value =='') this.value = '添加描述(20字以内)'" onfocus="if(this.value == '添加描述(20字以内)') this.value = ''" autocomplete="off" maxlength="20" >添加描述(20字以内)</textArea></p>
								<div style="text-align: right; border-top: 1px dashed #E4E4E4; height: 24px; line-height: 24px; margin-right: 3px;"><a onclick="delete_pic(this,0)" href="javascript:void(0);">删除</a></div>
							</form>
						</div>
						[/#if]
						
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">企业视频</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<!--<input id="add_vedio" type="button" value="添加" style="width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">-->
						</div>
					</div>
					<div id="shipins" class="shipin_parent">
						<div style="height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
							<font color="red" size="3">视频上传说明：</font><font color="red">总上传数量为2。一张视频截图+视频文件。<br>支持格式为：gif,jpg,jpeg,bmp,png,swf,flv。
							</font>
					 	</div>
						[#if Vedios?size>0]
						[#list Vedios as vedio]
						
							<div class="shipin" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
							<form novalidate="novalidate"  action="/enterprise-user/center/uploadVedio.jhtml" encType="multipart/form-data"  method="post" id="vedioForm${vedio_index+1}">
							<input type="hidden" name="type" value="1">
							<input type="hidden" name="id" value="${vedio.id}">
							<input type="hidden" id="size${vedio_index+1}" value="0">
							<input type="hidden" id="num${vedio_index+1}" value="0"> 
							<input name="vedioUrl" type="hidden" value="${vedio.vedioUrl}" id="vedioUrl">
				        	<input name="vedioName" type="hidden" value="${vedio.vedioName}" id="vedioName">
				        	<input name="url" type="hidden" value="${vedio.url}" id="url">
				        	<input name="originName" type="hidden" value="${vedio.originName}" id="originName">
							<table width="690">
								<tr id="pathTr">
										<th style="text-align: left; padding-left: 10px;">
											视频截图:
										</th>
										<td >
											<input type="file" name="fileImg" oldvalue="${vedio.url}" onchange="checkI(this)">
											<div>已上传视频截图：<a href="/${vedio.url}" title="点击查看" target="_blank">${vedio.originName}</a></div>
										</td>
									</tr>
									<tr>
										<th style="text-align: left; padding-left: 10px;">视频文件:</th>
										<td>
										<input type="file" name="fileVedio" oldvalue="${vedio.vedioUrl}" onchange="checkV(this)">
										<div>已上传视频文件：<a href="/${vedio.vedioUrl}" title="点击查看" target="_blank">${vedio.vedioName}</a></div>
										</td>
									</tr>
								<tr>
									<td colspan="2"><textArea oldvalue="${vedio.descption}" style="width:360px;height:60px;resize:none;" onblur="if(this.value =='') this.value = '添加描述'" onfocus="if(this.value == '添加描述') this.value = ''" autocomplete="off"name="descption">${vedio.descption}</textArea></td>
									<td style="vertical-align: bottom;"><a onclick="delete_vedio(this,${vedio_index+1},${vedio.id})"  href="javascript:void(0);">删除</a></td>
								</tr>
							</table>
						</form>
						</div>
						[/#list]
						[#else]
			    			<div class="shipin" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
							<form novalidate="novalidate"  action="/enterprise-user/center/uploadVedio.jhtml" encType="multipart/form-data" method="post" id="vedioForm1">
			    			<input type="hidden" name="type" value="1">
			    			<input type="hidden" id="size1" value="2"> 
			    			<input type="hidden" id="num1" value="0"> 
			    			<input name="vedioUrl" type="hidden" value="" id="vedioUrl">
				        	<input name="vedioName" type="hidden" value="" id="vedioName">
				        	<input name="url" type="hidden" value="" id="url">
				        	<input name="originName" type="hidden" value="" id="originName">
								<table width="690">
									<tr id="pathTr">
										<th style="text-align: left; padding-left: 10px;">
											视频截图:
										</th>
										<td >
											<input type="file" name="fileImg" oldvalue="" onchange="checkI(this)">
										</td>
									</tr>
									<tr>
										<th style="text-align: left; padding-left: 10px;">视频文件:</th>
										<td>
										<input type="file" name="fileVedio" oldvalue="" onchange="checkV(this)">
										</td>
									</tr>
									<tr>
										<td colspan="2"><textArea oldvalue="" style="width:360px;height:60px;resize:none;" onblur="if(this.value =='') this.value = '添加描述'" onfocus="if(this.value == '添加描述') this.value = ''" autocomplete="off"name="descption" name="descption">添加描述</textArea></td>
										<td style="vertical-align: bottom;"><a onclick="delete_vedio(this,1,0)" href="javascript:void(0);">删除</a></td>
									</tr>
								</table>
							</form>		    
							</div>
						[/#if]
					</div>			    
					
					<p style="text-align:center;">
						<input type="button" id="savaAll" value="保存">
					</p>
				</div>
				
				<div id="bianji_xinxi" style="width:728px;height:auto;;overflow:hidden;display:none;">
					<div class="zhaopin" style="height: auto; text-align: center; border: 1px solid #e4e4e4; margin: 5px 20px; width: 685px;">
						<table cellspacing="0">
							<tr style="background:#F0F0F0;">
								<th>招聘专业</th>
								<th>招聘工种</th>
								<th>性别</th>
								<th>文化程度</th>
								<th>年龄</th>
								<th>审核情况</th>
								<th>状况</th>
								<th>操作</th>
							</tr>
							[#if recruits?size>0]
							[#list recruits as recruit]
								<tr>
								<td title="${recruit.majorType.name}">
									[#if recruit.majorType.name?length > 5]
										${recruit.majorType.name?string?substring(0,5)}...
									[#else]
										${recruit.majorType.name}
									[/#if]
								</td>
								<td title="${recruit.workType.name}">
								[#if recruit.workType.name?length > 5]
									${recruit.workType.name?string?substring(0,5)}...
								[#else]
									${recruit.workType.name}
								[/#if]
								</td>
								<td>
								[#if recruit.sex=="man"&&recruit.sex!="woman"]男[#elseif recruit.sex=="woman"]女[#else]不限[/#if]
								</td>
								<td>${recruit.eduLevel}</td>
								<td>[#if recruit.age!=""]${recruit.age}[#else]不限[/#if]</td>
								<td>
								[#if recruit.status=="0"&&recruit.status!="1"]<font color="#FFC12B">审核中</font>[#elseif recruit.status=="1"]<font color="green">已通过审核</font>[#else]<font color="red">审核驳回</font>[/#if]
								</td>
								<td><a href="javascript:void(0)" onclick="changeIsview(${recruit.id});" title="点击即可修改" id="isview${recruit.id}">${recruit.isview}</a></td>
								<td><a href="/editRecruit.jhtml?id=${recruit.id}" style="margin-right: 5px;" id="editx" >编辑</a>
								<a href="javascript:void(0)" onclick="showDialog(${recruit.id},this)">删除</a>
								</td>
							</tr>
							[/#list]
							[/#if]
						</table>
					</div>
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">添加/编辑招聘信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">(红色字体为必填项)</font></span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 390px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input id="add_zhaopin" type="hidden" value="添加" style="width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div>
				<div class="zhaopinxinxi" style="padding:10px 30px;width:650px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
					<form novalidate="novalidate"  action="/enterprise-user/center/submit-recruit.jhtml"  method="post" id="jobsForm1">
						<input type="hidden" name="status" value="0">
						<input type="hidden" name="viewData" value="" id="viewData">
						<input type="hidden" name="isview" value="发布">
							<table>
								<tr>
									<td>招聘单位:</td>
									<td style="padding-right:80px;">
									<label>&nbsp;&nbsp;&nbsp;&nbsp;${sessionUser.fullName}</label>
									<input type="hidden" id="company1" name="company" value="${sessionUser.fullName}" readonly="readonly">
									</td>
									<td>人数:</td>
									<td><input type="text" id="worknum1" name="worknum" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="3"></td>
								</tr>
								<tr>
									<td><font color="red">工种:</font></td>
									<td>
									<input type="hidden" value="" id="selectJobshidden1" name="workTypeId"/>
									<div class="topnav">
										<script>
											$(function(){
											   $("#xmenuJobs1 li").click(function(){
											      $("#selectJobshidden1").val(($(this).attr("rel")));
											      $("#selectJobs1 > span").text($(this).text());
											      $("#xmenuJobs1").hide();
											   });
											});
										</script>
										<a id="selectJobs1" href="javascript:void(0);" class="as">
											<span>
												选择工种
											</span>		
										</a>	
									</div>
									</td>
									<td>性别:</td>
									<td>
										<select id="sex1" name="sex" style="width: 183px;">
											<option value="不限">不限</option>
											<option value="woman">女</option>
											<option value="man">男</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>专业:</td>
									<td>
									<input type="hidden" value="" id="selectSpecialtyhidden1" name="majorTypeId"/>
									<div class="topnav">
										<script>
											$(function(){
											  $("#xmenuSpecialty1 li").click(function(){
											   $("#selectSpecialty1 span").text($(this).text());
											   $("#selectSpecialtyhidden1").val($(this).attr("rel"));
											   $("#xmenuSpecialty1").hide();
											   
											  });
											
											});
										</script>
										<a id="selectSpecialty1" href="javascript:void(0);" class="as">
											<span >
												选择专业
											</span>		
										</a>	
									</div>
								</td>
									<td>技术等级:</td>
									<td>
										<select style="width:183px;" name="eteLevel" id="eteLevel1">
											<option value="">不限</option>
											<option value="职业资格一级（高级技师）">职业资格一级（高级技师）</option>
											<option value="职业资格二级（技师）">职业资格二级（技师）</option>
											<option value="职业资格三级（高级）">职业资格三级（高级）</option>
											<option value="职业资格四级（中级）">职业资格四级（中级）</option>
											<option value="职业资格五级（初级）">职业资格五级（初级）</option>
										</select>	
									</td>
								</tr>
								<tr>
									<td>从事年限:</td>
									<td>
									<select id="workyear1" name="workyear" style="width: 183px;">
											<option value="不限">不限</option>
											<option value="在读学生">在读学生</option>
											<option value="应届毕业生">应届毕业生</option>
											<option value="1~2年">1~2年</option>
											<option value="2~3年">2~3年</option>
											<option value="3~5年">3~5年</option>
											<option value="5~8年">5~8年</option>
											<option value="8~10年">8~10年</option>
											<option value="8~10年">8~10年</option>
											<option value="10年以上">10年以上</option>
										</select>
    
									</td>
									<td>文化程度:</td>
									<td>
										<select id="eduLevel1" name="eduLevel" style="width: 183px;">
											<option value="不限">不限</option>
											<option value="博士">博士</option>
											<option value="硕士">硕士</option>
											<option value="大学">大学</option>
											<option value="大专">大专</option>
											<option value="中专中技">中专中技</option>
											<option value="技校">技校</option>
											<option value="高中">高中</option>
											<option value="职高">职高</option>
											<option value="初中">初中</option>
											<option value="小学">小学</option>
											<option value="文盲或半文盲">文盲或半文盲</option>
										</select>
									</td>
								</tr>
								<tr>
									<td><font color="red">工作地点:</font></td>
									<td>
										<input type="text" name="workspace"  class="city_input  inputFocus proCityQueryAll proCitySelAll current2"  autocomplete="off" id="start1" name="expectArea" readonly="readonly">
									<!--////////////////////////////////////////////////////////////////////////-->
										<div class="provinceCityAll">
										  <div class="tabs clearfix">
										    <ul class="">
										      <li><a href="javascript:" class="current" tb="hotCityAll">热门城市</a></li>
										      <li><a href="javascript:" tb="provinceAll">省份</a></li>
										      <li><a href="javascript:" tb="cityAll" id="cityAll">城市</a></li>
										      <li><a href="javascript:" tb="countyAll" id="countyAll">区县</a></li>
										    </ul>
										  </div>
										  <div class="con">
										    <div class="hotCityAll invis">
										      <div class="pre"><a></a></div>
										      <div class="list">
										        <ul>
										         
										        </ul>
										      </div>
										      <div class="next"><a class="can"></a></div>
										    </div>
										    <div class="provinceAll invis">
										      <div class="pre"><a></a></div>
										      <div class="list">
										        <ul>
										        
										        </ul>
										      </div>
										      <div class="next"><a class="can"></a></div>
										    </div>
										    <div class="cityAll invis">
										      <div class="pre"><a></a></div>
										      <div class="list">
										        <ul>
										          
										        </ul>
										      </div>
										      <div class="next"><a class="can"></a></div>
										    </div>
										    <div class="countyAll invis">
										      <div class="pre"><a></a></div>
										      <div class="list">
										        <ul>
										        </ul>
										      </div>
										      <div class="next"><a class="can"></a></div>
										    </div>
										  </div>
										</div>
									<!--////////////////////////////////////////////////////////////////////////-->
									</td>
									<td>年龄:</td>
									<td><input type="text" id="age1" name="age" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="3"</td>
								</tr>
								<tr>
									<td>身高:</td>
									<td><input type="text" id="height1" name="height" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="3"><span style="padding: 0px; margin-left: -25px;color:#000000;">cm</span></td>
									<td>视力:</td>
									<td><input type="text" id="eyesight1" name="eyesight" onkeyup="value=this.value.replace(/\D+\./g,'')" maxlength="3"></td>
								</tr>
								<tr>
									<td>薪资待遇:</td>
									<td>
									<select id="salary1" name="salary" style="width: 183px;">
											<option value="不限">不限</option>
											<option value="1000以下">1000以下</option>
											<option value="1000~1999">1000~1999</option>
											<option value="2000~2999">2000~2999</option>
											<option value="3000~3999">3000~3999</option>
											<option value="4000~4999">4000~4999</option>
											<option value="5000以上">5000以上</option>
										</select>
									</td>
									<td>用工形式:</td>
									<td>
										<select id="workWay1" name="workWay" style="width: 183px;">
											<option value="不限">不限</option>
											<option value="全职">全职</option>
											<option value="兼职">兼职</option>
											<option value="实习">实习</option>
											<option value="临时">临时</option>
											<option value="小时工">小时工</option>
											<option value="全职/兼职/实习均可">全职/兼职/实习均可</option>
											<option value="就业见习">就业见习</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>招聘期限:</td>
									<td>
										<select name="worklimit" style="width: 183px;">
											<option value="三个月">三个月</option>
											<option value="一个月">一个月</option>
											<option value="六个月">六个月</option>
											<option value="一年">一年</option>
											<option value="长期">长期</option>
										</select>
									</td>
									<td>面试时间:</td>
									<td>
									<input type="text" name="beginDate" id="beginDate"   style="width:178px;height:25px" class="text Wdate"  onfocus="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'});" />
								    <input type="hidden"  name="endDate" id="endDate"  style="width:100px;height:25px" class="text Wdate"  onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDate\')}'});" />
								<tr>
									<td style="vertical-align:top;">其他说明:</td>
									<td colspan="3">
										<textArea cols="50" rows="3" style="resize:none;" id="note1" name="note"></textArea>
									</td>
								</tr>
							</table>
						</form>
						</div>
					</div>
					<p style="text-align:center;">
						<input type="button" id="savaJobs" value="保存">
					</p>
				</div>
			</div>
		</div>
		
		<div id="xmenuSpecialty1" class="xmenu" style="display: none;">
			<div class="select-info">	
					<label class="top-label">已选项：</label>
						<ul>		
						</ul>
						<a  name="menu-confirm" href="javascript:void(0);" class="a-btn">
							<span class="a-btn-text">确定</span>
						</a> 
				</div>	
				[@majorParentList]		
				<dl>
				[#list MajorParentList as majorParent]
					<dt class="open" id="${majorParent.id}">${majorParent.name}</dt>
					<dd>
						<ul>
						[@majorChildrenList parentCodeId = majorParent.codeId]
						[#list MajorChildrenList as majorChildren]
							<li rel="${majorChildren.id}">
									${majorChildren.name}
							</li>
						[/#list]
						[/@majorChildrenList]
						</ul>   
					</dd>
				[/#list]
				</dl>	
				[/@majorParentList]
		</div>
		<div id="xmenuJobs1" class="xmenu" style="display: none;">
			<div class="select-info">	
					<label class="top-label">已选项：</label>
					<ul>		
					</ul>
					<a  name="menu-confirm" href="javascript:void(0);" class="a-btn">
						<span class="a-btn-text">确定</span>
					</a> 
				</div>			
					[@workParentList]		
						<dl>
						[#list WorkParentList as workParent]
						<dt class="open" id="${workParent.id}">${workParent.name}</dt>
						<dd>
							<ul>
							[@workChildrenList parentCodeId = workParent.codeId]
							[#list WorkChildrenList as workChildren]
								<li rel="${workChildren.id}">
										${workChildren.name}
								</li>
							[/#list]
							[/@workChildrenList]
							</ul>   
						</dd>
						[/#list]
						</dl>	
					[/@workParentList]	
		</div>
	</div>
	
	<!--修改密码弹出层********************************************-->
	<style type="text/css">
		.bg{position:absolute;z-index:999;filter:alpha(opacity=50);background:#666;opacity: 0.5;-moz-opacity: 0.5;left:0;top:0;height:100%;width:100%;min-height:1370px;}
		.beian_winBG {MARGIN-TOP: -100px; LEFT: 50%; MARGIN-LEFT: -190px; WIDTH: 376px; POSITION: absolute; TOP: 50%; HEIGHT:200px;border:#666666 1px solid;z-index: 1000;}
		#divOneStep{background-color: #fbfbfb; border: 1px solid #ccc; border-radius: 4px; box-shadow: 0 0 1px #fff inset; margin: 0 auto; padding: 20px 75px; position: relative;text-align: left;width: 240px;}
		.pass_text{margin-top: 10px;border: 1px solid #e3e3e3; border-radius: 3px;height: 30px; margin-bottom: 20px;padding-left: 10px;width: 210px;}
		.btn_submit{background-color: #ff6c1e; border: 1px solid #ef5f06; border-radius: 3px;color: #fff;cursor: pointer;font-size: 14px;font-weight: bold;margin-bottom: 35px; margin-top: 1px;padding: 8px 22px;text-align: left;font-family:"黑体"; /*2014-07-18 北科*/}
	</style>
	<div id="alert_win" style="display:none;">
		<div id="mask" style="top:0;left:0;position: absolute;z-index:1000;" class="bg"></div>
		<DIV class=beian_winBG id=beian_popup><!--弹出框-->
			<div id="divOneStep" style="z-index:1002;height:140px;">
				<div style="width:100%;height:30px;light-height:30px;text-align:right;">
					<a style="font-size: 20px;font-family:"黑体";  position: relative; top: -15px; padding: 6px; left: 70px;" href="javascript:;" onClick="alert_win.style.display='none';">&times;</a>
				</div>
				<div id="need">
					<form action="/user/center/updatepd.jhtml" method="post" id="pdFrom">
						<input type="hidden" name="id" value="${sessionUser.id}">
						<label>新密码</label>
						<input class="pass_text" type="password"  autocomplete="off" name="password"><br/>
						<input class="btn_submit" type="button" value="确定" id="btn_pd">
						<input type="reset" value="重置" class="btn_submit" style="margin-left: 50px;">
					</form>
				</div>
			</div>
		</DIV>
	</div>
	<!--********************************************-->
	[#include "/include/footer.ftl" /]
	<script src="/resource/public/selectArea/js/public.js"></script>
</body>
</html>
