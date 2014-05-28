<!DOCTYPE html>
<html>
<head>
    <title>个人中心</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script type="text/javascript" src="/resource/public/js/jquery.js"></script>
    <script type="text/javascipt"  src="/resource/public/js/Etech.js"></script>
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
    		//margin-top:-6px;
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
		.current{
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
    	$().ready(function(){
    		$("#personal_xinxi").click(function(){
    			$("#personal_xinxi").removeClass("current");
    			$("#select_zhiyuan").removeClass("current");
    			$("#personal_xinxi").addClass("current");
    			$("#base_xinxi").show();
    			$("#select_zhuti").hide();
    		});
    		$("#select_zhiyuan").click(function(){
    			$("#select_zhiyuan").removeClass("current");
    			$("#personal_xinxi").removeClass("current");
    			$("#select_zhiyuan").addClass("current");
    			$("#select_zhuti").show();
    			$("#base_xinxi").hide();
    		});
    	});
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
		<div class="j_main_right">
			<div class="j_main_right_1">
				<p>所在位置 > 个人中心</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;">
				<div class="j_main_right_2_1">
					<div id="personal_xinxi" class="j_main_right_2_1_1 current" style="cursor:pointer;">个人信息</div>
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
									<td><input type="text" id="loginName" value="${sessionUser.loginName}"></td>
								</tr>
								<tr>
									<td>年龄:</td>
									<td><input type="text"></td>
								</tr>
								<tr>
									<td>民族:</td>
									<td><input type="text"></td>
								</tr>
								<tr>
									<td>政治面貌:</td>
									<td>
										<select name="" style="width:158px;">
											<option value="">请选择..</option>
											<option value="">中共党员</option>
											<option value="">共青团员</option>
											<option value="">民主党派</option>
											<option value="">普通公民</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>婚姻状况:</td>
									<td>
										<select name="" style="width:158px;">
											<option value="">请选择..</option>
											<option value="">未婚</option>
											<option value="">已婚</option>
											<option value="">离异</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>视力:</td>
									<td><input type="text"></td>
								</tr>
								<tr>
									<td>个人特长:</td>
									<td><input type="text"></td>
								</tr>
								<tr>
									<td>联系电话:</td>
									<td><input type="text"></td>
								</tr>
								<tr>
									<td>二女户:</td>
									<td>
										<input type="radio" name="girl" checked="true" style="width:0">是
										<input type="radio" name="girl" style="width:0">否
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
										<select name="" style="width:158px;">
											<option value="">请选择..</option>
											<option value="">男</option>
											<option value="">女</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>密码:</td>
									<td><input type="text" placeholder="明文密码"></td>
								</tr>
								<tr>
									<td>身份证号:</td>
									<td><input type="text" id="idcard" value="${sessionUser.idcard}"></td>
								</tr>
								<tr>
									<td>文化程度:</td>
									<td>
										<select name="" style="width:158px;">
											<option value="">请选择..</option>
											<option value="">大学</option>
											<option value="">高中</option>
											<option value="">初中</option>
											<option value="">小学</option>
											<option value="">幼儿园</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>身高:</td>
									<td><input type="text"></td>
								</tr>
								<tr>
									<td>健康状况:</td>
									<td>
										<select name="" style="width:158px;">
											<option value="">请选择..</option>
											<option value="">健康</option>
											<option value="">患病</option>
											<option value="">残疾</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>家庭详细地址:</td>
									<td><input type="text"></td>
								</tr>
								<tr>
									<td>原工作单位:</td>
									<td><input type="text"></td>
								</tr>
								<tr>
									<td>《就失业证》号:</td>
									<td><input type="text"></td>
								</tr>
								<tr>
									<td>独生子女:</td>
									<td>
										<input type="radio" name="dusheng" checked="true" style="width:0">是
										<input type="radio" name="dusheng" style="width:0">否
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
							<input type="button" value="添加" style="width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td>专业:</td>
								<td><input type="text"></td>
								<td>工种:</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>技能等级:</td>
								<td style="padding-right:70px;">
									<select name="" style="width:158px;">
										<option value="">请选择..</option>
										<option value="">精通</option>
										<option value="">熟练</option>
										<option value="">了解</option>
									</select>
								</td>
								<td>从事年限:</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>说明:</td>
								<td colspan="3"><textArea cols="50"></textArea></td>
								<td rowspan="3"><a href="" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">学习经历</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input type="button" value="添加" style="width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td>起止时间:</td>
								<td colspan="3">
									<select name="" style="width:80px;">
										<option value="">请选择..</option>
										<option value="">2014</option>
										<option value="">2013</option>
										<option value="">...</option>
									</select>
									年
									<select name="" style="width:80px;">
										<option value="">请选择..</option>
										<option value="">1</option>
										<option value="">2</option>
										<option value="">...</option>
									</select>
									月
									至
									<select name="" style="width:80px;">
										<option value="">请选择..</option>
										<option value="">2014</option>
										<option value="">2013</option>
										<option value="">...</option>
									</select>
									年
									<select name="" style="width:80px;">
										<option value="">请选择..</option>
										<option value="">1</option>
										<option value="">2</option>
										<option value="">...</option>
									</select>
									月
								</td>
							</tr>
							<tr>
								<td>学校名称:</td>
								<td style="padding-right:100px;"><input type="text"></td>
								<td>系别:</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>专业:</td>
								<td colspan="3"><input type="text"></td>
								<td rowspan="3"><a href="">删除</a></td>
							</tr>
						</table>
					</div>
					
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">工作经历</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input type="button" value="添加" style="width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td>起止时间:</td>
								<td colspan="3">
									<select name="" style="width:80px;">
										<option value="">请选择..</option>
										<option value="">2014</option>
										<option value="">2013</option>
										<option value="">...</option>
									</select>
									年
									<select name="" style="width:80px;">
										<option value="">请选择..</option>
										<option value="">1</option>
										<option value="">2</option>
										<option value="">...</option>
									</select>
									月
									至
									<select name="" style="width:80px;">
										<option value="">请选择..</option>
										<option value="">2014</option>
										<option value="">2013</option>
										<option value="">...</option>
									</select>
									年
									<select name="" style="width:80px;">
										<option value="">请选择..</option>
										<option value="">1</option>
										<option value="">2</option>
										<option value="">...</option>
									</select>
									月	
								</td>
							</tr>
							<tr>
								<td>工作单位:</td>
								<td style="padding-right:100px;"><input type="text"></td>
								<td>职务:</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>工种:</td>
								<td ><input type="text"></td>
								<td>工作内容:</td>
								<td ><input type="text"></td>
								<td rowspan="3"><a href="">删除</a></td>
							</tr>
						</table>
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
									<input type="radio" name="peixun" checked="true" style="width:0">是
									<input type="radio" name="peixun" style="width:0">否
								</td>
								<td>享受免费职业介绍:</td>
								<td>
									<input type="radio" name="jieshao" checked="true" style="width:0">是
									<input type="radio" name="jieshao" style="width:0">否
								</td>
							</tr>
						</table>
					</div>
					
					<p style="text-align:center;">
						<input type="button" value="保存">
						<input type="reset" value="重写">
					</p>
				</div>
				<div id="select_zhuti" style="width:728px;height:auto;;overflow:hidden;display:none;">
					<div style="height: 30px; width: 728px;">
						<span style="float:left;">选择志愿</span>
						<div style="border: 1px dashed #E4E4E4; height: 0px; width: 550px; float: left; margin-left: 10px; margin-top: 9px;"></div>
						<div style="float: left; width: 50px; margin-left: 20px;">
							<input type="button" value="添加" style="width: 50px; background: #FFFCDD; border: 1px solid #DCAE70; border-radius: 4px; height: 26px;">
						</div>
					</div>
					<div style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td rowspan="3" style="background:#DCDCDC;color:#FE7200;">1</td>
								<td>专业:</td>
								<td><input type="text"></td>
								<td>工种:</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>月薪要求:</td>
								<td style="padding-right:70px;">
									<input type="text" name="">
								</td>
								<td>择业地区:</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>其他要求:</td>
								<td colspan="3"><textArea cols="50"></textArea></td>
								<td rowspan="3"><a href="" style="margin-top:35px;float:right;">删除</a></td>
							</tr>
						</table>
					</div>
					<div style="width:690px;height:auto;overflow:hidden;background:#EEEEEE;margin:0 20px;margin-bottom:15px;">
						<table>
							<tr>
								<td rowspan="3" style="background:#DCDCDC;color:#FE7200;">2</td>
								<td>专业:</td>
								<td><input type="text"></td>
								<td>工种:</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>月薪要求:</td>
								<td style="padding-right:70px;">
									<input type="text" name="">
								</td>
								<td>择业地区:</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>其他要求:</td>
								<td colspan="3"><textArea cols="50"></textArea></td>
								<td rowspan="3"><a href="" style="margin-top:35px;float:right;">删除</a></td>
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