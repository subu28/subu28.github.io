<%-- 
    Document   : account
    Created on : 10 Jul, 2011, 11:16:19 AM
    Author     : Rohit
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%
      try{
         if(session.getAttribute("ALREADY_LOGGED_IN").equals("false")
            || session.getAttribute("authorized").equals("false")
            || session.getAttribute("access").equals("false"))
        {
            session.setAttribute("ALREADY_LOGGED_IN","false");
            session.setAttribute("authorized","false");
            session.setAttribute("access","false");
            response.sendRedirect("sessionExpired.jsp");
        }
      }
      catch(Exception e)
      {
            session.setAttribute("ALREADY_LOGGED_IN","false");
            session.setAttribute("authorized","false");
            session.setAttribute("access","false");
            response.sendRedirect("sessionExpired.jsp");
      }
    %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account - ADVAYA 2011</title>
        <%
        response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
        response.setHeader("Pragma","no-cache"); //HTTP 1.0
        response.setDateHeader ("Expires", -1); //prevents caching at the proxy server
        %>
    </head>
    <body>
        <div id="wrapper">
            <div id="container"> <br/>
                <div id="slogan">
                    <h2><font color=black>Personal details</font></h2>
                </div><!--END slogan-->

                <div class="index-list-services" style="position:relative; top:10px;">
                    <ul>
                        <!-- Personal details -->
                        <li>
                        <%
                           try
                           {
                              String advayaid=(String)session.getAttribute("ADVAYAID");
                              String email=(String)session.getAttribute("EMAIL");
                              String query="select * from reg where advayaid=\'"+advayaid+"\'";
                              Class.forName("org.postgresql.Driver");
                              Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost/Advaya", "postgres", "postgres");
                              Statement stmt = con.createStatement();
                              ResultSet rs=stmt.executeQuery(query);
                              ResultSetMetaData rsmd = rs.getMetaData();
                              int numberOfEvents = rsmd.getColumnCount();
                              if(rs.next()&&email.equalsIgnoreCase( rs.getString("email") ))
                              {
                                out.println("<table>");
                                  for(int j=2;j<numberOfEvents+1;j++)
                                  {
                                    if(j==6) continue;    //FOR PASSWORD
                                    out.println(" <tr> ");
                                        out.println(" <td> ");
                                        out.println(""+rsmd.getColumnName(j).toUpperCase());
                                        out.println(" </td> ");

                                        out.println(" <td> ");
                                        out.println(": "+rs.getString(j).toUpperCase());
                                        out.println(" </td> ");
                                    out.println(" </tr> ");
                                  }
                                out.println(" </table>");
                              }
                              else
                                 response.sendRedirect("logout.jsp");

                              /** Setting our session attributes */
                              session.setAttribute("ADVAYAID",advayaid);
                              session.setAttribute("authorized","true");
                              session.setAttribute("ALREADY_LOGGED_IN","true");
                              session.setAttribute("access","true");
                              session.setMaxInactiveInterval(1000);

                           }
                           catch(Exception e)
                           {
                                response.sendRedirect("sessionExpired.jsp");
                           }
                         %>
                        </li>
                        <br/>
                        <li><p>Click <a href="eventRegistration.jsp">here</a> to register for events.</p></li>
                    </ul>
                </div><!--END index-list-services-->
            </div>
	</div>
    </body>
</html>
