var motionNumber = 0;
var left_left = "200px";
var left_center = "330px";
var left_right = "600px";
var top_top = "-100px";
var top_center = "250px";
var top_bottom = "500px";
var slideAway_left;
var slideAway_top;
var slideFrom_left;
var slideFrom_top;

function loadPage(url){
	$("#div_box").stop();
	//set to final position
	$("#div_box").css({opacity:"1.0", left:left_center, top:top_center });

	if (motionNumber == 0){	//animate from left
		motionNumber = 1;
		slideAway_left = left_right;
		slideAway_top = top_center;
		slideFrom_left = left_left;
		slideFrom_top = top_center;
	}
	else if (motionNumber == 1){ //animate from right
		motionNumber = 0;
		slideAway_left = left_left;
		slideAway_top = top_center;
		slideFrom_left = left_right;
		slideFrom_top = top_center;
	}
	
	//animation slide away
	$("#div_box").animate({opacity:"0.0", left:slideAway_left, top:slideAway_top },"slow",function(){
		//load page
		$("#div_box").load(url);
		//set to initial position
		$("#div_box").css({opacity:"0.0", left:slideFrom_left, top:slideFrom_top });
		//animation slide to final position
		$("#div_box").animate({opacity:"7.0", left:left_center, top:top_center },"slow");
	});
};
