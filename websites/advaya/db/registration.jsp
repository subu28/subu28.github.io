<%-- 
    Document   : registration
    Created on : 9 Jul, 2011, 1:11:20 PM
    Author     : Rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTER</title>
        <script src="javascript/registration.js" type="text/javascript"></script>
    </head>
    <body style="overflow:hidden;">
        <div id="wrapper">
            <div id="container">

                <div class="index-list-services">
                            <form name="loginForm" action="registrationValidate.jsp" method="POST" onSubmit="return validate();">
                                <table>
                                    <tr>
                                        <td>*First name: </td>
                                        <td><input name="firstName" size="30" type="text" maxlength="90" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>*Last name: </td>
                                        <td><input name="lastName" size="30" type="text" maxlength="90" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>*Email id: </td>
                                        <td><input name="email" size="30" type="text" maxlength="90" value=""/></td>
                                    </tr>
                                    <tr>
                                        <td>*Password: </td>
                                        <td><input name="password1" size="30" type="password" maxlength="20" value=""/></td>
                                    </tr>
                                    <tr>
                                        <td>*Confirm Password: </td>
                                        <td><input name="cpassword" size="30" type="password" maxlength="20" value=""/></td>
                                    </tr>
                                    <tr>
                                        <td>*Contact number: </td>
                                        <td><input name="mobile1" size="13" type="text" maxlength="13" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Year: </td>
                                        <td>
                                            <select id="year" name="year">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><center><input class="submit" type="submit" value="Submit" /></center></td>
                                    </tr>
                                </table>
                            </form>
                </div><!--END index-list-services-->
            </div>
        </div>
    </body>
</html>
