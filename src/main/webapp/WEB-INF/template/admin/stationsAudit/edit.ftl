<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>岗位审核 - Powered By e3dmall</title>
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
<link href="/resource/public/js/jquery-X-Menu/css/xmenu-edit.css" rel="stylesheet" type="text/css" />  
<link href="/resource/public/js/jquery-X-Menu/css/powerFloat.css" rel="stylesheet" type="text/css" />  
<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-xmenu-edit.js"></script> 
<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-powerFloat-min.js"></script>
<script type="text/javascript" src="/resource/public/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/resource/public/js/waitamoment.js"></script>

<style type="text/css">
	.list li {
	    line-height: 23px;
	}
	.list input {
		width:80px;
	}
	input[type="text"] {
	    width: 176px;
	}
</style>
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
	$("#workyear1").val("${recruit.workyear}");
 	$("#sex1").val("${recruit.sex}");
 	$("#eduLevel1").val("${recruit.eduLevel}");
 	$("#salary1").val("${recruit.salary}");
 	$("#worklimit1").val("${recruit.worklimit}");
 	$("#workWay1").val("${recruit.workWay}");
 	
	var $inputForm = $("#inputForm");
	var $type = $("#type");
	var $contentTr = $("#contentTr");
	var $pathTr = $("#pathTr");
	var $path = $("#path");
	var $browserButton = $("#browserButton");
	
	var html='<div id="xmenuSkillSpecialty1" class="xmenu" style="display: none;">'+Specialty +'</div>'
			+'<div id="xmenuSkillJobs1" class="xmenu" style="display: none;">'+Jobs +'</div>';
			$("#inputForm").parent().append(html);
		//技能专业
	$("#selectSkillSpecialty1").xMenu({	
		width :600,	
		eventType: "click", //事件类型 支持focus click hover
		dropmenu:"#xmenuSkillSpecialty1",//弹出层
		emptytext:"选择专业",
		hiddenID : "selectSkillSpecialtyhidden1",//隐藏域ID
		value:"${recruit.majorType.id}"	
	});
	// 技能工种
	$("#selectSkillJobs1").xMenu({	
		width :600,	
		eventType: "click", //事件类型 支持focus click hover
		dropmenu:"#xmenuSkillJobs1",//弹出层
		emptytext:"选择工种",
		hiddenID : "selectSkillJobshidden1",//隐藏域ID	
		value : "${recruit.workType.id}"
	});
	
	
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
				   submitJobs();
   			}  
		});
	
		//封装ajax信息提交
		function submitJobs(){
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
	    		}else if($("#beginDate").val() == ""){
	    			alert("请选择面试时间");
	    			tag=true;
	    		}else{
		    		if(tag==false){
		    			showdiv();
		    			var viewData=new Date($("#beginDate").val().replace(/-/g,",")).getTime();
						$("#viewData").val(viewData);
						$(form).submit();  
	    			}
	    		}
				  
			}
			
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml">首页</a> &raquo; 编辑内容
	</div>
	
	
	
	<form id="inputForm" novalidate="novalidate"  action="/admin/stationAudit/update.jhtml" method="post">
		<input type="hidden" name="id" value="${recruit.id}"/>
		<input type="hidden" name="status" value="${recruit.status}"/>
		<input type="hidden" name="createTime" value="${recruit.createTime}"/>
		<input type="hidden" name="userId" value="${recruit.entUser.id}"/>
		<input type="hidden" name="viewData" value="" id="viewData">
		<input type="hidden" name="isview" value="${recruit.isview}">
			<table class="input">
				<tr>
					<th>招聘单位:</th>
					<td style="padding-right:80px;">
						<input type="text" id="company1" name="company" value="${recruit.company}"/>
					</td>
					<th>人数:</th>
					<td><input type="text" id="worknum1" name="worknum" value="${recruit.worknum}"/></td>
				</tr>
				<tr>
					<th>工种:</th>
					<td>
						<input type="hidden" id="selectSkillJobshidden1" name="workTypeId" value="${recruit.workType.id}"/>
						<div class="topnav">
							<a id="selectSkillJobs1" href="javascript:void(0);" class="as">
								<span >
									[#assign name=recruit.workType.name]
									[#if name?length > 15]
										${name?string?substring(0,15)}...
									[#else]
										${name}
									[/#if]
								</span>		
							</a>	
						</div>
					</td>
					<th>性别:</th>
					<td>
						<select id="sex1" name="sex" style="width: 183px;">
							<option value="">请选择..</option>
							<option value="woman">男</option>
							<option value="man">女</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>专业:</th>
					<td>
						<input type="hidden" id="selectSkillSpecialtyhidden1" name="majorTypeId" value="${recruit.majorType.id}"/>
							<input type="hidden" value="1" name="infoType">
						<div class="topnav">
							<a id="selectSkillSpecialty1" href="javascript:void(0);" class="as">
								<span >
									[#assign name=recruit.majorType.name]
									[#if name?length > 15]
										${name?string?substring(0,15)}...
									[#else]
										${name}
									[/#if]
								</span>		
							</a>	
						</div>
					</td>
					<th>技术等级:</th>
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
					<th>从事年限:</th>
					<td>
					<select id="workyear1" name="workyear"  value="${recruit.workyear}" style="width: 186px;">
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
					<th>文化程度:</th>
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
					<th>工作地点:</th>
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
					<th>年龄:</th>
					<td><input type="text" id="age1" name="age" value="${recruit.age}"></td>
				</tr>
				<tr>
					<th>身高:</th>
					<td><input type="text" id="height1" name="height" value="${recruit.height}"/><span style="margin-left:-25px;color:#000000;">cm</span></td>
					<th>视力:</th>
					<td><input type="text" id="eyesight1" name="eyesight" value="${recruit.eyesight}"></td>
				</tr>
				<tr>
					<th>薪资待遇:</th>
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
					<th>用工形式:</th>
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
					<th>招聘期限:</th>
					<td>
						<select id="worklimit1" name="worklimit" style="width: 183px;" value="${recruit.worklimit}">
							<option value="三个月">三个月</option>
							<option value="一个月">一个月</option>
							<option value="六个月">六个月</option>
							<option value="一年">一年</option>
							<option value="长期">长期</option>
						</select>
					</td>
					<th>面试时间:</th>
					<td>
						<input type="text" value="[#if recruit.viewData!=0]${recruit.viewData?number_to_date}[/#if]" name="beginDate" id="beginDate"   style="width:172px;height:25px" class="text Wdate"  onfocus="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'});" />
				    	<input type="hidden"  name="endDate" id="endDate"  style="width:100px;height:25px" class="text Wdate"  onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDate\')}'});" />
					</td>
				</tr>
				<tr>
					<th style="vertical-align:top;">其他说明:</th>
					<td colspan="3">
						<textArea rows="3" cols="77" style="resize:none;" id="note1" name="note">${recruit.note}</textArea>
					</td>
				</tr>
				<tr>
					<th>
						&nbsp;
					</th>
					<td colspan="3">
						<input type="submit" id="savaJobs" class="button" value="确定">
						<input type="button" id="backButton" class="button" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	<script src="/resource/public/selectArea/js/public.js"></script>
</body>
</html>