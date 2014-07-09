<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据频道</title>
<script src="/resource/public/resources/scripts/jquery-1.10.2.min.js"></script>
<style type="text/css">
a:link{
	text-decoration:none;
}
.gg ul{	
	font-family:'微软雅黑';
	line-height:28px;
	font-size:13px;
	color:#000;
	padding-left:30px;
	margin-top:10px;
}
.gg span {
    float: right;
    margin-right: 10px;
}
.left_{
	width:240px; 
	height:285px;
	border:1px solid #FCB887;	
}
.left_top{
	height:29px; 
	border-bottom: 1px solid #e4e4e4; 
	background:url(/resource/public/images/111.png);
}
.zti_im{
	margin:3px 25px;
	width:190px;
	height:60px;	
}
.middle_{
	height:30px; 
	border-bottom: 1px solid #e4e4e4; 
	background: url(/resource/public/images/background.png) repeat scroll 0 0 rgba(0, 0, 0, 0);
	font-size:12px;
	font-weight:bold;
}
.j_main_left_1{
	width:238px;
	height:180px;
	border:1px solid #e4e4e4;
	border-radius:4px;
}
.gongji li {
    border-bottom: 1px dashed #FF7800;
    line-height:31px;
}
.gongji a:hover{
	text-decoration:none;
}
</style>

