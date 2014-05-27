/*从哪个页面退出就回到哪个页面去*/
var Etech={
  "logout":function(){
	        var current = encodeURIComponent(window.location);
			window.location = "/logout.jhtml?return="+current;
	}
}