<%-- 
    Document   : eventRegistration
    Created on : 9 Jul, 2011, 9:59:53 PM
    Author     : Rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
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
        <title>EVENT REGISTRATION</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="container"> <br/>
                <div class="index-list-services" style="position:relative; top:10px;">
                    <ul>
                        <li>
                            <%
                            String advayaid=(String)session.getAttribute("ADVAYAID");
                            try{
                                if(advayaid.indexOf("ADVAYA11")<0)
                                {
                                    out.println("<script>parent.window.location = '../server.html#2'</script>");
                                    return;
                                }
                            }
                            catch(Exception e){
                                out.println("<script>parent.window.location = '../server.html#2'</script>");
                                return;
                            }
                            Class.forName("org.postgresql.Driver");
                            Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost/Advaya", "postgres", "postgres");
                            Statement stmt = con.createStatement();
                            ResultSet rs=null;
                            try{
                                rs=stmt.executeQuery("select * from eventregistration where advayaid=\'"+advayaid+"\'");
                                if(!rs.next())
                                {
                                    stmt.executeUpdate("INSERT INTO eventregistration (advayaid) VALUES('"+advayaid+"');");     
                                }
                            }
                            catch(Exception e1){
                               out.println("<script>parent.window.location = '../server.html#5'</script>");
                            }
                            rs=stmt.executeQuery("select * from eventregistration where advayaid=\'"+advayaid+"\'");
                            ResultSetMetaData rsmd = rs.getMetaData();
                            int numberOfEvents = rsmd.getColumnCount();
                            rs.next();
                            %>

                            <form name="eventsRegistration" action="eventRegistrationAccept.jsp" method="POST">
                                <table>
                                    <tr>
                                        <th>EVENTS REGISTERED</th>
                                    </tr>
                                    <%try{
                                    int count=0;
                                    for(int i=3;i<numberOfEvents+1;i++)
                                    {
                                        if( rs.getBoolean(i) )
                                        {
                                            count++;
                                            out.println("<tr>");
                                            out.println("<td>");
                                            out.println("<input name=\"" +i+"\" type=\"checkbox\" value=\""+rsmd.getColumnName(i)+"\" CHECKED >");
                                            out.println(rsmd.getColumnName(i));
                                            out.println("</td>");
                                            out.println("</tr>");
                                        }
                                     }
                                    if(count==0)
                                        out.println("<tr><td>None</td></tr>");
                                    count=0;
                                    out.println("<tr>"+
                                                "<th>REGISTER FOR NEW</th>"+
                                                "</tr>");
                                    for(int i=3;i<numberOfEvents+1;i++)
                                    {
                                        if( !rs.getBoolean(i) )
                                        {
                                            count++;
                                            out.println("<tr>");
                                            out.println("<td>");
                                            out.println("<input name=\"" +i+"\" type=\"checkbox\" value=\""+rsmd.getColumnName(i)+"\">");
                                            out.println(rsmd.getColumnName(i));
                                            out.println("</td>");
                                            out.println("</tr>");
                                        }
                                     }
                                    if(count==0)
                                        out.println("<tr><td>You have already Registered for all events.</td></tr>");
                                    }
                                    catch(Exception e){
                                    out.println(e.getMessage());}%>


                                    <tr><td><input type="submit" value="REGISTER" /></td></tr>
                                </table>
                            </form>
                        </li>
                    </ul>
                </div><!--END index-list-services-->
             </div>
        </div>
    </body>
</html>
