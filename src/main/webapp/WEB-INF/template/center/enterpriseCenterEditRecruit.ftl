<!DOCTYPE html>
<html>
<head>
    <title>企业中心</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
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
	
	<!--  引入文件上传组件-->
	<link href="/resource/public/js/uploadify3.2.1/uploadify.css" rel="stylesheet"/>
	<script src="/resource/public/js/uploadify3.2.1/jquery.uploadify.js" charset="utf-8"></script>

    <script type="text/javascript">
    	$().ready(function(){
    	$("#workyear1").val("${recruit.workyear}");
    	$("#workWay1").val("${recruit.workWay}");
    	$("#salary1").val("${recruit.salary}");
    	$("#worklimit1").val("${recruit.worklimit}");
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
		}
		.j_main_right_2_1_2{
		    text-align: center;
		    line-height: 30px;
		    font-size: 16px;
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
		    height: 215px;
		    width: 160px;
		    background:#FFFFFF;
		    margin-right:10px;
		    margin-bottom:10px;
		}
		.qiyepic p{
			margin:0;
		}
		.qiyepic img {
		    height: 145px;
		    width: 160px;
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
		    font-size: 13px;
		    border-bottom: 1px dashed #E4E4E4;
		}
		.delete_zhaopin {
		    color: #AE3234;
		    text-decoration: underline;
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
    </style>
    
    <style type="text/css">
	
.brandImg {
    background-color: #666666;
    border-color: #B8B8B8 #DCDCDC #DCDCDC #B8B8B8;
    border-radius: 2px;
    border-style: solid;
    border-width: 1px;
    height: 145px;
    position: relative;
    width: 160px;
}
.brandImg span {
    display: block;
    height: 145px;
    left: 0;
    position: absolute;
    top: 0;
    width: 140px;
}
.brandImg span:hover {
    background-color: #FFFFFF;
    opacity: 0.7;
}
.brandImg span a {
    display: block;
    left: 38px;
    position: absolute;
    top: 72px;
}
	
	</style>
	
    <style type="text/css">
	#Img{
		border-color: #B8B8B8 #DCDCDC #DCDCDC #B8B8B8;
	    border-radius: 2px 2px 2px 2px;
	    border-style: solid;
	    border-width: 1px;
	    background-color: #666666;
	    width:260px !important;height:30px !important;
	    position:relative;
	}
	
	#Img span{
		display:block;
		position:absolute;
		top:0px;left:0px;
		width:240px !important;
		height:30px !important;
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
		top:0px !important;
		left:90px !important;
	}
	
	</style>
	
</head>
 <script text="text/javascript">
        	[@compress single_line = true]
    		var Specialty='<div class="select-info">	
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
							';
							
			var Jobs='<div class="select-info">	
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
				</div>';
		[/@compress]
		 $().ready(function(){
		 
		 	$("#workyear1").val("${recruit.workyear}");
		 	$("#sex1").val("${recruit.sex}");
		 	$("#eduLevel1").val("${recruit.eduLevel}");
		 	$("#salary1").val("${recruit.salary}");
		 	$("#worklimit1").val("${recruit.worklimit}");
		 	$("#workWay1").val("${recruit.workWay}");
		 	
			 // 为所有插件使用相同的模板。
	    	var html ='<div id="xmenuSpecialty1" class="xmenu" style="display: none;">'+Specialty +'</div>'+
					  '<div id="xmenuJobs1" class="xmenu" style="display: none;">'+Jobs +'</div>';
			$("#bianji_xinxi").parent().append(html);
			
			// 添加弹窗控件。
				$("#selectSpecialty1").xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuSpecialty1",//弹出层
							emptytext:"选择专业",
							hiddenID : "selectSpecialtyhidden1"//隐藏域ID	
							,value : "${recruit.majorType.id}"
				});
				$("#selectJobs1").xMenu({	
							width :1000,
							top:175.5,
							left:145,
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuJobs1",//弹出层
							emptytext:"选择工种",
							hiddenID : "selectJobshidden1"//隐藏域ID	
							,value : "${recruit.workType.id}"
				});
				
			//封装ajax信息提交
			function submitJobs(){
				if($("#beginDate").val()!=""){
					var viewData=new Date($("#beginDate").val().replace(/-/g,",")).getTime();
					$("#viewData").val(viewData);
				}else{
					$("#viewData").remove();
				}
				$("#viewData").val(viewData);
					$("#jobsForm1").ajaxSubmit({
			            	 type: "post",
						     url: "/enterprise-user/center/submit-recruit.jhtml",
						     dataType: "json",
						     success: function(data){
						     	if(data.message=="success"){
							     	location.href="/enterprise-user/center.jhtml";	     		
						     	}
						     }
		        	});	
				
			}
			
			// 保存招聘信息。
    	$("#savaJobs").click(function() {
    	    var tag=false;
    		if($("#worknum1").val() == ""){
    			alert("请输入招聘人数");
    			tag=true;
    		}else if($("#selectJobshidden1").val() == ""){
    			alert("请选择工种");
    			tag=true;
    		}else if($("#selectSpecialtyhidden1").val() == ""){
    			alert("请选择专业");
    			tag=true;
    		}else if($("#workspace1").val() == ""){
    			alert("请输入工作地点");
    			tag=true;
    		}else{
	    		if(tag==false){
	    			showdiv();
	    			submitJobs();
    			}
    		}
    		
		});
		
		
		});
