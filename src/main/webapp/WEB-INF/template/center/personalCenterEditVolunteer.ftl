<!DOCTYPE html>
<html>
<head>
    <title>个人中心</title>
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
		 	
			
		// 保存招聘信息。
    	$("#savaJobs").click(function() {
    	    var tag=false;
    	    var value = "#bj";
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
	    			submitJobs(value);
    			}
    		}
		});
		
		var html ='<div id="xmenuVolunteerSpecialty1" class="xmenu" style="display: none;">'+Specialty +'</div>'+
						  '<div id="xmenuVolunteerJobs1" class="xmenu" style="display: none;">'+Jobs +'</div>';
						$("#conentDiv").parent().append(html);
		//志愿专业
		$("#selectVolunteerSpecialty1").xMenu({	
			width :600,	
			eventType: "click", //事件类型 支持focus click hover
			dropmenu:"#xmenuVolunteerSpecialty1",//弹出层
			emptytext:"选择专业",
			hiddenID : "selectVolunteerSpecialtyhidden1"//隐藏域ID
			,value : "${conInfo.majorType.id}"	
		});
		// 志愿工种
		$("#selectVolunteerJobs1").xMenu({	
			width :600,	
			eventType: "click", //事件类型 支持focus click hover
			dropmenu:"#xmenuVolunteerJobs1",//弹出层
			emptytext:"选择工种",
			hiddenID : "selectVolunteerJobshidden1"//隐藏域ID	
			,value : "${conInfo.workType.id}"
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
		 		   				location.href="/common-user/center.jhtml"+value;   				 						     	
					     	}
					     }
	        		});
			  })
		}
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
							<input type="button" style="margin-right: 10px;background: none repeat scroll 0 0 #6DBE3A;border: 1px solid #1C960C;border-radius: 4px;color: #FFFFFF; width: 75px;height:27px;" value="个人中心"
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
		<div class="j_main_right" id="conentDiv">
			<div class="j_main_right_1">
				<p>
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-left: 2px; margin-top: 2px; margin-right: 5px;">
					所在位置 > 个人中心
				</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;">
				<div style="height: 30px; width: 728px;margin-top:10px;">
						<span style="float:left;">编辑选择志愿</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div class="zhiyuan">
						<div class="zhiyuan_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="VolunteerForm1">	
						<input type="hidden" name="id" value="${conInfo.id}">
						<table>
							<tr>
								<td>专业:</td>
								<td>
									<input type="hidden" value="" id="selectVolunteerSpecialtyhidden1" name="majorTypeId"/>
									<input type="hidden" value="4" name="infoType">
									<div class="topnav">
										<a id="selectVolunteerSpecialty1" href="javascript:void(0);" class="as">
											<span >
												[#assign name=conInfo.majorType.name] 
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
								<td><font color="red">择业地区:</font></td>
								<td>
									<input type="text"  class="city_input  inputFocus proCityQueryAll proCitySelAll current2"  autocomplete="off" id="start1" name="expectArea" value="${conInfo.expectArea}" readonly="readonly">
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
									<div class="topnav">
										<a id="selectVolunteerJobs1" href="javascript:void(0);" class="as">
											<span >
											[#assign name=conInfo.workType.name] 
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
								<td>月薪要求:</td>
								<td style="padding-right:70px;">
									<select id="expectSalaryVolunteer1" name="expectSalary" value="${conInfo.expectSalary}">
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
								<td>工作性质:</td>
								<td colspan="3">
									<select name="workWay" id="workWay1" value="${conInfo.workWay}">
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
								<td colspan="3"><textArea cols="50" name="note" id="noteVolunteer1" style="resize:none;">${conInfo.note}</textArea></td>
							</tr>
						</table>
						</form>
					</div>
					
					</div>
					<p style="text-align:center;">
						<input type="button" id="saveVolunteer" value="保存">
						<input type="button" value="返回" onclick="javascript :window.location.href='/common-user/center.jhtml#zy'">
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
