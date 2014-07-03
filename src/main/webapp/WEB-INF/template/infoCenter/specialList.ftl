<!DOCTYPE html>
<html>
<head>
    <title>专题列表</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script src="/resource/public/resources/scripts/jquery-1.10.2.min.js"></script>
	 <script type="text/javascript" src="/resource/public/resources/scripts/jquery.validate.js"></script>
	 <script type="text/javascript" src="/resource/public/js/Etech.js"></script>
    <style type="text/css">
    	.j_main{
    		width:1000px;
    		height:auto;
    	}
    	.j_main_1{
    		width:998px;
    		height:30px;
    		background:url(resource/public/images/background_b.png);
    		border:1px solid #e4e4e4;
    		line-height:30px;
    	}
    	.j_main_2{
    		border: 1px solid #E4E4E4;
		    border-radius: 4px;
		    height: auto;
		    margin-top: 2px;
		    width: 998px;
		    color:#BA2534;
    	}
    	.j_main_2_1{
    		border-bottom: 3px solid #F9B552;
		    height: 70px;
		    margin-left: auto;
		    margin-right: auto;
		    width: 920px;
		    margin-bottom:20px;
    	}
    	.zt{
    		background: #FCD45B;
		    border-radius: 2px;
		    float: left;
		    font-size: 18px;
		    height: 30px;
		    line-height: 30px;
		    margin-top: 41px;
		    text-align: center;
		    width: 70px;
    	}
    	.zt_title{
    		float: left;
		    font-size: 18px;
		    height: 30px;
		    line-height: 30px;
		    margin-left: 10px;
		    margin-top: 40px;
		    width: 390px;
    	}
    	.zt_time{
    		float: left;
    		height: 30px;
		    line-height: 30px;
		    width: 120px;
		    margin-top: 40px;
		    margin-left:100px;
    	}
    	.zt_img{
    		float: left;
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
    </style>
</head>
<body>
	[#include "/include/header.ftl" /]
	<div class="j_main w">
		<div class="j_main_1">
			<img src="/resource/public/images/sanjiaojian.png" style="float: left; margin-left: 10px; margin-right: 10px; margin-top: 6px;">
			所在位置 > 专题报道
		</div>
		<div class="j_main_2">
			[#list spceilas as spceila]
			<div class="j_main_2_1">
				<div class="zt" style="">
					专题
				</div>
				<div class="zt_title">
					<a href="/special.jhtml?id=${spceila.id}">${spceila.title}</a>
				</div>
				<div class="zt_time">
					[${spceila.editTime?number_to_datetime}]
				</div>
				<div class="zt_img">
					<a href="/special.jhtml?id=${spceila.id}"><img style="height:66px;width:222px" src="${spceila.imgpath}" ></a>
				</div>
			</div>
			[/#list]
			<img style="padding: 0px 20px; width: 920px; margin-left: 15px;" src="/resource/public/images/line.png">
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
	[#include "/include/footer.ftl" /]
</body>
</html>