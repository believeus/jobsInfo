<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>企业审核 - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="/resource/public/js/admin/common.css" rel="stylesheet" type="text/css" />
<link href="/resource/public/js/admin/themes/default/default.css" rel="stylesheet" type="text/css" />
<link href="/resource/public/selectArea/css/css.css" type="text/css" rel="stylesheet">
<link href="/resource/public/selectArea/css/cityLayout.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/resource/public/js/jquery.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/jquery.validate.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/ueditor1_2_6_2/ueditor.config.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/ueditor1_2_6_2/ueditor.all.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/common.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/input.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/list.js"></script>
 <style type="text/css">
	#Img{
		border-color: #B8B8B8 #DCDCDC #DCDCDC #B8B8B8;
	    border-radius: 2px 2px 2px 2px;
	    border-style: solid;
	    border-width: 1px;
	    background-color: #666666;
	    width:190px !important;height:48px !important;
	    position:relative;
	}
	
	#Img span{
		display:block;
		position:absolute;
		top:0px;left:0px;
		width:190px !important;
		height:48px !important;
	}
	
	#Img span:hover{
		background-color:#FFFFFF;
	    opacity: 0.7;
	    filter:alpha(opacity=50);
	    -moz-opacity:0.5;
	    -khtml-opacity: 0.5;
	}
	
	#Img span a{
		display:block;
		position:absolute;
		top:10px !important;
		left:50px !important;
	}
	.list li {
	    line-height: 23px;
	}
	.list input {
		width:80px;
	}
	.qiyepic {
		border: 1px solid;
		float: left;
		height: 215px;
		width: 160px;
		background: #FFFFFF;
		margin-right: 10px;
		margin-bottom: 10px;
	}
	.shipin a {
			color: #9356a4;
		    text-decoration: underline;
		}
	</style>
	<!-- 预览图片 -->
	<style type="text/css">    
		#preview_wrapper1{     
		    display:inline-block;     
		   	width:190px;
		   	height:48px;    
		    background-color:#CCC;
		    margin-top: 10px;     
		}     
		#preview_fake1{ /* 该对象用户在IE下显示预览图片 */   
			border: 1px solid;    
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake1{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;
		    width:0;
		   	height:0;
		}     
		#preview1{ /* 该对象用户在FF下显示预览图片 */     
		  	width:190px;
		   	height:48px;      
		}   
		#upload_img1{
			margin-top: 10px;
			width: 160px;
		} 
		
	</style> 
	
<script type="text/javascript">

	function delete_pic(object,id){	
		deleteImg(id);
		$(object).closest("div").parent().remove();
	}
	function deleteImg(id){
			var deleteImgs = $("#deleteImgs");
								
			if (deleteImgs.length > 0) { 
		     	//对象存在的处理逻辑
	            $("#deleteImgs").val(deleteImgs.val()+","+id);
		    } else {
		      	//对象不存在的处理逻辑
		      	var html='<input id="deleteImgs" type="hidden" name="ids" value="'+id+'"/>';
				$("#inputForm").append(html);
		   }
		}
		
	
	function delete_vedio(object,formId,id){
		deleteVIds(id);
		$(object).closest("div").parent().remove();
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
				$("#inputForm").append(html);
		   }
		
		}
				
    	// 查看电子图是否有改变。
    	var changex=0;
    	
