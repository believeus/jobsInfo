<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图片详情</title>
<link type="text/css" rel="stylesheet" href="/resource/public/js/imgSlide/galleryview.css" />
<script type="text/javascript" src="/resource/public/js/imgSlide/js/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/resource/public/js/imgSlide/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="/resource/public/js/imgSlide/js/jquery.galleryview-1.1.js"></script>
<script type="text/javascript" src="/resource/public/js/imgSlide/js/jquery.timers-1.1.2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#photos').galleryView({
		panel_width: 800,
		panel_height: 300,
		frame_width: 100,
		frame_height: 100
	});
});

	function loadImg(img, maxWidth, maxHeight){
		
		var width = img.width,
            height = img.height;
	    if( width>maxWidth || height>maxHeight ){     
	        rateWidth = width / maxWidth;     
	        rateHeight = height / maxHeight;     
	             
	        if( rateWidth > rateHeight ){     
	            img.width =  maxWidth;     
	            img.height = height / rateWidth;     
	        }else{     
	            img.width = width / rateHeight;     
	            img.height = maxHeight;     
	        }     
	    }    
		img.style.width = img.width + 'px';    
		img.style.height = img.height + 'px';    
		    
    }
</script>


</head>

<body bgcolor="#000000;">
[#include "/include/header.ftl" /]
<div class="img_title">
	<div style="height:50px;line-height:50px;padding-left:20px;">
		<p style="color:#FFFFFF;font-weight:bold;">
			<img width="20" height="18" src="/resource/public/images/6-01.png">
			潜江公共就业服务网><a style="color:#FFFFFF;" href="/infoCenter.jhtml" title="资讯中心">资讯中心</a>
		</p>
	</div>
	<h1 style="color:#FFFFFF;text-align:center;">${data.title}</h1>
	<p style="color:#FFFFFF;text-align:center;">${data.editTime?number_to_datetime}</p>
</div>
<div id="photos" class="galleryview">
	[#list pathList as path]
	  <div class="panel">
	     	<img src="${path}" onload="loadImg(this,'800','572')"/> 
	    <div class="panel-overlay">
	      	<div style="text-align:left;padding:0 15px;">
					${data.content}
	  		</div>
	    </div>
	  </div>
	[/#list]
	  <ul class="filmstrip">
	  	[#list pathList as path]
	    	<li><img src="${path}" width="98" height="98" alt="${data.title}" title="${data.title}" /></li>
		[/#list]
	  </ul>
</div>
[#include "/include/footer.ftl" /]
</body>
</html>
