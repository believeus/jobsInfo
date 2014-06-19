/*
 * X-Menu 下拉框多选组件
 * 依赖jquery.powerFloat.js 
 * 整合powerFloat
 * 浏览器支持 FF Chrome Opera IE9 IE8一下不兼容
 * @author yelingfeng
 * @email  yelingfeng521@gmail.com 
 */
 
(function($) {

	var defaults  = {
		width :580, //可选参数：inherit，数值(px)
		eventType: "click", //事件类型，其他可选参数有：click, focus
		dropmenu:".xmenu",//弹出层div
		hiddenID : "selectposhidden",//隐藏域ID
		emptytext: "请选择",
		value:null
	};
	
	$.fn.xMenu = function(options) {
		return $(this).each(function() {
			// 定义变量设置为单选的,根据需求删除
			var count=0;
		
			var owl = $.extend({}, defaults, options || {});
			//触发按钮
			var $this = $(this);
			//span
			var $span = $this.find("span");
			//浮动层主div
			var $dropmenu= $(owl.dropmenu);
			//触发隐藏域 存职位ID
			var $Hd = $("#"+owl.hiddenID);
			//主li
			var $mli = $("dl li",$dropmenu);
			//关闭按钮
			var $closebtn =$(".m-close", $dropmenu);			
			//已选在职位div
			var $selectinfo = $(".select-info",$dropmenu);
			//已选在职位ul
			var $selectUl = $("ul",$selectinfo);
			//确认按钮
			var $okbtn = $("a[name='menu-confirm']",$selectinfo);
			
			//设置默认值
			$Hd.val(owl.value);
			
			//伸缩事件绑定
			$("dl dt",$dropmenu).toggle(function(){
				var $this = $(this);
				if($this.hasClass('open')){
					$this.removeClass('open').next().slideUp('fast');
				}else{
					$this.addClass('open').next().slideDown('fast');
				}				
			} , function(){
				$(this).removeClass('open').next().slideUp('fast');
			});
			
			//绑定关闭
			$closebtn.click(function(){
				 $.powerFloat.hide();
			});
			//绑定保存
			$okbtn.click(function(){
				var $li =$selectUl.find("li");
				var name = "";
				var id = "";			
				$li.each(function(){
					_this = $(this);
					name += _this.text()+",";
					id +=  _this.attr("rel")+",";
				});
				name = name.substring(0,name.length-1);
				id = id.substring(0,id.length-1);
				
				if(name.length>10){
					$span.attr({"title":name});
					name =name.substring(0,15)+"...";
				}
				
				$span.text(name);
				$Hd.val(id);
				$.powerFloat.hide();
			});
			
			
			//绑定每一个职位
			$mli.click(function(){
				// 判断是否有绑定的职位
				var $li = $(this);
				var val  =$li.text();
				var id  = $li.attr("rel");
				if($selectinfo.is(":hidden")){
					$selectinfo.show();
				}
				if($li.hasClass("current")){
					$selectUl.find("li[rel='"+id+"']").remove();					
					$li.removeClass("current");
					count--;
				}else{	
					if(count<5){
						$("<li rel='"+id+"' class='current'>"+val+"</li>").appendTo($selectUl);
						$li.addClass("current");
						count++;
					}else{
						alert("最多选择5个");
					}
				}	
				if($selectUl.children("li").length==0){
					$selectinfo.hide();
				}
			});
			
			//绑定已选区li事件
			$("li",$selectUl).live('click',function(){
				count--;
				var $li = $(this);
				var id  = $li.attr("rel");
				$mli.filter("li[rel='"+id+"']").removeClass("current");	
				$li.remove();
				if($selectUl.children("li").length==0){
					$selectinfo.hide();
				}
			});
			
			
			
			
			
			
			//绑定power浮动层
			$this.powerFloat({
				width: owl.width,
				eventType: owl.eventType,
				edgeAdjust: false,
				offsets: {
					x: 0,
					y: -1
				},
				position: "4-1",
				target: $dropmenu, 	 		
				showCall: function(){ 				
					//标注已选职位
					setCurrentItem($Hd.val());					
					$this.addClass("menu-open");
				},
				hideCall:function(){
					$this.removeClass("menu-open");
					if($selectUl.children("li").length==0){
						$span.text(owl.emptytext);
						$Hd.val("");
					}
				}
			});
			//选中已选的职位
			var setCurrentItem = function (val){	
				if((val&&val!="")){
					$mli.removeClass("current");
					var array = val.split(",");
					$selectUl.empty();
					for(var i=0;i<array.length;i++){
						var $cli = $mli.filter("li[rel='"+array[i]+"']");
						$cli.addClass("current");
						$("<li rel='"+array[i]+"' class='current'>"+$cli.text()+"(点击即可取消选择)</li>").appendTo($selectUl);
					}					
				}else if($selectUl.children("li").length > 0){
					$selectinfo.show();
				}else{
					$selectinfo.hide();
				}
				
			};
		});
	};
	
})(jQuery);