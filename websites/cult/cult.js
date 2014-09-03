		/*********************************************************************
		 * @Author Hamid Alipour Codehead @ webmaster-forums.code-head.com		
		**/
		function get_object(id) {
			var object = null;
			if( document.layers )	{			
				object = document.layers[id];
			} else if( document.all ) {
				object = document.all[id];
			} else if( document.getElementById ) {
				object = document.getElementById(id);
			}
			return object;
		}
		function is_child_of(parent, child) {
			if( child != null ) {			
				while( child.parentNode ) {
					if( (child = child.parentNode) == parent ) {
						return true;
					}
				}
			}
			return false;
		}
		function fixOnMouseOut(element, event) {
			var current_mouse_target = null;
			if( event.toElement ) {				
				current_mouse_target 			 = event.toElement;
			} else if( event.relatedTarget ) {				
				current_mouse_target 			 = event.relatedTarget;
			}
			if( !is_child_of(element, current_mouse_target) && element != current_mouse_target ) {
				eval(deeffect(element));
			}
		}
		function fixOnMouseOver(element,event) {
			var current_mouse_target = null;
			if( event.fromElement ) {				
				current_mouse_target 			 = event.fromElement;
			} else if( event.relatedTarget ) {				
				current_mouse_target 			 = event.relatedTarget;
			}
			if( !is_child_of(element, current_mouse_target) && element != current_mouse_target ) {
				eval(effect(element));
			}
		}

// This code was designed for the cultural council of IITH
// This code belongs to
// Subhash
// me10b035@iith.ac.in


if (navigator.appName == 'Microsoft Internet Explorer')
{
var m=document.getElementById("menu");
m.style.margin="0px";
var lis=m.getElementsByTagName("li");
for(var i=0;i<lis.length;i++)
	if(lis[i].getElementsByTagName("li").length==0)
		lis[i].style.padding="0px"
}


var scrollpos=0;
var menumast=document.getElementById("menumaster");
function scroll()
{	
	scrollpos=window.pageYOffset;
	if(scrollpos>125)
	{
		menumast.style.position="fixed";
		menumast.style.top=-5+"px";
		menumast.style.left=-window.pageXOffset+"px";
		menumast.style.background="url(menuback.png)";
		menumast.style.backgroundPosition="50% 0px";
	}
	else
	{
		menumast.style.position="relative";
		menumast.style.top=0+"px";
		menumast.style.left=0+"px";
		menumast.style.background="none";
	}
}
window.onscroll=scroll;
var menu=menumast.getElementsByTagName("li");
var dynelems=[];
var dir=[];
var pos=[];
var height=[];
var elems=0;
for(var i=0;i<menu.length;i++)
{
	if(menu[i].getElementsByTagName("ul").length==1)
	{
		dynelems[elems]=menu[i];
		dir[elems]=0;
		pos[elems]=0;
		height[elems]=menu[i].getElementsByTagName("li").length*54;
		elems++;
		menu[i].onmouseover=(function(event)
		{
			fixOnMouseOver(this,event);
		})
		menu[i].onmouseout=(function(event)
		{
			fixOnMouseOut(this,event);
		})
	}
}
var controler=new Array(elems);
var timed=new Array(elems);
function effect(that)
{
	var no;
	for(var i=0;i<elems;i++)
		if(that==dynelems[i])
			no=i;
	if(dir[no]==-1)
		clearTimeout(controler[no]);
	timed[no]=new Date();
	dir[no]=1;
	worker(no);
}
function deeffect(that)
{
	var no;
	for(var i=0;i<elems;i++)
		if(that==dynelems[i])
			no=i;
	if(dir[no]==1)
		clearTimeout(controler[no]);
	timed[no]=new Date();
	dir[no]=-1;
	worker(no);
}
function worker(no)
{
	var sub=dynelems[no].getElementsByTagName("ul");
	var time=new Date();
	var diff=time.getTime()-timed[no].getTime();
	pos[no]+=dir[no]*(diff)/600;
	if(pos[no]<0)
		pos[no]=0;
	else if(pos[no]>1)
		pos[no]=1;
	else
		controler[no]=setTimeout("worker("+no+")",13);
	var easy=( -Math.cos( pos[no]*Math.PI ) / 2 ) + 0.5;
	sub[0].style.clip="rect(auto,auto,"+(easy*height[no])+"px,auto)";
	timed[no]=time;
}