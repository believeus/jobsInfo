/*从哪个页面退出就回到哪个页面去*/
var Etech={
  "current": encodeURIComponent(window.location),
  "logout":function(){
			window.location = "/logout.jhtml";
	}
};