$().ready(function() {
	$("#relationship").val("${tentUsers.relationship}")
	$("#economicType").val("${tentUsers.economicType}");
	$("#unitType").val("${tentUsers.unitType}")
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
		submitHandler: function(form){  
			submitInfo(form);
   		} 
	});
		$("#phoneNum").blur(function(){
			var phoneNum =$(this).val();
			var regPartton=/^(?:13\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/; //验证手机号
			if(!regPartton.test(phoneNum)){
				alert("手机格式不正确！");
			}
		});
		
		// 保存。
		function submitInfo(form){
			var phoneNum =$("#phoneNum").val();
			var regPartton=/^(?:13\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/; //验证手机号
    		
    		if($("#fullName").val() == ""){
    			alert("请输入单位全称");
    		}else if($("#shorName").val() == ""){
    			alert("请输入单位简称");
    		}else if($("#legalMan").val() == ""){
    			alert("请输入法人代表");
    		}else if($("#area").val() == ""){
    			alert("请输入所属地区");
    		}else if($("#trade").val() == ""){
    			alert("请输入所属行业");
    		}else if($("#regMoney").val() == ""){
    			alert("请输入注册资金");
    		}else if($("#detailAddress").val() == ""){
    			alert("请输入详细地址");
    		}else if($("#contacts").val() == ""){
    			alert("请输入联系人");
    		}else if($("#address").val() == ""){
    			alert("请输入通讯地址");
    		}else if($("#zip").val() == ""){
    			alert("请输入邮政编码");
    		}else if($("#phoneNum").val() == ""){
    			alert("请输入手机号码");
    		}else if($("#phoneFax").val() == ""){
    			alert("请输入电话/传真");
    		}else if($("#introduce").val() == ""){
    			alert("请输入单位简介");
    		}else{
    			var tag=false;
    			var selects = $(".input select");//判断下拉框是否选值
	    		selects.each(function(index,obj){
	    			if($(this).val() == ""){
	    				tag=true;
	    				$(this).css("color","red");
	    				if(index == 1){
		    				alert("请选择下拉框信息");
	    				}
	    			}
	    		});
	    		// 判断是否完全通过。
	    		if(tag==false){
					form.submit();
		   		}
    	  }
			
		}
	
});
</script>
 <script type="text/javascript">    
		function onUploadImgChangex(sender,offsetWidth,offsetHeight,preview,preview_fake,preview_size_fake){     
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
		<a href="/admin/common/main.jhtml" target="_parent">首页</a> &raquo; 编辑内容
	</div>			
		<table class="input">
			<form id="inputForm" novalidate="novalidate"  action="/admin/enterpriseAudit/update.jhtml" encType="multipart/form-data"   method="post">
					<input type="hidden" name="id" value="${tentUsers.id}">
					<input type="hidden" id="status" name="status" value="${tentUsers.status}">
					<input type="hidden" name="loginName" value="${tentUsers.loginName}">
					<input type="hidden" name="password" value="${tentUsers.password}">
					<input type="hidden" name="lastLoginData" value="${tentUsers.lastLoginData}" />
					<tr>
						<td><font color="red">*</font>单位全称:</td>
						<td style="padding-right: 80px;">
						<span>${tentUsers.fullName}</span>
						<input type="hidden" value="${tentUsers.fullName}" oldvalue="${tentUsers.fullName}" id="fullName" name="fullName" readonly="readonly">
						</td>
						<td><font color="red">*</font>单位性质:</td>
						<td>
							<select id="unitType" name="unitType" style="width: 235px;" oldvalue="${tentUsers.unitType}">
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
						<td><input type="text" id="shorName" value="${tentUsers.shorName}" name="shorName" oldvalue="${tentUsers.shorName}"></td>
						<td><font color="red">*</font>隶属关系:</td>
						<td>
							<select id="relationship" name="relationship" style="width: 235px;" oldvalue="${tentUsers.relationship}">
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
							<select id="economicType" name="economicType" style="width: 235px;" oldvalue="${tentUsers.economicType}">
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
						<td><input type="text" value="${tentUsers.legalMan}" id="legalMan" name="legalMan" oldvalue="${tentUsers.legalMan}"></td>
					</tr>
					<tr>
						<td><font color="red">*</font>所属地区:</td>
						<td>
							<input type="text" name="area" value="${tentUsers.area}" oldvalue="${tentUsers.area}" class="city_input  inputFocus proCityQueryAll proCitySelAll current2"  autocomplete="off" id="start1" readonly="readonly" style="width:230px !important;">
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
						<td><input type="text"  value="${tentUsers.trade}" id="trade" name="trade" oldvalue="${tentUsers.trade}"></td>
					</tr>
					<tr>
						<td><font color="red">*</font>注册资金:</td>
						<td><input type="text"  value="${tentUsers.regMoney}" id="regMoney" name="regMoney" oldvalue="${tentUsers.regMoney}"><span style="padding:0;margin-left:-35px;color:#000000;">万元</span></td>
						<td><font color="red">*</font>详细地址:</td>
						<td><input type="text"  value="${tentUsers.detailAddress}" id="detailAddress" name="detailAddress" oldvalue="${tentUsers.detailAddress}"></td>
					</tr>
					<tr>
						<td><font color="red">*</font>联系人:</td>
						<td><input type="text"  value="${tentUsers.contacts}" id="contacts" name="contacts" oldvalue="${tentUsers.contacts}"></td>
						<td><font color="red">*</font>通讯地址:</td>
						<td><input type="text"  value="${tentUsers.address}" id="address" name="address" oldavalue="${tentUsers.address}"></td>
					</tr>
					<tr>
						<td><font color="red">*</font>邮编:</td>
						<td><input type="text"  value="${tentUsers.zip}" id="zip" name="zip" oldvalue="${tentUsers.zip}"></td>
						<td><font color="red">*</font>手机:</td>
						<td><input type="text"  value="${tentUsers.phoneNum}" id="phoneNum" name="phoneNum" oldvalue="${tentUsers.phoneNum}"></td>
					</tr>
					<tr>
						<td><font color="red">*</font>电话/传真:</td>
						<td><input type="text"  value="${tentUsers.phoneFax}" id="phoneFax" name="phoneFax" oldvalue="${tentUsers.phoneFax}"></td>
						<td>网址:</td>
						<td><input type="text"  value="${tentUsers.webSite}" id="webSite" name="webSite" oldvalue="${tentUsers.webSite}"></td>
					</tr>
					<tr>
						<td style="vertical-align: top;"><font color="red">*</font>单位简介:</td>
						<td colspan="3"><textArea cols="50" rows="5"  name="introduce" id="introduce" style="resize:none;" value="${tentUsers.introduce}">${tentUsers.introduce}</textArea></td>
					</tr>
						<tr>
							<td style="vertical-align: top;">企业电子图:</td>
							<td>
							<input type="hidden" name="type" value="2">
								[#if Maps?size>0]
									[#list Maps as map]
									 <div id="preview_wrapper1">    
								        <div id="preview_fake1" >    
								            <img id="preview1" onload="onPreviewLoad(this,188,48)" src="/${map.url}" name="url" id="${map.id}"/>
											<input type="hidden" name="MapId" value="${map.id}">
								        </div>    
								    </div>    
								    <br/>    
								    <input id="upload_img1" type="file" oldvalue="${map.url}" name="upload_img" onchange="filename0.value=this.value;onUploadImgChangex(this,188,48,'preview1','preview_fake1','preview_size_fake1');changex=1;"/>  
             						<div style="height: 2px; position: relative; width: 230px; left: 230px; font-size: 12px; top: -74px;">
										建议图片尺寸：宽190px*高48px
									</div>
								    <input type="hidden" id="filename0" name="filename0">
								    <br/>    
								    <img id="preview_size_fake1"/>   
									[/#list]
								[#else]
									 <div id="preview_wrapper1">    
								        <div id="preview_fake1" >    
								            <img id="preview1" onload="onPreviewLoad(this,188,48)" src="/resource/public/images/bg.png"/>
								        </div>    
								    </div>    
								    <br/>    
								    <input id="upload_img1" type="file" oldvalue="" name="upload_img" onchange="filename0.value=this.value;onUploadImgChangex(this,188,48,'preview1','preview_fake1','preview_size_fake1');changex=1;"/>  
	         						<div style="height: 2px; position: relative; width: 230px; left: 230px; font-size: 12px; top: -74px;">
										建议图片尺寸：宽190px*高48px
									</div>
								    <input type="hidden" id="filename0" name="filename0">
								    <br/>    
								    <img id="preview_size_fake1"/>   
								[/#if]
							</td>
						</tr>
						<tr>
						<td>企业图片</td>
						<td>
						[#if Imgs?size>0]
						[#list Imgs as img]
						<div class="qiyepic" [#if img_index==3||img_index==7]style="margin-right: 0px;"[/#if]>
							<img style="width:160px;height:145px" src="/${img.url}"/>
							图片描述：<label>${img.descption}</label>
							<div style="text-align: right; border-top: 1px dashed #E4E4E4; height: 24px; line-height: 24px; margin-right: 3px;"><a onclick="delete_pic(this,${img.id})" href="javascript:void(0);">删除</a></div>
						</div>
						[/#list]
						[/#if]
						</td>
						</tr>
						<tr>
						<td>企业视频</td>
						<td>
						[#if Vedios?size>0]
						[#list Vedios as vedio]
						<div class="shipin" style="overflow:hidden;background:#EEEEEE;margin:0 0px;margin-bottom:15px;">
							<div>已上传视频截图：<a href="/${vedio.url}" title="点击查看" target="_blank">${vedio.originName}</a></div>
							<div>已上传视频文件：<a href="/${vedio.vedioUrl}" title="点击查看" target="_blank">${vedio.vedioName}</a></div>
							<div>视频描述：<lable>${vedio.descption}</label></div>
							<div  style="text-align: right; border-top: 1px dashed #E4E4E4; height: 24px; line-height: 24px; margin-right: 3px;"><a onclick="delete_vedio(this,${vedio_index+1},${vedio.id})"  style="color: #666666;text-decoration: none;" href="javascript:void(0);">删除</a></div>
						</div>
						[/#list]
						[/#if]
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
				</form>
			</table>
			<script src="/resource/public/selectArea/js/public.js"></script>
</body>
</html>