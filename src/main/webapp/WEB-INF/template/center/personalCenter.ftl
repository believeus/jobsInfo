<!DOCTYPE html>
<html>
<head>
    <title>个人中心</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script type="text/javascript" src="/resource/public/js/jquery.js"></script>
    <script type="text/javascript" src="/resource/public/js/jquery.form.js"></script>
    <script type="text/javascript" src="/resource/public/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/resource/public/js/admin/jquery.validate.js"></script>
    <script type="text/javascript"  src="/resource/public/js/Etech.js"></script>
    <link href="/resource/public/js/jquery-X-Menu/css/xmenu.css" rel="stylesheet" type="text/css" />  
    <link href="/resource/public/js/jquery-X-Menu/css/powerFloat.css" rel="stylesheet" type="text/css" /> 
    <link href="/resource/public/selectArea/css/cityLayout.css" type="text/css" rel="stylesheet">
	<link href="/resource/public/selectArea/css/css.css" type="text/css" rel="stylesheet">
	 <link href="/resource/public/js/jquery-ui.css" rel="stylesheet" type="text/css" /> 
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-xmenu.js"></script> 
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-powerFloat-min.js"></script>
	<script type="text/javascript" src="/resource/public/js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="/resource/public/js/waitamoment.js"></script>
	<!--[if gte IE 7]> 
		<script type="text/javascript">   
			$().ready(function(){
				$("#upload_img").css("margin-top","10px");
				$("#upload_img").css("width","122px");
			});
		</script>
	<![endif]--> 
	
	<!-- 预览图片 -->
	<style type="text/css">    
		#preview_wrapper{     
		    display:inline-block;     
		   	width:122px;
		   	height:150px;    
		    background-color:#CCC;     
		}     
		#preview_fake{ /* 该对象用户在IE下显示预览图片 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);     
		}     
		#preview_size_fake{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */     
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);       
		    visibility:hidden;     
		}     
		#preview{ /* 该对象用户在FF下显示预览图片 */     
		  	width:122px;
		   	height:150px;       
		}   
		#upload_img{
			margin-top: 10px;
			width: auto;
		} 
		
	</style> 
	
	<script type="text/javascript">    
		function onUploadImgChange(sender){     
		    if( !sender.value.match( /.jpg|.gif|.png|.bmp/i ) ){     
		        alert('图片格式无效！');     
		        return false;     
		    }     
		         
		    var objPreview = document.getElementById( 'preview' );     
		    var objPreviewFake = document.getElementById( 'preview_fake' );     
		    var objPreviewSizeFake = document.getElementById( 'preview_size_fake' );    
		         
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
		             
		        objPreviewFake.filters.item(     
		            'DXImageTransform.Microsoft.AlphaImageLoader').src = imgSrc;     
		        objPreviewSizeFake.filters.item(     
		            'DXImageTransform.Microsoft.AlphaImageLoader').src = imgSrc;     
		             
		        autoSizePreview( objPreviewFake,      
		            objPreviewSizeFake.offsetWidth, objPreviewSizeFake.offsetHeight );     
		        objPreview.style.display = 'none';     
		    }     
		}     
		    
		function onPreviewLoad(sender){    
		    autoSizePreview( sender, sender.offsetWidth, sender.offsetHeight );     
		}     
		    
		function autoSizePreview( objPre, originalWidth, originalHeight ){     
		    var zoomParam = clacImgZoomParam( 122, 150, 122, 150 );     
		    objPre.style.width = zoomParam.width + 'px';     
		    objPre.style.height = zoomParam.height + 'px';     
		   // objPre.style.marginTop = zoomParam.top + 'px';     
		    //objPre.style.marginLeft = zoomParam.left + 'px';     
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
		    height: 30px;
		    line-height: 30px;
		    text-align: center;
		    width: 130px;
		    float:left;
		    font-family:"黑体"; /*2014-07-18 北科*/
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
			width:150px;
		}
		.list input {
		    width: 45px;
		    font-size:13px;
		    font-family:"黑体"; /*2014-07-18 北科*/
		}
		.currentSwich{
			background:#E36510;
			color:#FFFFFF;
		}
		input[type="radio"] {
			width: 10px !important;
		}
		
		.tzhiyuan th {
		    width: 100px;
		    padding:5px;
		}
		.tzhiyuan td {
		    font-size: 12px;
		    line-height:25px;
		    border-bottom:1px dashed #e4e4e4;
		}
		.tzhiyuan span{
			padding:0;
			color:#000000;
		}
		
		#base_xinxi tr {
		    line-height: 28px;
		}
		
		
		</style>
	
    <script type="text/javascript">
    
    		var a;
    		var b;
    		var c;
    		var d;
    		[#if learnings?size>0]
    			a = ${learnings?size}+1;
    		[#else]
    			a = 2;
    		[/#if]
    		
    		[#if skills?size>0]
    			b = ${skills?size}+1;
    		[#else]
    			b = 2;
    		[/#if]
    		
    		[#if works?size>0]
    			c = ${works?size}+1;
    		[#else]
    			c = 2;
    		[/#if]
    		
    		[#if volunteers?size>0]
    			d = ${volunteers?size}+1;
    		[#else]
    			d = 2;
    		[/#if]
    		
    	function showDialog(id){
			$("#dialog").dialog({
			    bgiframe: true,
			    resizable: false,
			    modal: true,
			    buttons: {
			        '确定': function() {
			        	$(this).dialog('close');
			        	$.ajax({
							url: "/common-user/submit-deleteids.jhtml",
							type: "POST",
							data: {"ids":id},
							dataType: "json",
							cache: false,
							success: function() {
									location.reload(true);
							}
						});
			           
			        },
			        '取消': function() {
			            $(this).dialog('close');
			        }
			    }
			});
			
		}
		
		//删除志愿
		function showDialog_V(id,object){
			$("#dialog_V").dialog({
			    bgiframe: true,
			    resizable: false,
			    modal: true,
			    buttons: {
			        '确定': function() {
			        	$(this).dialog('close');
			        	$.ajax({
							url: "/enterprise-user/center/delete-volunteer.jhtml",
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
			           
			        },
			        '取消': function() {
			            $(this).dialog('close');
			        }
			    }
			});
			
		}
		
		
	    		// 删除信息
		    	function deleteDiv(object,type,tag){
	    				// 得到最外层的div
	    				var div=$(object).parent().parent().parent().parent().parent().parent().parent();
	    				var clazz=div.attr("class");
	    				
	    				if ($("."+clazz).find("div."+clazz+"_div").size() <= 1) {
							// 获取需要删除的id
							var id=$(object).parent().parent().parent().find("input[name='id']");
							if(id.length > 0){
							  id=id.val();
							  showDialog(id);
							}else{
								alert("必须至少保留一个参数");	
								// 清空表单的值。
						 		var tablex=$(object).parent().parent().parent().parent();
								 if(type==1){
								 		tablex.find("#selectSkillSpecialtyhidden"+tag).val("");
								 		tablex.find("#selectSkillJobshidden"+tag).val("");
								 		tablex.find("#skillLevel"+tag).val("");
								 		tablex.find("#workingLifeSkill"+tag).val("");
								 		tablex.find("#noteSkill"+tag).val("");
								 		tablex.find("#selectSkillSpecialty"+tag).find("span").text("选择专业");
								 		tablex.find("#selectSkillJobs"+tag).find("span").text("选择工种");
								 		
								 }else if(type==2){
								 		tablex.find("#beginDateLearning"+tag).val("");
								 		tablex.find("#endDateLearning"+tag).val(""); 
								 		tablex.find("#schoolLearning"+tag).val("");
								 		tablex.find("#deptLearning"+tag).val("");
								 		tablex.find("#selectLearningSpecialtyhidden"+tag).val("");
								 		tablex.find("#selectLearningSpecialty"+tag).find("span").text("选择专业")
								 		
								 }else if(type==3){
								 		tablex.find("#beginDateWork"+tag).val("");
								 		tablex.find("#endDateWork"+tag).val("");  
								 		tablex.find("#workspaceWork"+tag).val("");
								 		tablex.find("#dutyWork"+tag).val("");
								 		tablex.find("#noteWork"+tag).val("");
								 		tablex.find("#selectWorkJobhidden"+tag).val("");
								 		tablex.find("#selectWorkJob"+tag).find("span").text("选择工种")
								 
								 }else if(type==4){
								 		
								 		tablex.find("#selectVolunteerSpecialtyhidden"+tag).val("");
								 		tablex.find("#workWay"+tag).val("");
								 		tablex.find("#selectVolunteerJobshidden"+tag).val("");
								 		tablex.find("#noteVolunteer"+tag).val("");
								 		tablex.find("#start"+tag).val("");
								 		tablex.find("#expectSalaryVolunteer"+tag).val("");
								 		tablex.find("#selectVolunteerSpecialty"+tag).find("span").text("选择专业");
								 		tablex.find("#selectVolunteerJobs"+tag).find("span").text("选择工种");
								 		
								 }					
							}
							
							
						} else {
							// 获取需要删除的id
							var id=$(object).parent().parent().parent().find("input[name='id']");
							
							if(id.length > 0){
								id=id.val();
								showDialog(id);
							}
							
							// 删除。
						   $(object).closest("div").remove();
						}
						 if(type==1&&b>2){
								b--;						 	
						 }else if(type==2&&a>2){
								a--;
						 }else if(type==3&&c>2){
								c--;						 	
						 }else if(type==4&&d>2){
						 		d--;						 	
						 }
					
	    	};
	    	
	    	   // ajax 提交验证和登录。
		    	function deleteIds(value){
		    		
	    			if($("#deleteids").length>0){
		    			var ids=$("#deleteids").val();
						$.ajax({
							url: "/common-user/submit-deleteids.jhtml",
							type: "POST",
							data: {ids:ids},
							dataType: "json",
							cache: false,
							success: function(data) {
								location.href="/common-user/center.jhtml" +value;
								location.reload(true);
								$("#trueName").attr("disabled","disabled");//测试
							}
						})
	    			}else{
	    				location.href="/common-user/center.jhtml" +value;
						location.reload(true);
					}				
				}
	    	
    		
						
    	
    	$().ready(function() {
    		var specialty=$("#Specialty").html();
			var jobs=$("#Jobs").html();
    		
    		$("#personal_xinxi").click(function(){
    			$("#personal_xinxi").removeClass("currentSwich");
    			$("#select_zhiyuan").removeClass("currentSwich");
    			$("#personal_xinxi").addClass("currentSwich");
    			$("#base_xinxi").show();
    			$("#select_zhuti").hide();
    		});
    		$("#select_zhiyuan").click(function(){
    			$("#select_zhiyuan").removeClass("currentSwich");
    			$("#personal_xinxi").removeClass("currentSwich");
    			$("#select_zhiyuan").addClass("currentSwich");
    			$("#select_zhuti").show();
    			$("#base_xinxi").hide();
    		});
    		
    		// 表单验证
			$("#pdFrom").validate({
				rules: {
					password: "required"
				}
			});
    		
		
						
    		
    		
    		//添加具备技能
    		$("#add_jineng").click(function(){
    			// 获取必填项是否有值。
    			var specialtyx=$("#selectSkillSpecialty"+(b-1)).find("span").text();
    			if(specialtyx=="选择专业"){
    				alert("请完整填写必填项！");
    				return false;
    			};
    			[@compress single_line = true]
    				var trHtml = 
					'<div class="jineng_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="SkillForm'+b+'">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">'+b+'</td>
							</tr>
							<tr>
								<td><font color="red">专业：</font></td>
								<td>
									<input type="hidden" id="selectSkillSpecialtyhidden'+b+'" value="" name="majorTypeId">
									
									<div class="topnav">
										<a href="javascript:void(0);" id="selectSkillSpecialty'+b+'" class="as">
											<span>选择专业</span>		
										</a>	
									</div>
								</td>
								<td>技能等级:</td>
								<td style="padding-right:70px;">
									<select id="skillLevel'+b+'" name="skillLevel" style="width:158px;">
										<option value="">请选择..</option>
										<option value="职业资格一级（高级技师）">职业资格一级（高级技师）</option>
										<option value="职业资格二级（技师）">职业资格二级（技师）</option>
										<option value="职业资格三级（高级）">职业资格三级（高级）</option>
										<option value="职业资格四级（中级）">职业资格四级（中级）</option>
										<option value="职业资格五级（初级）">职业资格五级（初级）</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>工种:</td>
								<td>
									<input type="hidden" id="selectSkillJobshidden'+b+'" value="" name="workTypeId">
									<input type="hidden" value="1" name="infoType">
									<div class="topnav">
										<a class="as" href="javascript:void(0);" id="selectSkillJobs'+b+'">
											<span>选择工种</span>		
										</a>	
									</div>
								</td>
								<td>从事年限:</td>
								<td><input type="text" name="workingLife" id="workingLifeSkill'+b+'">年</td>
							</tr>
							<tr>
								<td>说明:</td>
								<td colspan="3"><textArea name="note" id="noteSkill'+b+'" cols="50" style="resize:none;"></textArea></td>
								<td rowspan="3"><a class="delete_jineng"  onclick="deleteDiv(this,1,'+b+')" href="javascript:void(0);" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
						</form>
					</div>';
					
				[/@compress]
				
				if($(".jineng").find("div.jineng_div").size() <6){
					$(".jineng").append(trHtml);
					$("#xmenuSkillSpecialty"+b).html(specialty);
					$("#xmenuSkillJobs"+b).append(jobs);
				}else{
					alert("最多添加6条数据");
				}
				
				// 为新增的标签添加弹窗控件
				$("#selectSkillSpecialty"+b).xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuSkillSpecialty"+b,//弹出层
							emptytext:"选择专业",
							hiddenID : "selectSkillSpecialtyhidden"+b//隐藏域ID	
				});
				$("#selectSkillJobs"+b).xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuSkillJobs"+b,//弹出层
							emptytext:"选择专业",
							hiddenID : "selectSkillJobshidden"+b//隐藏域ID	
				});
				
				// 绑定工种
				 var xmenulijobs="#xmenuSkillJobs"+b+" li";
				 var selectjobs="#selectSkillJobs"+b;
				 var selectjobshidden="#selectSkillJobshidden"+b;
				 var xmenuSkillJobs="#xmenuSkillJobs"+b;
				 
				 $(xmenulijobs).click(function(){	
				 	 	$(selectjobs).find("span").text($(this).text());
				   		$(selectjobshidden).val($(this).attr("rel"));
				   		$(xmenuSkillJobs).hide();
				 
				 })
				 
				 //绑定专业
				 var xmenuliSpecialty="#xmenuSkillSpecialty"+b+" li";
				 var selectSpecialty="#selectSkillSpecialty"+b;
				 var selectSpecialtyhidden="#selectSkillSpecialtyhidden"+b;
				 var xmenuSkillSpecialty="#xmenuSkillSpecialty"+b;
				 
				 $(xmenuliSpecialty).click(function(){	
				 	 	$(selectSpecialty).find("span").text($(this).text());
				   		$(selectSpecialtyhidden).val($(this).attr("rel"));
				   		$(xmenuSkillSpecialty).hide();
				 
				 })
				
				if($(".jineng").find("div.jineng_div").size() <6){
					b ++;
				}
				
    		});
    		
    		//添加学习经历
    		$("#add_xuexi").click(function(){
    			// 获取必填项是否有值。
    			var beginDateLearning=$("#beginDateLearning"+(a-1)).val();
    			var endDateLearning=$("#endDateLearning"+(a-1)).val();
    			var schoolLearning=$("#schoolLearning"+(a-1)).val();
    			var selectLearningSpecialtyhidden=$("#selectLearningSpecialtyhidden"+(a-1)).val();
    			if(beginDateLearning==""||endDateLearning==""||schoolLearning==""||selectLearningSpecialtyhidden==""){
    				alert("请完整填写必填项！");
    				return false;
    			};
    			[@compress single_line = true]
    				var trHtml = 
    				'<div class="xuexi_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="LearningForm'+a+'">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">'+a+'</td>
							</tr>
							<tr>
								<td><font color="red">起始时间:</font></td>
								<td colspan="3">
								<input type="text" name="beginDateLearning'+a+'" id="beginDateLearning'+a+'" eidLearning="beginDateLearning'+a+'" style="width:100px;height:25px" class="text Wdate" value="${(beginDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: new Date()});"  />
								<font color="red">结束时间:</font> <input type="text" name="endDateLearning'+a+'" id="endDateLearning'+a+'" eidLearning="endDateLearning'+a+'" style="width:100px;height:25px" class="text Wdate" value="${(endDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: \'#F{$dp.$D(beginDateLearning'+a+')}\'});"/>
								<input type="hidden" name="beginData" value=""/>
								<input type="hidden" name="endData" value=""/>
								</td>
							</tr>
							<tr>
								<td><font color="red">学校名称:</font></td>
								<td style="padding-right:100px;"><input type="text" id="schoolLearning'+a+'" name="workspace"></td>
								<td>系别:</td>
								<td><input type="text" id="deptLearning'+a+'" name="dept"> </td>
							</tr>
							<tr>
								<td><font color="red">专业：</font></td>
								<td colspan="3">
									<input type="hidden" value="" id="selectLearningSpecialtyhidden'+a+'" name="majorTypeId" value=""/>
									<input type="hidden" value="2" name="infoType">
									<input type="hidden" value="" id="LearningId'+a+'"/>
									<div class="topnav">
										<a id="selectLearningSpecialty'+a+'" href="javascript:void(0);" class="as">
											<span >
												选择专业
											</span>		
										</a>	
									</div>
								</td>
								<td rowspan="3"><a class="delete_xuexi"  onclick="deleteDiv(this,2,'+a+')" href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
						</form>
					</div>';
				[/@compress]
				
				if($(".xuexi").find("div.xuexi_div").size() <6){
					$(".xuexi").append(trHtml);
					$("#xmenuLearningSpecialty"+a).html(specialty);
				}else{
					alert("最多添加6条数据");
				}
				
				// 为新增的标签添加弹窗控件
				$("#selectLearningSpecialty"+a).xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuLearningSpecialty"+a,//弹出层
							emptytext:"选择专业",
							hiddenID : "selectLearningSpecialtyhidden"+a//隐藏域ID	
				});
				
				 //绑定专业
				 var xmenuliSpecialty="#xmenuLearningSpecialty"+a+" li";
				 var selectSpecialty="#selectLearningSpecialty"+a;
				 var selectSpecialtyhidden="#selectLearningSpecialtyhidden"+a;
				 var xmenuSkillSpecialty="#xmenuLearningSpecialty"+a;
				 
				 $(xmenuliSpecialty).click(function(){	
				 	 	$(selectSpecialty).find("span").text($(this).text());
				   		$(selectSpecialtyhidden).val($(this).attr("rel"));
				   		$(xmenuSkillSpecialty).hide();
				 
				 })
				
				if($(".xuexi").find("div.xuexi_div").size() <6){
					a ++;
				}
				
    		});
    		
    		//添加工作经历
    		$("#add_gongzuo").click(function(){
    			// 获取必填项是否有值。
    			var beginDateWork=$("#beginDateWork"+(c-1)).val();
    			var endDateWork=$("#endDateWork"+(c-1)).val();
    			var workspaceWork=$("#workspaceWork"+(c-1)).val();
    			var dutyWork=$("#dutyWork"+(c-1)).val();
    			if(beginDateWork==""||endDateWork==""||workspaceWork==""||dutyWork==""){
    				alert("请完整填写必填项！");
    				return false;
    			};
    			[@compress single_line = true]
    				var trHtml = 
    				'<div class="gongzuo_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="WorkForm'+c+'">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">'+c+'</td>
							</tr>
							<tr>
								<td><font color="red">起始时间:</font></td>
								<td colspan="3">
								<input type="text" id="beginDateWork'+c+'" name="beginDateWork'+c+'" eidWork="beginDateWork'+c+'" style="width:100px;height:25px" class="text Wdate" value="${(beginDate?string("yyyy-MM-dd"))!}"  onfocus="WdatePicker({maxDate: new Date()});"  />
								<font color="red">结束时间:</font> <input type="text" id="endDateWork'+c+'" eidWork="endDateWork'+c+'" name="endDateWork'+c+'" style="width:100px;height:25px"class="text Wdate"value="${(endDate?string("yyyy-MM-dd"))!}"  onfocus="WdatePicker({minDate: \'#F{$dp.$D(beginDateWork'+c+')}\'});" />
								<input type="hidden" name="beginData" value=""/>
								<input type="hidden" name="endData" value=""/>
								</td>	
							</tr>
							<tr>
								<td><font color="red">工作单位:</font></td>
								<td style="padding-right:100px;"><input type="text" id="workspaceWork'+c+'" name="workspace"></td>
								<td><font color="red">职务:</font></td>
								<td><input type="text" id="dutyWork'+c+'" name="duty"></td>
							</tr>
							<tr>
								<td>工种:</td>
								<td>
									<input type="hidden" value="" id="selectWorkJobhidden'+c+'" name="workTypeId"/>
									<input type="hidden" value="3" name="infoType">
									<div class="topnav">
										<a id="selectWorkJob'+c+'" href="javascript:void(0);" class="as">
											<span >
												选择工种
											</span>		
										</a>	
									</div>
								</td>
								<td>工作内容:</td>
								<td ><input type="text" id="noteWork'+c+'" name="note"></td>
								<td rowspan="3"><a class="delete_gongzuo"  onclick="deleteDiv(this,3,'+c+')" href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
						</form>
					</div>';
				[/@compress]
				
				if($(".gongzuo").find("div.gongzuo_div").size() <6){
					$(".gongzuo").append(trHtml);
					$("#xmenuWorkJob"+c).html(jobs);
				}else{
					alert("最多添加6条数据");
				}
				
				// 为新增的标签添加弹窗控件
				$("#selectWorkJob"+c).xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuWorkJob"+c,//弹出层
							emptytext:"选择专业",
							hiddenID : "selectWorkJobhidden"+c//隐藏域ID	
				});
				
				// 绑定工种
				 var xmenuliWorks="#xmenuWorkJob"+c+" li";
				 var selectWorks="#selectWorkJob"+c;
				 var selectWorkshidden="#selectWorkJobhidden"+c;
				 var xmenuWorks="#xmenuWorkJob"+c;
				 
				 $(xmenuliWorks).click(function(){	
				 	 	$(selectWorks).find("span").text($(this).text());
				   		$(selectWorkshidden).val($(this).attr("rel"));
				   		$(xmenuWorks).hide();
				 
				 })
				
				if($(".gongzuo").find("div.gongzuo_div").size() <6){
					c ++;
				}
    		});
    		
    		
    	});
    </script>
    <script type="text/javascript">
    			
    		
    		//检查图片是否需要重新上传。
			var checkChange=0;
			
			
		    $().ready(function() {
		    	// 初始化一些值。设置value为用户填写过的项选中。
		    	$("#polity").val("${sessionUser.polity}");
		    	$("#marriage").val("${sessionUser.marriage}");
		    	$("#eduLevel").val("${sessionUser.eduLevel}");
		    	$("#health").val("${sessionUser.health}");
		    	$("#sex").val("${sessionUser.sex}");
		    	var specialty=$("#Specialty").html();
				var jobs=$("#Jobs").html();
				
		    	[#if skills?size>0]
		    		[#list skills as skill]
						$("#xmenuSkillSpecialty"+${skill_index+1}).html(specialty);
						$("#xmenuSkillJobs"+${skill_index+1}).append(jobs);
		    			//技能专业
						$("#selectSkillSpecialty"+${skill_index+1}).xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuSkillSpecialty"+${skill_index+1},//弹出层
							emptytext:"选择专业",
							hiddenID : "selectSkillSpecialtyhidden"+${skill_index+1},//隐藏域ID	
							value :"${skill.majorType.id}"  // 设置已经保存过的值。
						});
						// 技能工种
						$("#selectSkillJobs"+${skill_index+1}).xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuSkillJobs"+${skill_index+1},//弹出层
							emptytext:"选择工种",
							hiddenID : "selectSkillJobshidden"+${skill_index+1},//隐藏域ID	
							value : "${skill.workType.id}"
						});
						$("#skillLevel"+${skill_index+1}).val("${skill.skillLevel}");
								
						 $(document).on("click","#xmenuSkillSpecialty${skill_index+1} li",function(){
					       $("#selectSkillSpecialty${skill_index+1} span").text($(this).text());
						   $("#selectSkillSpecialtyhidden${skill_index+1}").val($(this).attr("rel"));
						   $("#xmenuSkillSpecialty${skill_index+1}").hide();
					   
					   });
					   
					   $(document).on("click","#xmenuSkillJobs${skill_index+1} li",function(){
					       $("#selectSkillJobs${skill_index+1} span").text($(this).text());
						   $("#selectSkillJobshidden${skill_index+1}").val($(this).attr("rel"));
						   $("#xmenuSkillJobs${skill_index+1}").hide();
					   
					   });
			   
		    		[/#list]
		    	[#else]
				$("#xmenuSkillSpecialty1").html(specialty);
				$("#xmenuSkillJobs1").append(jobs);
		    		//技能专业
				$("#selectSkillSpecialty1").xMenu({	
					width :600,	
					eventType: "click", //事件类型 支持focus click hover
					dropmenu:"#xmenuSkillSpecialty1",//弹出层
					emptytext:"选择专业",
					hiddenID : "selectSkillSpecialtyhidden1"//隐藏域ID	
				});
				// 技能工种
				$("#selectSkillJobs1").xMenu({	
					width :600,	
					eventType: "click", //事件类型 支持focus click hover
					dropmenu:"#xmenuSkillJobs1",//弹出层
					emptytext:"选择工种",
					hiddenID : "selectSkillJobshidden1"//隐藏域ID	
				});
				
			   $(document).on("click","#xmenuSkillSpecialty1 li",function(){
			       $("#selectSkillSpecialty1 span").text($(this).text());
				   $("#selectSkillSpecialtyhidden1").val($(this).attr("rel"));
				   $("#xmenuSkillSpecialty1").hide();
			   
			   });
			   
			    $(document).on("click","#xmenuSkillJobs1 li",function(){
			       $("#selectSkillJobs1 span").text($(this).text());
				   $("#selectSkillJobshidden1").val($(this).attr("rel"));
				   $("#xmenuSkillJobs1").hide();
			   
			   });
			   
		    	[/#if]
		    	
		    	// long 类型转时间类型
		    	function long_to_date(time){
				    var datetime = new Date();
				    datetime.setTime(time);
				    var year = datetime.getFullYear();
				    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
				    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
				    var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
				    var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
				    var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
				    return year + "-" + month + "-" + date;
				}
				
		    	//学习经历
		    	[#if learnings?size>0]
		    		[#list learnings as learning]
					$("#xmenuLearningSpecialty"+${learning_index+1}).html(specialty);
					
		    		// 学习经历专业
					$("#selectLearningSpecialty"+${learning_index+1}).xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuLearningSpecialty"+${learning_index+1},//弹出层
						emptytext:"选择专业",
						hiddenID : "selectLearningSpecialtyhidden"+${learning_index+1},//隐藏域ID
						value : "${learning.majorType.id}"
					});
					var beginDate=$("input[eidLearning='beginDateLearning"+${learning_index+1}+"']").val();
					var endDate=$("input[eidLearning='endDateLearning"+${learning_index+1}+"']").val();
					if(beginDate!=""||endDate!=""){
    					$("input[eidLearning='beginDateLearning"+${learning_index+1}+"']").val(long_to_date(${learning.beginData}));
						$("input[eidLearning='endDateLearning"+${learning_index+1}+"']").val(long_to_date(${learning.endData}));		
					}
					
					$(document).on("click","#xmenuLearningSpecialty${learning_index+1} li",function(){
				       $("#selectLearningSpecialty${learning_index+1} span").text($(this).text());
					   $("#selectLearningSpecialtyhidden${learning_index+1}").val($(this).attr("rel"));
					   $("#xmenuLearningSpecialty${learning_index+1}").hide();
					   
					 });
					  
		    		[/#list]
		    	[#else]
					$("#xmenuLearningSpecialty1").html(specialty);
					
			    	// 学习经历专业
					$("#selectLearningSpecialty1").xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuLearningSpecialty1",//弹出层
						emptytext:"选择专业",
						hiddenID : "selectLearningSpecialtyhidden1"//隐藏域ID	
					});
					
					 $(document).on("click","#xmenuLearningSpecialty1 li",function(){
					       $("#selectLearningSpecialty1 span").text($(this).text());
						   $("#selectLearningSpecialtyhidden1").val($(this).attr("rel"));
						   $("#xmenuLearningSpecialty1").hide();
					  });
		    	[/#if]	
		    	
		    	// 工作经验
		    	[#if works?size>0]
		    		[#list works as work]
						$("#xmenuWorkJob"+${work_index+1}).html(jobs);
		    			// 工作经历工种
						$("#selectWorkJob"+${work_index+1}).xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuWorkJob"+${work_index+1},//弹出层
							emptytext:"选择工种",
							hiddenID : "selectWorkJobhidden"+${work_index+1},//隐藏域ID
							value : "${work.workType.id}"	
						});
						// long 类型转日期类型
						var beginDate=$("input[eidWork='beginDateWork"+${work_index+1}+"']").val();
						var endDate=$("input[eidWork='endDateWork"+${work_index+1}+"']").val();
						if(beginDate!=""||endDate!=""){
							$("input[eidWork='beginDateWork"+${work_index+1}+"']").val(long_to_date(${work.beginData}));
							$("input[eidWork='endDateWork"+${work_index+1}+"']").val(long_to_date(${work.endData}));
						}
						
						$(document).on("click","#xmenuWorkJob${work_index+1} li",function(){
						    $("#selectWorkJob${work_index+1} span").text($(this).text());
                            $("#selectWorkJobhidden${work_index+1}").val($(this).attr("rel"));
                            $("#xmenuWorkJob${work_index+1}").hide();
                        });
		    		[/#list]
		    	[#else]
					$("#xmenuWorkJob1").html(jobs);
		    		// 工作经历工种
					$("#selectWorkJob1").xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuWorkJob1",//弹出层
						emptytext:"选择工种",
						hiddenID : "selectWorkJobhidden1"//隐藏域ID	
					});
					
					$(document).on("click","#xmenuWorkJob1 li",function(){
						    $("#selectWorkJob1 span").text($(this).text());
                            $("#selectWorkJobhidden1").val($(this).attr("rel"));
                            $("#xmenuWorkJob1").hide();
                     });
					
		    	[/#if]	
		    	
					$("#xmenuVolunteerSpecialty1").html(specialty);
					$("#xmenuVolunteerJobs1").html(jobs);	
					
		    		//志愿专业
					$("#selectVolunteerSpecialty1").xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuVolunteerSpecialty1",//弹出层
						emptytext:"选择专业",
						hiddenID : "selectVolunteerSpecialtyhidden1"//隐藏域ID	
					});
					// 志愿工种
					$("#selectVolunteerJobs1").xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuVolunteerJobs1",//弹出层
						emptytext:"选择工种",
						hiddenID : "selectVolunteerJobshidden1"//隐藏域ID	
					});
				
					
				$("#phoneNum").blur(function(){
					var phoneNum =$(this).val();
					var regPartton=/^(?:13\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/; //验证手机号
					if(!regPartton.test(phoneNum)){
						alert("手机格式不正确！");
					}
				});
				
    	
    			// 提交信息列表
    			function submitSkill(){
    				// alert("xxxxx具备技能xxxxxxxxxx");
    				  // 获取form表单个数
    				  var size=$(".jineng").find("div.jineng_div").size();
    				  $("div.jineng_div").each(function(index){
    				  		index++;
				 			$("#SkillForm"+index).ajaxSubmit({
				            	 type: "post",
							     url: "/common-user/center/submit-comInfo.jhtml",
							     dataType: "json",
							     success: function(result){
							     	if(index==size){
				 		   				submitLearnging();  
							     	}
							     }
			        		});	
    				  })
    			}
    			
    			function submitLearnging(){
    				 //alert("xxxxx学习经历xxxxxxxxxx");
    				   // 获取form表单个数
    				  var size=$(".xuexi").find("div.xuexi_div").size();
    				  $("div.xuexi_div").each(function(index){
		    				var tag=false;
    				  		index++;
    				  		// 转换时间类型为long类型。
    				  		var beginDate=$("#beginDateLearning"+index).val();
							var endDate=$("#endDateLearning"+index).val();
	    					if(beginDate!=""||endDate!=""){
		    					beginDate=new Date(beginDate.replace(/-/g,"/")).getTime();
	    						endDate=new Date(endDate.replace(/-/g,"/")).getTime(); 				
	    					}else{
	    						tag=true;
	    					}
	    					$(this).find("input[name='beginData']").val(beginDate);
	    					$(this).find("input[name='endData']").val(endDate);
	    					if(tag==false){
		    					$("#LearningForm"+index).ajaxSubmit({
					            	 type: "post",
								     url: "/common-user/center/submit-comInfo.jhtml",
								     dataType: "json",
								     success: function(result){
								     	if(index==size){
					 		   				submitWorks();    				 						     	
								     	}
								     }
				        		});	
	    					}else{
	    						if(index==size){
					 		   		submitWorks();    				 						     	
								}
	    					}
	    					
	    				 })
    			}
    			
    			function submitWorks(){
    				
    				var value = "#gr";
    				
    				//alert("xxxxxxxx工作经验xxxxxxx");
    				  // 获取form表单个数
    				  var size=$(".gongzuo").find("div.gongzuo_div").size();
    				  $("div.gongzuo_div").each(function(index){
		   				    var tag=false;
    				  		index++;
    				  		var beginDate=$("#beginDateWork"+index).val();
							var endDate=$("#endDateWork"+index).val();
							if(beginDate!=""||endDate!=""){
		    					beginDate=new Date(beginDate.replace(/-/g,"/")).getTime();
	    						endDate=new Date(endDate.replace(/-/g,"/")).getTime(); 				
	    					}else{
	    						tag=true;
	    					}
	    					if(tag==false){
		    				  $(this).find("input[name='beginData']").val(beginDate);
		    				  $(this).find("input[name='endData']").val(endDate);
		    				  $("#WorkForm"+index).ajaxSubmit({
					            	type: "post",
								     url: "/common-user/center/submit-comInfo.jhtml",
								     dataType: "json",
								     success: function(result){
								     	if(index==size){
					 		   				deleteIds(value);    				 						     	
								     	}
								     }
				        		});
	    					}else{
	    						if(index==size){
					 		   		deleteIds(value);    				 						     	
								}
	    					}
    				  })
    			}
    			
    			function submitVolunteer(){
    			
    					var value= "#zy";
    				  //alert("xxxxxxxx选择志愿xxxxxxx");
    				  // 获取form表单个数
    				  var size=$(".zhiyuan").find("div.zhiyuan_div").size();
    				  $("div.zhiyuan_div").each(function(index){
    				  		index++;
    				  		$("#VolunteerForm"+index).ajaxSubmit({
    				  			 type: "post",
							     url: "/common-user/center/submit-comInfo.jhtml",
							     dataType: "json",
							     success: function(result){
							     	if(index==size){
				 		   				deleteIds(value);    				 						     	
							     	}
							     }
			        		});
    				  })
    				 
    			}
    			
  			
		  			function showDialog(id,object){
					$("#dialog").dialog({
					    bgiframe: true,
					    resizable: false,
					    modal: true,
					    buttons: {
					        '确定': function() {
					        	$(this).dialog('close');
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
					           
					        },
					        '取消': function() {
					            $(this).dialog('close');
					        }
					    }
					});
					
				}
  			
  			
				// ajax 提交验证和保存，先提交图片再提交个人信息。
				function submitValid(submitx){
						showdiv();
						// 上传图片，并且得到图片路径返回值。
						if(checkChange==1){
							$("#imageForm").ajaxSubmit(function (data) {
								data=data.replace("<PRE>","").replace("</PRE>","");
								var imgHead = $("#imgHead");
								 //如果大于0 标识 id 为imgHead的对象存在，否则不存在
								 if (imgHead.length > 0) { 
							     	//对象存在的处理逻辑
						            $("#imgHead").val(data);
							    } else {
							      	//对象不存在的处理逻辑
							      	var html='<input id="imgHead" type="hidden" name="imgHead" value="'+data+'">';
									$("#InfoForm").append(html);
							   }
					            submitInfo(submitx);
					            return false;
				        	});	
						}else{
							submitInfo(submitx);
						}
						
					}
					
		    	// 提交用户信息
				function submitInfo(submitx){
						$("#freeTrain").val($('input:radio[name="freeTrain"]:checked').val());
						$("#freeIntro").val($('input:radio[name="freeIntro"]:checked').val());
						$("#submit").val(submitx);
						
						$("#InfoForm").ajaxSubmit({
				  			 type: "post",
						     url: "/ajaxComValidReg.jhtml",
						     dataType: "json",
						     success: function(data){
		        				if(data.message == "success" && $("#submit").val() == "submit"){
									submitSkill();
								}else if(data.property=="idcardIsNull"){
									// 设置年龄和性别为可填写。
									$("#ageH").attr("style","");
									$("#ageS").attr("style","display: none");
									$("#sexH").attr("style","");
									$("#sexS").attr("style","display: none");
								}else if(data.property!="idcardIsNull"&&data.property!="idcard"){
									// 设置年龄和性别为可填写。
									$("#ageH").attr("style","display: none");
									$("#ageS").attr("style","");
									$("#sexH").attr("style","display: none");
									$("#sexS").attr("style","");
									var sex="男";
									if(data.sex=="woman"){
										sex="女";
									}
									$("#ageH").find("input").val(data.age);
									$("#ageS").find("input").val(data.age);
									$("#ageS").find("label").html(data.age);
									$("#sexH").find("input").val(data.sex);
									$("#sexS").find("input").val(data.sex);
									$("#sexS").find("label").html(sex);
									$("#age").val(data.age);
									$("#sex").val(data.sex);
								}
								if(data.message!=""||data.property=="idcard"||data.property=="idcardIsNull"){
									if(data.message!="finish"&&data.message != "success" ){
										alert(data.message);										
									}								
								}
						     }
			        	});
				}
		    	// 用户名验证。
				$("#idcard,#phoneNum").change(function(){
					submitInfo("nosubmit");
				});
				
				// 保存其他信息。
				$("#saveInfo").click(function() {
					var loginName=$("#loginName").val();
					var phoneNum =$("#phoneNum").val();
					var regPartton=/^(?:13\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/; //验证手机号
					
					var dataTime=$("#beginDate");
					var isStudy=$("#schoolLearning1");
					if(isStudy.val() != "" && dataTime.val() == ""){
						alert("请选择学习经历时间");
						return false;
					}
					
					submitValid("submit");
				});
				//保存志愿。
				$("#saveVolunteer").click(function() {
					if($("#start1").val()==""){
		    			alert("请选择地区");
		    			return false;
		    		}else if($("#selectVolunteerJobshidden1").val()==""){
		    			alert("请选择工种");
		    			return false;
		    		}
			
					showdiv();
					submitVolunteer();
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
					     	 location.replace("/common-user/center.jhtml");	
					     }
		        	});	
				});
			
			})
		</script>
	<script type="text/javascript">
    	$().ready(function(){
    		if(window.location.hash == "#zy"){
    			$("#personal_xinxi").removeClass("currentSwich");
    			$("#select_zhiyuan").removeClass("currentSwich");
    			$("#select_zhiyuan").addClass("currentSwich");
    			$("#base_xinxi").css("display","none");
    			$("#select_zhuti").css("display","block");
    		}
    		if(window.location.hash == "#gr"){
    			$("#personal_xinxi").removeClass("currentSwich");
    			$("#select_zhiyuan").removeClass("currentSwich");
    			$("#personal_xinxi").addClass("currentSwich");
    			$("#select_zhuti").css("display","none");
    			$("#base_xinxi").css("display","block");
    		}
    	});
	</script>
</head>
<body>
	[#include "/include/header.ftl" /]
	<div class="j_main w">
		<div class="j_main_left">
			<div class="j_main_left_1" style="background:url(/resource/public/images/ggwsydl.png) no-repeat; width:258px; height:222px;border:1px solid #f2c49f;">
				<table style="margin:55px 0 0 15px;" border="0">
					<!--<tr>
						<td colspan="2" align="center" style="background:#EE981F;color:#FFFFFF;border-radius:4px;">用户登录</td>
					</tr>-->
					<tr>
						<td height="45" align="center" width="30"><img src="/resource/public/images/dlr.png" /></td>
						<td style="font-family:'黑体';font-size:17px;color:#ef4300;">${sessionUser.loginName}</td>
						<td style="font-family:'黑体';font-size:17px;color:#858585;">，欢迎您登录！</td>
					</tr>
					<tr>
						<td height="45" align="center"><img src="/resource/public/images/dlsj.png" /></td>
						<td style="font-family:'宋体';font-size:12px;color:#858585;">上次登录</td>
						<td style="font-family:'宋体';font-size:12px;color:#858585;">${sessionUser.lastLoginData?number_to_datetime}&nbsp;${sessionUser.lastLoginData?number_to_time}</td>
					</tr>
					<tr>
						<td align="center" colspan="3" height="60">
							<input type="button" style="background:url(/resource/public/images/ggw-yhdlh.png) no-repeat; width:113px;height:37px;border:0;color:#ffffff;font-size:16px;font-weight:bold;font-family:'黑体';" value="个人中心"
							onclick="javascript:[#if sessionUser.class.name == "com.etech.entity.TcomUser"]window.location.href='/common-user/center.jhtml';[#else] window.location.href='/enterprise-user/center.jhtml';[/#if]" 
							>
							<input type="button" onclick="Etech.logout();" style="width:104px;height:37px; background:url(/resource/public/images/tc.png) no-repeat;border:0;">
						</td>
					</tr>
				</table>
			</div>
			<div class="j_main_left_1" style="margin-top:10px;height:auto;text-align:center;border:1px solid #E4630F;border-radius:4px;">
				<p style="background: #EE981F; text-align: center; margin: 5px; padding: 5px; border-radius: 5px; border: 0px none; color: #FFFFFF;">职位推荐</p>
				[#list recommendTrecruit as recruit]
				<div class="j_main_left_1_1">
					<p style="color: blue;font-weight:bold;">${recruit.workType.name}</p>
					<p><font color="black">招聘单位:</font><a target="_blank" href="/enterpriseInformation.jhtml?id=${recruit.entUser.id}" style="color: blue;">${recruit.company}</a></p>
					<p>薪资待遇:${recruit.salary}</p>
					<p>招聘人数：${recruit.worknum}</p>
					<p>学历要求：${recruit.eduLevel}</p>
				</div>
				[/#list]
			</div>
		</div>
		<div class="j_main_right" id="conentDiv">
			<div class="j_main_right_1">
				<p>
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-left: 2px; margin-top: 2px; margin-right: 5px;">
					所在位置 > 个人中心
				</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;">
				<div class="j_main_right_2_1">
					<div id="personal_xinxi" class="j_main_right_2_1_1 currentSwich" style="cursor:pointer;">个人信息</div>
					<div id="select_zhiyuan" class="j_main_right_2_1_2" style="cursor:pointer;">选择志愿</div>
				</div>
				<p>
					<span>登记编号:${sessionUser.id}</span>
					<span style="float: right; padding-right: 20px;">更新日期:${sessionUser.editDate?number_to_datetime}&nbsp;${sessionUser.editDate?number_to_time}</span>
				</p>
				
				<div id="base_xinxi" style="width::728px;height:auto;overflow:hidden;">
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">基本信息</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 525px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input id="update_mima" type="button" value="修改密码" onClick="alert_win.style.display='block';" style="cursor:pointer;width: 80px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<div class="" style="height: auto; overflow: hidden; float: left; width: 230px; margin-left: 30px; margin-top: 10px;margin-right:10px;">
						<form novalidate="novalidate"  action="/ajaxComValidReg.jhtml" method="post" id="InfoForm">
							<input type="hidden" name="id" value="${sessionUser.id}">
							<input type="hidden" name="submit" value="nosubmit" id="submit">
							<input type="hidden" name="freeTrain" value="${sessionUser.freeTrain}" id="freeTrain">
							<input type="hidden" name="freeIntro" value="${sessionUser.freeIntro}" id="freeIntro">
							[#if sessionUser.imgHead?exists]
								<input type="hidden" name="imgHead" value="${sessionUser.imgHead}" id="imgHead">
							[/#if]
						
							<table>
								<tr>
									<td>姓名:</td>
									<td>
									<label>${sessionUser.trueName}</label>
									<input type="hidden" id="trueName" readonly="readonly" name="trueName" value="${sessionUser.trueName}">
									</td>
								</tr>
								<tr>
									<td>登录名:</td>
									<td>
									<label>${sessionUser.loginName}</label>
									<input type="hidden" id="loginName" readonly="readonly" name="loginName" value="${sessionUser.loginName}">
									</td>
								</tr>
								<tr>
									<td>年龄:</td>
									<td id="ageS" [#if sessionUser.idcard!=""]style=""[#else]style="display: none"[/#if]>
										<label>${sessionUser.age}</label>
									</td>
									<td id="ageH" [#if sessionUser.idcard!=""]style="display: none"[#else]style=""[/#if]>
										<input type="text" id="age" name="age" value="${sessionUser.age}"  onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="3">
									</td>
									
								</tr>
								<tr>
									<td>民族:</td>
									<td><input type="text" id="nation" name="nation" value="${sessionUser.nation}"></td>
								</tr>
								<tr>
									<td>政治面貌:</td>
									<td>
										<select id="polity" name="polity" style="width:158px;">
											<option value="">请选择..</option>
											<option value="中共党员">中共党员</option>
											<option value="共青团员">共青团员</option>
											<option value="民主党派">民主党派</option>
											<option value="普通公民">普通公民</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>婚姻状况:</td>
									<td>
										<select id="marriage" name="marriage" style="width:158px;">
											<option value="">请选择..</option>
											<option value="未婚">未婚</option>
											<option value="已婚">已婚</option>
											<option value="离异">离异</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>视力:</td>
									<td><input type="text" id="eyesight" name="eyesight" value="${sessionUser.eyesight}"></td>
								</tr>
								<tr>
									<td>个人特长:</td>
									<td><input type="text" id="strongPoint" name="strongPoint" value="${sessionUser.strongPoint}"></td>
								</tr>
								<tr>
									<td>手机号码:</td>
									<td><input type="text" id="phoneNum" name="phoneNum" value="${sessionUser.phoneNum}" minlegnth="11" maxlength="11"  onkeyup="value=this.value.replace(/\D+/g,'')"></td>
								</tr>
								<tr>
									<td>二女户:</td>
									<td>
										<input type="radio"  name="twoGirl" value="1" [#if sessionUser.twoGirl=="1"]checked="true"[#elseif sessionUser.twoGirl!="0"]checked="true"[/#if] style="width:10px">是
										<input type="radio"  name="twoGirl" value="0" [#if sessionUser.twoGirl=="0"]checked="true"[/#if]style="width:10px">否
									</td>
								</tr>
							</table>
						</div>
						<div style="width:0px;height:320px;border-left:1px solid #C9C9C9;float:left;"></div>
						<div class="" style="float: left; margin-left: 15px; overflow: hidden; width: 235px; margin-top: 10px;">
							<table>
								<tr>
									<td>性别:</td>
									<td id="sexS" [#if sessionUser.idcard!=""]style=""[#else]style="display: none"[/#if]>
										<label>
										[#if sessionUser.sex=="woman"]女[#else]男[/#if]
										</label>
									</td>
									<td id="sexH" [#if sessionUser.idcard!=""]style="display: none"[#else]style=""[/#if]>
										<select id="sex" name="sex" style="width:158px;">
											<option value="">请选择..</option>
											<option value="man">男</option>
											<option value="woman">女</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>密码:</td>
									<td>
									<label>保密</label>
									<input type="hidden" id="password"  name="password" placeholder="不填" readonly="readonly"></td>
								</tr>
								<tr>
									<td>身份证号:</td>
									<td><input type="text" id="idcard" name="idcard" value="${sessionUser.idcard}"  onkeyup="value=this.value.replace(/\D+/g,'')" minlength="15" minlength="18"></td>
								</tr>
								<tr>
									<td>文化程度:</td>
									<td>
										<select id="eduLevel" name="eduLevel" style="width:158px;">
											<option value="">请选择..</option>
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
									<td>身高:</td>
									<td><input type="text" id="height" name="height" value="${sessionUser.height}" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="3"><span style="padding: 0px; margin-left: -25px;color:#000000;">cm</span></td>
								</tr>
								<tr>
									<td>健康状况:</td>
									<td>
										<select id="health" name="health" style="width:158px;">
											<option value="">请选择..</option>
											<option value="健康">健康</option>
											<option value="患病">患病</option>
											<option value="残疾">残疾</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>家庭地址:</td>
									<td><input type="text" id="address" name="address" value="${sessionUser.address}"></td>
								</tr>
								<tr>
									<td style="font-size: 12px;">原工作单位:</td>
									<td><input type="text"  id="workspace" name="workspace" value="${sessionUser.workspace}"></td>
								</tr>
								<tr>
									<td style="font-size: 12px;">就失业证号:</td>
									<td><input type="text" id="jobId" name="jobId" value="${sessionUser.jobId}"onkeyup="value=this.value.replace(/\D+/g,'')"></td>
								</tr>
								<tr>
									<td>独生子女:</td>
									<td>
										<input type="radio" name="singleChild" value="1" [#if sessionUser.singleChild=="1"]checked="true"[#elseif sessionUser.singleChild!="0"]checked="true"[/#if] style="width:0">是
										<input type="radio" name="singleChild" value="0" [#if sessionUser.singleChild=="0"]checked="true"[/#if]style="width:0">否
									</td>
								</tr>
							</table>
							</form>
						</div>
						<div id="add_header" style="width: 150px; float: left; margin-left: 15px; height: auto; margin-top: 15px;">
								<form novalidate="novalidate"  action="/upload.jhtml" method="post" encType="multipart/form-data" id="imageForm">
									 <div id="preview_wrapper">    
								        <div id="preview_fake" >    
								       	 <img id="preview" onload="onPreviewLoad(this)" src="[#if sessionUser.imgHead!=""]/${sessionUser.imgHead}[#else]/resource/public/images/bg1.png[/#if]"/>    
								        </div>    
								    </div>    
								    <br/>    
								    <input id="upload_img" type="file" name="upload_img" onchange="filename0.value=this.value;checkChange=1;onUploadImgChange(this)"/>  
								     <div style="color: #000000; font-size: 12px; position: relative; padding-top: 25px; width: 122px;text-align:center;">建议图片大小：</div>
             						 <div style="color: #000000; font-size: 12px; position: relative; padding: 0px; width: 122px;text-align:center;">宽122px*高150px</div>  
								    <input type="hidden" id="filename0" name="filename0">
								    <br/>    
								    <img id="preview_size_fake"/>    
								</form>			
						</div>
					</div>
					<div id="dialog" title="&nbsp;" style="display: none;">
							<p style="text-align: center;">确定要删除吗？</p>
					</div>
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">具备技能&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">(红色字体为必填项)</font>
						</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 405px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div class="add_s" style="float: left; width: 50px; margin-left: 15px;">
							<input id="add_jineng" type="button" value="添加" style="cursor:pointer;width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div class="jineng">
					[#if skills?size>0]
					[#list skills as skill]
						<div class="jineng_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="SkillForm${skill_index+1}">						
						<table >
						
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">${skill_index+1}</td>
							</tr>
							<tr>
								<td><font color="red">专业：</font></td>
								<td>
									<input type="hidden" id="selectSkillSpecialtyhidden${skill_index+1}" name="majorTypeId" value="${skill.majorType.id}"/>
									<input type="hidden" value="1" name="infoType">
									<input type="hidden" value="${skill.id}" name="id">
									<div class="topnav">
										<a id="selectSkillSpecialty${skill_index+1}" href="javascript:void(0);" class="as">
											<span >
											 
											[#assign name=skill.majorType.name]
											 [#if name!=""]
											 	[#if name?length > 15]
													${name?string?substring(0,15)}...
												[#else]
													${name}
												[/#if]
											 [#else]
											 	选择专业
											 [/#if]
											</span>		
										</a>	
									</div>
								</td>
								<td>技能等级:</td>
								<td style="padding-right:70px;">
									<select id="skillLevel${skill_index+1}" name="skillLevel" style="width:158px;">
										<option value="">请选择..</option>
										<option value="职业资格一级（高级技师）">职业资格一级（高级技师）</option>
										<option value="职业资格二级（技师）">职业资格二级（技师）</option>
										<option value="职业资格三级（高级）">职业资格三级（高级）</option>
										<option value="职业资格四级（中级）">职业资格四级（中级）</option>
										<option value="职业资格五级（初级）">职业资格五级（初级）</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>工种:</td>
								<td>
									<input type="hidden" value="${skill.workType.id}" id="selectSkillJobshidden${skill_index+1}" name="workTypeId"/>
									<div class="topnav">
										<a id="selectSkillJobs${skill_index+1}" href="javascript:void(0);" class="as">
											<span >
												[#assign name=skill.workType.name]
												[#if name!=""]
													[#if name?length > 15]
														${name?string?substring(0,15)}...
													[#else]
														${name}
													[/#if]
												[#else]
													选择工种
												[/#if]
											</span>		
										</a>	
									</div>
								</td>
								<td>从事年限:</td>
								<td><input type="text" id="workingLifeSkill${skill_index+1}" name="workingLife" value="${skill.workingLife}">年
								</td>
							</tr>
							<tr>
								<td>说明:</td>
								<td colspan="3"><textArea cols="50" style="resize:none;" name="note"  id="noteSkill${skill_index+1}">${skill.note}</textArea></td>
								<td rowspan="3"><a class="delete_jineng" onclick="deleteDiv(this,1,${skill_index+1})"  href="javascript:void(0);" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
						</form>
					</div>
							
						[/#list]
					[#else]
						
					<div class="jineng_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="SkillForm1">						
						<table>
						
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">1</td>
							</tr>
							<tr>
								<td><font color="red">专业：</font></td>
								<td>
									<input type="hidden" value="" id="selectSkillSpecialtyhidden1" name="majorTypeId"/>
										<input type="hidden" value="1" name="infoType">
									<div class="topnav">
										<a id="selectSkillSpecialty1" href="javascript:void(0);" class="as">
											<span>选择专业</span>		
										</a>	
									</div>
								</td>
								<td>技能等级:</td>
								<td style="padding-right:70px;">
									<select id="skillLevel1" name="skillLevel" style="width:158px;">
										<option value="">请选择..</option>
										<option value="职业资格一级（高级技师）">职业资格一级（高级技师）</option>
										<option value="职业资格二级（技师）">职业资格二级（技师）</option>
										<option value="职业资格三级（高级）">职业资格三级（高级）</option>
										<option value="职业资格四级（中级）">职业资格四级（中级）</option>
										<option value="职业资格五级（初级）">职业资格五级（初级）</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>工种:</td>
								<td>
									<input type="hidden" value="" id="selectSkillJobshidden1" name="workTypeId"/>
									<div class="topnav">
										<a id="selectSkillJobs1" href="javascript:void(0);" class="as">
											<span >
												选择工种
											</span>		
										</a>	
									</div>
								</td>
								<td>从事年限:</td>
								<td><input type="text" id="workingLifeSkill1" name="workingLife">&nbsp;年
								</td>
							</tr>
							<tr>
								<td>说明:</td>
								<td colspan="3"><textArea cols="50" style="resize:none;" name="note" id="noteSkill1"></textArea></td>
								<td rowspan="3"><a class="delete_jineng"  onclick="deleteDiv(this,1,1)" href="javascript:void(0);" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
						</form>
					</div>
					[/#if]
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">学习经历&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">(红色字体为必填项)</font></span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 405px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div class="add_s" style="float: left; width: 50px; margin-left: 15px;">
							<input id="add_xuexi" type="button" value="添加" style="cursor:pointer;width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div class="xuexi">
					
					[#if learnings?size>0]
					[#list learnings as learning]
						<div class="xuexi_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="LearningForm${learning_index+1}">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">${learning_index+1}</td>
							</tr>
							<tr>
								<td><font color="red">起始时间:</font></td>
								<td colspan="2"><!--${(beginDate?string('yyyy-MM-dd'))!} ${(endDate?string('yyyy-MM-dd'))!}-->
								<input type="text" name="beginDateLearning${learning_index+1}" id="beginDateLearning${learning_index+1}"  eidLearning="beginDateLearning${learning_index+1}" style="width:100px;height:25px" class="text Wdate" value="2012-01-23" onfocus="WdatePicker({maxDate: new Date()});"  />
								<font color="red">结束时间:</font> <input type="text"  name="endDateLearning${learning_index+1}" id="endDateLearning${learning_index+1}" eidLearning="endDateLearning${learning_index+1}" style="width:100px;height:25px" class="text Wdate" value="2120-05-21" onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDateLearning${learning_index+1}\')}'});" />
								<input type="hidden" name="beginData" value=""/>
								<input type="hidden" name="endData" value=""/>
								</td>
								[#if learning_index==0]								
									<td>
										先选择时间，否则无法保存。
									</td>
								[/#if]
							</tr>
							<tr>
								<td><font color="red">学校名称:</font></td>
								<td style="padding-right:100px;">
								<input type="text" id="schoolLearning${learning_index+1}" name="workspace"  value="${learning.workspace}"></td>
								<td>系别:</td>
								<td><input type="text" id="deptLearning${learning_index+1}" name="dept" value="${learning.dept}"></td>
							</tr>
							<tr>
								<td><font color="red">专业：</font></td>
								<td colspan="3">
									<input type="hidden" value="${learning.majorType.id}" id="selectLearningSpecialtyhidden${learning_index+1}" name="majorTypeId"/>
									<input type="hidden" value="2" name="infoType">
									<input type="hidden" value="${learning.id}" name="id">
									<div class="topnav">
										<a id="selectLearningSpecialty${learning_index+1}" href="javascript:void(0);" class="as">
											<span >
												[#assign name=learning.majorType.name]
												[#if name!=""]
													[#if name?length > 15]
														${name?string?substring(0,15)}...
													[#else]
														${name}
													[/#if]
												[#else]
													选择专业
												[/#if]
											</span>		
										</a>	
									</div>
								</td>
								<td rowspan="3"><a class="delete_xuexi" onclick="deleteDiv(this,2,${learning_index+1})" href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
						</form>
					</div>
					[/#list]
					[#else]
					<div class="xuexi_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="LearningForm1">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">1</td>
							</tr>
							<tr>
								<td><font color="red">起始时间:</font></td>
								<td colspan="2">
								<input type="text" name="beginDateLearning1" id="beginDateLearning1"  eidLearning="beginDateLearning1" style="width:100px;height:25px" class="text Wdate" value="${(beginDateLearning1?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: new Date()});" />
								<font color="red">结束时间:</font> <input type="text"  name="endDateLearning1" id="endDateLearning1" eidLearning="endDateLearning1" style="width:100px;height:25px" class="text Wdate" value="${(endDateLearning1?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDateLearning1\')}'});" />
								<input type="hidden" name="beginData" value=""/>
								<input type="hidden" name="endData" value=""/>
								</td>
								<td>
									先选择时间，否则无法保存。
								</td>
							</tr>
							<tr>
								<td><font color="red">学校名称:</font></td>
								<td style="padding-right:100px;">
								<input type="text" id="schoolLearning1" name="workspace"></td>
								<td>系别:</td>
								<td><input type="text" id="deptLearning1" name="dept" ></td>
							</tr>
							<tr>
								<td><font color="red">专业：</font></td>
								<td colspan="3">
									<input type="hidden" value="" id="selectLearningSpecialtyhidden1" name="majorTypeId"/>
									
									<input type="hidden" value="2" name="infoType">
									<div class="topnav">
										<a id="selectLearningSpecialty1" href="javascript:void(0);" class="as">
											<span >
												选择专业
											</span>		
										</a>	
									</div>
								</td>
								<td rowspan="3"><a class="delete_xuexi"  onclick="deleteDiv(this,2,1)"  href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
						</form>
					</div>
					
					[/#if]
					
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">工作经历&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">(红色字体为必填项)</font></span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 405px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div class="add_s" style="float: left; width: 50px; margin-left: 15px;">
							<input id="add_gongzuo" type="button" value="添加" style="cursor:pointer;width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div class="gongzuo">
					[#if works?size>0]
						[#list works as work]
						<div class="gongzuo_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="WorkForm${work_index+1}">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">${work_index+1}</td>
							</tr>
							<tr>
								<td><font color="red">起始时间:</font></td>
								<td colspan="2">
								<input type="text" eidWork="beginDateWork${work_index+1}" id="beginDateWork${work_index+1}" name="beginDateWork${work_index+1}" style="width:100px;height:25px" class="text Wdate" value="1990-01-01" onfocus="WdatePicker({maxDate: new Date()});" />
								<font color="red">结束时间:</font> <input type="text" eidWork="endDateWork${work_index+1}" id="endDateWork${work_index+1}" name="endDateWork${work_index+1}" style="width:100px;height:25px" class="text Wdate" value="1990-01-01" onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDateWork${work_index+1}\')}'});" />
								<input type="hidden" name="beginData" value=""/>
								<input type="hidden" name="endData" value=""/>
								</td>
								[#if work_index==0]								
									<td>
										先选择时间，否则无法保存。
									</td>
								[/#if]
							</tr>
							<tr>
								<td><font color="red">工作单位:</font></td>
								<td style="padding-right:100px;"><input type="text" id="workspaceWork${work_index+1}" name="workspace" value="${work.workspace}"></td>
								<td><font color="red">职务:</font></td>
								<td><input type="text" id="dutyWork${work_index+1}" name="duty" value="${work.duty}"></td>
							</tr>
							<tr>
								<td>工种:</td>
								<td>
									<input type="hidden" value="${work.workType.id}" id="selectWorkJobhidden${work_index+1}" name="workTypeId"/>
									<input type="hidden" value="3" name="infoType">
									<input type="hidden" value="${work.id}" name="id">
									<div class="topnav">
										<a id="selectWorkJob${work_index+1}" href="javascript:void(0);" class="as">
											<span >
												[#assign name=work.workType.name]
												[#if name!=""]
													[#if name?length > 15]
														${name?string?substring(0,15)}...
													[#else]
														${name}
													[/#if]
												[#else]
												 	选择工种
												[/#if]
											</span>		
										</a>	
									</div>
								</td>
								<td>工作内容:</td>
								<td ><input type="text" id="noteWork${work_index+1}" name="note" value="${work.note}"></td>
								<td rowspan="3"><a class="delete_gongzuo" href="javascript:void(0);" onclick="deleteDiv(this,3,${work_index+1})">删除</a></td>
							</tr>
						</table>
						</form>
					</div>
						[/#list]
						[#else]
						<div class="gongzuo_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="WorkForm1">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">1</td>
							</tr>
							<tr>
								<td><font color="red">起始时间:</font></td>
								<td colspan="2">
								<input type="text" eidWork="beginDateWork1" id="beginDateWork1" name="beginDateWork1" style="width:100px;height:25px" class="text Wdate" value="${(beginDateWork1?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: new Date()});" />
								<font color="red">结束时间:</font> <input type="text" eidWork="endDateWork1" id="endDateWork1" name="endDateWork1" style="width:100px;height:25px" class="text Wdate" value="${(endDateWork1?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDateWork1\')}'});" />
								<input type="hidden" name="beginData" value=""/>
								<input type="hidden" name="endData" value=""/>
								</td>
								<td>
									先选择时间，否则无法保存。
								</td>
							</tr>
							<tr>
								<td><font color="red">工作单位:</font></td>
								<td style="padding-right:100px;"><input type="text" id="workspaceWork1" name="workspace"></td>
								<td><font color="red">职务:</font></td>
								<td><input type="text" id="dutyWork1" name="duty"></td>
							</tr>
							<tr>
								<td>工种:</td>
								<td>
									<input type="hidden" value="" id="selectWorkJobhidden1" name="workTypeId"/>
									
									<input type="hidden" value="3" name="infoType">
									<div class="topnav">
										<a id="selectWorkJob1" href="javascript:void(0);" class="as">
											<span >
												选择工种
											</span>		
										</a>	
									</div>
								</td>
								<td>工作内容:</td>
								<td ><input type="text" id="noteWork1" name="note"></td>
								<td rowspan="3"><a class="delete_gongzuo"  onclick="deleteDiv(this,3,1)" href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
						</form>
					</div>
					[/#if]
					
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">就业服务</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 600px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td>享受免费职业培训:</td>
								<td style="padding-right:100px;">
									<input type="radio" name="freeTrain" [#if sessionUser.freeTrain=="1"]checked="true"[#elseif sessionUser.freeTrain!="0"]checked="true"[/#if] style="width:0" value="1">是
									<input type="radio" name="freeTrain" [#if sessionUser.freeTrain=="0"]checked="true"[/#if] style="width:0" value="0">否
								</td>
								<td>享受免费职业介绍:</td>
								<td>
									<input type="radio" name="freeIntro" [#if sessionUser.freeIntro=="1"]checked="true"[#elseif sessionUser.freeIntro!="0"]checked="true"[/#if] style="width:0" value="1">是
									<input type="radio" name="freeIntro" [#if sessionUser.freeIntro=="0"]checked="true"[/#if]style="width:0" value="0">否
								</td>
							</tr>
						</table>
					</div>
					
					<p style="text-align:center;">
						<input type="button" id="saveInfo" value="保存">
					</p>
				</div>
				
				<div id="select_zhuti" style="width:728px;height:auto;;overflow:hidden;display:none;">
					<div class="tzhiyuan" style="height: auto; text-align: center; border: 1px solid #e4e4e4; margin: 5px 20px; width: 685px;">
						<table cellspacing="0">
							<tr style="background:#F0F0F0;">
								<th>专业</th>
								<th>工种</th>
								<th>择业地区</th>
								<th>月薪要求</th>
								<th>工作性质</th>
								<th>其他要求</th>
								<th>操作</th>
							</tr>
							[#list volunteers as volunteer]
							[#if volunteer.infoType == 4]
							
							<tr>
								<td><span title="${volunteer.majorType.name}">
									[#if volunteer.majorType.name?length > 7]
										${volunteer.majorType.name?string?substring(0,7)}...
									[#else]
										${volunteer.majorType.name}
									[/#if]
								</span></td>
								<td><span title="${volunteer.workType.name}">
									[#if volunteer.workType.name?length > 7]
										${volunteer.workType.name?string?substring(0,7)}...
									[#else]
										${volunteer.workType.name}
									[/#if]
								</span></td>
								<td><span title="${volunteer.expectArea}">
									[#if volunteer.expectArea?length > 7]
										${volunteer.expectArea?string?substring(0,7)}...
									[#else]
										${volunteer.expectArea}
									[/#if]
								</span></td>
								<td><span title="${volunteer.expectSalary}">${volunteer.expectSalary}</span></td>
								<td><span title="${volunteer.workWay}">${volunteer.workWay}</span></td>
								<td><span title="${volunteer.note}">
									[#if volunteer.note?length > 7]
										${volunteer.note?string?substring(0,7)}...
									[#else]
										${volunteer.note}
									[/#if]
								</span></td>
								<td>
									<a href="/editVolunteer.jhtml?id=${volunteer.id}">编辑</a>
									<a href="javascript:void(0)" onclick="showDialog_V(${volunteer.id},this)">删除</a>
									<div id="dialog_V" title="&nbsp;" style="display: none;">
										<p style="text-align: center;">确定要删除吗？</p>
									</div>
								</td>
							</tr>
							[/#if]
							[/#list]
						</table>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">添加选择志愿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">(红色字体为必填项)</font></span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 405px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div class="zhiyuan">
						<div class="zhiyuan_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="VolunteerForm1">	
						<table>
							<tr>
								<td>专业：</td>
								<td>
									<input type="hidden" value="" id="selectVolunteerSpecialtyhidden1" name="majorTypeId"/>
									<script>
									   $(function(){
									     $("#xmenuVolunteerSpecialty1 li").click(function(){
									     $("#selectVolunteerSpecialty1 span").text($(this).text());
										 $("#selectVolunteerSpecialtyhidden1").val($(this).attr("rel"));
										 $("#xmenuVolunteerSpecialty1").hide();	   
										});		
									  });
									</script>
									<input type="hidden" value="4" name="infoType">
									<div class="topnav">
										<a id="selectVolunteerSpecialty1" href="javascript:void(0);" class="as">
											<span >
												选择专业
											</span>		
										</a>	
									</div>
								</td>
								<td><font color="red">择业地区:</font></td>
								<td>
									<input type="text"  class="city_input  inputFocus proCityQueryAll proCitySelAll current2"  autocomplete="off" id="start1" name="expectArea" readonly="readonly">
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
							</tr>
							<tr>
								
								<td><font color="red">工种:</font></td>
								<td>
									<input type="hidden" value="" id="selectVolunteerJobshidden1" name="workTypeId"/>
									<script>
									   $(function(){
									     $("#xmenuVolunteerJobs1 li").click(function(){
									     $("#selectVolunteerJobs1 span").text($(this).text());
										 $("#selectVolunteerJobshidden1").val($(this).attr("rel"));
										 $("#xmenuVolunteerJobs1").hide();	   
										});
									  });
									</script>
									<div class="topnav">
										<a id="selectVolunteerJobs1" href="javascript:void(0);" class="as">
											<span >
												选择工种
											</span>		
										</a>	
									</div>
								</td>
								<td>月薪要求:</td>
								<td style="padding-right:70px;">
									
									<select id="expectSalaryVolunteer1" name="expectSalary">
										<option value="1000以下">1000以下</option>
										<option value="1000~1999">1000~1999</option>
										<option value="2000~2999">2000~2999</option>
										<option value="3000~3999">3000~3999</option>
										<option value="4000~4999">4000~4999</option>
										<option value="5000以上">5000以上</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>工作性质</td>
								<td colspan="3">
									<select name="workWay" id="workWay1">
										<option value="全职">全职</option>
										<option value="兼职">兼职</option>
										<option value="实习">实习</option>
										<option value="小时工">小时工</option>
										<option value="全职/兼职/实习即可">全职/兼职/实习即可</option>
										<option value="就业见习">就业见习</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>其他要求:</td>
								<td colspan="3"><textArea cols="50" name="note" id="noteVolunteer1" style="resize:none;"></textArea></td>
							</tr>
						</table>
						</form>
					</div>
					
					</div>
					<p style="text-align:center;">
						<input type="button" id="saveVolunteer" value="保存">
					</p>
				</div>
				</div>
			</div>
		</div>
		
		<!--具备技能--->
		<div id="xmenuSkillSpecialty1" class="xmenu" style="display: none;"></div>
		<div id="xmenuSkillJobs1" class="xmenu" style="display: none;"></div>
		
		<div id="xmenuSkillSpecialty2" class="xmenu" style="display: none;"></div>
		<div id="xmenuSkillJobs2" class="xmenu" style="display: none;"></div>
		
		<div id="xmenuSkillSpecialty3" class="xmenu" style="display: none;"></div>
		<div id="xmenuSkillJobs3" class="xmenu" style="display: none;"></div>
		
		<div id="xmenuSkillSpecialty4" class="xmenu" style="display: none;"></div>
		<div id="xmenuSkillJobs4" class="xmenu" style="display: none;"></div>
		
		<div id="xmenuSkillSpecialty5" class="xmenu" style="display: none;"></div>
		<div id="xmenuSkillJobs5" class="xmenu" style="display: none;"></div>
		
		<div id="xmenuSkillSpecialty6" class="xmenu" style="display: none;"></div>
		<div id="xmenuSkillJobs6" class="xmenu" style="display: none;"></div>
		
		<!--学习经历 -->
		<div id="xmenuLearningSpecialty1" class="xmenu" style="display: none;"></div>
		
		<div id="xmenuLearningSpecialty2" class="xmenu" style="display: none;"></div>
		
		<div id="xmenuLearningSpecialty3" class="xmenu" style="display: none;"></div>
		
		<div id="xmenuLearningSpecialty4" class="xmenu" style="display: none;"></div>
		
		<div id="xmenuLearningSpecialty5" class="xmenu" style="display: none;"></div>
		
		<div id="xmenuLearningSpecialty6" class="xmenu" style="display: none;"></div>
		
    	
    	<!--工作经历 -->
    	<div id="xmenuWorkJob1" class="xmenu" style="display: none;"></div>
    	
    	<div id="xmenuWorkJob2" class="xmenu" style="display: none;"></div>
    	
    	<div id="xmenuWorkJob3" class="xmenu" style="display: none;"></div>
    	
    	<div id="xmenuWorkJob4" class="xmenu" style="display: none;"></div>
    	
    	<div id="xmenuWorkJob5" class="xmenu" style="display: none;"></div>
    	
    	<div id="xmenuWorkJob6" class="xmenu" style="display: none;"></div>
    	
    	
    	<!-- 选择志愿-->
    	<div id="xmenuVolunteerSpecialty1" class="xmenu" style="display: none;"></div>
    	<div id="xmenuVolunteerJobs1" class="xmenu" style="display: none;"></div>
    	
    	<div id="xmenuVolunteerSpecialty2" class="xmenu" style="display: none;"></div>
    	<div id="xmenuVolunteerJobs2" class="xmenu" style="display: none;"></div>
    	
    	<div id="xmenuVolunteerSpecialty3" class="xmenu" style="display: none;"></div>
    	<div id="xmenuVolunteerJobs3" class="xmenu" style="display: none;"></div>
    	
    	<div id="xmenuVolunteerSpecialty4" class="xmenu" style="display: none;"></div>
    	<div id="xmenuVolunteerJobs4" class="xmenu" style="display: none;"></div>
    	
    	<div id="xmenuVolunteerSpecialty5" class="xmenu" style="display: none;"></div>
    	<div id="xmenuVolunteerJobs5" class="xmenu" style="display: none;"></div>
    	
    	<div id="xmenuVolunteerSpecialty6" class="xmenu" style="display: none;"></div>
    	<div id="xmenuVolunteerJobs6" class="xmenu" style="display: none;"></div>
    	
		<!--数据 -->
		<div id="Specialty" class="xmenu" style="display: none;">
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
			<div id="Jobs" class="xmenu" style="display: none;">
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
		<!--数据-->
	</div>
	
	<!--修改密码弹出层********************************************-->
	<style type="text/css">
		.bg{position:absolute;z-index:999;filter:alpha(opacity=50);background:#666;opacity: 0.5;-moz-opacity: 0.5;left:0;top:0;height:100%;width:100%;min-height:1323px;}
		.beian_winBG {MARGIN-TOP: -100px; LEFT: 50%; MARGIN-LEFT: -190px; WIDTH: 376px; POSITION: absolute; TOP: 50%; HEIGHT:200px;border:#666666 1px solid;z-index: 1000;}
		#divOneStep{background-color: #fbfbfb; border: 1px solid #ccc; border-radius: 4px; box-shadow: 0 0 1px #fff inset; margin: 0 auto; padding: 20px 75px; position: relative;text-align: left;width: 240px;}
		.pass_text{border: 1px solid #e3e3e3; border-radius: 3px;height: 30px; margin-bottom: 20px;padding-left: 10px;width: 210px;}
		.btn_submit{background-color: #ff6c1e; border: 1px solid #ef5f06; border-radius: 3px;color: #fff;cursor: pointer;font-size: 14px;font-weight: bold;margin-bottom: 35px; margin-top: 1px;padding: 8px 22px;text-align: left;font-family:"黑体"; /*2014-07-18 北科*/}
	</style>
	<div id="alert_win" style="display:none;">
		<div id="mask" style="top:0;left:0;position: absolute;z-index:1000;" class="bg"></div>
		<DIV class=beian_winBG id=beian_popup><!--弹出框-->
			<div id="divOneStep" style="z-index:1002;height:140px;">
				<div style="width:100%;height:30px;light-height:30px;text-align:right;">
					<a style="font-size: 20px;font-family:'黑体'; position: relative; top: -15px; padding: 6px; left: 70px;" href="javascript:;" onClick="alert_win.style.display='none';">&times;</a>
				</div>
				<div id="need">
					<form action="/user/center/updatepd.jhtml" method="post" id="pdFrom">
						<input type="hidden" name="id" value="${sessionUser.id}">
						<input class="pass_text" type="password" autocomplete="off" name="password" placeholder="新密码"><br/>
						<input class="btn_submit" type="button" value="确定" id="btn_pd">
						<input type="reset" value="重置" class="btn_submit" style="margin-left: 50px;">
					</form>
				</div>
			</div>
		</DIV>
	</div>
	<!--********************************************-->
	
	<!-- alpha div -->
	<div id="maskLayer" style="display:none">
	<div id="alphadiv" style="filter:alpha(opacity=50);-moz-opacity:0.5;opacity:0.5"></div>
		<div id="drag">
			<h3 id="drag_h"><b>请选择居住地</b><span onclick="boxAlpha()">关闭</span></h3>
			<div id="drag_con">
				<div id="residencyAlpha" class="residencyAlpha">
					<div id="maincity" class="maincity"></div>
					<div id="allProv" class="allProv"></div>
				</div>
			</div><!-- drag_con end -->
		</div>
	</div><!-- maskLayer end -->
	</div>
	<!-- alpha div end -->
	<div id="sublist" class="sublist" style="display:none"></div>
	
	<script src="/resource/public/selectArea/js/public.js"></script>
	[#include "/include/footer.ftl" /]
	<script type="text/javascript">
		$().ready(function(){
			var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
			var isOpera = userAgent.indexOf("Opera") > -1;
			
			if (isOpera){return "Opera"}; //判断是否Opera浏览器
			if (userAgent.indexOf("Firefox") > -1){//判断是否Firefox浏览器
				//alert("Firefox浏览器");
				$("#box").css("right","988px");
				$("#box").css("top","50px");
				return "FF";
			} 
			if (userAgent.indexOf("Safari") > -1){return "Safari";} //判断是否Safari浏览器
			if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera){
				//alert("IE浏览器");
				$("#add_header").css("display","inline-block");
				$("#add_header").css("float","none");
				$(".add_s").css("display","inline-block");
				$(".add_s").css("margin-left","0");
			} ; //判断是否IE浏览器
		});
	</script>
</body>
</html>