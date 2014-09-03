function slidchang()
{
	if(picgalopen==0)
		return(0);
	slf++;
	if(sln==1||sln==0)
	sln=92;
	else if(sln==93)
	sln=2;
//transition code here
	if(sld==50)
	{
		if(document.getElementById('sl'+sln).className=="pright")
		{
			document.getElementById('sl'+sln).style.webkitTransitionDuration='0s';
			document.getElementById('sl'+sln).style.MozTransitionDuration='0s';
			document.getElementById('sl'+sln).className="pleft";
		}
		document.getElementById('sl'+sln).style.webkitTransformOrigin="left center";
		document.getElementById('sl'+sln).style.transformOrigin="left center";
		document.getElementById('sl'+slp).style.webkitTransformOrigin="right center";
		document.getElementById('sl'+slp).style.transformOrigin="right center";
		document.getElementById('sl'+slp).className="pright";
	}
	else
	{
		if(document.getElementById('sl'+sln).className=="pleft")
		{
			document.getElementById('sl'+sln).style.webkitTransitionDuration='0s';
			document.getElementById('sl'+sln).style.MozTransitionDuration='0s';
			document.getElementById('sl'+sln).className="pright";
		}
		document.getElementById('sl'+sln).style.webkitTransformOrigin="right center";
		document.getElementById('sl'+sln).style.transformOrigin="right center";
		document.getElementById('sl'+slp).style.webkitTransformOrigin="left center";
		document.getElementById('sl'+slp).style.transformOrigin="left center";
		document.getElementById('sl'+slp).className="pleft";
	}
	slp=sln;
	sln++;
	slg++;
	setTimeout("slidein("+slp+")",300);
	setTimeout("slideaccept()",1000);
	setTimeout("slideaut("+slg+")",5000);
}