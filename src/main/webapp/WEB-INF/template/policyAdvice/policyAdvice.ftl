<!DOCTYPE html>
<html>
<head>
    <title>政策咨询</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
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
			border: 1px solid #CDCDCD;
		    border-radius: 4px;
		    height: 215px;
		    width: 258px;
		}
		.j_main_left_1 p{
		    color: #BF0906;
		    font-size: 20px;
		    margin: 0;
		    padding: 20px;
		    text-align: left;
		}
		.j_main_left_1 span{
			color: #000000;
		    float: right;
		    font-size: 13px;
		    margin-top: 7px;
		}
		.j_main_left_1 li{
			line-height:35px;
			list-style:none;
			background:url(/resource/public/images/1_07.png);
		}
		.j_main_left_1 a{
			margin-left:40px;
			font-size:17px;
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
			background: url(/resource/public/images/background_b.png);
		    border: 1px solid #e4e4e4;
		    font-size:13px;
		}
		.j_main_right_2{
			width:728px;
			height:auto;
			margin-top:10px;
		}
		.j_main_right_2_1{
			float:left;
			width:359px;
			height:290px;
			margin-right:10px;
		}
		.j_main_right_2_1 p a{
			color: #3586F2;
		    margin-right: 10px;
		    text-decoration: underline;
		}
		.j_main_right_2_1 li{
			border-bottom: 1px solid #000000;
    		line-height: 25px;
		}
		.j_main_right_2 p{
			padding:0 30px;
			font-size:14px;
		}
		.j_main_right_3{
			border: 1px solid #e4e4e4;
		    margin: 10px 10px;
		    width: 336px;
		    height:262px;
		}
		.j_main_right_3 p{
			background:url(/resource/public/images/background.png);
		    margin: 0;
		    padding: 5px;
		}
		.j_main_right_3 span{
			float:right;
			margin-right:5px;
		}
		.j_main_right_3_1{
			width:336px;
			height:231px;
			background:#FFFFFF;
		}
		.j_main_right_3_1 li{
			list-style:none;
			font-size:13px;
			line-height:32px;
		}
		.current_li{
			background:url(/resource/public/images/1_02.png) !important;
			color:#FFFFFF;
		}
		.current_li a{
			color:#FFFFFF;
		}
    </style>
</head>
<body>
	[#include "/include/header.ftl" /]
	<div class="j_main w">
		<div class="j_main_left">
			<div class="j_main_left_1" style="background:#F3F3F3;">
				<p>政策咨询<span>Policy Advice</span></p>
				<ul style="padding-left:0;margin:0;">
					<li><a href="/countryLawList.jhtml">国家法律法规</a></li>
					<li><a href="/cityLawList.jhtml">地方法律法规</a></li>
					<li><a href="/countryFileList.jhtml">国家相关文件</a></li>
					<li><a href="/cityFileList.jhtml">地方相关文件</a></li>
				</ul>
			</div>
			<div class="j_main_left_1" style="margin-top:10px;height:400px;text-align:center;">
				<div style="width:99px;float:left;"><img src="/resource/public/images/zhizuo-_03.png" style="padding: 5px;"></div>
				<div style="line-height: 34px; height: 34px; margin-left: 10px; margin-top: 15px; float: left; margin-right: 10px; width: 60px;"><hr style="border:1px dashed #e4e4e4;"></div>
				<div style="width: 70px; float: left; line-height: 45px;"><a href="/specialList.jhtml" style="margin-left:0;">更多>></a></div>
				<img src="/resource/public/images/zhuanti.png" style="margin-top:7px;">
			</div>
		</div>
		<div class="j_main_right">
			<div class="j_main_right_1">
				<p>
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					所在位置 > 政策咨询
				</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;width:727px;">
				<table style="background:#F2F2F2;border: 3px solid #FFFFFF; padding: 10px 0; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
					<tr>
						<td>
							<select name="">
								<option value="">标题</option>
							</select>
						</td>
						<td>
							<input type="text" name="" placeholder="输入文本..">
						</td>
						<td>
							发布日期：
						</td>
						<td>
							<select name="">
								<option value="">年</option>
							</select>
							<select name="">
								<option value="">月</option>
							</select>
						</td>
						<td>
							至
						</td>
						<td>
							<select name="">
								<option value="">年</option>
							</select>
							<select name="">
								<option value="">月</option>
							</select>
						</td>
						<td rowspan="2" style="background: url(/resource/public/images/chaxun.png); border-radius: 4px;">
							<input type="button" value="" name="" onclick="javascript:window.location.href='/policyAdviceSearch.jhtml'" style="border: 0px none; font-size: 18px; cursor: pointer; height: 61px; width: 60px; background: none;">
						</td>
					</tr>
					<tr>
						<td>效力等级：</td>
						<td>
							<select name="" style="width: 235px;">
								<option value="">全部</option>
							</select>
						</td>
						<td>
							效力属性：
						</td>
						<td colspan="3">
							<select name="" style="width: 217px;">
								<option value="">全部</option>
							</select>
						<td>
					</tr>
				</table>
				<table>
					<tr>
						<td>
							<div class="j_main_right_3">
								<p>
									<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
									国家法律法规<span><a href="/countryLaw.jhtml">更多</a></span></p>
								<div class="j_main_right_3_1">
									<ul style="padding-left:10px;margin:0;">
										<li><a href="/countryLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/countryLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/countryLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/countryLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/countryLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/countryLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/countryLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
									</ul>
								</div>
							</div>
						</td>
						<td>
							<div class="j_main_right_3">
								<p>
									<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
									地方法律法规<span><a href="/cityLaw.jhtml">更多</a></span>
								</p>
								<div class="j_main_right_3_1">
									<ul style="padding-left:10px;margin:0;">
										<li><a href="/cityLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/cityLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/cityLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/cityLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/cityLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/cityLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/cityLaw.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
									</ul>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="j_main_right_3">
								<p>
									<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
									国家相关文件<span><a href="">更多</a></span>
								</p>
								<div class="j_main_right_3_1">
									<ul style="padding-left:10px;margin:0;">
										<li><a href="/countryFile.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/countryFile.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/countryFile.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/countryFile.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/countryFile.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/countryFile.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/countryFile.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
									</ul>
								</div>
							</div>
						</td>
						<td>
							<div class="j_main_right_3">
								<p>
									<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
									地方相关文件<span><a href="">更多</a></span>
								</p>
								<div class="j_main_right_3_1">
									<ul style="padding-left:10px;margin:0;">
										<li><a href="/cityFile.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/cityFile.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/cityFile.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/cityFile.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/cityFile.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/cityFile.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
										<li><a href="/cityFile.jhtml">2014年医疗、工伤和生育保险工作座谈会召开</a><span style="">04-19</span></li>
									</ul>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	[#include "/include/footer.ftl" /]
</body>
</html>