</script>
<body>
	[#include "/include/header.ftl" /]
	<div class="j_main w">
		<div class="j_main_left">
			<div class="j_main_left_1" style="border:0;height:auto;border:1px solid #E4630F;border-radius:4px;">
				<table style="padding: 6px 19px 19px;">
					<tr>
						<td colspan="2" align="center" style="background:#EE981F;color:#FFFFFF;border-radius:4px;">用户登录</td>
					</tr>
					<tr>
						<td colspan="2"><font color="red" size="2">${sessionUser.loginName}</font>，欢迎您登录！</td>
					</tr>
					<tr>
						<td colspan="2">上次登录时间:
							<span style="font-size:13px;float:left;">
								${sessionUser.lastLoginData?number_to_datetime}&nbsp;${sessionUser.lastLoginData?number_to_time}
							</span>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2" style="padding-top: 20px;">
							<input type="button" style="margin-right: 10px;background: none repeat scroll 0 0 #6DBE3A;border: 1px solid #1C960C;border-radius: 4px;color: #FFFFFF; width: 75px;height:27px;" value="企业中心"
							onclick="javascript:[#if sessionUser.class.name == "com.etech.entity.TcomUser"]window.location.href='/common-user/center.jhtml';[#else] window.location.href='/enterprise-user/center.jhtml';[/#if]" 
							>
							<input type="button" onclick="Etech.logout();" style="background: none repeat scroll 0 0 #6DBE3A;border: 1px solid #1C960C;border-radius: 4px;color: #FFFFFF; width: 75px;height:27px;" value="退出">
						</td>
					</tr>
				</table>
			</div>
			<div class="j_main_left_1" style="margin-top:10px;height:auto;text-align:center;border:1px solid #E4630F;border-radius:4px;">
				<p style="background: #EE981F; text-align: center; margin: 5px; padding: 5px; border-radius: 5px; border: 0px none; color: #FFFFFF;">人才推荐</p>
				[#list talentRecommend as user]
				<div class="j_main_left_1_1">
					<p style="color: blue;">${user.loginName}</p>
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
					<div id="zhaopin_xinxi" class="j_main_right_2_1_2" style="cursor:pointer;">编辑招聘信息</div>
				</div>
				
				
				<div id="bianji_xinxi" style="width:728px;height:auto;;overflow:hidden;">
					<div class="zhaopin" style="height: auto; text-align: center; border: 1px solid #e4e4e4; margin: 5px 20px; width: 685px;">
					</div>
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">添加/编辑招聘信息</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 490px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input id="add_zhaopin" type="hidden" value="添加" style="width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div>
				<div class="zhaopinxinxi" style="padding:10px 30px;width:650px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
					<form novalidate="novalidate"  action="/enterprise-user/center/submit-recruit.jhtml"  method="post" id="jobsForm1">
						<input type="hidden" name="status" value="0">
						<input type="hidden" name="viewData" value="" id="viewData">
						<input type="hidden" name="isview" value="未发布">
						<input type="hidden" name="id" value="${recruit.id}">
							<table>
								<tr>
									<td>招聘单位:</td>
									<td style="padding-right:80px;"><input type="text" id="company1" name="company" value="${recruit.company}" readonly="readonly"></td>
									<td>人数:</td>
									<td><input value="${recruit.worknum}" type="text" id="worknum1" name="worknum" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="3"></td>
								</tr>
								<tr>
									<td>工种:</td>
									<td>
									<input type="hidden" value="" id="selectJobshidden1" name="workTypeId"/>
									<div class="topnav">
										<a id="selectJobs1" href="javascript:void(0);" class="as">
											<span >
											[#assign name=recruit.workType.name] 
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
									<td>性别:</td>
									<td>
										<select id="sex1" name="sex" style="width: 183px;" value="${recruit.sex}">
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
										<a id="selectSpecialty1" href="javascript:void(0);" class="as">
											<span >
											[#assign name=recruit.majorType.name] 
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
									<td>技术等级:</td>
									<td>
										<select style="width:183px;" name="eteLevel" id="eteLevel1" value="${recruit.eteLevel}">
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
									<td>从事年限:</td>
									<td>
									<select id="workyear1" name="workyear" style="width: 183px;" value="${recruit.workyear}">
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
										<select id="eduLevel1" name="eduLevel" style="width: 183px;" value="${recruit.eduLevel}">
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
									<td>工作地点:</td>
									<td>
										<input type="text" name="workspace" value="${recruit.workspace}"  class="city_input  inputFocus proCityQueryAll proCitySelAll current2"  autocomplete="off" id="start1" name="expectArea">
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
									<td><input type="text" id="age1" name="age" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="3" value="${recruit.age}"></td>
								</tr>
								<tr>
									<td>身高:</td>
									<td><input type="text" value="${recruit.height}" id="height1" name="height" placeholder="cm" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="3"><span style="margin-left:-25px;color:#000000;padding:0;">cm</span></td>
									<td>视力:</td>
									<td><input type="text" value="${recruit.eyesight}" id="eyesight1" name="eyesight" onkeyup="value=this.value.replace(/\D+\./g,'')" maxlength="3"></td>
								</tr>
								<tr>
									<td>薪资待遇:</td>
									<td>
									<select id="salary1" name="salary" style="width: 183px;" value="${recruit.salary}">
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
										<select id="workWay1" name="workWay" style="width: 183px;" value="${recruit.workWay}">
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
										<select id="worklimit1" name="worklimit" style="width: 183px;" value="${recruit.worklimit}">
											<option value="三个月">三个月</option>
											<option value="一个月">一个月</option>
											<option value="六个月">六个月</option>
											<option value="一年">一年</option>
											<option value="长期">长期</option>
										</select>
									</td>
									<td>面试时间:</td>
									<td>
									<input type="text" value="[#if recruit.viewData!=0]${recruit.viewData?number_to_date}[/#if]" name="beginDate" id="beginDate"   style="width:100px;height:25px" class="text Wdate"  onfocus="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'});" />
								    <input type="hidden"  name="endDate" id="endDate"  style="width:100px;height:25px" class="text Wdate"  onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDate\')}'});" />
									</td>
								<tr>
									<td style="vertical-align:top;">其他说明:</td>
									<td colspan="2">
										<textArea cols="30" style="resize:none;" id="note1" name="note">${recruit.note}</textArea>
									</td>
									<td style="display:none;vertical-align: bottom; text-align: right;">
										<a onclick="delete_zhaopin(this)" href="javascript:void(0);">删除</a>
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
	</div>
	
	<!--修改密码弹出层********************************************-->
	<style type="text/css">
		.bg{position:absolute;z-index:999;filter:alpha(opacity=50);background:#666;opacity: 0.5;-moz-opacity: 0.5;left:0;top:0;height:100%;width:100%;min-height:1370px;}
		.beian_winBG {MARGIN-TOP: -100px; LEFT: 50%; MARGIN-LEFT: -190px; WIDTH: 376px; POSITION: absolute; TOP: 50%; HEIGHT:200px;border:#666666 1px solid;z-index: 1000;}
		#divOneStep{background-color: #fbfbfb; border: 1px solid #ccc; border-radius: 4px; box-shadow: 0 0 1px #fff inset; margin: 0 auto; padding: 20px 75px; position: relative;text-align: left;width: 240px;}
		.pass_text{border: 1px solid #e3e3e3; border-radius: 3px;height: 30px; margin-bottom: 20px;padding-left: 10px;width: 210px;}
		.btn_submit{background-color: #ff6c1e; border: 1px solid #ef5f06; border-radius: 3px;color: #fff;cursor: pointer;font-size: 14px;font-weight: bold;margin-bottom: 35px; margin-top: 1px;padding: 8px 22px;text-align: left;}
	</style>
	<div id="alert_win" style="display:none;">
		<div id="mask" style="top:0;left:0;position: absolute;z-index:1000;" class="bg"></div>
		<DIV class=beian_winBG id=beian_popup><!--弹出框-->
			<div id="divOneStep" style="z-index:1002;height:140px;">
				<div style="width:100%;height:30px;light-height:30px;text-align:right;">
					<a style="font-size: 20px; position: relative; top: -15px; padding: 6px; left: 70px;" href="javascript:;" onClick="alert_win.style.display='none';">&times;</a>
				</div>
				<div id="need">
					<form action="/user/center/updatepd.jhtml" method="post" id="pdFrom">
						<input type="hidden" name="id" value="${sessionUser.id}">
						<input class="pass_text" type="text"  autocomplete="off" name="password" placeholder="新密码"><br/>
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
