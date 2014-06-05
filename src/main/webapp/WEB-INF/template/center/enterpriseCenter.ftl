<!DOCTYPE html>
<html>
<head>
    <title>企业中心</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script type="text/javascript" src="/resource/public/js/jquery.js"></script>
    <script type="text/javascript"  src="/resource/public/js/Etech.js"></script>
    <script type="text/javascript">
    	$().ready(function(){
    		$("#qiye_xinxi").click(function(){
    			$("#qiye_xinxi").removeClass("current");
    			$("#zhaopin_xinxi").removeClass("current");
    			$("#qiye_xinxi").addClass("current");
    			$("#base_xinxi").show();
    			$("#bianji_xinxi").hide();
    		});
    		$("#zhaopin_xinxi").click(function(){
    			$("#qiye_xinxi").removeClass("current");
    			$("#zhaopin_xinxi").removeClass("current");
    			$("#zhaopin_xinxi").addClass("current");
    			$("#bianji_xinxi").show();
    			$("#base_xinxi").hide();
    		});
    	});
    </script>
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
			width:175px;
		}
		.j_main_right_2 tr{
			line-height:30px;
		}
		.qiyepic{
			float: left;
		    height: 215px;
		    width: 160px;
		    background:#FFFFFF;
		    margin-right:10px;
		}
		.qiyepic p{
			margin:0;
		}
		.qiyepic img {
		    height: 145px;
		    width: 160px;
		}
		.qiyepic input{
			width:163px;
		}
		.qiyepic a {
		    color: #AE3234;
		    text-decoration: underline;
		}
		.qiyepic textarea{
			border: 0 none;
		    font-size: 13px;
		    height: 39px;
		    resize: none;
		    width: 158px;
		}
		.shipin td {
		    padding: 10px;
		}
		.shipin a{
			color: #AE3234;
		    text-decoration: underline;
		}
		.zhaopin th {
		    width: 100px;
		}
		.zhaopin td {
		    font-size: 13px;
		    border-bottom: 1px dashed #E4E4E4;
		}
		.current{
			background:#E36510;
			color:#FFFFFF;
		}
    </style>
    <script text="text/javascript">
    $().ready(function(){
    
    				
		    	// ajax 提交验证和保存。
				function submitValid(submitx){
						$.ajax({
							url: "/ajaxComValidReg.jhtml",
							type: "POST",
							data: {
								id:${sessionUser.id},
								fullName: $("#fullName").val(),
								unitType:$("#unitType").val(),
								shorName:$("#shorName").val(),
								relationship:$("#relationship").val(),
								economicType:$("#economicType").val(),
								legalMan:$("#legalMan").val(),
								area:$("#area").val(),
								trade:$("#trade").val(),
								regMoney:$("#regMoney").val(),
								detailAddress:$("#detailAddress").val(),
								contacts:$("#contacts").val(),
								address:$("#address").val(),
								zip:$("#zip").val(),
								phoneNum:$("#phoneNum").val(),
								phoneFax:$("#phoneFax").val(),
								webSite:$("#webSite").val(),
								introduce:$("#introduce").val(),
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
					
				// ajax 提交验证和保存。
				function submitJobs(submitx){
						$.ajax({
							url: "/ajaxComValidReg.jhtml",
							type: "POST",
							data: {
								id:${sessionUser.id},
								fullName: $("#fullName").val(),
								unitType:$("#unitType").val(),
								shorName:$("#shorName").val(),
								relationship:$("#relationship").val(),
								economicType:$("#economicType").val(),
								legalMan:$("#legalMan").val(),
								area:$("#area").val(),
								trade:$("#trade").val(),
								regMoney:$("#regMoney").val(),
								detailAddress:$("#detailAddress").val(),
								contacts:$("#contacts").val(),
								address:$("#address").val(),
								zip:$("#zip").val(),
								phoneNum:$("#phoneNum").val(),
								phoneFax:$("#phoneFax").val(),
								webSite:$("#webSite").val(),
								introduce:$("#introduce").val(),
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
    	// 保存信息。
    	$("#savaAll").click(function() {
				submitValid("no");
		});
		
		// 保存招聘信息。
    	$("#savaAll").click(function() {
				submitValid("no");
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
				<p style="background: #EE981F; text-align: center; margin: 5px; padding: 5px; border-radius: 5px; border: 0px none; color: #FFFFFF;">人才推荐</p>
				<div class="j_main_left_1_1">
					<p style="color: blue;">王小利</p>
					<p style="color: blue;font-weight:bold;">室内设计师</p>
					<p>薪资待遇：面议</p>
					<p>招聘人数：若干人</p>
					<p>学历要求：中专</p>
				</div>
				<div class="j_main_left_1_1">
					<p style="color: blue;">王小利</p>
					<p style="color: blue;font-weight:bold;">室内设计师</p>
					<p>薪资待遇：面议</p>
					<p>招聘人数：若干人</p>
					<p>学历要求：中专</p>
				</div>
				<div class="j_main_left_1_1" style="border-bottom:0;">
					<p style="color: blue;">王小利</p>
					<p style="color: blue;font-weight:bold;">室内设计师</p>
					<p>薪资待遇：面议</p>
					<p>招聘人数：若干人</p>
					<p>学历要求：中专</p>
				</div>
			</div>
		</div>
		<div class="j_main_right">
			<div class="j_main_right_1">
				<p>所在位置 > 企业中心</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;">
				<div class="j_main_right_2_1">
					<div id="qiye_xinxi" class="j_main_right_2_1_1 current" style="cursor:pointer;">企业信息</div>
					<div id="zhaopin_xinxi" class="j_main_right_2_1_2" style="cursor:pointer;">招聘信息</div>
				</div>
				<p>
					<span>登记编号:${sessionUser.id}</span>
					<span style="padding-right: 20px; margin-left: 90px;">更新日期:${sessionUser.editDate?number_to_datetime}&nbsp;${sessionUser.editDate?number_to_time}</span>
					<span style="float: right; padding-right: 20px;">审核状态:[#if sessionUser.status=="0"&&sessionUser.status!="1"]审核中[#elseif ssionUser.status=="1"]已通过审核[/#if]</span>
				</p>
				
				<div id="base_xinxi" style="width::728px;height:auto;overflow:hidden;">
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">基本信息</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 600px; float: left; margin-left: 10px; margin-top: 9px;"></div>
					</div>
					<div style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<div class="" style="height: auto; overflow: hidden; float: left; width: 660px; margin-left: 30px; margin-top: 10px;margin-right:10px;">
							<table>
								<tr>
									<td>单位全称:</td>
									<td style="padding-right: 80px;"><input type="text" id="fullName" name="fullName"></td>
									<td>单位性质:</td>
									<td>
										<select id="unitType" name="unitType" style="width: 182px;">
											<option value="">请选择..</option>
											<option value="企业">企业</option>
											<option value="党政机关">党政机关</option>
											<option value="事业单位">事业单位</option>
											<option value="社会团体">社会团体</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>单位简称:</td>
									<td><input type="text" id="shorName" name="shorName"></td>
									<td>隶属关系:</td>
									<td>
										<select id="relationship" name="relationship" style="width: 182px;">
											<option value="">请选择..</option>
											<option value="中央">中央</option>
											<option value="省">省</option>
											<option value="市">市</option>
											<option value="县">县</option>
											<option value="街道">街道</option>
											<option value="居委会">居委会</option>
											<option value="其它">其它</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>经济类型:</td>
									<td>
										<select id="economicType" name="economicType" style="width: 182px;">
											<option value="">请选择..</option>
											<option value="国有">国有</option>
											<option value="集体">集体</option>
											<option value="联营">联营</option>
											<option value="股份制">股份制</option>
											<option value="私营">私营</option>
											<option value="个体">个体</option>
											<option value="外商">外商</option>
											<option value="港澳台">港澳台</option>
											<option value="其它">其它</option>
										</select>
									</td>
									<td>法人代表:</td>
									<td><input type="text" id="legalMan" name="legalMan"></td>
								</tr>
								<tr>
									<td>所属地区:</td>
									<td><input type="text" id="area" name="area"></td>
									<td>行业:</td>
									<td><input type="text" id="trade" name="trade"></td>
								</tr>
								<tr>
									<td>注册资金:</td>
									<td><input type="text" id="regMoney" name="regMoney"></td>
									<td>详细地址:</td>
									<td><input type="text" id="detailAddress" name="detailAddress"></td>
								</tr>
								<tr>
									<td>联系人:</td>
									<td><input type="text" id="contacts" name="contacts"></td>
									<td>通讯地址:</td>
									<td><input type="text" id="address" name="address"></td>
								</tr>
								<tr>
									<td>邮编:</td>
									<td><input type="text" id="zip" name="zip"></td>
									<td>手机:</td>
									<td><input type="text" id="phoneNum" name="phoneNum"></td>
								</tr>
								<tr>
									<td>电话/传真:</td>
									<td><input type="text" id="phoneFax" name="phoneFax"></td>
									<td>网址:</td>
									<td><input type="text" id="webSite" name="webSite"></td>
								</tr>
								<tr>
									<td style="vertical-align: top;">单位简介:</td>
									<td colspan="3"><textArea cols="50" rows="5" name="introduce" id="introduce" style="resize:none;"></textArea></td>
								</tr>
								<tr>
									<td style="vertical-align: top;">企业电子图:</td>
									<td colspan="3">
										<img src="" width="260px" height="30px"/>
										<input type="button" value="上传" style="width:60px;">
									</td>
								</tr>
							</table>
						</div>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">企业图片</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input type="button" value="添加" style="width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div style="width:670px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;padding:10px;">
						<div class="qiyepic">
							<p><img src="" /></p>
							<p><textArea placeholder="添加描述（20字以内）" maxlength="20"></textArea></p>
							<div style="text-align: right; border-top: 1px dashed #E4E4E4; height: 24px; line-height: 24px; margin-right: 3px;"><a href="">删除</a></div>
						</div>
						<div class="qiyepic">
							<p><img src="" /></p>
							<p><textArea placeholder="添加描述（20字以内）" maxlength="20"></textArea></p>
							<div style="text-align: right; border-top: 1px dashed #E4E4E4; height: 24px; line-height: 24px; margin-right: 3px;"><a href="">删除</a></div>
						</div>
						<div class="qiyepic">
							<p><img src="" /></p>
							<p><textArea placeholder="添加描述（20字以内）" maxlength="20"></textArea></p>
							<div style="text-align: right; border-top: 1px dashed #E4E4E4; height: 24px; line-height: 24px; margin-right: 3px;"><a href="">删除</a></div>
						</div>
						<div class="qiyepic" style="margin-right:0;">
							<p><img src="" /></p>
							<p><textArea placeholder="添加描述（20字以内）" maxlength="20"></textArea></p>
							<div style="text-align: right; border-top: 1px dashed #E4E4E4; height: 24px; line-height: 24px; margin-right: 3px;"><a href="">删除</a></div>
						</div>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">企业视频</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input type="button" value="添加" style="width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div class="shipin" style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td>
									<img src="" width="100" height="70">
								</td>
								<td style="vertical-align: bottom;">
									视频描述:
								</td>
								<td>
									<textArea style="width:400px;height:60px;resize:none;"></textArea>
								</td>
								<td style="vertical-align: bottom;">
									<a href="">删除</a>
								</td>
							</tr>
						</table>
					</div>
					
					<p style="text-align:center;">
						<input type="button" id="savaAll" value="保存">
						<input type="reset" value="重写">
					</p>
				</div>
				
				<div id="bianji_xinxi" style="width:728px;height:auto;;overflow:hidden;display:none;">
					<div class="zhaopin" style="height: auto; text-align: center; border: 1px solid #e4e4e4; margin: 5px 20px; width: 685px;">
						<table>
							<tr style="background:#F0F0F0;">
								<th>招聘专业</th>
								<th>工种描述</th>
								<th>性别</th>
								<th>文化程度</th>
								<th>年龄</th>
								<th>审核情况</th>
								<th>状况</th>
								<th>操作</th>
							</tr>
							<tr>
								<td>招聘专业</td>
								<td>工种描述</td>
								<td>性别</td>
								<td>文化程度</td>
								<td>年龄</td>
								<td>审核情况</td>
								<td>状况</td>
								<td><a href="" style="margin-right: 5px;">编辑</a><a href="">删除</a></td>
							</tr>
							<tr>
								<td>招聘专业</td>
								<td>工种描述</td>
								<td>性别</td>
								<td>文化程度</td>
								<td>年龄</td>
								<td>审核情况</td>
								<td>状况</td>
								<td><a href="" style="margin-right: 5px;">编辑</a><a href="">删除</a></td>
							</tr>
							<tr>
								<td>招聘专业</td>
								<td>工种描述</td>
								<td>性别</td>
								<td>文化程度</td>
								<td>年龄</td>
								<td>审核情况</td>
								<td>状况</td>
								<td><a href="" style="margin-right: 5px;">编辑</a><a href="">删除</a></td>
							</tr>
						</table>
					</div>
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">添加/编辑招聘信息</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 490px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input type="button" value="添加" style="width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div style="padding:10px 30px;width:650px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td>招聘单位:</td>
								<td style="padding-right:80px;"><input type="text"></td>
								<td>专业:</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>工种:</td>
								<td><input type="text"></td>
								<td>性别:</td>
								<td>
									<select name="" style="width: 183px;">
										<option value="">请选择..</option>
										<option value="">男</option>
										<option value="">女</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>人数:</td>
								<td><input type="text"></td>
								<td>技术等级:</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>从事年限:</td>
								<td><input type="text"></td>
								<td>文化程度:</td>
								<td>
									<select name="" style="width: 183px;">
										<option value="">请选择..</option>
										<option value="">研究生以上</option>
										<option value="">博士研究生</option>
										<option value="">大学本科</option>
										<option value="">大学专科</option>
										<option value="">中专技校</option>
										<option value="">中等专科</option>
										<option value="">职业高中</option>
										<option value="">技工学校</option>
										<option value="">普通高中</option>
										<option value="">初中及以下</option>
										<option value="">初级中学</option>
										<option value="">小学</option>
										<option value="">其他</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>工作地点:</td>
								<td><input type="text"></td>
								<td>年龄:</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>身高:</td>
								<td><input type="text"></td>
								<td>视力:</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>薪资待遇:</td>
								<td><input type="text"></td>
								<td>用工形式:</td>
								<td>
									<select name="" style="width: 183px;">
										<option value="">请选择..</option>
										<option value="">兼职</option>
										<option value="">全职</option>
										<option value="">实习</option>
										<option value="">...</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>招聘期限:</td>
								<td>
									<select name="" style="width: 183px;">
										<option value="">请选择..</option>
										<option value="">1年</option>
										<option value="">3年</option>
										<option value="">5年</option>
										<option value="">...</option>
									</select>
								</td>
								<td>面试时间:</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td style="vertical-align:top;">其他说明:</td>
								<td colspan="3">
									<textArea cols="50" style="resize:none;"></textArea>
								</td>
							</tr>
						</table>
					</div>
					<p style="text-align:center;">
						<input type="button" value="保存">
						<input type="reset" value="重写">
					</p>
				</div>
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>