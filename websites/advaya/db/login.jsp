<%-- 
    Document   : login
    Created on : 9 Jul, 2011, 9:04:36 AM
    Author     : Rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="javascript/login.js" type="text/javascript"></script>
        <title>LOGIN</title>
        <style>
body{
    width: 200px;
    margin: 0px;
    padding: 0px;
}
        </style>
<%  int log=0;
      try{ 
         if(session.getAttribute("ALREADY_LOGGED_IN").equals("true")
            && session.getAttribute("authorized").equals("true")
            && session.getAttribute("access").equals("true"))
        {
           log=1;
        }
      }
      catch(Exception e){
      log=0;}
    %>
        <script type="text/javascript">
            var log=<%=log%>;
            function logins()
            {
                if(log==1)
                location.href="logged.jsp";
                parent.loginstat(log);
            }
        </script>
    </head>

    <body onLoad="logins();">
        <div id="wrapper">
            <div id="container">
            <div class="index-list-services">
                 <form name="loginForm" action="loginValidate.jsp" method="POST" onSubmit="return loginValidate();">
                 <table>
                   <tr>
                    <td>Email id: </td>
                    <td><input type="text" name="email" value="" size="30" maxlength="90"/></td>
                   </tr>
                   <tr>
                    <td>Password: </td>
                    <td><input type="password" name="password1" value="" size="30" maxlength="90"/></td>
                   </tr>
                   <tr>
                    <td colspan="2"><input type="submit" value="Submit" /><input onClick="location.href='forgotPassword.jsp'" type="button" value="Forgot password"/></td>
                   </tr>
                 </table>
                 </form>
             </div><!--END index-list-services-->
            </div><!--END container-->
	</div><!--END wrapper-->
    </body>
</html>