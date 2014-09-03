<%-- 
    Document   : forgotPassword
    Created on : 11 Jul, 2011, 10:56:02 AM
    Author     : Rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password - ADVAYA 2011</title>
		<script type="text/javascript" >
			function check()
			{
				var email=document.mail.email.value;
				if(email=="")
				{
					alert("email must not be empty");
					return false;
				}
				return true;
			}
		</script>
    </head>
    <body>
        <div id="wrapper">
            <div id="container">
                <div class="index-list-services">
                To get a new password enter your Email address.
                <form name="mail" action="sendPassword.jsp" onsubmit="return check()" method="POST">
                    <input type="text" name="email" size="30"><br/>
                    <input type="submit" value="Submit" ><input onClick="location.href='login.jsp'" type="button" value="Login with existing password"/>
                </form>
                </div><!--END index-list-services-->
            </div>
        </div>
    </body>
</html>
