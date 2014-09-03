<%-- 
    Document   : sendConfirmationMail
    Created on : 10 Jul, 2011, 12:30:13 PM
    Author     : Rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation Mail</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="container">
                <div class="index-list-services" style="position:relative; top:-5px;">
                        <%
                            String email=request.getParameter("email");
                            String activationCode="";
                            if(email.contains("'\\"))
                            {
                               out.println("<p>Invalid request.</p>");
                               return;
                            }
                            Class.forName("org.postgresql.Driver");
                            Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost/Advaya", "postgres", "postgres");
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from tempReg where email=\'" + email + "\'");
                            if (!rs.next())
                            {
                                out.println("<p>Your email id is not registred.</p>");
                                return;
                            }
                            activationCode=rs.getString("activationCode");
                            String emailMsgTxt =" Welcome to Advaya 2011..\n"+
                                                    " You MUST COMPLETE registration by giving this activation code on this link ..\n"+
                                                    " http://www.iith.ac.in/advaya/db/activation.jsp?email="+email+"&code="+activationCode;
                            String emailSubjectTxt = "Advaya Registration - 2011";
                             String emailFromAddress = "advaya.register@gmail.com";
                             String sendTo[];
                             sendTo= new String[1];
                             sendTo[0]=email;
                                    //Mail Sending
                                    try
                                  {
                                          mailSending.GoogleTest mail=new mailSending.GoogleTest();
                                          mail.sendSSLMessage(sendTo, emailSubjectTxt, emailMsgTxt);
                                  }
                                  catch(Exception e)
                                  {
                                          out.println("<p>Exception occoured in sending mail." + e + "</p>");
                                  }
                             
                            out.println("<p>Please confirm your registration by clicking the link in yor mail email.</p>");

                            %>
                    <p> <a href="forgotPassword.jsp">Forgotten your password?</a></p>
            </div><!--END index-list-services-->
            </div>
        </div>
    </body>
</html>
