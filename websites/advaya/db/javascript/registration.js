function validate()
{
  var valid=false;
  var fn=document.loginForm.firstName.value;
  var ln=document.loginForm.lastName.value;
  var m1=document.loginForm.mobile1.value;
  var email=document.loginForm.email.value;
  var password1=document.loginForm.password1.value;
  var cpassword=document.loginForm.cpassword.value;
 if(password1!="")
 if(cpassword!="")
 if(email!="")
	  if(fn!="")
	  	if(ln!="")
	  		if(age!="")
	  			if(m1!="")
	  				valid=true;
	  			else
	 				{	alert("Mobile Number Field is Required.");}
	  		else
	  			{	alert("Age Field is Required."); }
	  	else
	  		{	alert("Last Name Field is Required.");}
	  else
	 	{	alert("First Name Field is Required."); }
  else
 	{	alert("Email Address is Required."); }
else
{	alert("Confirm Password Field is Required.");}	  					
else
{	alert(" Password Field is Required.");}	  						  					
  if(valid==false) return false;
  
  valid=validateEmail(email);
  if(valid==false) return false;
  
  if(password1!=cpassword) { alert("Passwords not matched.."); return false; }
  
  valid=symbolsForPassword(password1);
  if(valid==false) {  alert("These Symbols are not allowed in the password ... \" \' \\ "); return false; }
  if(password1.length < 5) {  alert("Password must be atleast 5 characters."); return false; }

  valid=isInteger(age);
  if(valid==false || age.length > 2) { alert("Enter valid age.");  return false; }

  valid=isInteger(m1);
  if(valid==false || m1.length < 10 || m1.length > 15 ) { alert("Enter valid Mobile Number.");  return false; }

  valid=checkAlphabetAndSpace(fn);
  if(valid==false) { alert("Only alphabets and spaces are allowed in Firstname");  return false;  }
  
  valid=checkAlphabetAndSpace(ln);
  if(valid==false) { alert("Only alphabets and spaces are allowed  Last name");  return false;  }

  return valid;
}
 
  function validateEmail(emailid) 
  {
   var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
   if(reg.test(emailid) == false)
   {
      alert('Invalid Email Address');
      return false;
   }
   return true;
}
function isInteger(s)
{   var i;
    for (i = 0; i < s.length; i++)
    {   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}
function symbolsChecking(s)
{
	var chars = "!#$%^&*()+=-[]\\\';,./{}|\":<>?";
	for (var i = 0; i < s.length; i++) 
	{
		if (chars.indexOf(s.charAt(i)) != -1) 
		{
			//alert ("Text1 is having special characters.Please remove them.");	
			return false;
		}
	}
	return true;
}
function symbolsForPassword(s)
{
	var chars = "\'\"\\";
	for (var i = 0; i < s.length; i++) 
	{
		if (chars.indexOf(s.charAt(i)) != -1) 
		{
			//alert ("Text1 is having special characters.Please remove them.");	
			return false;
		}
	}
	return true;
}
function checkAlphabetAndSpace(e)
  {  
   var key;
	var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
	for (var i = 0; i < e.length; i++) 
	{
		if (chars.indexOf(e.charAt(i)) == -1) 
		{
			return false;
		}
	}
	return true;
   }  
