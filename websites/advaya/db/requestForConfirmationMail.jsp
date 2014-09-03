<%-- 
    Document   : requestForConfirmationMail
    Created on : 10 Jul, 2011, 12:10:05 PM
    Author     : Rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Confirmation Mail - ADVAYA 2011</title>
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

                <div class="index-list-services" style="position:relative; top:-5px;">
                   Enter your mail address <br/>
                       
                            <form name="mail" action="sendConfirmationMail.jsp" onsubmit="return check()" method="POST">
                                    <input type="text" name="email" size="30"><br/>
                                    <input type="submit" value="Send me confirmation mail" ><br/>
                                    <input onClick="location.href='login.jsp'" type="button" value="Got mail already?"/><input onClick="location.href='forgotPassword.jsp'" type="button" value="Forgot password"/>
                            </form>

                </div><!--END index-list-services-->
            </div>
        </div>
    </body>
</html>
