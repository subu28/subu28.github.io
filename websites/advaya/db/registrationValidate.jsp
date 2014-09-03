<%--
    Document   : registrationValidate
    Created on : 9 Jul, 2011, 1:56:53 PM
    Author     : Rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<%@page import="java.security.MessageDigest"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTRATION</title>
        <%  response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setDateHeader ("Expires", -1); //prevents caching at the proxy server
        %>
    </head>
    <body>
        <div id="wrapper">
            <div id="container"> <br/>
                

                <div class="index-list-services">
                    <p style="width:260px;">
                            <%
                                /* These will extract data from html */
                                String firstName,lastName,age,mobile1,email,departmentName,year,address,city,state,postalCode,password;
                                String fields[];
                                fields=new String[16];
                                int i=0;
                                fields[i++]=firstName=request.getParameter("firstName");
                                fields[i++]=lastName=request.getParameter("lastName");
                                fields[i++]=mobile1=request.getParameter("mobile1");
                                fields[i++]=email=request.getParameter("email");
                                fields[i++]=year=request.getParameter("year");
                                fields[i++]=password=request.getParameter("password1");

                                if(firstName==null || lastName==null ||mobile1==null || email==null || year==null || password==null)
                                {
                                  out.println("<script>parent.window.location = '../server.html#2'</script>");
                                  return;
                                }
                                /*Checking Registration is correct is valid or not*/
                                i--;
                                //checking for attack
                                try
                                {
                                    for(;i>=0;i--)
                                    {
                                       if(fields[i].contains("\'")) throw new Exception();
                                    }
                                    if(password.length()<5) throw new Exception();
                                    if(Integer.parseInt(year)<1 || Integer.parseInt(year)>9999)    throw new Exception();
                                }
                                catch(Exception e)
                                {
                                       out.println("<script>parent.window.location = '../server.html#3'</script>");
                                       return;
                                }
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
                                /* Generating Random number of size 25*/
                                String activationCode="";
                                Random rand=new Random();

                                for(i=0;i<25;i++)
                                    activationCode=activationCode.concat(""+(char)(65+(rand.nextInt(26))));

                                boolean activationStatus=false;
                                String append="'"+firstName+"','"+lastName+"','"+email+"','"
                                              +password+"','"+mobile1+"','"+
                                              year+"','"+activationCode+"','"+activationStatus+"'";
                                // Checking for email is already registred.
                                String query="select * from tempReg where email='"+email+"'";
                                Statement stmt = null;
                                ResultSet rs= null;
                                Class.forName("org.postgresql.Driver");
                                Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost/Advaya", "postgres", "postgres");
                                stmt = con.createStatement();
                                try
                                {
                                    stmt = con.createStatement();
                                    rs = stmt.executeQuery(query);
                                }
                                catch(Exception e)
                                {
                                   out.println("<script>parent.window.location = '../server.html#5'</script>");
                                   return;
                                }
                                // If email is already registered..
                               if(rs.next())
                                {
                                    out.println("<script>parent.window.location = '../server.html#4'</script>");
                                }
                                else
                                {
                                    // Inserting into temp database
                                    query="INSERT INTO tempReg (firstname,lastname,email,password,mobile,year,"
                                                                + "activationCode,activationStatus)values("+append+")";
                                    int res=-1;
                                    try
                                    {
                                        stmt = con.createStatement();
                                        res=stmt.executeUpdate(query);
                                    }
                                    catch(Exception e)
                                    {
                                       out.println("<script>parent.window.location = '../server.html#5'</script>");
                                    }
                                    if(res==0)
                                    {
                                       out.println("<script>parent.window.location = '../server.html#5'</script>");
                                    }
                                    else if(res==1)
                                    {
                                     String emailMsgTxt =" Welcome to Advaya 2011..\n"+
                                     " You MUST COMPLETE registration by giving this activation code on this link ..\n"+
                                     " http://www.iith.ac.in/advaya/db/activation.jsp?email="+email+"&code="+activationCode;
                                     String emailSubjectTxt = "Advaya Registration - 2011";
                                     String emailFromAddress = "advaya.register@gmail.com";
                                     String sendTo[];
                                     sendTo= new String[1];
                                     sendTo[0]=email;
                                //     Mail Sending
                                      try
                                      {
                                          mailSending.GoogleTest mail=new mailSending.GoogleTest();
                                          mail.sendSSLMessage(sendTo, emailSubjectTxt, emailMsgTxt);
                                      }
                                      catch(Exception e)
                                      {
                                          out.println("Exception occured"+e);
                                          System.out.println("Exception occured");
                                      }
                                        out.println("Confirmation Link sent successfully to your email.");
                                    }
                                    else if(res==-3)
                                    {
                                        out.println("<script>parent.window.location = '../server.html#5'</script>");
                                    }
                                    else
                                    {
                                       out.println("<script>parent.window.location = '../server.html#2'</script>");;
                                    }
                               }
                            %>
                    </p>
					<form>
                    <input onClick="location.href='registration.jsp'" type="button" value="New Registration"/>
					</form>
				</div><!--END index-list-services-->
            </div>
        </div>
    </body>
</html>
