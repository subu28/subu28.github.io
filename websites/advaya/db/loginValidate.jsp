<%-- 
    Document   : loginvalidate
    Created on : 9 Jul, 2011, 9:21:28 AM
    Author     : Rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.security.MessageDigest"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
        <%
            response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setDateHeader ("Expires", -1); //prevents caching at the proxy server
        %>
	<script src="javascript/login.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="wrapper">
	<div id="container">

              <div class="index-list-services">
                      <%
                       String email,password;
                       email=request.getParameter("email");
                       password=request.getParameter("password1");
                       if(email==null ||password==null)
                        {
                            session.setAttribute("ALREADY_LOGGED_IN","false");
                            session.setAttribute("authorized","false");
                            session.setAttribute("access","false");
                            out.println("<p>Invalid Request.</p>");
                        }
                       else if(email.contains("\'"))
                        {
                            session.setAttribute("ALREADY_LOGGED_IN","false");
                            session.setAttribute("authorized","false");
                            session.setAttribute("access","false");
                           out.println("<p>Tried to attack.Attack was blocked....</p>");
                        }
                       else if(password.contains("\'"))
                        {
                                session.setAttribute("ALREADY_LOGGED_IN","false");
                                session.setAttribute("authorized","false");
                                session.setAttribute("access","false");
                           out.println("<p>Tried to attack.Attack was blocked....</p>");
                        }
                       else
                       {
                               String[] e,p;
                               e=email.split("\'");
                               p=password.split("\'");
                               if(e.length>1 || p.length>1)
                               {
                                    session.setAttribute("ALREADY_LOGGED_IN","false");
                                    session.setAttribute("authorized","false");
                                    session.setAttribute("access","false");
                                    out.println("<p>Tried to attack.Attack was blocked...</p>");
                               }
                               else
                               {
 									MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
                                       mdAlgorithm.update(password.getBytes());

                                       byte[] digest = mdAlgorithm.digest();
                                       StringBuffer hexString = new StringBuffer();

                                       for (int x = 0; x < digest.length; x++) {
                                            password = Integer.toHexString(0xFF & digest[x]);

                                            if (password.length() < 2) {
                                                password = "0" + password;
                                            }

                                            hexString.append(password);
                                       }

                                       password = hexString.toString();
                                       String query="select advayaid from reg where ( email='"+email+"'and password='"+password+"') ";
                                       Class.forName("org.postgresql.Driver");
                                       Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost/Advaya", "postgres", "postgres");
                                       Statement stmt = con.createStatement();
                                       ResultSet rs= stmt.executeQuery(query);
                                       if(rs.next())
                                       {
                                            String advayaid=rs.getString("advayaid");
                                            session.setAttribute("ADVAYAID",advayaid);
                                            session.setAttribute("ALREADY_LOGGED_IN","true");
                                            session.setAttribute("authorized","true");
                                            session.setAttribute("access","true");
                                            session.setAttribute("EMAIL",email);
                                            response.sendRedirect("logged.jsp");
                                        }
                                        else
                                        {
                                            session.setAttribute("ALREADY_LOGGED_IN","false");
                                            session.setAttribute("authorized","false");
                                            session.setAttribute("access","false");
                                            %>
                                                 Did you forget your login details?<br/>
                                                 <input onClick="location.href='login.jsp'" type="button" value="try again?"/><input onClick="location.href='forgotPassword.jsp'" type="button" value="Forgot password"/><br/><input onClick="location.href='requestForConfirmationMail.jsp'" type="button" value="havent got your conformation mail?"/>
                                            <%
                                        }
                                    }
                                }
                              %>

                </div><!--END index-list-services-->
			</div>

		</div>
    </body>
</html>