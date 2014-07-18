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
<script type="text/javascript" src="/resource/public/js/admin/kindeditor.js"></script>
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
	</style>
	
<script type="text/javascript">

    	
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
     	// 图片上传
		function loadImgFast(img,i){
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
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml">首页</a> &raquo; 编辑内容
	</div>			
		<table class="input">
			<form id="inputForm" novalidate="novalidate"  action="/admin/enterpriseAudit/update.jhtml" encType="multipart/form-data"   method="post">
					<input type="hidden" name="id" value="${tentUsers.id}">
					<input type="hidden" id="status" name="status" value="${tentUsers.status}">
					<input type="hidden" name="loginName" value="${tentUsers.loginName}">
					<input type="hidden" name="password" value="${tentUsers.password}">
					<tr>
						<td><font color="red">*</font>单位全称:</td>
						<td style="padding-right: 80px;"><input type="text" value="${tentUsers.fullName}" oldvalue="${tentUsers.fullName}" id="fullName" name="fullName" readonly="readonly"></td>
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
								[#if Maps?exists&&Maps?size>0]
									[#list Maps as map]
									<div class="brandImg" id="Img">
										<span><a onclick="file0.click()" href="javascript:void(0);">点击上传图片</a>
										</span>
											<img width="190px" height="48px" src="/${map.url}" name="url" id="${map.id}"/>
											<input type="hidden" name="MapId" value="${map.id}">
									</div>
									<input type="file" style="display:none" id="file0" name="file0" onchange="filename0.value=this.value;loadImgFast(this,0);changex=1;">
									<input type="hidden" id="filename0" name="filename0">
									[/#list]
								[#else]
								<div class="brandImg" id="Img">
									<span><a onclick="file0.click()" href="javascript:void(0);">点击上传图片</a>
									</span>
										<img width="190px" height="48px" src="/resource/public/images/bg.png" name="url" id="0"/>
								</div>
								<input type="file" style="display:none" id="file0" name="file0" onchange="filename0.value=this.value;loadImgFast(this,0);changex=1;">
								<input type="hidden" id="filename0" name="filename0">
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