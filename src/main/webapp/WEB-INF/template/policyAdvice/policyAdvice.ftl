<!DOCTYPE html>
<html>
<head>
    <title>政策咨询</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script src="/resource/public/resources/scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/resource/public/js/datePicker/WdatePicker.js"></script>
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
		    background:#FFFFFF;
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
			background:#FFFFFF;
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
		    margin: 10px 10px;
		    width: 336px;
		    height:230px;
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
			height:215px;
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
			<div class="j_main_left_1" style="margin-top:10px;height:425px;text-align:center;">
				<div style="width:99px;float:left;"><img src="/resource/public/images/zhizuo-_03.png" style="padding: 5px;"></div>
				<div style="line-height: 34px; height: 34px; margin-left: 10px; margin-top: 15px; float: left; margin-right: 10px; width: 60px;"><hr style="border:1px dashed #e4e4e4;"></div>
				<div style="width: 70px; float: left; line-height: 45px;"><a href="/specialList.jhtml" style="margin-left:0;">更多>></a></div>
				[#list subjectReport as sReport]
					[#if sReport_index <5]
						<a style="margin-left:0;" href="/special.jhtml?id=${sReport.id}"><img src="${sReport.imgpath?string?split("#")[1]}" style="width:222px;height:62px;margin-top:7px;"></a>
					[/#if]
				[/#list]
			</div>
		</div>
		<div class="j_main_right">
			<div class="j_main_right_1">
				<p>
					<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
					所在位置 > <a href="/policyAdvice.jhtml" title="政策咨询">政策咨询</a>
				</p>
			</div>
			<div class="j_main_right_2" style="border:1px solid #e4e4e4;width:727px;">
		  	<form method="post" action="/searchPolicyAdvice.jhtml">
		  		<input type="hidden" name="currentPage" value="0" />
		  		<input type="hidden" name="perCount" value="25"/>
				<table style="background:#F2F2F2;border: 3px solid #FFFFFF; padding: 10px 0; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
					<tr>
						<td>
							关键字：
						</td>
						<td>
							<input type="text" name="title" style="width:150px;">
						</td>
						<td>
							发布日期：
						</td>
						<td>起:
						<input type="text"  id="beginDate" name="beginDate" style="width:100px;height:25px" class="text Wdate" value="${(beginDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'});" />
						止: <input type="text" id="endDate" name="endDate" style="width:100px;height:25px" class="text Wdate" value="${(endDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDate\')}'});" />
						</td>
						<td rowspan="2"> <!-- style="background: url(/resource/public/images/chaxun.png); border-radius: 4px;"-->
							<input id="select_p" type="submit" value="查询"  style="cursor: pointer; height: 63px; width: 63px;">
						</td>
					</tr>
					<tr>
						<td>效力等级：</td>
						<td>
							<select name="powerLevel" style="width: 159px;">
								<option value="0">全部</option>
								<option value="1">法律</option>
								<option value="2">行政法规</option>
								<option value="3">地方法规</option>
								<option value="4">规章</option>
								<option value="5">规范性文件</option>
								<option value="6">省厅文件</option>
							</select>
						</td>
						<td>
							效力属性：
						</td>
						<td colspan="3">
							<select name="powerProperty" style="width: 217px;">
								<option value="0">全部</option>
								<option value="1">有效</option>
								<option value="2">失效</option>
								<option value="3">废止</option>
							</select>
						<td>
					</tr>
				</table>
			</form>
				<table>
					<tr>
						<td>
							<div class="j_main_right_3">
								<p>
									<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
									国家法律法规<span><a href="/countryLawList.jhtml">更多</a></span></p>
								<div class="j_main_right_3_1">
									<ul style="padding-left:10px;margin:0;">
										[#list countryLawDataList as countryLawData]
										<li>
											<a href="/countryLaw.jhtml?id=${countryLawData.id}" title="${countryLawData.title}">
												[#if countryLawData.title?length >15 ]
													${countryLawData.title?string?substring(0,15)}...
												[#else]
													${countryLawData.title}
												[/#if]
											</a>
											<span style="">${countryLawData.editTime?number_to_datetime}</span>
										</li>
										[/#list]
									</ul>
								</div>
							</div>
						</td>
						<td>
							<div class="j_main_right_3">
								<p>
									<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
									地方法律法规<span><a href="/cityLawList.jhtml">更多</a></span>
								</p>
								<div class="j_main_right_3_1">
									<ul style="padding-left:10px;margin:0;">
										[#list cityLawDataList as cityLawData]
										<li>
											<a href="/cityLaw.jhtml?id=${cityLawData.id}" title="${cityLawData.title}">
												[#if cityLawData.title?length >15 ]
													${cityLawData.title?string?substring(0,15)}...
												[#else]
													${cityLawData.title}
												[/#if]
											</a>
											<span style="">${cityLawData.editTime?number_to_datetime}</span>
										</li>
										[/#list]
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
									国家相关文件<span><a href="/countryFileList.jhtml">更多</a></span>
								</p>
								<div class="j_main_right_3_1">
									<ul style="padding-left:10px;margin:0;">
										[#list countryFileDataList as countryFileData]
										 <li>
										 	<a href="/countryFile.jhtml?id=${countryFileData.id}" title="${countryFileData.title}">
										 		[#if countryFileData.title?length >15 ]
													${countryFileData.title?string?substring(0,15)}...
												[#else]
													${countryFileData.title}
												[/#if]
									 		</a>
									 		<span style="">
										  		${countryFileData.editTime?number_to_datetime}
									  		</span>
								  		</li>
										[/#list]
									</ul>
								</div>
							</div>
						</td>
						<td>
							<div class="j_main_right_3">
								<p>
									<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-right: 10px;">
									地方相关文件<span><a href="cityFileList.jhtml">更多</a></span>
								</p>
								<div class="j_main_right_3_1">
									<ul style="padding-left:10px;margin:0;">
										[#list cityFileDataList as cityFileData]
										<li>
											<a href="/cityFile.jhtml?id=${cityFileData.id}" title="${cityFileData.title}">
												[#if cityFileData.title?length >15 ]
													${cityFileData.title?string?substring(0,15)}...
												[#else]
													${cityFileData.title}
												[/#if]
											</a>
											<span style="">${cityFileData.editTime?number_to_datetime}</span>
										</li>
										[/#list]
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
	<script type="text/javascript">
		$().ready(function(){
			var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
			var isOpera = userAgent.indexOf("Opera") > -1;
			
			if (isOpera){return "Opera"}; //判断是否Opera浏览器
			if (userAgent.indexOf("Firefox") > -1){//判断是否Firefox浏览器
				//alert("Firefox浏览器");
				$("#box").css("right","988px");
				$("#box").css("top","50px");
				return "FF";
			} 
			if (userAgent.indexOf("Safari") > -1){return "Safari";} //判断是否Safari浏览器
			if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera){
				//alert("IE浏览器");
			} ; //判断是否IE浏览器
		});
	</script>
</body>
</html>