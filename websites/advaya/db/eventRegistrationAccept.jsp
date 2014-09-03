<%-- 
    Document   : eventRegistrationAccept
    Created on : 10 Jul, 2011, 9:15:27 AM
    Author     : Rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
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
                <div id="slogan">
                    <h2><font color=black>Events Registration</font></h2>
                </div><!--END slogan-->

                <div class="index-list-services" style="position:relative; top:10px;">
                    <ul>
                        <li>
                            <%try{
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
                                    ResultSet rs=stmt.executeQuery("select * from eventRegistration where advayaid=\'"+advayaid+"\'");
                                    ResultSetMetaData rsmd = rs.getMetaData();
                                    int numberOfEvents = rsmd.getColumnCount();
                                    String query = "UPDATE eventregistration SET ";
                                    int res=-1;
                                    for(int i=3;i<numberOfEvents;i++)
                                    {
                                        if( request.getParameter(""+i)!=null )
                                        {
                                            query=query.concat("\""+ rsmd.getColumnName(i)+"\"" );
                                            query=query.concat("=TRUE, ");
                                        }
                                        else
                                        {
                                            query=query.concat("\""+ rsmd.getColumnName(i)+"\"" );
                                            query=query.concat("=FALSE, ");
                                        }
                                    }
                                    query=query.concat( "\""+rsmd.getColumnName(numberOfEvents)+"\"" );   rs.close();
                                    if(request.getParameter(""+numberOfEvents)!=null)
                                        query=query.concat("=TRUE ");
                                    else
                                        query=query.concat("=FALSE ");
                                    query=query.concat("WHERE advayaid=\'"+advayaid+"\'");
                                    res=stmt.executeUpdate(query);
                                    if(res==1)
                                            out.println("<script>parent.window.location = '../eventslog.html'</script>");
                                    else
                                            out.println("<script>parent.window.location = '../server.html#5'</script>");
                             }
                            catch(Exception e)
                                    {out.println("<script>parent.window.location = '../server.html#5'</script>");
                            }
                            %>
                            <p>Click <a href="eventRegistration.jsp">here</a> to register for more events.</p>
                        </li>
                    </ul>
                </div><!--END index-list-services-->
            </div>
        </div>
    </body>
</html>