</head>
<body>
[#include "/include/header.ftl" /]
<div style="width:1000px; height:auto; margin-left:auto; margin-right:auto;overflow:hidden;">
	<div style="width:240px; float:left;">
        <div class="left_">  
            <div class="left_top">
            	<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-top: 7px; margin-left: 10px;">
                <div style="margin:8px 10px; width:160px; display:inline-block;font-weight:bold;">公告公示</div>
                <a href="/publicityList.jhtml" style="vertical-align:middle; font-size:13px;">更多</a>
            </div>
            <div class="gg" style="font-size:12px; font-weight:100;">
              <ul>
           		[#list notices as notice]
           		[#if notice_index <8]
					<li>
						<a href="/publicityInfo.jhtml?id=${notice.id}" title="${notice.title}">
						[#if notice.title?length > 8]
							${notice.title?string?substring(0,8)}...
						[#else]
							${notice.title}
						[/#if]
						</a>
						<span>${notice.editTime?number_to_datetime}</span>
					</li>
				[/#if]
				[/#list]
              </ul>
            </div>
        </div>
       <div class="j_main_left_1" style="margin-top:10px;height:508px;text-align:center;background:#FFFFFF;">
			<div style="width:99px;float:left;"><img src="/resource/public/images/zhizuo-_03.png" style="padding: 5px;"></div>
			<div style="line-height: 34px; height: 34px; margin-left: 10px; margin-top: 15px; float: left; margin-right: 10px; width: 45px;"><hr style="border:1px dashed #e4e4e4;"></div>
			<div style="width: 70px; float: left; line-height: 45px;"><a href="/specialList.jhtml" style="margin-left:0;">更多>></a></div>
			[#list subjectReport as sReport]
				[#if sReport_index <6]
					<a href="/special.jhtml?id=${sReport.id}"><img src="${sReport.imgpath?string?split("#")[1]}" style="width:222px;height:66px;margin-top:10px;"></a>
				[/#if]
			[/#list]
		</div>
    </div>
    <div style="width:750px; float:left; margin-left:10px;">
    	<div style="background: url(/resource/public/images/background_b.png) repeat scroll 0% 0% transparent; border: 1px solid rgb(228, 228, 228); height: 28px; line-height: 28px; padding-left: 10px; width: 738px;">
        	<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-top: 7px; margin-right: 10px;">
        	<span>所在位置</span>
            <span>></span>
			<span><a href="/dataChannel.jhtml" title="数据频道">数据频道</a></span>
        </div>
        <div style="width:748px; height:765px; border:1px solid #e4e4e4; margin-top:10px;background:#FFFFFF;">
        	<div style="float:left;">
                <div style="width:505px; height:290px; margin:10px;">
                    <div class="middle_">
                    	<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-top: 7px; margin-left: 10px;">
                        <div style="margin:8px; width:405px; display:inline-block">人力资源供求市场供求分析报告</div>
                        <a href="/fenxibaogaoList.jhtml" style="vertical-align:middle; font-size:13px;">更多</a>
                    </div>
                    <div class="gg">
                      <ul style="font-size:13px; letter-spacing:0px;">
                      [#list analysisreport as aReport]
                      [#if aReport_index < 9 ]
                        <li>
                          	<div style="width:375px; display:inline-block;">
	                          	<a href="/report.jhtml?id=${aReport.id}" title="${aReport.title}">
	                          		[#if aReport.title?length > 25 ]
		                          		${aReport.title?string?substring(0,25)}...
	                          		[#else]
		                          		${aReport.title}
	                          		[/#if] 
	                      		</a>
                  			</div>
                          	<span>${aReport.editTime?number_to_datetime}</span>
                        </li>
                        [/#if]
                      [/#list]
                      </ul>
                    </div>	
                </div>
                <div style="width:505px; height:295px; margin:10px;">
                    <div class="middle_">
                    	<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-top: 7px; margin-left: 10px;">
                        <div style="margin:8px; width:405px; display:inline-block">全市工资指导价位</div>
                        <a href="/zhidaojiaweiList.jhtml" style="vertical-align:middle; font-size:13px;">更多</a>
                    </div>
                     <div class="gg">
                      <ul style="font-size:13px; letter-spacing:0px;">
                      [#list wagePriceGuide as wagePriceGuide]
                      [#if wagePriceGuide_index < 9 ]
                        <li>
                          	<div style="width:375px; display:inline-block;">
	                          	<a href="/guidance.jhtml?id=${wagePriceGuide.id}" title="${wagePriceGuide.title}">
	                          		[#if wagePriceGuide.title?length > 25 ]
		                          		${wagePriceGuide.title?string?substring(0,25)}...
	                          		[#else]
		                          		${wagePriceGuide.title}
	                          		[/#if] 
	                      		</a>
                  			</div>
                          <span>${wagePriceGuide.editTime?number_to_datetime}</span>
                        </li>
                      [/#if]
                      [/#list]
                      </ul>
                    </div>   
                </div>
                <div style="width:505px; height:130px; margin:10px;">
                    <div class="middle_">
                    	<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-top: 7px; margin-left: 10px;">
                        <div style="margin:8px; width:405px; display:inline-block">相关下载</div>
                        <a href="/ziliaoList.jhtml" style="vertical-align:middle; font-size:13px;">更多</a>
                    </div>
                     <div class="gg">
                      <ul style="font-size:13px; letter-spacing:0px;">
                        <li>
                          <div style="width:395px; display:inline-block;"><a href="/ziliaoList.jhtml">资料下载</a></div>
                        </li>	
                        <li>
                          <div style="width:395px; display:inline-block;"><a href="/biaogeList.jhtml">表格下载</a></div>
                        </li>
                        <li>
                          <div style="width:395px; display:inline-block;"><a href="/ruanjianList.jhtml">软件下载</a></div>
                        </li>
                      </ul>
                    </div>   
                </div>
             </div>
             <div style="width:215px; float:left; border:1px solid #e4e4e4; height:357px; margin-top:10px;background:#FFF6E5;">
                <div class="middle_" style="text-align:center; padding-top:8px; height:22px;"> 
                    <div>
                    	<img style="float: left; margin-left: 10px;" src="/resource/public/images/sanjiaojian.png">
                    	每月职业供给排行榜<span style="float:right;"><a href="/gongjipaihangList.jhtml?pageNo=0&pageSize=20">更多</a></span>
                	</div>
                </div>
                <div class="gg" style="">
                  <ul class="gongji" style="font-size:13px; letter-spacing:0px; list-style-type:none;margin:0;padding-left:15px;padding-right:15px;">
                    [#list supply as supply]
                    [#if supply_index <10]
	                    <li>
	                      	<div>
		                      	<a style="color:#fe0002;" title="${supply.jobPost}">
		                      		${supply_index+1}、
		                      		[#if supply.jobPost?exists]
			                      		[#if supply.jobPost?length >11]
			                      			${supply.jobPost?string?substring(0,11)}...
			                      		[#else]
				                      		${supply.jobPost}
			                      		[/#if]
		                      		[/#if]
	                      		</a>
                      		</div>
	                    </li>
                    [/#if]
                    [/#list]
                  </ul>
                </div>     
             </div>
             <div style="width:215px; float:left; border:1px solid #e4e4e4; height:370px; margin-top:10px;background:#FFF6E5;">
                <div class="middle_" style="text-align:center; padding-top:8px; height:22px;"> 
                    <div>
                    	<img style="float: left; margin-left: 10px;" src="/resource/public/images/sanjiaojian.png">
                    	每月职业需求排行榜<span style="float:right;"><a href="/xuqiupaihangList.jhtml?pageNo=0&pageSize=20">更多</a></span>
                	</div>
                </div>
                <div class="gg">
                  <ul class="gongji" style="font-size:13px; letter-spacing:0px; list-style-type:none;margin:0;padding-left:15px;padding-right:15px;">
                    [#list demand as demand]
                    [#if demand_index <10]
	                    <li>
	                      	<div>
		                      	<a style="color:#fe0002;" title="${demand.workType.name}">
		                      		${demand_index+1}、
		                      		[#if demand.workType?exists]
			                      		[#if demand.workType.name?length >11]
			                      			${demand.workType.name?string?substring(0,11)}...
		                      			[#else]
		                      				${demand.workType.name}
	                      				[/#if]
                      				[/#if]
	                      		</a>
                      		</div>
	                    </li>
                    [/#if]
                    [/#list]
                  </ul>
                </div>     
             </div>
        </div>
    </div>
</div>
[#include "/include/footer.ftl" /]
</body>
</html>
