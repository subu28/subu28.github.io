<%  int log=0;
      try{
         if(session.getAttribute("ALREADY_LOGGED_IN").equals("true")
            && session.getAttribute("authorized").equals("true")
            && session.getAttribute("access").equals("true"))
        {
           log=1;
        }
      }
      catch(Exception e){
      log=0;}
    %>
        <script type="text/javascript">
            var log=<%=log%>;
            function logins()
            {
                    parent.loginstat(log);
            }
        </script>
<html>
<body onLoad="logins(); parent.closepop();">
    <form name="loginForm" action="logout.jsp" method="POST">
                 <table>
                   <tr>
                    <td>Confirm that you want to log out.</td>
                   </tr>
                   <tr>
                    <td colspan="2"><input type="submit" value="Confirm" /></td>
                   </tr>
                 </table>
                 </form>

</body>
</html>