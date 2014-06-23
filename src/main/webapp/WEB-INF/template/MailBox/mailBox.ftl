<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>局长信箱</title>
<style type="text/css">
body {
	font-size:14px;	
}
a:link{
	text-decoration:none;
}
.left_{
	width:240px; 
	height:285px;
}
.left_top{
	height:35px; 
	border-bottom: 1px solid #e4e4e4; 
	background:url(/resource/public/images/background_b.png);
}
.zti_im{
	margin:3px 10px 10px;
	width:220px;
	height:60px;	
}
.gg ul{	
	font-family:'微软雅黑';
	line-height:28px;
	font-size:13px;
	color:#000;
	padding-left:30px;
	margin-top:10px;
}
table {
	border:solid #DCD1E8; 
	border-width:1px 0px 0px 1px;
	width:670px;
}
.tab_1 td , th{
	border:solid #DCD1E8; 
	border-width:0px 1px 1px 0px;
	width:235px;	
}
.tab_1 tr{
	height:35px;	
}
.tab_1 th{
	width:90px;	
	background-color:#EFEAF4;
	color:#7B62B1;
	font-weight:100;
	text-align:right;
}
.tab_1 th span:first-child{
	color:#C00;
}
.tab_1 input{
	height:20px; 
	margin-left:20px;	
	font-size:14px;
	padding-left:7px;
}
#shangc, .tab_1 td > span{
	color:#7B62B1;
	display:inline-block; 
	vertical-align:top; 
	margin:6px 2px;
}
select{
	height:24px;
	width:130px;
	margin-right:30px;	
	color:#999;
}
select option:first-child{
	color:#999;
}
select > option + option {
	color:#333;
}
::-webkit-input-placeholder { /* WebKit browsers */
    color:    #999;
	font-size: 12px;
}
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
    color:    #999;
	font-size: 12px;
}
::-moz-placeholder { /* Mozilla Firefox 19+ */
    color:    #999;
	font-size: 12px;
}
:-ms-input-placeholder { /* Internet Explorer 10+ */
    color:    #999;
	font-size: 12px;
}
#tab_2 th{
	width:82px;	
}
#tab_2 td > input{
	width:480px;	
}
#tab_2 tr{
	height:40px;	
}
.butt_ {
	font-size:14px;
	border:1px solid #999;
	color:#06C;
	height:25px;
	margin-left:20px;
	border-radius:2px;
	display:inline-block;
}
textarea{
	margin:5px 20px; 
	font-size:14px; 
	color:#666; 
	width:340px;
	height:120px;
	min-width:340px;
	max-width:465px;
	min-height:120px;
}
.j_main_left_1{
	width:240px;
	height:290px;
	border:1px solid;
}
.j_main_left_1 p{
	background: #FFCC00;
    border-bottom: 1px solid;
    margin: 0;
    text-align:left;
    padding: 5px;
}
.j_main_left_1 span{
	float:right;
}
.j_main_left_1 li{
	line-height:28px;
}
.gonggao{
	width:240px;
	height:285px;
	border:1px solid #EED9C8;
	margin-bottom:5px;
	background:#fffbf6;
}
.gonggao li{
	margin-right:10px;
	line-height:29px;
	font-size:12px;
}
.gonggao span{
	float:right;
}
</style>

</head>
<body>
[#include "/include/header.ftl" /]
<div style="width:1002px; height:850px; margin:auto;">
	<div style="width:240px; float:left;">
        <div class="left_">  
           <div id="" class="gonggao">
				<p style="margin:0;padding:5px;padding-left:20px;background:url(/resource/public/images/111.png);">
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					公告公示<span style="float:right;"><a href="/publicityList.jhtml">更多</a></span>
				</p>
				<ul id="" style="padding-left:25px;">
					[#list notices as notice]
						<li><a href="/publicityInfo.jhtml?id=${notice.id}">
							[#if notice.title?length > 13]
								${notice.title?string?substring(0,13)}...
							[#else]
								${notice.title}
							[/#if]
					</a><span>${notice.createTime?number_to_datetime}</span></li>
					[/#list]
				</ul>
			</div>
        </div>
        <div class="j_main_left_1" style="margin-top:10px;height:auto;text-align:center;border:1px solid #E4E4E4;">
			<div style="width:99px;float:left;"><img src="/resource/public/images/zhizuo-_03.png" style="padding: 5px;"></div>
			<div style="line-height: 34px; height: 34px; margin-left: 10px; margin-top: 15px; float: left; margin-right: 10px; width: 45px;"><hr style="border:1px dashed #e4e4e4;"></div>
			<div style="width: 70px; float: left; line-height: 45px;"><a href="/specialList.jhtml">更多>></a></div>
			[#list subjectReport as sReport]
				[#if sReport_index <5]
	            	<div class="zti_im">
	            		<a href="/special.jhtml?id=${sReport.id}">
	            			<img src="${sReport.imgpath}" width="222" height="62"/>
	        			</a>
	    			</div>
           		[/#if]
			[/#list]
		</div>
    </div>
    <div style="width:750px; float:left; margin-left:10px;">
    	<div style="width:750px; height:30px;line-height:30px;border:1px solid #e4e4e4; background:url(/resource/public/images/background_b.png);">
        	<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-left: 10px; margin-top: 7px; margin-right: 10px;">
        	<span>所在位置</span>
            <span>></span>
        	<span>服务功能</span>
            <span>></span>
			<span>局长信箱</span>
        </div>
        <div style="width:750px; padding-bottom:20px; border:1px solid #e4e4e4; margin-top:10px; background-color:#F7F3FA;">
        <form action="/savaMailBox.jhtml" method="post">
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
    </div>
</div>
[#include "/include/footer.ftl" /]
</body>
</html>
