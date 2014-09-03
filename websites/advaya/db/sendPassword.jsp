<%-- 
    Document   : sendPassword
    Created on : 10 Jul, 2011, 1:56:07 PM
    Author     : Rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<%@ page import="java.security.MessageDigest"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password - ADVAYA 2011</title>
		<script src="javascripts/login.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="container">

                <div class="index-list-services" style="position:relative; top:-5px;">
                        <%
                            String email=request.getParameter("email");
                            String password="";
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
                                out.println("<p>Your email id is not registered.</p>");
                                return;
                            }
                             Random rand=new Random();

                                for(int i=0;i<8;i++)
                                    password=password.concat(""+(char)(65+(rand.nextInt(26))));
                            String emailMsgTxt =" Your email id is :"+email+" \n Password : "+password;
                            String emailSubjectTxt = "ADVAYA Registration - 2011 Password ";
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
                            out.println("<p>Password sent to your mail sucessfully.</p>");

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
                            String query="update Reg set password='"+ password+ "'where ( email='" + email + "')";
                            int result = stmt.executeUpdate(query);
                        %>
                        <p>Click <a href="login.jsp">here</a> to login.</p>
                </div><!--END index-list-services-->
            </div>
        </div>
    </body>
</html>
