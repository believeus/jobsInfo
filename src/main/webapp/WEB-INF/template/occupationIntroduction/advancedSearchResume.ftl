<!DOCTYPE html>
<html>
<head>
    <title>高级搜索</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-1.7.2.min.js"></script>
    <link href="/resource/public/selectArea/css/css.css" type="text/css" rel="stylesheet">
   	<link href="/resource/public/js/jquery-X-Menu/css/xmenu.css" rel="stylesheet" type="text/css" />  
   	<link href="/resource/public/selectArea/css/css.css" type="text/css" rel="stylesheet">
   	<link href="/resource/public/selectArea/css/cityLayout.css" type="text/css" rel="stylesheet">
    <link href="/resource/public/js/jquery-X-Menu/css/powerFloat.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/resource/public/js/jquery.form.js"></script>
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-xmenu-search.js"></script> 
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-powerFloat-min.js"></script>
	<script type="text/javascript" src="/resource/public/js/admin/jquery.validate.js"></script>
	<link href="/resource/public/css/common.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/resource/public/js/admin/list.js"></script>
    <style type="text/css">
   		.j_main{
    		width:1000px;
    		height:auto;
    	}
    	.j_main_1{
    		width:995px;
    		height:30px;
    		background:#FFF1DA;
    		border:1px solid #F9CEAC;
    	}
		.j_main_right{
			float:left;
    		width:998px;
    		height:auto;
			overflow:hidden;		
		}
		.j_main_right_1{
    		width:996px;
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
			width:996px;
			height:auto;
			margin-top:10px;
			background:#FFFDF0;
			overflow:hidden;
		}
		.j_main_right_2_1{
			float: left;
		    height: 30px;
		    line-height: 30px;
		    margin: 0 25px;
		    width: 119px;
		}
		.j_main_right_2_2{
			float: left;
			width:800px;
			height:30px;
		    line-height: 30px;
		}
		.j_main_right_2_2 li {
		    float: left;
		    line-height: 30px;
		    list-style: none outside none;
		    padding: 0 15px;
		    font-size:12px;
		}
		.j_main_right_2_2 a:hover{
			color:blue;
			text-decoration:underline;
		}
		.j_main_right_2 input{
			width:160px;
		}
		.selected{
			color:#0000FF;
		}
		.selected a {
		    border: 1px solid #E4925A;
		    padding: 3px 10px;
		}
		.hotword {
			color:#0000FF;
		}
		.hotword a {
		    font-size: 13px;
		}
		.paixu{
			width:998px;
			height:30px;
		}
		.paixu li {
		    float: left;
		    list-style: none outside none;
		    margin-right: 5px;
		}
		.paixu a {
		    border: 1px solid #72ABD8;
		    border-radius: 4px;
		    padding: 3px;
		}
		.paixu_1{
			width:330px;
			height:30px;
			float:left;
		}
		.t_table{
			width:995px;
			height:auto;
			overflow:hidden;
			text-align:center;
			border:1px solid #C1C1C1;
		}
		.t_table th {
		    padding: 5px;
		    width: 239px;
		}
		.t_table tr {
		    line-height: 35px;
		}
		.t_table a:hover{
			text-decoration:underline;
		}
		.fenye a {
		    border: 0 none;
		    color: blue;
		    text-decoration: underline;
		}
		.list input {
		    width: 80px;
		}
		#start1{
			background: none repeat scroll 0 0 #88bbd4;
		    border-radius: 4px;
		    color: #fff;
		    font-weight: bold;
		    border:1px solid #88bbd4;
		    text-align:center;
		    line-height: 21px;
		    cursor:pointer;
		}
		.currentC{
			color:blue
		}
    </style>
