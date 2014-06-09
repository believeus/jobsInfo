<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加条件 - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/jquery-X-Menu/css/xmenu.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/zTreeStyle.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/demo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/shop/jquery-X-Menu/js/jquery-xmenu.js"></script>
<script type="text/javascript" src="${base}/resources/shop/jquery-X-Menu/js/jquery-powerFloat-min.js"></script>
<script type="text/javascript">



		//zTree显示对话框
		function showMenu() {
			var cityObj = $("#citySel");
			var cityOffset = $("#citySel").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}


$().ready(function() {

	var $inputForm = $("#inputForm");
	var $conditionTable = $("#conditionTable");
	var $addCondition = $("#addCondition");
	var $deleteParameter = $("a.deleteParameter");
	var conditionIndex = 1;
	
	[@flash_message /]
	
	// 增加参数
	$addCondition.live("click", function() {
		var $this = $(this);
		[@compress single_line = true]
			var trHtml = 
			'<tr class="parameterTr">
				<td>
					&nbsp;
				<\/td>
				<td>
					<input type="text" name="names" class="text conditionValuesName" maxlength="200" \/>
				<\/td>
				<td>
					<input type="text" name="orders" class="text conditionValuesOrder" value="" maxlength="9" style="width: 30px;" \/>
				<\/td>
				<td>
					<a href="javascript:;" class="deleteParameter">[${message("admin.common.delete")}]<\/a>
				<\/td>
			<\/tr>';
		[/@compress]
		$conditionTable.append(trHtml);
		conditionIndex ++;
	});
	
	// 删除参数
	$deleteParameter.live("click", function() {
		var $this = $(this);
		if ($conditionTable.find("tr.parameterTr").size() <= 1) {
			$.message("warn", "${message("admin.parameterGroup.deleteAllParameterNotAllowed")}");
		} else {
			$this.closest("tr").remove();
		}
	});
	
	$.validator.addClassRules({
		parametersName: {
			required: true
		},
		parametersOrder: {
			digits: true
		}
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			productCategoryId: "required",
			name: "required",
			order: "digits",
			names: "required"
		}
	});
	
	$("#selectpos").xMenu({	
		width :600,	
		eventType: "click", //事件类型 支持focus click hover
		dropmenu:"#xmenu",//弹出层
		hiddenID : "selectposhidden"//隐藏域ID	
	});



		

		//zTree树状图
		var setting = {
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: onClick
			}
		};
		
		var zNodes =[
		[#list productCategoryTree as productCategory]
			[#if productCategory.grade == 0]
				{ id:"${productCategory.id}", pId:0, name:"${productCategory.name}",open:false,icon:"${base}/resources/shop/css/img/productCategoryImg/${productCategory.id}.png"},
				[#list productCategory.children as childrens]
						{ id:${productCategory.id}+"${childrens.id}", pId:"${productCategory.id}", name:"${childrens.name}",open:false,icon:"${base}/resources/shop/css/img/diy/11.png"},
					[#list childrens.children as child]
							{ id:${productCategory.id}+"${childrens.id}"+${child.id}, pId:${productCategory.id}+"${childrens.id}", name:"${child.name}",open:false,icon:"${base}/resources/shop/css/img/diy/10.png"},
					[/#list]
				[/#list]
		  [/#if]
		[/#list]
		 ];

		function onClick(e, treeId, treeNode) {
			var pid = treeNode.pId;
			var id = treeNode.id;
			var name = treeNode.name;
			var newid;
			if(pid==null){
				newid = id;
				$("#productCategoryId").val(newid);
			}else{
				newid = id.substring(pid.length);
				$("#productCategoryId").val(newid);
			}
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			v = "";
			nodes.sort(function compare(a,b){return a.id-b.id;});
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			var cityObj = $("#citySel");
			cityObj.attr("value", v);
		}
	
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	
	$("#inputForm").submit(function(){
		$("input[name=orders]").each(function(){
			var $this = $(this);
			if($.trim($this.val()) == ""){
				$this.val(1);
			}		
		});
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 添加条件
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<table id="conditionTable" class="input">
			<tr>
				<th>
					${message("ParameterGroup.productCategory")}:
				</th>
				<td>
					<input type="hidden" value="" id="selectposhidden" name="condition_pCategory" />
					<ul>
						<li >
							<input id="citySel" name="citySel" type="button" readonly onclick="showMenu(); return false;" style="width:190px;" value="选择分类"/>
						</li>
						<li style="display:none">
							<input id="productCategoryId" name="productCategoryId" type="text" />
						</li>
					</ul>
					<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
						<ul id="treeDemo" class="ztree" style="margin-top:0; width:181px;"></ul>
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("ParameterGroup.name")}:
				</th>
				<td colspan="3">
					<input type="text" name="name" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.order")}:
				</th>
				<td colspan="3">
					<input type="text" name="order" class="text" maxlength="9" />
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<td colspan="3">
					<a href="javascript:;" id="addCondition" class="button">增加条件值</a>
				</td>
			</tr>
			<tr class="title">
				<td>
					&nbsp;
				</td>
				<td>
					${message("Parameter.name")}
				</td>
				<td>
					${message("admin.common.order")}
				</td>
				<td>
					${message("admin.common.delete")}
				</td>
			</tr>
			<tr class="parameterTr">
				<td>
					&nbsp;
				</td>
				<td>
					<input type="text" name="names" class="text conditionValuesName" maxlength="200" />
				</td>
				<td>
					<input type="text" name="orders" class="text conditionValuesOrder" maxlength="9" style="width: 30px;" />
				</td>
				<td>
					<a href="javascript:;" class="deleteParameter">[${message("admin.common.delete")}]</a>
				</td>
			</tr>
		</table>
		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" id="backButton" class="button" value="${message("admin.common.back")}" />
				</td>
			</tr>
		</table>
	</form>
	<div id="xmenu" class="xmenu" style="display: none;">
		<div class="select-info">	
			<label class="top-label">已选项：</label>
			<ul>		
			<div />			
			</ul>
			<a  name="menu-confirm" href="javascript:void(0);" class="a-btn">
				<span class="a-btn-text">确定</span>
			</a> 
		</div>			
		<style type="text/css">
			.open{
				 background-position: 6px 6px;
				 background-repeat: no-repeat; 
				 color: #666666;
				 cursor: pointer;
				 height: 25px;
				 overflow: hidden;
				 text-indent: 20px;
				 width: auto;
				 font-weight:bold;
				 color:#5893B7;
				 padding-top:3px;
			}
			.open:hover{
				background:#dfecff;
			}
		</style>
	</div>
</body>
</html>