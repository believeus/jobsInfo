<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>求职者 - Powered By e3dmall</title>
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
		<input type="hidden" name="id" value="">
		<input type="hidden" name="submit" value="nosubmit" id="submit">
		<input type="hidden" name="freeTrain" value="" id="freeTrain">
		<input type="hidden" name="freeIntro" value="" id="freeIntro">
		<input type="hidden" name="imgHead" value="" id="imgHead">
	
		<table class="input">
			<tr>
				<th>姓名:</th>
				<td><input type="text" id="trueName" name="trueName" value=""></td>
				<th>性别:</th>
				<td>
					<select id="sex" name="sex" style="width:158px;">
						<option value="">请选择..</option>
						<option value="man">男</option>
						<option value="woman">女</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>登录名:</th>
				<td><input type="text" id="loginName" name="loginName" value=""></td>
				<th>密码:</th>
				<td><input type="password" id="password"  name="password" placeholder="不填则默认"></td>
			</tr>
			<tr>
				<th>年龄:</th>
				<td><input type="text" id="age" name="age" value=""></td>
				<th>身份证号:</th>
				<td><input type="text" id="idcard" name="idcard" value=""></td>
			</tr>
			<tr>
				<th>民族:</th>
				<td><input type="text" id="nation" name="nation" value=""></td>
				<th>文化程度:</th>
				<td>
					<select id="eduLevel" name="eduLevel" style="width:158px;">
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
				<th>政治面貌:</th>
				<td>
					<select id="polity" name="polity" style="width:158px;">
						<option value="">请选择..</option>
						<option value="中共党员">中共党员</option>
						<option value="共青团员">共青团员</option>
						<option value="民主党派">民主党派</option>
						<option value="普通公民">普通公民</option>
					</select>
				</td>
				<th>身高:</th>
				<td><input type="text" id="height" name="height" value=""></td>
			</tr>
			<tr>
				<th>婚姻状况:</th>
				<td>
					<select id="marriage" name="marriage" style="width:158px;">
						<option value="">请选择..</option>
						<option value="未婚">未婚</option>
						<option value="已婚">已婚</option>
						<option value="离异">离异</option>
					</select>
				</td>
				<th>家庭地址:</th>
				<td><input type="text" id="address" name="address" value=""></td>
			</tr>
			<tr>
				<th>视力:</th>
				<td><input type="text" id="eyesight" name="eyesight" value=""></td>
				<th style="font-size: 12px;">原工作单位:</th>
				<td><input type="text"  id="workspace" name="workspace" value=""></td>
			</tr>
			<tr>
				<th>个人特长:</th>
				<td><input type="text" id="strongPoint" name="strongPoint" value=""></td>
				<th style="font-size: 12px;">就失业证号:</th>
				<td><input type="text" id="jobId" name="jobId" value=""></td>
			</tr>
			<tr>
				<th>联系电话:</th>
				<td><input type="text" id="phoneNum" name="phoneNum" value=""></td>
				<th>独生子女:</th>
				<td>
					<input type="radio" name="singleChild" value="1" [#if sessionUser.singleChild=="1"]checked="true"[#elseif sessionUser.singleChild!="0"]checked="true"[/#if] style="width:0">是
					<input type="radio" name="singleChild" value="0" [#if sessionUser.singleChild=="0"]checked="true"[/#if]style="width:0">否
				</td>
			</tr>
			<tr>
				<th>二女户:</th>
				<td colspan="3">
					<input type="radio"  name="twoGirl" value="1" [#if sessionUser.twoGirl=="1"]checked="true"[#elseif sessionUser.twoGirl!="0"]checked="true"[/#if] style="width:0">是
					<input type="radio"  name="twoGirl" value="0" [#if sessionUser.twoGirl=="0"]checked="true"[/#if]style="width:0">否
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