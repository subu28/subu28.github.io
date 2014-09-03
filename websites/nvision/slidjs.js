function slidchang()
{
	if(picgalopen==0)
		return(0);
	if(slf==0)
	{
	if(sln==1||sln==0)
	sln=92;
	else if(sln==93)
	sln=2;
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
	setTimeout("slideaut("+slg+")",5000);
	}
	else
	setTimeout("slidchang()",50);
}