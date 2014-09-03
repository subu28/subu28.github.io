<%-- 
    Document   : logout
    Created on : 10 Jul, 2011, 11:58:10 AM
    Author     : Rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page errorPage="/sessionExpired.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout - ADVAYA 2011</title>
        <%
            response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setDateHeader ("Expires", -1); //prevents caching at the proxy server
        %>
        <%
            session.removeAttribute("authorized");
            session.removeAttribute("ACCESS");
            session.removeAttribute("secret");
            session.removeAttribute("secret_include");
            session.invalidate();
        %>
    </head>
    <body onLoad="parent.closepop(); location.href='login.jsp'">
    </body>
</html>
