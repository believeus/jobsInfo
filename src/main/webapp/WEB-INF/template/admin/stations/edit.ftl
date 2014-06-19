<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>岗位 - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="/resource/public/js/admin/common.css" rel="stylesheet" type="text/css" />
<link href="/resource/public/js/admin/themes/default/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resource/public/js/admin/jquery.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/jquery.validate.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/kindeditor.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/common.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/input.js"></script>
<script type="text/javascript">
$().ready(function() {

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
		rules: {
			title: "required",
			adPositionId: "required",
			path: "required",
			order: "digits"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml">首页</a> &raquo; 编辑内容
	</div>
	<!--
	<form id="inputForm" action="update.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${dataCenter.id}"/>
		<input type="hidden" name="type" value="${type}"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>新闻标题:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" />
				</td>
				<th>
					<span class="requiredField">*</span>作者:
				</th>
				<td>
					<input type="text" name="author" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					所属分类:
				</th>
				<td>
					<select id="type" name="type">
						<option value="1">新闻动态</option>
						<option value="2">工作动态</option>
						<option value="3">公告公示</option>
						<option value="4">图片新闻</option>
						<option value="5">视频新闻</option>
						<option value="6">专题报道</option>
					</select>
				</td>
				<th>
					是否置顶:
				</th>
				<td>
					<input type="checkbox" name="top" value="1">
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					<span class="requiredField">*</span>相关图片:
				</th>
				<td colspan="3">
					<script type="text/javascript">
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
					
					<div>
						<span style="float:left">
							<div class="brandImg">
								<span>
									<a onclick="file0.click()" href="javascript:return false;">点击上传图片</a>
								</span>
								<img style="width:190px;height:120px" src="" name="img"/>
							</div>
							<input type="file" style="display:none" id="file0" name="file0" onchange="filename0.value=this.value;loadImgFast(this,0)">
							<input type="hidden" id="filename0" name="filename0">
						</span>
					</div>
					<style type="text/css">
						.brandImg span{
							display:block;
							position:absolute;
							top:0px;left:0px;
							width:200px;
							height:130px;
						}
						
						.brandImg{
							border-color: #B8B8B8 #DCDCDC #DCDCDC #B8B8B8;
						    border-radius: 2px 2px 2px 2px;
						    border-style: solid;
						    border-width: 1px;
						    background-color: #666666;
						    width:192px;height:122px;
						    position:relative;
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
							top:50px;left:50px;
						}
						
						.deleteProductImage:hover{
							color:#C9033B !important;
						}
					</style>
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					内容:
				</th>
				<td colspan="3">
					<textarea id="editor" name="content" class="editor"></textarea>
				</td>
			</tr>
			<tr>
				<th>
					排序编号:
				</th>
				<td colspan="3">
					<input type="text" name="order" class="text" maxlength="9" />
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
		</table>
	</form>
	-->
	
	
	
	<form id="inputForm" novalidate="novalidate"  action="update.jhtml" method="post">
		<input type="hidden" name="status" value="0">
			<table class="input">
				<tr>
					<th>招聘单位:</th>
					<td style="padding-right:80px;"><input type="text" id="company1" name="company"></td>
					<th>人数:</th>
					<td><input type="text" id="worknum1" name="worknum"></td>
				</tr>
				<tr>
					<th>工种:</th>
					<td>
						<input type="text" id="selectJobshidden1" name="workTypeId" value="java"/>
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
					<input type="test" value="计算机系" id="selectSpecialtyhidden1" name="majorTypeId"/>
				</td>
					<th>技术等级:</th>
					<td><input type="text" id="eteLevel1" name="eteLevel"></td>
				</tr>
				<tr>
					<th>从事年限:</th>
					<td><input type="text" id="workyear1" name="workyear"></td>
					<th>文化程度:</th>
					<td>
						<select id="eduLevel1" name="eduLevel" style="width: 183px;">
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
					<th>工作地点:</th>
					<td><input type="text" id="workspace1" name="workspace"></td>
					<th>年龄:</th>
					<td><input type="text" id="age1" name="age"></td>
				</tr>
				<tr>
					<th>身高:</th>
					<td><input type="text" id="height1" name="height"></td>
					<th>视力:</th>
					<td><input type="text" id="eyesight1" name="eyesight"></td>
				</tr>
				<tr>
					<th>薪资待遇:</th>
					<td><input type="text" id="salary1" name="salary"></td>
					<th>用工形式:</th>
					<td>
						<select id="workWay1" name="workWay" style="width: 183px;">
							<option value="">请选择..</option>
							<option value="兼职">兼职</option>
							<option value="全职">全职</option>
							<option value="实习">实习</option>
							<option value="...">...</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>招聘期限:</th>
					<td>
						<select id="worklimit1" name="worklimit" style="width: 183px;">
							<option value="">请选择..</option>
							<option value="1年">1年</option>
							<option value="3年">3年</option>
							<option value="5年">5年</option>
							<option value="...">...</option>
						</select>
					</td>
					<th>面试时间:</th>
					<td><input type="text" id="viewData1" name="viewData"></td>
				</tr>
				<tr>
					<th style="vertical-align:top;">其他说明:</th>
					<td colspan="3">
						<textArea cols="30" style="resize:none;" id="note1" name="note"></textArea>
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
			</table>
		</form>
	
	
	
	
	
</body>
</html>