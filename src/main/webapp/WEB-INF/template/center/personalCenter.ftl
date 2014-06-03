<!DOCTYPE html>
<html>
<head>
    <title>个人中心</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script type="text/javascript" src="/resource/public/js/jquery.js"></script>
    <script type="text/javascript"  src="/resource/public/js/Etech.js"></script>
    <link href="/resource/public/js/jquery-X-Menu/css/xmenu.css" rel="stylesheet" type="text/css" />  
    <link href="/resource/public/js/jquery-X-Menu/css/powerFloat.css" rel="stylesheet" type="text/css" />  
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-xmenu.js"></script> 
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-powerFloat-min.js"></script>
	<script type="text/javascript" src="/resource/public/js/datePicker/WdatePicker.js"></script>
	
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
			background: #FFCC00;
		    border: 1px solid;
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
		.currentSwich{
			background:#E36510;
			color:#FFFFFF;
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
    	
    	[@compress single_line = true]
    		var Specialty='<div class="select-info">	
						<label class="top-label">已选项：</label>
								<ul>		
								</ul>
								<a  name="menu-confirm" href="javascript:void(0);" class="a-btn">
									<span class="a-btn-text">确定</span>
								</a> 
							</div>			
							<dl>
							<dt class="open">工程师</dt>
							<dd>
								<ul>
									<li rel="1">
											工程师1
									</li>
									<li rel="2">
											工程师2
									</li>
								</ul>   
								<ul>
									<li rel="3">
											工程师3
									</li>
									<li rel="4">
											工程师4
									</li>
								</ul>    
							</dd>
							<dt class="open">设计师</dt>
							<dd>
								<ul>
									<li rel="5">
											设计师设计师设计师你
									</li>
									<li rel="6">
											设计师设计师设计师你
									</li>
									<li rel="7">
											设计师设计师设计师你
									</li>
									<li rel="8">
											设计师2
									</li>
									<li rel="56">
											设计师2
									</li>
								</ul>   
								<ul>
									<li rel="9">
											设计师3
									</li>
									<li rel="0">
											设计师4
									</li>
								</ul>    
							</dd>
							</dl>	';
							
			var Jobs='<div class="select-info">	
						<label class="top-label">已选项：</label>
						<ul>		
						</ul>
						<a  name="menu-confirm" href="javascript:void(0);" class="a-btn">
							<span class="a-btn-text">确定</span>
						</a> 
					</div>			
					<dl>
					<dt class="open">管理员</dt>
					<dd>
						<ul>
							<li rel="12">
									管理员1
							</li>
							<li rel="22">
									管理员2
							</li>
						</ul>   
						<ul>
							<li rel="32">
									管理员3
							</li>
							<li rel="42">
									管理员4
							</li>
						</ul>    
					</dd>
					<dt class="open">技术人员</dt>
					<dd>
						<ul>
							<li rel="52">
									技术人员
							</li>
							<li rel="62">
									技术人员
							</li>
							<li rel="72">
									技术人员
							</li>
							<li rel="82">
									技术人员2
							</li>
							<li rel="52">
									技术人员2
							</li>
						</ul>   
						<ul>
							<li rel="92">
									技术人员3
							</li>
							<li rel="02">
									技术人员4
							</li>
						</ul>    
					</dd>
					</dl>			
				</div>';
	[/@compress]
						
    	$().ready(function() {
    		
    		
    		var a = 2;
    		var b = 2;
    		var c = 2;
    		var d = 2;
    		
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
    		
    		
						
    		//添加学习经历
    		$("#add_xuexi").click(function(){
    			[@compress single_line = true]
    				var trHtml = 
    				'<div class="xuexi_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">'+a+'</td>
							</tr>
							<tr>
								<td>起始时间:</td>
								<td colspan="3">
								<input type="text" name="beginDate" id="beginDate" eidLearning="beginDateLearning'+a+'" style="width:100px;height:25px" class="text Wdate" value="${(beginDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: \'#F{$dp.$D(endDate)}\'});" />
								结束时间: <input type="text" name="endDate" id="endDate" eidLearning="endDateLearning'+a+'" style="width:100px;height:25px" class="text Wdate" value="${(endDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: \'#F{$dp.$D(beginDate)}\'});"/>
								</td>
							</tr>
							<tr>
								<td>学校名称:</td>
								<td style="padding-right:100px;"><input type="text" id="schoolLearning'+a+'"></td>
								<td>系别:</td>
								<td><input type="text" id="deptLearning'+a+'"> </td>
							</tr>
							<tr>
								<td>专业:</td>
								<td colspan="3">
									<input type="hidden" value="" id="selectLearningSpecialtyhidden'+a+'" name="LearningId" value=""/>
									<div class="topnav">
										<a id="selectLearningSpecialty'+a+'" href="javascript:void(0);" class="as">
											<span >
												选择专业
											</span>		
										</a>	
									</div>
								</td>
								<td rowspan="3"><a class="delete_xuexi" href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
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
				
				//删除学习经历
				$("a.delete_xuexi").on("click",function(){
					if ($(".xuexi").find("div.xuexi_div").size() <= 1) {
						alert("必须至少保留一个参数");
					} else {
						$(this).closest("div").remove();
					}
				});
				
				// 为新增的标签添加弹窗控件
				$("#selectLearningSpecialty"+a).xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuLearningSpecialty"+a,//弹出层
							emptytext:"选择专业",
							hiddenID : "selectLearningSpecialtyhidden"+a//隐藏域ID	
				});
				
				a ++;
				
    		});
    		
    		//添加具备技能
    		$("#add_jineng").click(function(){
    			[@compress single_line = true]
    				var trHtml = 
					'<div class="jineng_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">'+b+'</td>
							</tr>
							<tr>
								<td>专业：</td>
								<td>
									<input type="hidden" id="selectSkillSpecialtyhidden'+b+'" value="">
									<div class="topnav">
										<a href="javascript:void(0);" id="selectSkillSpecialty'+b+'" class="as">
											<span>选择专业</span>		
										</a>	
									</div>
								</td>
								<td>技能等级:</td>
								<td style="padding-right:70px;">
									<select id="skillLevel'+b+'" style="width:158px;">
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
									<input type="hidden" id="selectSkillJobshidden'+b+'" value="">
									<div class="topnav">
										<a class="as" href="javascript:void(0);" id="selectSkillJobs'+b+'">
											<span>选择工种</span>		
										</a>	
									</div>
								</td>
								<td>从事年限:</td>
								<td><input type="text" id="workingLifeSkill'+b+'"></td>
							</tr>
							<tr>
								<td>说明:</td>
								<td colspan="3"><textArea  id="noteSkill'+b+'" cols="50" style="resize:none;"></textArea></td>
								<td rowspan="3"><a class="delete_jineng" href="javascript:void(0);" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
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
				
				//删除具备技能
				$("a.delete_jineng").on("click",function(){
					if ($(".jineng").find("div.jineng_div").size() <= 1) {
						alert("必须至少保留一个参数");
					} else {
						$(this).closest("div").remove();
					}
				});
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
				
				b ++;
    		});
    		
    		//添加工作经历
    		$("#add_gongzuo").click(function(){
    			[@compress single_line = true]
    				var trHtml = 
    				'<div class="gongzuo_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">'+c+'</td>
							</tr>
							<tr>
								<td>起始时间:</td>
								<td colspan="3">
								<input type="text" id="beginDate" name="beginDate" eidWork="beginDateWork'+c+'" style="width:100px;height:25px" class="text Wdate" value="${(beginDate?string("yyyy-MM-dd"))!}"  onfocus="WdatePicker({maxDate: \'#F{$dp.$D(endDate)}\'});" />
								结束时间: <input type="text" id="endDate" eidWork="endDateWork'+c+'" name="endDate" style="width:100px;height:25px"class="text Wdate"value="${(endDate?string("yyyy-MM-dd"))!}"  onfocus="WdatePicker({minDate: \'#F{$dp.$D(beginDate)}\'});" />
								</td>	
							</tr>
							<tr>
								<td>工作单位:</td>
								<td style="padding-right:100px;"><input type="text" id="workspaceWork'+c+'"></td>
								<td>职务:</td>
								<td><input type="text" id="dutyWork'+c+'"></td>
							</tr>
							<tr>
								<td>工种:</td>
								<td>
									<input type="hidden" value="" id="selectWorkJobhidden'+c+'" />
									<div class="topnav">
										<a id="selectWorkJob'+c+'" href="javascript:void(0);" class="as">
											<span >
												选择工种
											</span>		
										</a>	
									</div>
								</td>
								<td>工作内容:</td>
								<td ><input type="text" id="noteWork'+c+'"></td>
								<td rowspan="3"><a class="delete_gongzuo" href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
					</div>';
					var html ='<div id="xmenuWorkJob'+c+'" class="xmenu" style="display: none;">'+Jobs +'</div>';
				[/@compress]
				if($(".gongzuo").find("div.gongzuo_div").size() <6){
					$(".gongzuo").append(trHtml);
					$("#conentDiv").parent().append(html);
				}else{
					alert("最多添加6条数据");
				}
				
				//删除工作经历
				$("a.delete_gongzuo").on("click",function(){
					if ($(".gongzuo").find("div.gongzuo_div").size() <= 1) {
						alert("必须至少保留一个参数");
					} else {
						$(this).closest("div").remove();
					}
				});
				
				// 为新增的标签添加弹窗控件
				$("#selectWorkJob"+c).xMenu({	
							width :600,	
							eventType: "click", //事件类型 支持focus click hover
							dropmenu:"#xmenuWorkJob"+b,//弹出层
							emptytext:"选择专业",
							hiddenID : "selectWorkJobhidden"+b//隐藏域ID	
				});
				
				c ++;
    		});
    		
    		//添加选择志愿
    		$("#add_zhiyuan").click(function(){
    			[@compress single_line = true]
    				var trHtml = 
    				'<div class="zhiyuan_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td rowspan="3" style="background:#DCDCDC;color:#FE7200;">'+d+'</td>
								<td>专业:</td>
								<td>
									<input type="hidden" value="" id="selectVolunteerSpecialtyhidden'+d+'"/>
									<div class="topnav">
										<a id="selectVolunteerSpecialty'+d+'" href="javascript:void(0);" class="as">
											<span >
												选择专业
											</span>		
										</a>	
									</div>
								</td>
								<td>择业地区:</td>
								<td><input type="text" id="expectAreaVolunteer'+d+'"></td>
							</tr>
							<tr>
								
								<td>工种:</td>
								<td>
									<input type="hidden" value="" id="selectVolunteerJobshidden'+d+'" />
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
									<input type="text" id="expectSalaryVolunteer'+d+'">
								</td>
							</tr>
							<tr>
								<td>其他要求:</td>
								<td colspan="3"><textArea cols="50" id="noteVolunteer'+d+'" style="resize:none;"></textArea></td>
								<td rowspan="3"><a class="delete_zhiyuan" href="javascript:void(0);" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
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
				
				//删除选择志愿
				$("a.delete_zhiyuan").on("click",function(){
					if ($(".zhiyuan").find("div.zhiyuan_div").size() <= 1) {
						alert("必须至少保留一个参数");
					} else {
						if(d!=2) d-- ;
						$(this).closest("div").remove();
					}
				});
				
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
				
				d ++;
    		});
    		
    	});
    </script>
    <script type="text/javascript">
    			
    		
		    $().ready(function() {
		    	// 初始化一些值。设置value为用户填写过的项选中。
		    	$("#polity").val("${sessionUser.polity}");
		    	$("#marriage").val("${sessionUser.marriage}");
		    	$("#eduLevel").val("${sessionUser.eduLevel}");
		    	$("#health").val("${sessionUser.health}");
		    	$("#sex").val("${sessionUser.sex}");
		    	// 为所有插件使用相同的模板。
		    	var html ='<div id="xmenuSkillSpecialty1" class="xmenu" style="display: none;">'+Specialty +'</div>'+
						'<div id="xmenuSkillJobs1" class="xmenu" style="display: none;">'+Jobs +'</div>'+
						'<div id="xmenuLearningSpecialty1" class="xmenu" style="display: none;">'+Specialty +'</div>'+
						'<div id="xmenuWorkJob1" class="xmenu" style="display: none;">'+Jobs +'</div>'+
						'<div id="xmenuVolunteerSpecialty1" class="xmenu" style="display: none;">'+Specialty +'</div>'+
						'<div id="xmenuVolunteerJobs1" class="xmenu" style="display: none;">'+Jobs +'</div>';
				$("#conentDiv").parent().append(html);
		    	
		    	//技能专业
				$("#selectSkillSpecialty1").xMenu({	
					width :600,	
					eventType: "click", //事件类型 支持focus click hover
					dropmenu:"#xmenuSkillSpecialty1",//弹出层
					emptytext:"选择专业",
					hiddenID : "selectSkillSpecialtyhidden1",//隐藏域ID	
					value : "1,8"
				});
				// 技能工种
				$("#selectSkillJobs1").xMenu({	
					width :600,	
					eventType: "click", //事件类型 支持focus click hover
					dropmenu:"#xmenuSkillJobs1",//弹出层
					emptytext:"选择工种",
					hiddenID : "selectSkillJobshidden1"//隐藏域ID	
				});
				// 学习经历专业
				$("#selectLearningSpecialty1").xMenu({	
					width :600,	
					eventType: "click", //事件类型 支持focus click hover
					dropmenu:"#xmenuLearningSpecialty1",//弹出层
					emptytext:"选择工种",
					hiddenID : "selectLearningSpecialtyhidden1"//隐藏域ID	
				});
				// 工作经历工种
				$("#selectWorkJob1").xMenu({	
					width :600,	
					eventType: "click", //事件类型 支持focus click hover
					dropmenu:"#xmenuWorkJob1",//弹出层
					emptytext:"选择工种",
					hiddenID : "selectWorkJobhidden1"//隐藏域ID	
				});
    	
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
				
    			// 提交信息列表
    			function sumitValidLIist(submitx){
    				  alert("xxxxx具备技能xxxxxxxxxx");
    				  $("div.jineng_div").each(function(index){
    				  		index++;
    				  		/*alert(index);
    				  		alert("专业id:" +$("#selectSkillSpecialtyhidden"+index).val());
							alert("工种id:"+$("#selectSkillJobshidden"+index).val());
							alert("技能能级:"+$("#skillLevel"+index).val());
							alert("从事年限:"+$("#workingLifeSkill"+index).val());
							alert("说明:"+$("#noteSkill"+index).val());*/
    				  })
    				   alert("xxxxx学习经历xxxxxxxxxx");
    				   $("div.xuexi_div").each(function(index){
    				  		index++;
    				  		/*alert(index);
							alert("开始时间:"+$("input[eidLearning='beginDateLearning"+index+"']").val());
							alert("结束时间:"+$("input[eidLearning='endDateLearning"+index+"']").val());
							alert("学校名称:"+$("#schoolLearning"+index).val());
							alert("系别:"+$("#deptLearning"+index).val());
    				  		alert("专业id:" +$("#selectLearningSpecialtyhidden"+index).val());
    				  		*/
    				  })
    				  alert("xxxxxxxx工作经验xxxxxxx");
    				  $("div.gongzuo_div").each(function(index){
    				  		index++;
    				  		/*alert(index);
							alert("开始时间:"+$("input[eidWork='beginDateWork"+index+"']").val());
							alert("结束时间:"+$("input[eidWork='endDateWork"+index+"']").val());
							alert("工作单位:"+$("#workspaceWork"+index).val());
							alert("职务:"+$("#dutyWork"+index).val());
    				  		alert("工种id:" +$("#selectWorkJobhidden"+index).val());
							alert("工作内容:"+$("#noteWork"+index).val());
							*/
    				  })
    				  
    			}
    			function submitVolunteer(submitx){
    				  alert("xxxxxxxx选择志愿xxxxxxx");
    				  $("div.zhiyuan_div").each(function(index){
    				  		index++;
    				  		alert(index);
    				  		alert("专业id:" +$("#selectVolunteerSpecialtyhidden"+index).val());
							alert("工种id:"+$("#selectVolunteerJobshidden"+index).val());
							alert("地区:"+$("#expectAreaVolunteer"+index).val());
							alert("薪水:"+$("#expectSalaryVolunteer"+index).val());
							alert("要求:"+$("#noteVolunteer"+index).val());
							
    				  })
    			}
		    	// ajax 提交验证和保存。
				function submitValid(submitx){
						$.ajax({
							url: "/ajaxComValidReg.jhtml",
							type: "POST",
							data: {
								id:${sessionUser.id},
								loginName: $("#loginName").val(),
								password:$("#password").val(),
								idcard:$("#idcard").val(),
								trueName:$("#trueName").val(),
								age:$("#age").val(),
								nation:$("#nation").val(),
								polity:$("#polity").val(),
								marriage:$("#marriage").val(),
								eyesight:$("#eyesight").val(),
								strongPoint:$("#strongPoint").val(),
								phoneNum:$("#phoneNum").val(),
								twoGirl:$('input:radio[name="twoGirl"]:checked').val(),
								sex:$("#sex").val(),
								eduLevel:$("#eduLevel").val(),
								height:$("#height").val(),
								health:$("#health").val(),
								address:$("#address").val(),
								workspace:$("#workspace").val(),
								jobId:$("#jobId").val(),
								singleChild:$('input:radio[name="singleChild"]:checked').val(),
								freeTrain:$('input:radio[name="freeTrain"]:checked').val(),
								freeIntro:$('input:radio[name="freeIntro"]:checked').val(),
								submit:submitx
								},
							dataType: "json",
							cache: false,
							success: function(data) {
									if(data.message == "success" && submitx == "submit"){
										alert("要提交其他信息了。");
										sumitValidLIist("xxx");
									}else{
										
									}
									alert(data.message);
								}
							});
					}
		    	// 用户名验证。
				$("#loginName,#idcard").change(function(){
					submitValid("no");
				});
				
				// 保存其他信息。
				$("#saveInfo").click(function() {
					var loginName=$("#loginName").val();
					if(loginName==""){
						alert("用户名必填！");
					}else{
						submitValid("submit");
						//sumitValidLIist("no");
					}
				});
				//保存志愿。
				$("#saveVolunteer").click(function() {
						submitVolunteer("no");
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
							<input type="button" style="margin-right: 10px;background: none repeat scroll 0 0 #6DBE3A;border: 1px solid #1C960C;border-radius: 4px;color: #FFFFFF; width: 75px;height:27px;" value="个人中心">
							<input type="button" onclick="Etech.logout();" style="background: none repeat scroll 0 0 #6DBE3A;border: 1px solid #1C960C;border-radius: 4px;color: #FFFFFF; width: 75px;height:27px;" value="退出">
						</td>
					</tr>
				</table>
			</div>
			<div class="j_main_left_1" style="margin-top:10px;height:auto;text-align:center;border:1px solid #E4630F;border-radius:4px;">
				<p style="background: #EE981F; text-align: center; margin: 5px; padding: 5px; border-radius: 5px; border: 0px none; color: #FFFFFF;">职位推荐</p>
				<div class="j_main_left_1_1">
					<p style="color: blue;font-weight:bold;">室内设计师</p>
					<p style="color: blue;">中南集团营销公司</p>
					<p>薪资待遇：面议</p>
					<p>招聘人数：若干人</p>
					<p>学历要求：中专</p>
				</div>
				<div class="j_main_left_1_1">
					<p style="color: blue;font-weight:bold;">室内设计师</p>
					<p style="color: blue;">中南集团营销公司</p>
					<p>薪资待遇：面议</p>
					<p>招聘人数：若干人</p>
					<p>学历要求：中专</p>
				</div>
				<div class="j_main_left_1_1" style="border-bottom:0;">
					<p style="color: blue;font-weight:bold;">室内设计师</p>
					<p style="color: blue;">中南集团营销公司</p>
					<p>薪资待遇：面议</p>
					<p>招聘人数：若干人</p>
					<p>学历要求：中专</p>
				</div>
			</div>
		</div>
		<div class="j_main_right" id="conentDiv">
			<div class="j_main_right_1">
				<p>所在位置 > 个人中心</p>
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
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 600px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<div class="" style="height: auto; overflow: hidden; float: left; width: 230px; margin-left: 30px; margin-top: 10px;margin-right:10px;">
							<table>
								<tr>
									<td>姓名:</td>
									<td><input type="text" id="trueName" value="${sessionUser.trueName}"></td>
								</tr>
								<tr>
									<td>登录名:</td>
									<td><input type="text" id="loginName" name="loginName" value="${sessionUser.loginName}"></td>
								</tr>
								<tr>
									<td>年龄:</td>
									<td><input type="text" id="age" value="${sessionUser.age}"></td>
								</tr>
								<tr>
									<td>民族:</td>
									<td><input type="text" id="nation" value="${sessionUser.nation}"></td>
								</tr>
								<tr>
									<td>政治面貌:</td>
									<td>
										<select id="polity" style="width:158px;">
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
										<select id="marriage" style="width:158px;">
											<option value="">请选择..</option>
											<option value="未婚">未婚</option>
											<option value="已婚">已婚</option>
											<option value="离异">离异</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>视力:</td>
									<td><input type="text" id="eyesight" value="${sessionUser.eyesight}"></td>
								</tr>
								<tr>
									<td>个人特长:</td>
									<td><input type="text" id="strongPoint" value="${sessionUser.strongPoint}"></td>
								</tr>
								<tr>
									<td>联系电话:</td>
									<td><input type="text" id="phoneNum" value="${sessionUser.phoneNum}"></td>
								</tr>
								<tr>
									<td>二女户:</td>
									<td>
										<input type="radio"  name="twoGirl" value="1" [#if sessionUser.twoGirl=="1"]checked="true"[#elseif sessionUser.twoGirl!="0"]checked="true"[/#if] style="width:0">是
										<input type="radio"  name="twoGirl" value="0" [#if sessionUser.twoGirl=="0"]checked="true"[/#if]style="width:0">否
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
										<select id="sex" style="width:158px;">
											<option value="">请选择..</option>
											<option value="man">男</option>
											<option value="woman">女</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>密码:</td>
									<td><input type="text" id="password" placeholder="不填则默认"></td>
								</tr>
								<tr>
									<td>身份证号:</td>
									<td><input type="text" id="idcard" name="idcard" value="${sessionUser.idcard}"></td>
								</tr>
								<tr>
									<td>文化程度:</td>
									<td>
										<select id="eduLevel" style="width:158px;">
											<option value="">请选择..</option>
											<option value="研究生以上">研究生以上</option>
											<option value="博士研究生">博士研究生</option>
											<option value="大学本科">大学本科</option>
											<option value="大学专科">大学专科</option>
											<option value="中专技校">中专技校</option>
											<option value="中等专科">中等专科</option>
											<option value="职业高中">职业高中</option>
											<option value="技工学校">技工学校</option>
											<option value="普通高中">普通高中</option>
											<option value="初中及以下">初中及以下</option>
											<option value="初级中学">初级中学</option>
											<option value="小学">小学</option>
											<option value="其他">其他</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>身高:</td>
									<td><input type="text" id="height" value="${sessionUser.height}"></td>
								</tr>
								<tr>
									<td>健康状况:</td>
									<td>
										<select id="health" style="width:158px;">
											<option value="">请选择..</option>
											<option value="健康">健康</option>
											<option value="患病">患病</option>
											<option value="残疾">残疾</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>家庭详细地址:</td>
									<td><input type="text" id="address" value="${sessionUser.address}"></td>
								</tr>
								<tr>
									<td>原工作单位:</td>
									<td><input type="text"  id="workspace" value="${sessionUser.workspace}"></td>
								</tr>
								<tr>
									<td>《就失业证》号:</td>
									<td><input type="text" id="jobId" value="${sessionUser.jobId}"></td>
								</tr>
								<tr>
									<td>独生子女:</td>
									<td>
										<input type="radio" name="singleChild" value="1" [#if sessionUser.singleChild=="1"]checked="true"[#elseif sessionUser.singleChild!="0"]checked="true"[/#if] style="width:0">是
										<input type="radio" name="singleChild" value="0" [#if sessionUser.singleChild=="0"]checked="true"[/#if]style="width:0">否
									</td>
								</tr>
							</table>
						</div>
						<div style="width: 150px; float: left; margin-left: 15px; height: auto; margin-top: 15px;">
									<div class="brandImg">
										<span><a onclick="file0.click()" href="javascript:void(0);">点击上传图片</a>
										</span>
												<img style="width:122px;height:150px" src="/resource/public/images/bg.png" name="img"/>
									</div>
									<input type="file" style="display:none" id="file0" name="file0" onchange="filename0.value=this.value;loadImgFast(this,0)">
									<input type="hidden" id="filename0" name="filename0">
						</div>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">具备技能</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input id="add_jineng" type="button" value="添加" style="cursor:pointer;width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div class="jineng">
					<div class="jineng_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">1</td>
							</tr>
							<tr>
								<td>专业：</td>
								<td>
									<input type="hidden" value="" id="selectSkillSpecialtyhidden1" value="8"/>
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
									<select id="skillLevel1" style="width:158px;">
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
									<input type="hidden" value="" id="selectSkillJobshidden1"/>
									<div class="topnav">
										<a id="selectSkillJobs1" href="javascript:void(0);" class="as">
											<span >
												选择工种
											</span>		
										</a>	
									</div>
								</td>
								<td>从事年限:</td>
								<td><input type="text" id="workingLifeSkill1"></td>
							</tr>
							<tr>
								<td>说明:</td>
								<td colspan="3"><textArea cols="50" style="resize:none;" id="noteSkill1"></textArea></td>
								<td rowspan="3"><a class="delete_jineng" href="javascript:void(0);" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
					</div>
					</div>
					
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">学习经历</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input id="add_xuexi" type="button" value="添加" style="cursor:pointer;width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div class="xuexi">
					<div class="xuexi_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">1</td>
							</tr>
							<tr>
								<td>起始时间:</td>
								<td colspan="3">
								<input type="text" name="beginDate" id="beginDate"  eidLearning="beginDateLearning1" style="width:100px;height:25px" class="text Wdate" value="${(beginDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'});" />
								结束时间: <input type="text"  name="endDate" id="endDate" eidLearning="endDateLearning1" style="width:100px;height:25px" class="text Wdate" value="${(endDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDate\')}'});" />
								</td>
							</tr>
							<tr>
								<td>学校名称:</td>
								<td style="padding-right:100px;">
								<input type="text" id="schoolLearning1"></td>
								<td>系别:</td>
								<td><input type="text" id="deptLearning1"></td>
							</tr>
							<tr>
								<td>专业:</td>
								<td colspan="3">
									<input type="hidden" value="" id="selectLearningSpecialtyhidden1"/>
									<div class="topnav">
										<a id="selectLearningSpecialty1" href="javascript:void(0);" class="as">
											<span >
												选择专业
											</span>		
										</a>	
									</div>
								</td>
								<td rowspan="3"><a class="delete_xuexi" href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
					</div>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">工作经历</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input id="add_gongzuo" type="button" value="添加" style="cursor:pointer;width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div class="gongzuo">
					<div class="gongzuo_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td rowspan="4" style="background:#DCDCDC;color:#F57200;">1</td>
							</tr>
							<tr>
								<td>起始时间:</td>
								<td colspan="3">
								<input type="text" eidWork="beginDateWork1" id="beginDate" name="beginDate" style="width:100px;height:25px" class="text Wdate" value="${(beginDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'});" />
								结束时间: <input type="text" eidWork="endDateWork1" id="endDate" name="endDate" style="width:100px;height:25px" class="text Wdate" value="${(endDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDate\')}'});" />
								</td>
							</tr>
							<tr>
								<td>工作单位:</td>
								<td style="padding-right:100px;"><input type="text" id="workspaceWork1"></td>
								<td>职务:</td>
								<td><input type="text" id="dutyWork1"></td>
							</tr>
							<tr>
								<td>工种:</td>
								<td>
									<input type="hidden" value="" id="selectWorkJobhidden1"/>
									<div class="topnav">
										<a id="selectWorkJob1" href="javascript:void(0);" class="as">
											<span >
												选择工种
											</span>		
										</a>	
									</div>
								</td>
								<td>工作内容:</td>
								<td ><input type="text" id="noteWork1"></td>
								<td rowspan="3"><a class="delete_gongzuo" href="javascript:void(0);">删除</a></td>
							</tr>
						</table>
					</div>
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
									<input type="radio" name="freeTrain" checked="true" style="width:0" value="1">是
									<input type="radio" name="freeTrain" style="width:0" value="0">否
								</td>
								<td>享受免费职业介绍:</td>
								<td>
									<input type="radio" name="freeIntro" checked="true" style="width:0" value="1">是
									<input type="radio" name="freeIntro" style="width:0" value="0">否
								</td>
							</tr>
						</table>
					</div>
					
					<p style="text-align:center;">
						<input type="button" id="saveInfo" value="保存">
						<input type="reset" value="重写">
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
					<div class="zhiyuan_div" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td rowspan="3" style="background:#DCDCDC;color:#FE7200;">1</td>
								<td>专业:</td>
								<td>
									<input type="hidden" value="" id="selectVolunteerSpecialtyhidden1"/>
									<div class="topnav">
										<a id="selectVolunteerSpecialty1" href="javascript:void(0);" class="as">
											<span >
												选择专业
											</span>		
										</a>	
									</div>
								</td>
								<td>择业地区:</td>
								<td><input type="text" id="expectAreaVolunteer1"></td>
							</tr>
							<tr>
								
								<td>工种:</td>
								<td>
									<input type="hidden" value="" id="selectVolunteerJobshidden1"/>
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
									<input type="text" id="expectSalaryVolunteer1">
								</td>
							</tr>
							<tr>
								<td>其他要求:</td>
								<td colspan="3"><textArea cols="50" id="noteVolunteer1" style="resize:none;"></textArea></td>
								<td rowspan="3"><a class="delete_zhiyuan" href="javascript:void(0);" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
					</div>
					</div>
					<p style="text-align:center;">
						<input type="button" id="saveVolunteer" value="保存">
						<input type="reset" value="重写">
					</p>
				</div>
			</div>
		</div>
	</div>
	
	[#include "/include/footer.ftl" /]
</body>
</html>