</head>
<body>
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

	
		//  条件组合和切换。
		function Aclick(obj){
			$this=$(obj);
			// 得到当前a标签id值
			var aId=$this.attr("id");
			// 判断是否在同一组
			var group=$this.attr("group");
			// 判断当前连接的class 是否是选中的状态
			var claxx=$this.attr("class");
			var data="";
			var str="${data}";
			var str3=str.split("-");
			var ifx=false;
			// 不是选中状态
			if(claxx == null){
				// 判断当前所选a值是否作替换条件了。
				// 遍历条件id数组，得到组值
				for(var i=0;i<str3.length;i++){
					var vgroup=str3[i].split("_")[1];
					//如果组值相同，则进行替换
					if(vgroup == group){
						str3[i]=aId;
						ifx=true;
					}
					data=data+str3[i];
					if(i!=str3.length-1){
						if(data!=""){
							data=data + "-" ;
						}
					}
				} 
				//当前a值没有做替换使用则加上这个条件。
				if(ifx!=true){
					if(data!=""){
						data=data+"-";
					}
					data=data+aId;
				}
				// 发送form表单提交。
				$("#data").val(data);
				$("#listForm").submit();
	        	
			// 是选中状态的时候
			}else{
				// 遍历条件id数组，得到组值
				for(var i=0;i<str3.length;i++){
					//匹配条件值是否再次被点击，然后取消 
					if(str3[i]!=aId){
						data=data+str3[i];
						if(i!=str3.length-1){
							if(data!=""){
								data=data + "-" ;													
							}
						}
					}
				} 
				$("#data").val(data);
				$("#listForm").submit();
			}
		}
		function changeKeyword(value,object){
			var name=$(object).attr("id");
			if(name=="changeKeyword"){
				$("#keyword").val(value);
			}
		}
		$().ready(function(){
			
			// 条件组合显示
			var strdata="${data}";
			if(strdata==""){
				$("a[name='不限']").each(function(){
					$(this).attr("class","currentC");
				})
			}
			strdata=strdata.split("-");
			var myarray=new Array(6);
			for(var i=0;i<6;i++){
			  if(strdata[i]!=""&&strdata[i]!=undefined){
				var str=strdata[i].split("_")[0];
				var sgroup=strdata[i].split("_")[1];
				if(str!=""){
					// 添加class 为当前所选的。
					myarray[sgroup]=sgroup;
					$("a[name='"+str+"']").attr("class","currentC");
					var html='<span><a href="javascript:void(0);" class="none" onclick="javascript:Aclick(this);" group="'+sgroup+'" id="'+strdata[i]+'" name="'+str+'" >'
					+str+
					'<span style="color: #E4925A;font-size: 17px;margin-left: 10px;">&times;</span></a></span>	';
					$(".selected").append(html);
				}
			  }
			}
			
			 $.each(myarray,function(n,value) {
			 	if(value==undefined){
			 		$("a[group='"+n+"']").each(function(){
					  	if($(this).attr("name")=="不限"){
					  		$(this).attr("class","currentC");
					  	}
					 })
			 	}
			 })
			 
			// 关键字显示
			$("#keyword").val("${keyword}");
			
			var html ='<div id="xmenuSpecialty1" class="xmenu" style="display: none;">'+Specialty +'</div>'+
				  '<div id="xmenuJobs1" class="xmenu" style="display: none;">'+Jobs +'</div>';
			$("#tag").parent().append(html);
			
			// 判断是否有值存在。
			[#if majorTypeId!=""]
				// 添加弹窗控件。
			$("#selectSpecialty1").xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuSpecialty1",//弹出层
						emptytext:"选择专业",
						hiddenID : "selectSpecialtyhidden1",//隐藏域ID
						value : "${majorTypeId}"	
			});
			[#else]
				// 添加弹窗控件。
			$("#selectSpecialty1").xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuSpecialty1",//弹出层
						emptytext:"选择专业",
						hiddenID : "selectSpecialtyhidden1"//隐藏域ID	
			});
			[/#if]
			[#if workTypeId!=""]
				$("#selectJobs1").xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuJobs1",//弹出层
						emptytext:"选择工种",
						hiddenID : "selectJobshidden1",//隐藏域ID
						value : "${workTypeId}"	
			});
			[#else]
				$("#selectJobs1").xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuJobs1",//弹出层
						emptytext:"选择工种",
						hiddenID : "selectJobshidden1"//隐藏域ID	
			});
			[/#if]
			
			// form 表单提交之前
			$("#listForm").validate({
				submitHandler: function(form) {  
					if($("#data").val()==""&&$("#keyword").val()==""&&$("#selectSpecialty1").val()==""&&$("#selectJobs1").val()==""&&$("#start1").val()=="选择城市"){
						if(strdata==""){
							$("#listForm").attr("action","/resumeAdvancedSearch.jhtml");
						}
					}
					form.submit();
				}
			});
		
		})
	</script>
	[#include "/include/header.ftl" /]
	<div class="j_main w">
		<div class="j_main_right">
			<div class="j_main_1">
				<style type="text/css">
					#demo {overflow:hidden;width: 885px;margin-left:8px;float:left;height:30px;line-height:30px;}
					#demo img {border: 3px solid #F2F2F2;}
					#indemo {float: left;width: 800%;}
					#demo1 {float: left;}
					#demo2 {float: left;}
				</style>
				<div style="padding-left: 10px;width:70px;height:30px;line-height:30px;;float:left;font-size:13px;">最新消息：</div>
				<div id="demo">
					<div id="indemo">
						<div id="demo1">
							[#list notices as notices]
								<span style="font-size:12px;margin-right:5px;">${notices.editTime?number_to_datetime}</span>
								<a style="margin-right:10px;color:red;" href="/publicityInfo.jhtml?id=${notices.id}" title="${notices.title}">
									${notices.title}
								</a>
							[/#list]
						</div>
						<div id="demo2"></div>
					</div>
				</div>
				<script type="text/javascript">
					var speed=20;
					var tab=document.getElementById("demo");
					var tab1=document.getElementById("demo1");
					var tab2=document.getElementById("demo2");
					tab2.innerHTML=tab1.innerHTML;
					function Marquee(){
						if(tab2.offsetWidth-tab.scrollLeft<=0)
							tab.scrollLeft-=tab1.offsetWidth
						else{
							tab.scrollLeft++;
						}
					}
					var MyMar=setInterval(Marquee,speed);
					tab.onmouseover=function() {clearInterval(MyMar)};
					tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};
				</script>
			</div>
			<form id="listForm" novalidate="novalidate"  action="/advanceSearchByContision.jhtml"  method="post" >
			<input type="hidden" name="data" value="" id="data">
			<script>
			$(function(){
			        $("#type").val("${location}");
					$("#type").change(function(){
					//  if($("#keyword").val()==""){
					    // 搜索职位
						if($(this).val()=="position"){
						  top.location.href="/jobAdvancedSearch.jhtml";
						// 搜索简历
						}else if($(this).val()=="resume"){
						  top.location.href="/resumeAdvancedSearch.jhtml";
						// 搜索公司
						}else if($(this).val()=="company"){
						  top.location.href="/companyAdvancedSearch.jhtml";
						}
					  //}
					});
				});
			</script>
			<div id="tag" class="j_main_right_2" style="border:1px solid #E4925A;border-radius:4px;">
				<table style="background: #60B732; border-radius: 4px; margin: 5px 25px;">
					<tr>
						<td>
							<select id="type" name="type" style="color:#868686;" value="${location}">
								<option value="position">职位搜索</option>
								<option value="resume" >简历搜索</option>
								<option value="company">公司搜索</option>
							</select>
						</td>
						<td><input type="text" placeholder="请输入关键字.." name="keyword" id="keyword"></td>
						<td>
							<input type="hidden" value="" id="selectSpecialtyhidden1" name="majorTypeId"/>
							<script>
								$(function(){
									 $("#xmenuSpecialty1 li").click(function(){
										   $("#selectSpecialty1 span").text($(this).text());
										   $("#selectSpecialtyhidden1").val($(this).attr("rel"));
										   $("#xmenuSpecialty1").hide();
										});
								
								});
							</script>
							<div class="topnav">
								<a id="selectSpecialty1" href="javascript:void(0);" class="as">
									<span >
									[#if majorTypeId!=""]
										[#if majorValue?length > 10]
											${majorValue?string?substring(0,10)}...
										[#else]
											${majorValue}
										[/#if]
									[#else]
										选择专业										
									[/#if]
									</span>		
								</a>	
							</div>
						</td>
						<td>
							<input type="hidden" value="" id="selectJobshidden1" name="workTypeId"/>
							<script>
							$(function(){
								 $("#xmenuJobs1 li").click(function(){
										   $("#selectJobs1 span").text($(this).text());
										   $("#selectJobshidden1").val($(this).attr("rel"));
										   $("#keyword").val($(this).text());
										   $("#xmenuJobs1").hide();
										});
										
							});
							</script>
							<div class="topnav">
								<a id="selectJobs1" href="javascript:void(0);" class="as">
									<span id="changeKeyword">
									[#if workTypeId!=""]
										[#if workValue?length > 10]
											${workValue?string?substring(0,10)}...
										[#else]
											${workValue}
										[/#if]
									[#else]
										选择工种										
									[/#if]
									</span>		
								</a>	
							</div>
						</td>
						<td>
							<input type="text" name="area" id="start1" value="[#if area !=""]${area}[#else]选择城市[/#if]" autocomplete="off" class="city_input  inputFocus proCityQueryAll proCitySelAll current2" style="width:auto;min-width:150px;" readonly="readonly">
							<!--/////地区插件///////////////////////////////////////////////////////////////////-->
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
						<td><input type="submit" value="搜索" style="width: 80px;"></td>
					</tr>
				</table>
				<div style="width: 996px; height: 30px;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">发布日期</span><span style="color: blue; float: right;"><a group="0" name="不限" id="" href="javascript:void(0);" onclick="javascript:Aclick(this);">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="0" id="近2天_0" name="近2天">近2天</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="0" id="近3天_0" name="近3天">近3天</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="0" id="近7天_0" name="近7天">近7天</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="0" id="近15天_0" name="近15天">近15天</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="0" id="近30天_0" name="近30天">近30天</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="0" id="近60天_0" name="近60天">近60天</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="0" id="近60天以上_0" name="近60天以上">近60天以上</a></li>
						</ul>
					</div>
				</div>
				<div style="width: 996px; height: 30px;background:#FFF1DA;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">起薪范围</span><span style="color: blue; float: right;"><a group="1" name="不限" id="" href="javascript:void(0);" onclick="javascript:Aclick(this);">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="1" id="1000以下_1" name="1000以下">1000以下</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="1" id="1000~1999_1" name="1000~1999">1000~1999</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="1" id="2000~2999_1" name="2000~2999">2000~2999</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="1" id="3000~3999_1" name="3000~3999"> 3000~3999</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="1" id="4000~4999_1" name="4000~4999">4000~4999</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="1" id="5000以上_1" name="5000以上">5000以上</a></li>
						</ul>
					</div>
				</div>
				<div style="width: 996px; height: 30px;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">工作性质</span><span style="color: blue; float: right;"><a group="2" name="不限" id="" href="javascript:void(0);" onclick="javascript:Aclick(this);">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="2" id="全职_2" name="全职">全职</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="2" id="兼职_2" name="兼职">兼职</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="2" id="实习_2" name="实习">实习</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="2" id="临时_2" name="临时">临时</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="2" id="小时工_2" name="小时工">小时工</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="2" id="全职/兼职/实习均可_2" name="全职/兼职/实习均可">全职/兼职/实习均可</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="2" id="就业见习_2" name="就业见习">就业见习</a></li>
						</ul>
					</div>
				</div>
				<div style="width: 996px; height: 30px;background:#FFF1DA;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">学历要求</span><span style="color: blue; float: right;"><a group="3" name="不限" id="" href="javascript:void(0);" onclick="javascript:Aclick(this);">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="博士_3" name="博士">博士</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="硕士_3" name="硕士">硕士</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="大学_3" name="大学">大学</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="大专_3" name="大专">大专</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="中专中技_3" name="中专中技">中专中技</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="技校_3" name="技校">技校</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="高中_3" name="高中">高中</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="职高_3" name="职高">职高</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="初中_3" name="初中">初中</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="小学_3" name="小学">小学</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="文盲或半文盲_3" name="文盲或半文盲">文盲或半文盲</a></li>
						</ul>
					</div>
				</div>
			</div>
			<p class="selected">您选择的是：
			</p>
			
			<div class="paixu">
				<span class="fenye" style="float: right; margin: 0px;">
				共${comInfoList.total}条记录
				</span>
			</div>
			<div class="t_table" style="">
				<table cellspacing="0">
					<tr style="background: url(/resource/public/images/bg-image.png); line-height: 30px;">
						<th>姓名</th>
						<th>工种</th>
						<th>月薪范围</th>
						<th>择业地区</th>
						<th>发布时间</th>
					</tr>
					[#list comInfoList.content as info]
					<tr>
						<td><a style="color:#0101FF;" href="/personalResume.jhtml?id=${info.comUser.id}">${info.comUser.trueName}</a></td>
						<td><a style="color:#0101FF" >${info.jobPost}</a></td>
						<td style="color:#0101FF;">${info.expectSalary}</td>
						<td>${info.expectArea}</td>
						<td>${info.editDate?number_to_date} ${info.editDate?number_to_time}</td>
					</tr>
				   [/#list]
				</table>
				<div class="paixu" style="margin-top:30px;">
					[@pagination pageNumber = comInfoList.pageNumber totalPages = comInfoList.totalPages]
						[#include "/include/pagination.ftl"]
					[/@pagination]
				</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- alpha div -->
	<div id="maskLayer" style="display:none">
	<div id="alphadiv" style="filter:alpha(opacity=50);-moz-opacity:0.5;opacity:0.5"></div>
		<div id="drag">
			<h3 id="drag_h"></h3>
			<div id="drag_con"></div><!-- drag_con end -->
		</div>
	</div><!-- maskLayer end -->
	</div>
	<!-- alpha div end -->
	<div id="sublist" style="display:none"></div>
	
	[#include "/include/footer.ftl" /]
	<script src="/resource/public/selectArea/js/public.js"></script>
</body>
</html>