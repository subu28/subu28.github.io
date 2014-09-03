var updtot=4;
var upd1='DATES ANNOUNCED<br/> The Fest dates are 13th and 14th of October 2012';
var upd2='WORKSHOP<br/>The Second workshop is gonna be <b/>Robo-o-mania 2.0</b> . Click on workshop icon for details';
var upd3='FEST NAME<br/> The fest name is changed to &eta;vision. Click on our "&eta;vision" icon to know more'; //always keep atleat a dummy upd3
var upd4='CEPHIED<br/> The first CELESTIAL INQUISITION is now released!';
var upstrt=0;
var uplen=0;
var updtop=0;
var upnex=upd3;
var upnow=3;
var totspon=6;
var spon1='<a target="_blank" href="http://www.thinkdigit.com/store?utm_source=spo-banner&utm_medium=spo-banner-nvision-iith&utm_campaign=spo-banner-nvision-iith" title="thinkdigit">Online Media Partner<img src="images/spons/thinkdigit.jpg" style="width:90%; margin: 10px;"/></a>';
var spon6='<a target="_blank" href="http://www.jntuworld.com/" title="jntu world">Online Media Partner<img src="images/spons/jntuworld.gif" style="width:90%; margin: 10px;"/></a>';
var spon2='<a target="_blank" href="http://www.i3indya.com/" title="i3indya">Workshop Partner<img src="images/spons/i3indya.jpg" style="width:90%; margin: 10px;"/></a>';
var spon3='<a target="_blank" href="http://www.efyexpo.com" title="Electronics For You">Event Sponsor<br/>Electronic Circuit Design<img src="images/spons/efy.jpg" style="width:90%; margin: 10px;"/></a>';
var spon4='<a target="_blank" href="http://www.microsoft.com/en-in/default.aspx" title="Microsoft">EML Partner<img src="images/spons/mslogo.jpg" style="width:90%; margin: 10px;"/></a>';
var spon5='<a target="_blank" href="http://www.princetonreview.com/" title="Princton Review">Event Sponsor<img src="images/spons/reviewlogo.jpg" style="width:90%; margin: 10px;"/></a>';
var sponnex=2;
function updatediv()
{
	up1=document.getElementById('up1');
	up2=document.getElementById('up2');
	if(upstrt==0)
	{
		up1.innerHTML=upd1;
		if(updtot>1)
		up2.innerHTML=upd2;
		upstrt++;
		if(updtot>2)
		setTimeout("updatediv()",3000);
	}
	else
	{
		if(updtop>-100)
		{
			updtop-=10;
			up1.style.top=updtop+"px";
			up2.style.top=updtop+"px";
			setTimeout("updatediv()",100);
		}
		else
		{
			up1.style.top="0px";
			up2.style.top="0px";
			if(uplen==0)
			up1.innerHTML=up2.innerHTML;
			if(uplen<(upnex.length+1))
			{
				uplen++;
				up2.innerHTML=upnex.substring(0,uplen);
				setTimeout("updatediv()",50);
			}
			else
			{
				upnow++;
				if(upnow>updtot)
				{
				upnow=1;
				upnex=upd1;
				}
				else
				upnex=window['upd'+upnow];
				nextspons();
				updtop=0;
				uplen=0;
				setTimeout("updatediv()",3000);
			}
		}
		
	}
}
function nextspons()
{
	document.getElementById("sponsimgdiv").innerHTML=window['spon'+sponnex];
	sponnex++;
	if(sponnex>totspon)
		sponnex=1;
}
updatediv();