<!DOCTYPE html>
<html>
<head>
    <title>个人中心</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script type="text/javascript" src="/resource/public/js/jquery.js"></script>
    <script type="text/javascript" src="/resource/public/js/jquery.form.js"></script>
    <script type="text/javascript" src="/resource/public/js/admin/jquery.validate.js"></script>
    <script type="text/javascript"  src="/resource/public/js/Etech.js"></script>
    <link href="/resource/public/js/jquery-X-Menu/css/xmenu.css" rel="stylesheet" type="text/css" />  
    <link href="/resource/public/js/jquery-X-Menu/css/powerFloat.css" rel="stylesheet" type="text/css" /> 
    <link rel="stylesheet" type="text/css" href="/resource/public/areaSelect/css.css" />
    <link href="/resource/public/selectArea/css/cityLayout.css" type="text/css" rel="stylesheet">
	<link href="/resource/public/selectArea/css/css.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/resource/public/areaSelect/css.css" />
	<script type="text/javascript" src="/resource/public/areaSelect/drag.js"></script>
	<script type="text/javascript" src="/resource/public/areaSelect/city_arr.js"></script>
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-xmenu.js"></script> 
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-powerFloat-min.js"></script>
	<script type="text/javascript" src="/resource/public/js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="/resource/public/js/waitamoment.js"></script>
	
	<style type="text/css">
	.brandImg{
		border-color: #B8B8B8 #DCDCDC #DCDCDC #B8B8B8;
	    border-radius: 2px 2px 2px 2px;
	    border-style: solid;
	    border-width: 1px;
	    background-color: #666666;
	    width:122px;height:150px;
	    position:relative;
	}
	
	.brandImg span{
		display:block;
		position:absolute;
		top:0px;left:0px;
		width:100px;
		height:150px;
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
		top:65px;
		left:20px;
	}
	
	</style>
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
			width:150px;
		}
		.list input {
		    width: 45px;
		    font-size:13px;
		}
		.currentSwich{
			background:#E36510;
			color:#FFFFFF;
		}
		input[type="radio"] {
			width: 10px !important;
		}
    </style>
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
    		
    		[@compress single_line = true]
    		var type1='
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="SkillForm1">						
						<table>
						
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">1</td>
							</tr>
							<tr>
								<td>专业：</td>
								<td>
									<input type="hidden" value="" id="selectSkillSpecialtyhidden1" name="majorTypeId"/>
										<input type="hidden" value="1" name="infoType">
									<div class="topnav">
										<a id="selectSkillSpecialty1" href="javascript:void(0);" class="as">
											<span >
												选择专业
											</span>		
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
								<td><input type="text" id="workingLifeSkill1" name="workingLife">
								</td>
							</tr>
							<tr>
								<td>说明:</td>
								<td colspan="3"><textArea cols="50" style="resize:none;" name="note" id="noteSkill1"></textArea></td>
								<td rowspan="3"><a class="delete_jineng"  onclick="deleteDiv(this,1)" href="javascript:void(0);" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
						</form>
    		';
    		
    		var type2='
    				<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="LearningForm1">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">1</td>
							</tr>
							<tr>
								<td>起始时间:</td>
								<td colspan="3">
								<input type="text" name="beginDate" id="beginDate"  eidLearning="beginDateLearning1" style="width:100px;height:25px" class="text Wdate" value="${(beginDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: \'#F{$dp.$D(endDate)}\'});" />
								结束时间: <input type="text"  name="endDate" id="endDate" eidLearning="endDateLearning1" style="width:100px;height:25px" class="text Wdate" value="${(endDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: \'#F{$dp.$D(beginDate)}\'});" />
								<input type="hidden" name="beginData" value=""/>
								<input type="hidden" name="endData" value=""/>
								</td>
								
							</tr>
							<tr>
								<td>学校名称:</td>
								<td style="padding-right:100px;">
								<input type="text" id="schoolLearning1" name="workspace"></td>
								<td>系别:</td>
								<td><input type="text" id="deptLearning1" name="dept" ></td>
							</tr>
							<tr>
								<td>专业:</td>
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
								<td rowspan="3"><a class="delete_xuexi"  onclick="deleteDiv(this,2)"  href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
						</form>
    		';
    		var type3='
    		<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="WorkForm1">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">1</td>
							</tr>
							<tr>
								<td>起始时间:</td>
								<td colspan="3">
								<input type="text" eidWork="beginDateWork1" id="beginDate" name="beginDate" style="width:100px;height:25px" class="text Wdate" value="${(beginDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: \'#F{$dp.$D(endDate)}\'});" />
								结束时间: <input type="text" eidWork="endDateWork1" id="endDate" name="endDate" style="width:100px;height:25px" class="text Wdate" value="${(endDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: \'#F{$dp.$D(beginDate)}\'});" />
								<input type="hidden" name="beginData" value=""/>
								<input type="hidden" name="endData" value=""/>
								</td>
							</tr>
							<tr>
								<td>工作单位:</td>
								<td style="padding-right:100px;"><input type="text" id="workspaceWork1" name="workspace"></td>
								<td>职务:</td>
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
								<td rowspan="3"><a class="delete_gongzuo"  onclick="deleteDiv(this,3)" href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
						</form>
    		';
    		var type4='
    		<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="VolunteerForm1">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#FE7200;">1</td>
								<td>专业:</td>
								<td>
									<input type="hidden" value="" id="selectVolunteerSpecialtyhidden1" name="majorTypeId"/>
									<input type="hidden" value="4" name="infoType">
									<div class="topnav">
										<a id="selectVolunteerSpecialty1" href="javascript:void(0);" class="as">
											<span >
												选择专业
											</span>		
										</a>	
									</div>
								</td>
								<td>择业地区:</td>
								<td>
									<input type="text"  class="city_input  inputFocus proCityQueryAll proCitySelAll current2"  autocomplete="off" id="start1" name="expectArea">
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
								
								<td>工种:</td>
								<td>
									<input type="hidden" value="" id="selectVolunteerJobshidden1" name="workTypeId"/>
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
									<select name="workWay">
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
								<td rowspan="3"><a class="delete_zhiyuan" href="javascript:void(0);"  onclick="deleteDiv(this,4)" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
						</form>
    		';
    		[/@compress]
	    		// 删除信息
		    	function deleteDiv(object,type){
	    				// 得到最外层的div
	    				var div=$(object).parent().parent().parent().parent().parent().parent().parent();
	    				var clazz=div.attr("class");
	    				
	    				if ($("."+clazz).find("div."+clazz+"_div").size() <= 1) {
							alert("必须至少保留一个参数");
							// 获取需要删除的id
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
									$("#InfoForm").append(html);
							   }
							   
							}
							 if(type==1){
									$(object).parent().parent().parent().parent().parent().parent().html(type1);
							 }else if(type==2){
									$(object).parent().parent().parent().parent().parent().parent().html(type2);
							 }else if(type==3){
									$(object).parent().parent().parent().parent().parent().parent().html(type3);
							 }else if(type==4){
									$(object).parent().parent().parent().parent().parent().parent().html(type4);
									deleteIds();
							 }
							
						} else {
							// 获取需要删除的id
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
									$("#InfoForm").append(html);
							   }
							   
							}
							
							// 删除。
						   $(object).closest("div").remove();
						}
						 if(type==1){
									b--;
						 }else if(type==2){
								a--;
						 }else if(type==3){
								c--;
						 }else if(type==4){
						 		d--
						 }
					
	    	};
	    	
	    	   // ajax 提交验证和登录。
		    	function deleteIds(){
		    			if($("#deleteids").length>0){
			    			var ids=$("#deleteids").val();
							$.ajax({
								url: "/common-user/submit-deleteids.jhtml",
								type: "POST",
								data: {ids:ids},
								dataType: "json",
								cache: false,
								success: function(data) {
									location.reload(true);
								}
							})
		    			}else{
							location.reload(true);
						}				
					}
	    	
    		
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
						
    	
    	$().ready(function() {
    		
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
    		
						
    		//添加学习经历
    		$("#add_xuexi").click(function(){
    			[@compress single_line = true]
    				var trHtml = 
    				'<div class="xuexi_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="LearningForm'+a+'">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">'+a+'</td>
							</tr>
							<tr>
								<td>起始时间:</td>
								<td colspan="3">
								<input type="text" name="beginDate" id="beginDate" eidLearning="beginDateLearning'+a+'" style="width:100px;height:25px" class="text Wdate" value="${(beginDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: \'#F{$dp.$D(endDate)}\'});" />
								结束时间: <input type="text" name="endDate" id="endDate" eidLearning="endDateLearning'+a+'" style="width:100px;height:25px" class="text Wdate" value="${(endDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: \'#F{$dp.$D(beginDate)}\'});"/>
								<input type="hidden" name="beginData" value=""/>
								<input type="hidden" name="endData" value=""/>
								</td>
							</tr>
							<tr>
								<td>学校名称:</td>
								<td style="padding-right:100px;"><input type="text" id="schoolLearning'+a+'" name="workspace"></td>
								<td>系别:</td>
								<td><input type="text" id="deptLearning'+a+'" name="dept"> </td>
							</tr>
							<tr>
								<td>专业:</td>
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
								<td rowspan="3"><a class="delete_xuexi"  onclick="deleteDiv(this,2)" href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
						</form>
					</div>';
					var html =
						'<div id="xmenuLearningSpecialty'+a+'" class="xmenu" style="display: none;">'+Specialty +'</div>
						';
				[/@compress]
				
				if($(".xuexi").find("div.xuexi_div").size() <6){
					$(".xuexi").append(trHtml);
					$("#conentDiv").parent().append(html);
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
				
				
				if($(".xuexi").find("div.xuexi_div").size() <6){
					a ++;
				}
				
    		});
    		
    		//添加具备技能
    		$("#add_jineng").click(function(){
    			[@compress single_line = true]
    				var trHtml = 
					'<div class="jineng_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="SkillForm'+b+'">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">'+b+'</td>
							</tr>
							<tr>
								<td>专业：</td>
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
								<td><input type="text" name="workingLife" id="workingLifeSkill'+b+'"></td>
							</tr>
							<tr>
								<td>说明:</td>
								<td colspan="3"><textArea name="note" id="noteSkill'+b+'" cols="50" style="resize:none;"></textArea></td>
								<td rowspan="3"><a class="delete_jineng"  onclick="deleteDiv(this,1)" href="javascript:void(0);" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
						</form>
					</div>';
					
					var html =
						'<div id="xmenuSkillSpecialty'+b+'" class="xmenu" style="display: none;">'+Specialty +'</div>
						<div id="xmenuSkillJobs'+b+'" class="xmenu" style="display: none;">'+Jobs +'</div>
						';
				[/@compress]
				
				if($(".jineng").find("div.jineng_div").size() <6){
					$(".jineng").append(trHtml);
					$("#conentDiv").parent().append(html);
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
				
				
				if($(".jineng").find("div.jineng_div").size() <6){
					b ++;
				}
				
    		});
    		
    		//添加工作经历
    		$("#add_gongzuo").click(function(){
    			[@compress single_line = true]
    				var trHtml = 
    				'<div class="gongzuo_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="WorkForm'+c+'">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">'+c+'</td>
							</tr>
							<tr>
								<td>起始时间:</td>
								<td colspan="3">
								<input type="text" id="beginDate" name="beginDate" eidWork="beginDateWork'+c+'" style="width:100px;height:25px" class="text Wdate" value="${(beginDate?string("yyyy-MM-dd"))!}"  onfocus="WdatePicker({maxDate: \'#F{$dp.$D(endDate)}\'});" />
								结束时间: <input type="text" id="endDate" eidWork="endDateWork'+c+'" name="endDate" style="width:100px;height:25px"class="text Wdate"value="${(endDate?string("yyyy-MM-dd"))!}"  onfocus="WdatePicker({minDate: \'#F{$dp.$D(beginDate)}\'});" />
								<input type="hidden" name="beginData" value=""/>
								<input type="hidden" name="endData" value=""/>
								</td>	
							</tr>
							<tr>
								<td>工作单位:</td>
								<td style="padding-right:100px;"><input type="text" id="workspaceWork'+c+'" name="workspace"></td>
								<td>职务:</td>
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
								<td rowspan="3"><a class="delete_gongzuo"  onclick="deleteDiv(this,3)" href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
						</form>
					</div>';
					var html ='<div id="xmenuWorkJob'+c+'" class="xmenu" style="display: none;">'+Jobs +'</div>';
				[/@compress]
				
				if($(".gongzuo").find("div.gongzuo_div").size() <6){
					$(".gongzuo").append(trHtml);
					$("#conentDiv").parent().append(html);
				}else{
					alert("最多添加6条数据");
				}
				
				// 为新增的标签添加弹窗控件
				$("#selectWorkJob"+c).xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuWorkJob"+b,//弹出层
							emptytext:"选择专业",
							hiddenID : "selectWorkJobhidden"+b//隐藏域ID	
				});
				
				if($(".gongzuo").find("div.gongzuo_div").size() <6){
					c ++;
				}
    		});
    		
    		//添加选择志愿
    		$("#add_zhiyuan").click(function(){
    			[@compress single_line = true]
    				var trHtml = 
    				'<div class="zhiyuan_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="VolunteerForm'+d+'">
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#FE7200;">'+d+'</td>
								<td>专业:</td>
								<td>
									<input type="hidden" value="" id="selectVolunteerSpecialtyhidden'+d+'" name="majorTypeId"/>
									<input type="hidden" value="4" name="infoType">
									<div class="topnav">
										<a id="selectVolunteerSpecialty'+d+'" href="javascript:void(0);" class="as">
											<span >
												选择专业
											</span>		
										</a>	
									</div>
								</td>
								<td>择业地区:</td>
								<td>
									<input type="text" class="city_input  inputFocus proCityQueryAll proCitySelAll current2" autocomplete="off" id="start1" name="expectArea">
									<input class="residency" type="hidden" value="" name="residency" id="residency">
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
								
								<td>工种:</td>
								<td>
									<input type="hidden" value="" id="selectVolunteerJobshidden'+d+'" name="workTypeId"/>
									<div class="topnav">
										<a id="selectVolunteerJobs'+d+'" href="javascript:void(0);" class="as">
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
									<select name="workWay">
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
								<td colspan="3"><textArea cols="50" name="note" id="noteVolunteer'+d+'" style="resize:none;"></textArea></td>
								<td rowspan="3"><a class="delete_zhiyuan"  onclick="deleteDiv(this,4)" href="javascript:void(0);" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
						</form>
					</div>';
					var html =
						'<div id="xmenuVolunteerSpecialty'+d+'" class="xmenu" style="display: none;">'+Specialty +'</div>
						<div id="xmenuVolunteerJobs'+d+'" class="xmenu" style="display: none;">'+Jobs +'</div>
						';
				[/@compress]
				
				if($(".zhiyuan").find("div.zhiyuan_div").size() <6){
					$(".zhiyuan").append(trHtml);
					$("#conentDiv").parent().append(html);
				}else{
					alert("最多添加6条数据");
				}
				
				// 为新增的标签添加弹窗控件
				$("#selectVolunteerSpecialty"+d).xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuVolunteerSpecialty"+d,//弹出层
							emptytext:"选择专业",
							hiddenID : "selectVolunteerSpecialtyhidden"+d//隐藏域ID	
				});
				$("#selectVolunteerJobs"+d).xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuVolunteerJobs"+d,//弹出层
							emptytext:"选择专业",
							hiddenID : "selectVolunteerJobshidden"+d//隐藏域ID	
				});
				
				
				if($(".zhiyuan").find("div.zhiyuan_div").size() <6){
					d ++;
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
		    	
		    	[#if skills?size>0]
		    		[#list skills as skill]
		    			var html='<div id="xmenuSkillSpecialty'+${skill_index+1}+'" class="xmenu" style="display: none;">'+Specialty +'</div>'
								+'<div id="xmenuSkillJobs'+${skill_index+1}+'" class="xmenu" style="display: none;">'+Jobs +'</div>';
						$("#conentDiv").parent().append(html);
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
		    		[/#list]
		    	[#else]
		    	var html='<div id="xmenuSkillSpecialty1" class="xmenu" style="display: none;">'+Specialty +'</div>'
						+'<div id="xmenuSkillJobs1" class="xmenu" style="display: none;">'+Jobs +'</div>';
						$("#conentDiv").parent().append(html);
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
		    		var html ='<div id="xmenuLearningSpecialty'+${learning_index+1}+'" class="xmenu" style="display: none;">'+Specialty +'</div>';
						$("#conentDiv").parent().append(html);
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
		    		[/#list]
		    	[#else]
		    		var html ='<div id="xmenuLearningSpecialty1" class="xmenu" style="display: none;">'+Specialty +'</div>';
					$("#conentDiv").parent().append(html);
			    	// 学习经历专业
					$("#selectLearningSpecialty1").xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuLearningSpecialty1",//弹出层
						emptytext:"选择专业",
						hiddenID : "selectLearningSpecialtyhidden1"//隐藏域ID	
					});
		    	[/#if]	
		    	
		    	// 工作经验
		    	[#if works?size>0]
		    		[#list works as work]
		    			var html ='<div id="xmenuWorkJob'+${work_index+1}+'" class="xmenu" style="display: none;">'+Jobs +'</div>';
						$("#conentDiv").parent().append(html);
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
		    		[/#list]
		    	[#else]
		    		var html ='<div id="xmenuWorkJob1" class="xmenu" style="display: none;">'+Jobs +'</div>';
						$("#conentDiv").parent().append(html);
		    		// 工作经历工种
					$("#selectWorkJob1").xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuWorkJob1",//弹出层
						emptytext:"选择工种",
						hiddenID : "selectWorkJobhidden1"//隐藏域ID	
					});
		    	[/#if]	
				
				[#if volunteers?size>0]
		    		[#list volunteers as volunteer]
		    			$("#workWay"+${volunteer_index+1}).val("${volunteer.workWay}");
		    			$("#expectSalaryVolunteer"+${volunteer_index+1}).val("${volunteer.expectSalary}");
		    			var html ='<div id="xmenuVolunteerSpecialty'+${volunteer_index+1}+'" class="xmenu" style="display: none;">'+Specialty +'</div>'+
						  '<div id="xmenuVolunteerJobs'+${volunteer_index+1}+'" class="xmenu" style="display: none;">'+Jobs +'</div>';
						$("#conentDiv").parent().append(html);
		    			//志愿专业
						$("#selectVolunteerSpecialty"+${volunteer_index+1}).xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuVolunteerSpecialty"+${volunteer_index+1},//弹出层
							emptytext:"选择专业",
							hiddenID : "selectVolunteerSpecialtyhidden"+${volunteer_index+1},//隐藏域ID
							value : "${volunteer.majorType.id}"	
						});
						// 志愿工种
						$("#selectVolunteerJobs"+${volunteer_index+1}).xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuVolunteerJobs"+${volunteer_index+1},//弹出层
							emptytext:"选择工种",
							hiddenID : "selectVolunteerJobshidden"+${volunteer_index+1},//隐藏域ID	
							value : "${volunteer.workType.id}"
						});
		    		[/#list]
		    	[#else]
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
					});
					// 志愿工种
					$("#selectVolunteerJobs1").xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuVolunteerJobs1",//弹出层
						emptytext:"选择工种",
						hiddenID : "selectVolunteerJobshidden1"//隐藏域ID	
					});
		    	[/#if]	
				
    	
    			// 提交信息列表
    			function submitSkill(){
    				  //alert("xxxxx具备技能xxxxxxxxxx");
    				  var num=0;
    				  $("div.jineng_div").each(function(index){
    				  		index++;
				 			$("#SkillForm"+index).ajaxSubmit({
				            	 type: "post",
							     url: "/common-user/center/submit-comInfo.jhtml",
							     dataType: "json",
							     success: function(result){
							     	num=num+1;
							     	if(num==index){
				 		   				submitLearnging();    				 						     	
							     	}
							     }
			        		});	
    				  })
    			}
    			
    			function submitLearnging(){
    				 //alert("xxxxx学习经历xxxxxxxxxx");
    				  var num=0;
    				  $("div.xuexi_div").each(function(index){
		    				var tag=false;
    				  		index++;
    				  		// 转换时间类型为long类型。
    				  		var beginDate=$("input[eidLearning='beginDateLearning"+index+"']").val();
							var endDate=$("input[eidLearning='endDateLearning"+index+"']").val();
	    					if(beginDate!=""||endDate!=""){
		    					beginDate=new Date(beginDate.replace(/-/g,",")).getTime();
	    						endDate=new Date(endDate.replace(/-/g,",")).getTime(); 				
	    					}else{
	    						tag=true;
	    					}
	    					$("input[name='beginData']").val(beginDate);
	    					$("input[name='endData']").val(endDate);
	    					if(tag==false){
		    					$("#LearningForm"+index).ajaxSubmit({
					            	 type: "post",
								     url: "/common-user/center/submit-comInfo.jhtml",
								     dataType: "json",
								     success: function(result){
								     	num=num+1;
								     	if(num==index){
					 		   				submitWorks();    				 						     	
								     	}
								     }
				        		});	
	    					}else{
	    						num=num+1;
						     	if(num==index){
			 		   				submitWorks();    				 						     	
						     	}
	    					}
	    					
	    				 })
    			}
    			
    			function submitWorks(){
    				//alert("xxxxxxxx工作经验xxxxxxx");
    				  var num=0;
    				  $("div.gongzuo_div").each(function(index){
		   				    var tag=false;
    				  		index++;
    				  		var beginDate=$("input[eidWork='beginDateWork"+index+"']").val();
							var endDate=$("input[eidWork='endDateWork"+index+"']").val();
							if(beginDate!=""||endDate!=""){
		    					beginDate=new Date(beginDate.replace(/-/g,",")).getTime();
	    						endDate=new Date(endDate.replace(/-/g,",")).getTime(); 				
	    					}else{
	    						tag=true;
	    					}
	    					$("input[name='beginData']").val(beginDate);
	    					$("input[name='endData']").val(endDate);
	    					if(tag==false){
		    					$("#WorkForm"+index).ajaxSubmit({
					            	type: "post",
								     url: "/common-user/center/submit-comInfo.jhtml",
								     dataType: "json",
								     success: function(result){
								     	num=num+1;
								     	if(num==index){
					 		   				deleteIds();    				 						     	
								     	}
								     }
				        		});
	    					}else{
	    						num=num+1;
								if(num==index){
					 		   		deleteIds();    				 						     	
								}
	    					}
    				  })
    			}
    			
    			function submitVolunteer(){
    				  //alert("xxxxxxxx选择志愿xxxxxxx");
    				  $("div.zhiyuan_div").each(function(index){
    				  		index++;
    				  		$("#VolunteerForm"+index).ajaxSubmit({
    				  			 type: "post",
							     url: "/common-user/center/submit-comInfo.jhtml",
							     dataType: "json",
							     success: function(result){
							     	if(index==(d-1)){
				 		   				deleteIds();    				 						     	
							     	}
							     }
			        		});
    				  })
    				 
    			}
    			
  			
				// ajax 提交验证和保存，先提交图片再提交个人信息。
				function submitValid(submitx){
						showdiv();
						// 上传图片，并且得到图片路径返回值。
						if(checkChange==1){
							$("#imageForm").ajaxSubmit(function (data) {
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
								}else if(data.message!="finish"){
									alert(data.message);								
								}
						     }
			        	});
				}
		    	// 用户名验证。
				$("#loginName,#idcard").change(function(){
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
					
					if(loginName==""){
						alert("用户名必填！");
					}else if(phoneNum==""){
						alert("手机号码必填！");
					}else if(!regPartton.test(phoneNum)){
						alert("手机号码格式不正确！");
						return false;
					}else{
						submitValid("submit");
					}
				});
				//保存志愿。
				$("#saveVolunteer").click(function() {
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
</head>
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
									<td><input type="text" id="trueName" name="trueName" value="${sessionUser.trueName}"></td>
								</tr>
								<tr>
									<td>登录名:</td>
									<td><input type="text" id="loginName" name="loginName" value="${sessionUser.loginName}"></td>
								</tr>
								<tr>
									<td>年龄:</td>
									<td><input type="text" id="age" name="age" value="${sessionUser.age}" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="3"></td>
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
									<td><input type="text" id="phoneNum" name="phoneNum" value="${sessionUser.phoneNum}"></td>
								</tr>
								<tr>
									<td>二女户:</td>
									<td>
										<input type="radio"  name="twoGirl" value="是" [#if sessionUser.twoGirl=="1"]checked="true"[#elseif sessionUser.twoGirl!="0"]checked="true"[/#if] style="width:0">是
										<input type="radio"  name="twoGirl" value="否" [#if sessionUser.twoGirl=="0"]checked="true"[/#if]style="width:0">否
									</td>
								</tr>
							</table>
						</div>
						<div style="width:0px;height:320px;border-left:1px solid #C9C9C9;float:left;"></div>
						<div class="" style="float: left; margin-left: 15px; overflow: hidden; width: 235px; margin-top: 10px;">
							<table>
								<tr>
									<td>性别:</td>
									<td>
										<select id="sex" name="sex" style="width:158px;">
											<option value="">请选择..</option>
											<option value="man">男</option>
											<option value="woman">女</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>密码:</td>
									<td><input type="text" id="password"  name="password" placeholder="不填" readonly="readonly"></td>
								</tr>
								<tr>
									<td>身份证号:</td>
									<td><input type="text" id="idcard" name="idcard" value="${sessionUser.idcard}"  onkeyup="value=this.value.replace(/\D+x/g,'')" minlength="15" minlength="18"></td>
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
									<td><input type="text" id="height" name="height" value="${sessionUser.height}" placeholder="cm"></td>
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
										<input type="radio" name="singleChild" value="是" [#if sessionUser.singleChild=="1"]checked="true"[#elseif sessionUser.singleChild!="0"]checked="true"[/#if] style="width:0">是
										<input type="radio" name="singleChild" value="否" [#if sessionUser.singleChild=="0"]checked="true"[/#if]style="width:0">否
									</td>
								</tr>
							</table>
							</form>
						</div>
						<div style="width: 150px; float: left; margin-left: 15px; height: auto; margin-top: 15px;">
								<form novalidate="novalidate"  action="/upload.jhtml" method="post" encType="multipart/form-data" id="imageForm">
									<div class="brandImg">
										<span><a onclick="file0.click()" href="javascript:void(0);">点击上传图片</a>
										</span>
												<img style="width:122px;height:150px" src="[#if sessionUser.imgHead?exists]/${sessionUser.imgHead}[#else]/resource/public/images/bg.png[/#if]" name="img"/>
									</div>
									<input type="file" style="display:none" id="file0" name="file0" onchange="filename0.value=this.value;checkChange=1;loadImgFast(this,0)">
									<input type="hidden" id="filename0" name="filename0">
								</form>			
						</div>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">具备技能
						</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input id="add_jineng" type="button" value="添加" style="cursor:pointer;width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div class="jineng">
					[#if skills?size>0]
					[#list skills as skill]
						<div class="jineng_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="SkillForm${skill_index+1}">						
						<table>
						
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">${skill_index+1}</td>
							</tr>
							<tr>
								<td>专业：</td>
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
								<td><input type="text" id="workingLifeSkill1" name="workingLife" value="${skill.workingLife}">
								</td>
							</tr>
							<tr>
								<td>说明:</td>
								<td colspan="3"><textArea cols="50" style="resize:none;" name="note"  id="noteSkill1">${skill.note}</textArea></td>
								<td rowspan="3"><a class="delete_jineng" onclick="deleteDiv(this,1)"  href="javascript:void(0);" style="margin-top:35px;float:right;">删除</a></td>
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
								<td>专业：</td>
								<td>
									<input type="hidden" value="" id="selectSkillSpecialtyhidden1" name="majorTypeId"/>
										<input type="hidden" value="1" name="infoType">
									<div class="topnav">
										<a id="selectSkillSpecialty1" href="javascript:void(0);" class="as">
											<span >
												选择专业
											</span>		
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
								<td><input type="text" id="workingLifeSkill1" name="workingLife">
								</td>
							</tr>
							<tr>
								<td>说明:</td>
								<td colspan="3"><textArea cols="50" style="resize:none;" name="note" id="noteSkill1"></textArea></td>
								<td rowspan="3"><a class="delete_jineng"  onclick="deleteDiv(this,1)" href="javascript:void(0);" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
						</form>
					</div>
					[/#if]
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">学习经历</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
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
								<td>起始时间:</td>
								<td colspan="3"><!--${(beginDate?string('yyyy-MM-dd'))!} ${(endDate?string('yyyy-MM-dd'))!}-->
								<input type="text" name="beginDate" id="beginDate"  eidLearning="beginDateLearning${learning_index+1}" style="width:100px;height:25px" class="text Wdate" value="2012-01-23" onfocus="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'});" />
								结束时间: <input type="text"  name="endDate" id="endDate" eidLearning="endDateLearning${learning_index+1}" style="width:100px;height:25px" class="text Wdate" value="2120-05-21" onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDate\')}'});" />
								<input type="hidden" name="beginData" value=""/>
								<input type="hidden" name="endData" value=""/>
								</td>
								
							</tr>
							<tr>
								<td>学校名称:</td>
								<td style="padding-right:100px;">
								<input type="text" id="schoolLearning1" name="workspace"  value="${learning.workspace}"></td>
								<td>系别:</td>
								<td><input type="text" id="deptLearning1" name="dept" value="${learning.dept}"></td>
							</tr>
							<tr>
								<td>专业:</td>
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
								<td rowspan="3"><a class="delete_xuexi" onclick="deleteDiv(this,2)" href="javascript:void(0);">删除</a></td>
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
								<td>起始时间:</td>
								<td colspan="3">
								<input type="text" name="beginDate" id="beginDate"  eidLearning="beginDateLearning1" style="width:100px;height:25px" class="text Wdate" value="${(beginDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'});" />
								结束时间: <input type="text"  name="endDate" id="endDate" eidLearning="endDateLearning1" style="width:100px;height:25px" class="text Wdate" value="${(endDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDate\')}'});" />
								<input type="hidden" name="beginData" value=""/>
								<input type="hidden" name="endData" value=""/>
								</td>
								
							</tr>
							<tr>
								<td>学校名称:</td>
								<td style="padding-right:100px;">
								<input type="text" id="schoolLearning1" name="workspace"></td>
								<td>系别:</td>
								<td><input type="text" id="deptLearning1" name="dept" ></td>
							</tr>
							<tr>
								<td>专业:</td>
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
								<td rowspan="3"><a class="delete_xuexi"  onclick="deleteDiv(this,2)"  href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
						</form>
					</div>
					
					[/#if]
					
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">工作经历</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
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
								<td>起始时间:</td>
								<td colspan="3">
								<input type="text" eidWork="beginDateWork${work_index+1}" id="beginDate" name="beginDate" style="width:100px;height:25px" class="text Wdate" value="1990-01-01" onfocus="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'});" />
								结束时间: <input type="text" eidWork="endDateWork${work_index+1}" id="endDate" name="endDate" style="width:100px;height:25px" class="text Wdate" value="1990-01-01" onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDate\')}'});" />
								<input type="hidden" name="beginData" value=""/>
								<input type="hidden" name="endData" value=""/>
								</td>
							</tr>
							<tr>
								<td>工作单位:</td>
								<td style="padding-right:100px;"><input type="text" id="workspaceWork1" name="workspace" value="${work.workspace}"></td>
								<td>职务:</td>
								<td><input type="text" id="dutyWork1" name="duty" value="${work.duty}"></td>
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
								<td ><input type="text" id="noteWork1" name="note" value="${work.note}"></td>
								<td rowspan="3"><a class="delete_gongzuo" href="javascript:void(0);" onclick="deleteDiv(this,3)">删除</a></td>
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
								<td>起始时间:</td>
								<td colspan="3">
								<input type="text" eidWork="beginDateWork1" id="beginDate" name="beginDate" style="width:100px;height:25px" class="text Wdate" value="${(beginDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'});" />
								结束时间: <input type="text" eidWork="endDateWork1" id="endDate" name="endDate" style="width:100px;height:25px" class="text Wdate" value="${(endDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDate\')}'});" />
								<input type="hidden" name="beginData" value=""/>
								<input type="hidden" name="endData" value=""/>
								</td>
							</tr>
							<tr>
								<td>工作单位:</td>
								<td style="padding-right:100px;"><input type="text" id="workspaceWork1" name="workspace"></td>
								<td>职务:</td>
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
								<td rowspan="3"><a class="delete_gongzuo"  onclick="deleteDiv(this,3)" href="javascript:void(0);">删除</a></td>
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
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">选择志愿</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input id="add_zhiyuan" type="button" value="添加" style="cursor:pointer;width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div class="zhiyuan">
					[#if volunteers?size>0]
					[#list volunteers as volunteer]
						<div class="zhiyuan_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="VolunteerForm${volunteer_index+1}">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#FE7200;">${volunteer_index+1}</td>
								<td>专业:</td>
								<td>
									<input type="hidden" value="${volunteer.majorType.id}" id="selectVolunteerSpecialtyhidden${volunteer_index+1}" name="majorTypeId"/>
									<input type="hidden" value="4" name="infoType">
									<input type="hidden" value="${volunteer.id}" name="id">
									<div class="topnav">
										<a id="selectVolunteerSpecialty${volunteer_index+1}" href="javascript:void(0);" class="as">
											<span >
												[#assign name=volunteer.majorType.name]
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
								<td>择业地区:</td>
								<td>
									<input type="text"  class="city_input  inputFocus proCityQueryAll proCitySelAll current2" value="${volunteer.expectArea}" autocomplete="off" id="start1" name="expectArea">
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
								
								<td>工种:</td>
								<td>
									<input type="hidden" value="${volunteer.workType.id}" id="selectVolunteerJobshidden${volunteer_index+1}" name="workTypeId"/>
									<div class="topnav">
										<a id="selectVolunteerJobs${volunteer_index+1}" href="javascript:void(0);" class="as">
											<span >
												[#assign name=volunteer.workType.name]
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
									
									<select id="expectSalaryVolunteer${volunteer_index+1}" name="expectSalary" value="${volunteer.expectSalary}">
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
									<select id="workWay${volunteer_index+1}" name="workWay" value="${volunteer.workWay}">
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
								<td colspan="3"><textArea cols="50" name="note" id="noteVolunteer1"  style="resize:none;">${volunteer.note}</textArea></td>
								<td rowspan="3"><a class="delete_zhiyuan" href="javascript:void(0);" onclick="deleteDiv(this,4)" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
						</form>
					</div>
					[/#list]
					[#else]
						<div class="zhiyuan_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<form novalidate="novalidate"  action="/common-user/center/submit-comInfo.jhtml" method="post" id="VolunteerForm1">	
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#FE7200;">1</td>
								<td>专业:</td>
								<td>
									<input type="hidden" value="" id="selectVolunteerSpecialtyhidden1" name="majorTypeId"/>
									<input type="hidden" value="4" name="infoType">
									<div class="topnav">
										<a id="selectVolunteerSpecialty1" href="javascript:void(0);" class="as">
											<span >
												选择专业
											</span>		
										</a>	
									</div>
								</td>
								<td>择业地区:</td>
								<td>
									<input type="text"  class="city_input  inputFocus proCityQueryAll proCitySelAll current2"  autocomplete="off" id="start1" name="expectArea">
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
								
								<td>工种:</td>
								<td>
									<input type="hidden" value="" id="selectVolunteerJobshidden1" name="workTypeId"/>
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
									<select name="workWay">
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
								<td rowspan="3"><a class="delete_zhiyuan" href="javascript:void(0);"  onclick="deleteDiv(this,4)" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
						</form>
					</div>
					[/#if]
					
					</div>
					<p style="text-align:center;">
						<input type="button" id="saveVolunteer" value="保存">
					</p>
				</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--修改密码弹出层********************************************-->
	<style type="text/css">
		.bg{position:absolute;z-index:999;filter:alpha(opacity=50);background:#666;opacity: 0.5;-moz-opacity: 0.5;left:0;top:0;height:100%;width:100%;min-height:1323px;}
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
						<input class="pass_text" type="text" autocomplete="off" name="password" placeholder="新密码"><br/>
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
	
	<script type="text/javascript" src="/resource/public/areaSelect/city_func.js"></script>
	<script src="/resource/public/selectArea/js/public.js"></script>
	[#include "/include/footer.ftl" /]
</body>
</html>