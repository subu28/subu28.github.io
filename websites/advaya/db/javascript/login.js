
/* Script for Login */
function loginValidate()
{
   var valid=false;
  var email=document.loginForm.email.value;
  var password1=document.loginForm.password1.value;
  if(password1!="")
     if(email!="")
         valid=true;
     else
 	{	alert("Email Address is Required."); }
  else
  {	alert("Password Field is Required.");}	  
  if(valid==false) return false;
  
    valid=validateEmail(email);
    if(valid==false) return false;
    
      valid=symbolsForPassword(password1);
    if(valid==false) {  alert("These Symbols are not allowed in the password ... \" \' \\ "); return false; }
    if(password1.length < 5) {  alert("Password must be atleast 5 characters."); return false; }

    valid=symbolsForPassword(email);
    if(valid==false) {  alert("These Symbols are not allowed in the email ... \" \' \\ "); return false; }

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
function symbolsForPassword(s)
{
	var chars = "\'\"\\";
	for (var i = 0; i < s.length; i++) 
	{
		if (chars.indexOf(s.charAt(i)) != -1) 
		{
			return false;
		}
	}
	return true;
}

