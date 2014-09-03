<%--
    Document   : activation
    Created on : 9 Jul, 2011, 5:16:49 PM
    Author     : Rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACTIVATION</title>
    </head>
    <body>
        <div id="wrapper">
	<div id="container"> <br/>
            <div id="slogan">
                <h2><font color=black>Activation</font></h2>
            </div><!--END slogan-->

            <div class="index-list-services" style="position:relative; top:10px;">
                <ul>
                    <li>
                        <%
                            try
                            {
                               String email,code;
                               email=request.getParameter("email");
                               code=request.getParameter("code");
                                if(email==null ||code==null)
                                {
                                    response.sendRedirect("../server.html#2");
                                    return;
                                }
                               String[] e,p;
                               e=email.split("\'");
                               p=code.split("\'");
                               if(e.length>1 || p.length>1)
                               {
                                    session.setAttribute("authorized", "no");
                                    session.setAttribute("access","null");
                                    session.setAttribute("ALREADY_LOGGED_IN","false");
                                    response.sendRedirect("../server.html#3");
                               }
                               else
                               {
                                    /**checking status of activation*/
                                    String query="select * from tempReg where ( email='"+email+"' and activationStatus='true' )";
                                    Class.forName("org.postgresql.Driver");
                                    Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost/Advaya", "postgres", "postgres");
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = stmt.executeQuery(query);
                                    if(rs.next()){
                                        response.sendRedirect("../server.html#4");
                                        return;
                                    }
                                    query="select * from tempReg where ( email='" + email + "'and activationCode='" + code + "')";
                                    rs = stmt.executeQuery(query);
                                    if(!rs.next())
                                    {
                                        response.sendRedirect("../server.html#2");
                                    }
                                    else
                                    {
                                        query="update tempReg set activationStatus='true' where ( email='" + email + "'and activationCode='" + code + "')";
                                        stmt.executeUpdate(query);
                                        query="SELECT nextval(\'advaya_id_seq\')";
                                        ResultSet rs_seq = stmt.executeQuery(query);
                                        int count=0;
                                        if(rs_seq.next()){
                                            count = rs_seq.getInt(1);
                                        }
                                        query="select * from tempReg where ( email='"+email+"'and activationCode='"+code+"')";
                                        rs=stmt.executeQuery(query);
                                        if(rs.next())
                                        {
                                            String advayaid="ADVAYA11";
                                            String temp=""+count;
                                            for(int i=0;i<3-temp.length();i++)
                                            {
                                                advayaid=advayaid.concat("0");
                                            }
                                            advayaid=advayaid.concat(""+count);
                                            String append="'"+advayaid+"',";
                                            for(int j=2;j<rs.getMetaData().getColumnCount()-2;j++)
                                                            append=append.concat("'"+rs.getString(j)+"',");

                                            append=append.concat("'"+rs.getString( rs.getMetaData().getColumnCount()-2 )+"'");
                                            query="INSERT INTO reg (advayaid,firstname,lastname,email,password,mobile,year"
                                                                    + ")"
                                                                    + "values("+append+")";
                                            int res=-1;
                                            try
                                            {
                                                stmt = con.createStatement();
                                                res=stmt.executeUpdate(query);
                                            }
                                            catch(Exception e1)
                                            {
                                               response.sendRedirect("../server.html#5");
                                            }
                                            if(res==0)
                                            {
                                               response.sendRedirect("../server.html#7");
                                            }
                                            else if(res==1)
                                            {
                                             response.sendRedirect("../server.html#1");   
                                            }
                                        }
                                        else
                                        {
                                            response.sendRedirect("../server.html#2");
                                        }
                                    }
                                }
                            }
                            catch(Exception e)
                            {
                                    response.sendRedirect("../server.html#6");
                            }
                        %>
                    </li>
                </ul>
            </div><!--END index-list-services-->
        </div>
        </div>
    </body>
</html>
