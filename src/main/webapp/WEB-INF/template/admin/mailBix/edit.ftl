<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>编辑 - Powered By e3dmall</title>
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
	
	<form id="inputForm" action="update.jhtml" method="post" enctype="multipart/form-data">
    	<input type="hidden" name="status" value="0"/>
    	<div style="width:670px; margin:30px auto;">
			<table class="tab_1" cellspacing="0"> 
              <tr style="background:url(/resource/public/images/xiexin.jpg) repeat-x scroll 0 0 #FFFFFF;">
                <th scope="row" style="background-color:transparent;">
                	<span>*</span>
                	<span style="font-weight:bold">写信人：</span>
                </th>
                <th scope="col" colspan="3" style="background-color:transparent; text-align:left; width:auto;"> 
                	<div style="margin-left:20px; ">
                        <span>*</span>
                        <span style="width:200px; display:inline-block;">为必填项目</span>
                    </div>
                </th>
              </tr>
              <tr>
                <th scope="row">
                	<span>*</span>
                	<span>姓名：</span>
                </th>
                <td>
                	<input type="text" name="username" />
                </td>
                <th scope="row">
                	<span>*</span>
                	<span>性别：</span>
                </th>
                <td>
                    <input type="radio" checked="checked" name="sex" id="radio"/><span>男</span>
                    <input type="radio" name="sex"/><span>女</span>
                </td>
              </tr>
              <tr>
                <th scope="row">
                	<span>*</span>
                	<span>手机：</span>
                </th>
                <td>
                	<input type="text" name="phoneNum"/>
                </td>
                <th scope="row">
                	<span>*</span>
                	<span>E-mail：</span>
                </th>
                <td>
                	<input name="email" />
                </td>
              </tr>
              <tr>
                <th scope="row">
                	<span>*</span>
                	<span>住址：</span>
                </th>
                <td colspan="3" style="height:65px;">
                	<div style="height:28px; margin-left:20px;">
                    	<select name="province" style="border:1px solid #C0C0C0; font-size:12px;border-radius:2px;">
                            <option value="" selected="selected">--请选择省份--</option>
                            <option value="41">湖北省</option>
                            <option value="42">湖南省</option>
                            <option value="43">河南省</option>
                            <option value="44">河北省</option>
                        </select>
                        <select name="city" style="border:1px solid #C0C0C0; font-size:12px;border-radius:2px;">
                            <option value="" selected="selected">--请选择城市--</option>
                            <option value="41">武汉</option>
                            <option value="42">黄石</option>
                            <option value="43">石家庄</option>
                            <option value="44">郑州</option>
                        </select>
                        <select name="county" style="border:1px solid #C0C0C0; font-size:12px;border-radius:2px;">
                            <option value="" selected="selected">--请选择区域--</option>
                            <option value="41">洪山区</option>
                            <option value="42">江夏区</option>
                            <option value="43">青山区</option>
                            <option value="44">汉阳区</option>
                        </select>
                    </div>
                    <div style="height:22px;">
                    	<input type="text" name="supplyAddress" style="width:305px;" />
                    </div>
                </td>
              </tr>
              <tr>
                <th scope="row">
                	<span>*</span>
                	<span>职业：</span>
                </th>
                <td>
                	<select style="border:1px solid #C0C0C0; font-size:12px;border-radius:2px; margin-left:20px">
                        <option value="job" selected="selected">--请选择职业--</option>
                        <option value="41">工人</option>
                        <option value="42">农民</option>
                        <option value="43">学生</option>
                        <option value="44">政要</option>
                    </select>
                </td>
                <th scope="row">
                	<span>*</span>
                	<span>身份证：</span>
                </th>
                <td>
                	<input type="text" name="idcard" />
                </td>
              </tr>
              <tr>
                <th scope="row">
                	<span></span>
                	<span>固定电话：</span>
                </th>
                <td colspan="3">
                	<input type="text" name="fixPhone" />
                    <span>（*输入格式：027-89898989）</span>
                </td>
              </tr>
            </table>
        </div>
        <div style="width:670px; margin:30px auto 0px;">
        	<table class="tab_1" cellspacing="0" id="tab_2">
              <tr>
                <th scope="col">
                	<span>*</span>
                	<span>信件标题：</span>
                </th>
                <td>
                	<input type="text" name="title"/>
                </td>
              </tr>
              <tr>
                <th scope="col">
                	<span>*</span>
                	<span>发生地区：</span>
                </th>
                <td>
                	<input type="text" name="happenArea"  style="width:300px" />
                </td>
              </tr>
              <tr>
                <th scope="col">
                	<span>*</span>
                	<span>问题分类：</span>
                </th>
                <td>
                	<select name="questionType" style="border:1px solid #C0C0C0; font-size:12px;border-radius:2px; margin-left:20px">
                        <option value="" selected="selected">--请选择类别--</option>
                        <option value="41">类别1</option>
                        <option value="42">类别2</option>
                        <option value="43">类别3</option>
                        <option value="44">类别4</option>
                    </select>
                </td>
              </tr>
              <tr>
                <th scope="col">
                	<span>*</span>
                	<span>来信人数：</span>
                </th>
                <td>
                	<input type="text" name="letterNumber"  style="width:50px;" placeholder="人数..."/>
                </td>
              </tr>
              <tr>
                <th scope="col">
                	<span>*</span>
                	<span>信件内容：</span>
                </th>
                <td>
                	<textarea cols="60" name="content" rows="5"></textarea>
                    <span style="display:inline-block; margin-left:20px;">*如果字数多于1000字，请以附加形式上传，你已经输入了0个字。</span>
                </td>
              </tr>
              <tr>
                <th scope="col">
                	<span></span>
                	<span>上传附件：</span>
                </th>
                <td>
                	<input type="file" file class="butt_" value="选择文件" style="width:70px;"/>
                    <span style="font-size:12px">未选择文件</span>
                    <div>
                        <input type="button" class="butt_" value="增加附件" style="width:70px; "/>
                        <span id="shangc" style="font-size:12px;">*上传格式：jpg,bmp,png,gif,doc,xls,txt,rar,zip ----小于5M</span>
                    </div>
                </td>
              </tr>
              <tr>
                <th scope="col">
                	<span>*</span>
                	<span>公开意愿：</span>
                </th>
                <td>
                	<input type="radio" checked="checked" name="agree" style="width:auto;"/><span>同意</span>
                    <input type="radio" name="agree" style="width:auto;"/><span>不同意</span>
                    <span style="margin-left:20px;">
                    	<span style="color:red;">*</span>
                        <span>如果您选择“同意”，我们可能将对您的写信内容以及办理结果进行公示！</span>
                    </span>
                </td>
              </tr>
            </table>
        </div>
        <div style="text-align:center;margin-top:10px;">
            <input type="submit" class="butt_" value="提交" style="width:70px; margin-left:0px;"/>
            <input type="reset" class="butt_" value="重写" style="width:70px; "/>
        </div>
    </div>
    </form>
	
</body>
</html>