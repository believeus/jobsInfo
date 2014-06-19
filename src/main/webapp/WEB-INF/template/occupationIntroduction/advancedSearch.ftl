<!DOCTYPE html>
<html>
<head>
    <title>高级搜索</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-1.7.2.min.js"></script>
   	<link href="/resource/public/js/jquery-X-Menu/css/xmenu.css" rel="stylesheet" type="text/css" />  
    <link href="/resource/public/js/jquery-X-Menu/css/powerFloat.css" rel="stylesheet" type="text/css" />  
	<script type="text/javascript" src="/resource/public/js/jquery.form.js"></script>
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-xmenu-search.js"></script> 
	<script type="text/javascript" src="/resource/public/js/jquery-X-Menu/js/jquery-powerFloat-min.js"></script>
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
		    margin-top:-14px;
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
		    width: 194px;
		}
		.t_table tr {
		    line-height: 35px;
		}
		.t_table a:hover{
			text-decoration:underline;
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
							<dt class="open" id="${majorParent.codeId}">${majorParent.name}</dt>
							<dd>
								<ul>
								[@majorChildrenList parentCodeId = majorParent.codeId]
								[#list MajorChildrenList as majorChildren]
									<li rel="${majorChildren.codeId}">
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
							<dt class="open" id="${workParent.codeId}">${workParent.name}</dt>
							<dd>
								<ul>
								[@workChildrenList parentCodeId = workParent.codeId]
								[#list WorkChildrenList as workChildren]
									<li rel="${workChildren.codeId}">
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
			var aId=$this.attr("name");
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
						data=data + "-" ;					
					}
				} 
				//当前a值没有做替换使用则加上这个条件。
				if(ifx!=true){
					data=data+"-"+aId;
				}
				// 发送form表单提交。
				$("#data").val(data);
				$("#infoForm").submit();
	        	
			// 是选中状态的时候
			}else{
				// 遍历条件id数组，得到组值
				for(var i=0;i<str3.length;i++){
					//匹配条件值是否再次被点击，然后取消 
					if(str3[i]!=aId){
						data=data+str3[i];
						if(i!=str3.length-1){
							data=data + "-" ;					
						}
					}
				} 
				$("#data").val(data);
				$("#infoForm").submit();
			}
		}
			
		$().ready(function(){
			
			var strdata="${data}";
			strdata=strdata.split("-");
			for(var i=0;i<strdata.length;i++){
				var reg=new RegExp("~","g"); 
				strdata[i]=strdata[i].replace(reg,"-");
				var str=strdata[i].split("_")[0];
				if(str!=""){
					// 添加class 为当前所选的。
					$("#"+strdata[i]).attr("class","current");
					var html='<span><a href="javascript:void(0);" onclick="javascript:Aclick(this);" class="current" >'
					+$("#"+strdata[i]).text()+
					'<span style="color: #E4925A;font-size: 17px;margin-left: 10px;">&times;</span></a></span>	';
					$(".selected").append(html);
				}
				
			}
			var html ='<div id="xmenuSpecialty1" class="xmenu" style="display: none;">'+Specialty +'</div>'+
				  '<div id="xmenuJobs1" class="xmenu" style="display: none;">'+Jobs +'</div>';
			$("#tag").parent().append(html);
			
			// 添加弹窗控件。
			$("#selectSpecialty1").xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuSpecialty1",//弹出层
						emptytext:"选择专业",
						hiddenID : "selectSpecialtyhidden1"//隐藏域ID	
			});
			$("#selectJobs1").xMenu({	
						width :600,	
						eventType: "click", //事件类型 支持focus click hover
						dropmenu:"#xmenuJobs1",//弹出层
						emptytext:"选择工种",
						hiddenID : "selectJobshidden1"//隐藏域ID	
			});
		
		
		})
	</script>
	[#include "/include/header.ftl" /]
	<div class="j_main w">
		<div class="j_main_right">
			<div class="j_main_1">
				<table align="left"  style="font-size: 13px; padding: 4px;">
					<tr>
						<td style="padding-right: 20px; padding-left: 10px;">最新消息：</td>
						<td style="padding-right: 20px;">05月21日</td>
						<td style="padding-right: 40px;">潜江人才招聘会第二期.....</td>
						<td style="padding-right: 20px;">05月21日</td>
						<td style="padding-right: 40px;">潜江人才招聘会第二期.....</td>
						<td style="padding-right: 20px;">05月21日</td>
						<td style="padding-right: 40px;">潜江人才招聘会第二期.....</td>
					</tr>
				</table>
			</div>
			<form id="infoForm" novalidate="novalidate"  action="/advancedSearch.jhtml"  method="post" >
			<input type="hidden" name="data" value="" id="data">
			<div id="tag" class="j_main_right_2" style="border:1px solid #E4925A;border-radius:4px;">
				<table style="background: #60B732; border-radius: 4px; margin: 5px 25px;">
					<tr>
						<td>
							<select name="type" style="color:#868686;">
								<option value="position">职位搜索</option>
								<option value="resume" >简历搜索</option>
								<option value="company">公司搜索</option>
							</select>
						</td>
						<td><input type="text" placeholder="请输入关键字.." name="keyword"></td>
						<td>
							<input type="hidden" value="" id="selectSpecialtyhidden1" name="majorTypeId"/>
							<div class="topnav">
								<a id="selectSpecialty1" href="javascript:void(0);" class="as">
									<span >
										选择专业
									</span>		
								</a>	
							</div>
						</td>
						<td>
							<input type="hidden" value="" id="selectJobshidden1" name="workTypeId"/>
							<div class="topnav">
								<a id="selectJobs1" href="javascript:void(0);" class="as">
									<span >
										选择工种
									</span>		
								</a>	
							</div>
						</td>
						<td><input type="text" placeholder="请选择区域.." name="area"></td>
						<td><input type="button" value="搜索" style="width: 80px;"></td>
					</tr>
				</table>
				<div style="width: 996px; height: 30px;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">发布日期</span><span style="color: blue; float: right;"><a style="color: blue; font-size: 12px;" href="">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="0" id="近2天_0" name="近2天_0">近2天</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="0" id="近3天_0" name="近3天_0">近3天</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="0" id="近7天_0" name="近7天_0">近7天</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="0" id="近15天_0" name="近15天_0">近15天</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="0" id="近30_0" name="近30_0">近30天</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="0" id="近60天_0" name="近60天_0">近60天</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="0" id="近60天以上_0" name="近60天以上_0">近60天以上</a></li>
						</ul>
					</div>
				</div>
				<div style="width: 996px; height: 30px;background:#FFF1DA;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">起薪范围</span><span style="color: blue; float: right;"><a style="color: blue; font-size: 12px;" href="">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="1" id="1000以下_1" name="1000以下_1">1000以下</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="1" id="1000-1999_1" name="1000~1999_1">1000~1999</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="1" id="2000-2999_1" name="2000~2999_1">2000~2999</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="1" id="3000-3999_1" name="3000~3999_1"> 3000~3999</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="1" id="4000-4999_1" name="4000~4999_1">4000~4999</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="1" id="5000以上_1" name="5000以上_1">5000以上</a></li>
						</ul>
					</div>
				</div>
				<div style="width: 996px; height: 30px;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">工作性质</span><span style="color: blue; float: right;"><a st-yle="color: blue; font-size: 12px;" href="">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="2" id="全职_2" name="全职_2">全职</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="2" id="兼职_2" name="兼职_2">兼职</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="2" id="实习_2" name="实习_2">实习</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="2" id="临时_2" name="临时_2">临时</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="2" id="小时工_2" name="小时工_2">小时工</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="2" id="全职/兼职/实习均可_2" name="全职/兼职/实习均可_2">全职/兼职/实习均可</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="2" id="就业见习_2" name="就业见习_2">就业见习</a></li>
						</ul>
					</div>
				</div>
				<div style="width: 996px; height: 30px;background:#FFF1DA;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">学历要求</span><span style="color: blue; float: right;"><a style="color: blue; font-size: 12px;" href="">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="博士_3" name="博士_3">博士</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="硕士_3" name="硕士_3">硕士</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="大学_3" name="大学_3">大学</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="大专_3" name="大专_3">大专</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="中专中技_3" name="中专中技_3">中专中技</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="技校_3" name="技校_3">技校</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="高中_3" name="高中_3">高中</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="职高_3" name="职高_3">职高</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="初中_3" name="初中_3">初中</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="小学_3" name="小学_3">小学</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="3" id="文盲或半文盲_3" name="文盲或半文盲_3">文盲或半文盲</a></li>
						</ul>
					</div>
				</div>
				<div style="width: 996px; height: 30px;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">工作年限</span><span style="color: blue; float: right;"><a style="color: blue; font-size: 12px;" href="">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="4" id="在读学生_4" name="在读学生_4">在读学生</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="4" id="应届毕业生_4" name="应届毕业生_4">应届毕业生</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="4" id="1-2年_4" name="1-2年_4">1~2年</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="4" id="2-3年_4" name="2~3年_4">2~3年</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="4" id="3-5年_4" name="3~5年_4">3~5年</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="4" id="5-8年_4" name="5~8年_4">5~8年</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="4" id="8-10年_4" name="8~10年_4">8~10年</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="4" id="10年以上_4" name="10年以上_4">10年以上</a></li>
						</ul>
					</div>
				</div>
				<div style="width: 996px; height: 30px;margin-bottom:25px;background:#FFF1DA;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">公司性质</span><span style="color: blue; float: right;"><a style="color: blue; font-size: 12px;" href="">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="5" id="内资0_5" name="内资">内资</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="5" id="国有全资_5" name="国有全资">国有全资</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="5" id="集体全资_5" name="集体全资">集体全资</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="5" id="股份合作_5" name="股份合作">股份合作</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="5" id="联营_5" name="联营">联营</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="5" id="国有联营_5" name="国有联营">国有联营</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="5" id="国有与集体联营_5" name="国有与集体联营">国有与集体联营</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="5" id="其他联营_5" name="其他联营">其他联营</a></li>
							<li><a href="javascript:void(0);" onclick="javascript:Aclick(this);" group="5" id="有限责任（公司）_5" name="有限责任（公司）">有限责任（公司）</a></li>
						</ul>
					</div>
				</div>
			</div>
			</form>
			<p class="selected">您选择的是：
			</p>
			<p class="hotword">搜索热词： 
				<span><a href="">软件工程师</a></span>
				<span><a href="">建筑工程师</a></span>
				<span><a href="">厨师</a></span>
				<span><a href="">会计</a></span>
				<span><a href="">出租司机</a></span>
				<span><a href="">计算机硬件工程师</a></span>
				<span><a href="">计算机软件工程师</a></span>
			</p>
			<div class="paixu">
				<div class="paixu_1">
					<span>排序方式：</span>
					<a href="">按有效日期</a>
					<a href="">按月薪范围</a>
					<a href="">按相关度</a>
				</div>
				
				<ul style="float: right; margin: 0px;">
					<li>
						<a href="">上一页</a>
					</li>
					<li>
						<a href="">1</a>
					</li>
					<li>
						<a href="">2</a>
					</li>
					<li>
						<a href="">3</a>
					</li>
					<li>
						<a href="">4</a>
					</li>
					<li>
						<a href="">5</a>
					</li>
					<li>
						<a href="">下一页</a>
					</li>
				</ul>
			</div>
			<div class="t_table" style="">
				<table cellspacing="0">
					<tr style="background: url(/resource/public/images/bg-image.png); line-height: 30px;">
						<th>岗位名称</th>
						<th>公司名称</th>
						<th>月薪范围</th>
						<th>招聘人数</th>
						<th>有效日期</th>
					</tr>
					<tr>
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr style="background:#F6F6F6;">
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr>
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr style="background:#F6F6F6;">
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr>
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr style="background:#F6F6F6;">
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr>
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr style="background:#F6F6F6;">
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr>
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr style="background:#F6F6F6;">
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr>
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr style="background:#F6F6F6;">
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr>
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr style="background:#F6F6F6;">
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr>
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr style="background:#F6F6F6;">
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr>
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
					<tr style="background:#F6F6F6;">
						<td><a style="color:#0101FF;" href="/enterpriseInformation.jhtml#zw">java程序员</a></td>
						<td><a style="color:#0101FF" href="/enterpriseInformation.jhtml">云科科技</a></td>
						<td style="color:#0101FF;">2000-3000</td>
						<td>3</td>
						<td>2014-06-01</td>
					</tr>
				</table>
				<div class="paixu" style="margin-top:30px;">
					<ul style="float: right; margin: 0px 40px 0px 0px;">
						<li>
							<a href="">上一页</a>
						</li>
						<li>
							<a href="">1</a>
						</li>
						<li>
							<a href="">2</a>
						</li>
						<li>
							<a href="">3</a>
						</li>
						<li>
							<a href="">4</a>
						</li>
						<li>
							<a href="">5</a>
						</li>
						<li>
							<a href="">下一页</a>
						</li>
						<li style="margin-left: 20px;">
							<a href="#">Top</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>