/***************************/
//@Author: Adrian "yEnS" Mato Gondelle
//@website: www.yensdesign.com
//@email: yensamg@gmail.com
//@license: Feel free to use it, but keep this credits please!					
/***************************/

//SETTING UP OUR POPUP
//0 means disabled; 1 means enabled;
var popupStatus = 0;

//loading popup with jQuery magic!
function loadPopup(){
	//loads popup only if it is disabled
	if(popupStatus==0){
		$("#backgroundPopup").css({
			"opacity": "0.7"
		});
		$("#backgroundPopup").fadeIn("slow");
		$("#popupContact").fadeIn("slow");
		popupStatus = 1;
	}
}

//disabling popup with jQuery magic!
function disablePopup(){
	//disables popup only if it is enabled
	if(popupStatus==1){
		$("#backgroundPopup").fadeOut("slow");
		$("#popupContact").fadeOut("slow");
		popupStatus = 0;
	}
}

//centering popup
function centerPopup(){
	//request data for centering
	var windowWidth = document.documentElement.clientWidth;
	var windowHeight = document.documentElement.clientHeight;
	var popupHeight = $("#popupContact").height();
	var popupWidth = $("#popupContact").width();
	//centering
	$("#popupContact").css({
		"position": "absolute",
		"top": windowHeight/2-popupHeight/2,
		"left": windowWidth/2-popupWidth/2
	});
	//only need force for IE6
	
	$("#backgroundPopup").css({
		"height": windowHeight
	});
	
}


//CONTROLLING EVENTS IN jQuery
$(document).ready(function(){
	
	//LOADING POPUP
	//Click the button event!
	$("#login_popup").click(function(){
		//centering with css
		centerPopup();
		//load popup
		loadPopup();
	});
	
				
	//CLOSING POPUP
	//Click the x event!
	$("#popupContactClose").click(function(){
		disablePopup();
	});
	//Click out event!
	$("#backgroundPopup").click(function(){
		disablePopup();
	});
	//Press Escape event!
	$(document).keypress(function(e){
		if(e.keyCode==27 && popupStatus==1){
			disablePopup();
		}
	});

});












var rpopupStatus = 0;

//loading popup with jQuery magic!
function rloadPopup(){
	//loads popup only if it is disabled
	if(rpopupStatus==0){
		$("#rbackgroundPopup").css({
			"opacity": "0.7"
		});
		$("#rbackgroundPopup").fadeIn("slow");
		$("#rpopupContact").fadeIn("slow");
		rpopupStatus = 1;
	}
}

//disabling popup with jQuery magic!
function rdisablePopup(){
	//disables popup only if it is enabled
	if(rpopupStatus==1){
		$("#rbackgroundPopup").fadeOut("slow");
		$("#rpopupContact").fadeOut("slow");
		rpopupStatus = 0;
	}
}

//centering popup
function rcenterPopup(){
	//request data for centering
	var windowWidth = document.documentElement.clientWidth;
	var windowHeight = document.documentElement.clientHeight;
	var popupHeight = $("#rpopupContact").height();
	var popupWidth = $("#rpopupContact").width();
	//centering
	$("#rpopupContact").css({
		"position": "absolute",
		"top": windowHeight/2-popupHeight/2,
		"left": windowWidth/2-popupWidth/2
	});
	//only need force for IE6
	
	$("#rbackgroundPopup").css({
		"height": windowHeight
	});
	
}


//CONTROLLING EVENTS IN jQuery
$(document).ready(function(){
	
	//LOADING POPUP
	//Click the button event!
	$("#register_popup").click(function(){
		//centering with css
		rcenterPopup();
		//load popup
		rloadPopup();
	});
	
				
	//CLOSING POPUP
	//Click the x event!
	$("#rpopupContactClose").click(function(){
		rdisablePopup();
	});
	//Click out event!
	$("#rbackgroundPopup").click(function(){
		rdisablePopup();
	});
	//Press Escape event!
	$(document).keypress(function(e){
		if(e.keyCode==27 && rpopupStatus==1){
			rdisablePopup();
		}
	});

});