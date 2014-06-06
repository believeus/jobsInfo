<!DOCTYPE html>
<html>
<head>
    <title>高级搜索</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
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
			<div class="j_main_right_2" style="border:1px solid #E4925A;border-radius:4px;">
				<table style="background: #60B732; border-radius: 4px; margin: 5px 25px;">
					<tr>
						<td>
							<select name="" style="color:#868686;">
								<option value="">职位搜索</option>
								<option value="">职位搜索</option>
								<option value="">职位搜索</option>
							</select>
						</td>
						<td><input type="text" placeholder="请输入职位关键字.."></td>
						<td><input type="text" placeholder="请选择区域.."></td>
						<td><input type="text" placeholder="请选择岗位.."></td>
						<td><input type="text" placeholder="请选择行业.."></td>
						<td><input type="button" value="搜索" style="width: 80px;"></td>
					</tr>
				</table>
				<div style="width: 996px; height: 30px;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">发布日期</span><span style="color: blue; float: right;"><a style="color: blue; font-size: 12px;" href="">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="">近2天</a></li>
							<li><a href="">近3天</a></li>
							<li><a href="">近7天</a></li>
							<li><a href="">近15天</a></li>
							<li><a href="">近30天</a></li>
							<li><a href="">近60天</a></li>
							<li><a href="">近60天以上</a></li>
						</ul>
					</div>
				</div>
				<div style="width: 996px; height: 30px;background:#FFF1DA;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">起薪范围</span><span style="color: blue; float: right;"><a style="color: blue; font-size: 12px;" href="">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="">1000以下</a></li>
							<li><a href="">1000-1999</a></li>
							<li><a href="">2000-2999</a></li>
							<li><a href="">3000-3999</a></li>
							<li><a href="">4000-4999</a></li>
							<li><a href="">5000以上</a></li>
						</ul>
					</div>
				</div>
				<div style="width: 996px; height: 30px;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">工作性质</span><span style="color: blue; float: right;"><a style="color: blue; font-size: 12px;" href="">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="">全职</a></li>
							<li><a href="">兼职</a></li>
							<li><a href="">实习</a></li>
							<li><a href="">临时</a></li>
							<li><a href="">小时工</a></li>
							<li><a href="">全职/兼职/实习均可</a></li>
							<li><a href="">就业见习</a></li>
						</ul>
					</div>
				</div>
				<div style="width: 996px; height: 30px;background:#FFF1DA;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">学历要求</span><span style="color: blue; float: right;"><a style="color: blue; font-size: 12px;" href="">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="">博士</a></li>
							<li><a href="">硕士</a></li>
							<li><a href="">大学</a></li>
							<li><a href="">大专</a></li>
							<li><a href="">中专中技</a></li>
							<li><a href="">技校</a></li>
							<li><a href="">高中</a></li>
							<li><a href="">职高</a></li>
							<li><a href="">初中</a></li>
							<li><a href="">小学</a></li>
							<li><a href="">文盲或半文盲</a></li>
						</ul>
					</div>
				</div>
				<div style="width: 996px; height: 30px;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">工作年限</span><span style="color: blue; float: right;"><a style="color: blue; font-size: 12px;" href="">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="">在读学生</a></li>
							<li><a href="">应届毕业生</a></li>
							<li><a href="">1-2年</a></li>
							<li><a href="">2-3年</a></li>
							<li><a href="">3-5年</a></li>
							<li><a href="">5-8年</a></li>
							<li><a href="">8-10年</a></li>
							<li><a href="">10年以上</a></li>
						</ul>
					</div>
				</div>
				<div style="width: 996px; height: 30px;margin-bottom:25px;background:#FFF1DA;">
					<div class="j_main_right_2_1">
						<span style="font-weight: bold;">公司性质</span><span style="color: blue; float: right;"><a style="color: blue; font-size: 12px;" href="">不限</a></span>
					</div>
					<div class="j_main_right_2_2">
						<ul>
							<li><a href="">内资</a></li>
							<li><a href="">国有全资</a></li>
							<li><a href="">集体全资</a></li>
							<li><a href="">股份合作</a></li>
							<li><a href="">联营</a></li>
							<li><a href="">国有联营</a></li>
							<li><a href="">国有与集体联营</a></li>
							<li><a href="">其他联营</a></li>
							<li><a href="">有限责任（公司）</a></li>
						</ul>
					</div>
				</div>
			</div>
			<p class="selected">您选择的是：
				<span><a href="">java程序员<span style="color: #E4925A;font-size: 17px;margin-left: 10px;">&times;</span></a></span>	
				<span><a href="">2000-2999<span style="color: #E4925A;font-size: 17px;margin-left: 10px;">&times;</span></a></span>	
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