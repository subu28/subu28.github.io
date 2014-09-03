var t=0;
var p=0;
var fr=0;
var logpos=0;
var regpos=0;
var s=0;
var slm=0;
var slp=1;
var sln=2;
var slf=0;
var slg=0;
var sld=-50;
var slr=0;
var upstrt=0;
var uplen=0;
var updtop=0;
var upnex=upd3;
var upnow=3;
var log=0;
var eventch=1;
var dl=0;
function anim()
{
	t-=100;
	if(t==-1000)
	t=0;
	document.getElementById('imag').style.left=t+"px";
	setTimeout("anim()",100);
}
function shut(s)
{
	if(s==1)
	document.getElementById('popback').style.display="block";
	else
	document.getElementById('popback').style.display="none";
}
function bring(p)
{
	if(p>0)
	{
		fr++;
		if(p==1)
		{
			if(fr==1)
			shut(1);
			logpos-=20;
		}
		else if(p==2)
		{
			if(fr==1)
			shut(1);
			regpos-=20;
		}
		else
		{
			if(regpos<0)
			regpos+=20;
			if(logpos<0)
			logpos+=20;
			if((regpos+logpos)==0)
			{
				shut(0);
				fr=16;
			}
		}
		document.getElementById('loginpop').style.left=logpos+"px";
		document.getElementById('regpop').style.left=regpos+"px";
		if(fr==16)
		{
			fr=0;
			p=0;
		}
	}
	setTimeout("bring("+p+")",30);
}
function closepop()
{
	if(fr==0)
	{
		bring(3);
	}
}
function slidchang()
{
	if(slf==0)
	{
	if(sln==0)
	sln=6;
	else if(sln==7)
	sln=1;
	}
	slf++;
	document.getElementById("sl"+sln).style.opacity=slf*0.1;
	document.getElementById("sl"+slp).style.opacity=1-(slf*0.1);
	document.getElementById("sl"+slp).style.left=sld*slf+"px";
	if(slf==10)
	{
	document.getElementById("sl"+slp).style.left=0+"px";
	slf=0;
	slp=sln;
	sln++;
	slg++;
	setTimeout("slideaut("+slg+")",7500);
	}
	else
	setTimeout("slidchang()",50);
}
function slideaut(slr)
{
	if(slf==0)
	{
	if(slg==slr)
		{sld=-50;
		slidchang();}
	}
}
function slideman(slm)
{
	if(slf==0)
	{
	if(slm==1)
	sln-=2;
	slidchang();
	}
}
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
				updtop=0;
				uplen=0;
				setTimeout("updatediv()",3000);
			}
		}
		
	}
}
function loginstat(log)
{
    if(log==1)
        document.getElementById("logindiv").innerHTML='<br/><a href="eventslog.html">Event Log</a><p> or </p><a onclick="bring(1);">Logout</a>';
    else
        document.getElementById("logindiv").innerHTML='<br/><a onclick="bring(1);">Login</a><p> or </p><a onclick="bring(2);">Sign up now!!</a>';
}
function eventlinker()
{
        eventch++;
        if (eventch>eventtot)
            eventch=1;
        document.getElementById('changimg').src="images/event/img"+eventch+".jpg";
        document.getElementById('changtxt').innerHTML=window['event'+eventch];
		document.getElementById('totlink').href=document.getElementById('texlink').href;
        setTimeout("eventlinker()",5000);
}
function dynload(dl)
{
	document.getElementById('dyndiv').innerHTML="<br/>";
	var xmlhttp;
		if (window.XMLHttpRequest)
		{// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else
		{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function()
		{
            if (xmlhttp.readyState==1)
			{
				document.getElementById('dynfx').style.display="block";
				document.getElementById('dyntext').innerHTML="connecting to server";
			}
            if (xmlhttp.readyState==3)
			{
				document.getElementById('dyntext').innerHTML="recieving data";
			}
                        if (xmlhttp.readyState==4 && xmlhttp.status==404)
				document.getElementById('dyntext').innerHTML="<b>:(</b> an error occured";
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
                document.getElementById('dynfx').style.display="none";
				document.getElementById('dyndiv').innerHTML=xmlhttp.responseText;
			}
		}
                if(dl==1)
					xmlhttp.open("GET",l1,true);
                if(dl==2)
                    xmlhttp.open("GET",l2,true);
				if(dl==3)
					xmlhttp.open("GET",l3,true);
                if(dl==4)
                    xmlhttp.open("GET",l4,true);
				if(dl==-1)
                    xmlhttp.open("GET",l,true);
		xmlhttp.send();
}
function urlcheck()
{
	if(window.location.hash==h1)
	dynload(1);
	else if(window.location.hash==h2)
	dynload(2);
	else if(window.location.hash==h3)
	dynload(3);
	else if(window.location.hash==h4)
	dynload(4);
	else
	dynload(-1);
}