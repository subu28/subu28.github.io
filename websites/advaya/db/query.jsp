<%-- 
    Document   : query
    Created on : 11 Sep, 2011, 11:05:54 AM
    Author     : Rohit
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

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
   <%
        String emailID = null;
        try{
            emailID = (String)session.getAttribute("EMAIL");
        }
        catch(Exception e){
            out.println("Not Logged In.");
            return;
        }
        String rohit1 = "cs10b043@iith.ac.in";
        String rohit2 = "rockstarjindal@gmail.com";
        String subhash1 = "me10b035@iith.ac.in";
        String subhash2 = "s_subash_028@yahoo.com";
	if (emailID != null){
            if (!(emailID.equals(rohit1) || emailID.equals(rohit2)
                    || emailID.equals(subhash1) || emailID.equals(subhash2) ))
            {
                response.sendRedirect("index.jsp");
                return;
            }
        }
    %>


<html>
<head>
    <title>Query</title>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", -1); //prevents caching at the proxy server
    %>

    <script type="text/javascript">
        function check(form)
        {
            allowSubmit = false;
            // check conditions
            // if all conditions are valid set allowSubmit to true
            allowSubmit = true;
            if (allowSubmit) form.submit();
        }
    </script>
</head>

<body>
<center>
    <form method="post" name="query" action="./query.jsp">
        <table border="0">
            <tr>
                <td>Query:</td>
                <td><input type="text" name="query"></td>
            </tr>
        </table>
        <input type="button" name="Submit" value="Submit" onclick="check(this.form)">
    </form>

    <%
    String query="";
    try
    {
        query = request.getParameter("query");
        if (query == null)
        {
            out.println("</center></body></html>");
            return;
        }
        if (query.isEmpty())
        {
            out.println("Empty Query");
            out.println("</center></body></html>");
            return;
        }

        Class.forName("org.postgresql.Driver");
        Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost/Advaya", "postgres", "postgres");
        Statement stmt = con.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        ResultSetMetaData rsmd = rs.getMetaData();
        int numberOfEvents = rsmd.getColumnCount();
        out.println("<center>");
        out.println("<br/><br/> Your Query: \'" + query + "\'");
        out.println("Result count = " + (numberOfEvents));

        out.println("<br/><br/><table border=\"3px\">");
        if(rs.next()){
            out.println(" <tr> ");
            for(int j=2;j<numberOfEvents+1;j++){
                out.println(" <td> ");
                out.println(""+rsmd.getColumnName(j).toUpperCase());
                out.println(" </td> ");
            }
            out.println(" </tr> ");
            out.println(" <tr> ");
            for(int j=2;j<numberOfEvents+1;j++){
                out.println(" <td> ");
                out.println(": "+rs.getString(j).toUpperCase());
                out.println(" </td> ");
            }
            out.println(" </tr> ");
        }
        while(rs.next()){
            out.println(" <tr> ");
            for(int j=2;j<numberOfEvents+1;j++){
                out.println(" <td> ");
                out.println(": "+rs.getString(j).toUpperCase());
                out.println(" </td> ");
            }
            out.println(" </tr> ");
        }
        out.println("</table><br/>");
        out.println("</center>");
    }
    catch(Exception e){
        out.println("Invalid Query or cannot connect to database.");
    }
    %>
</center>
</body>
</html>