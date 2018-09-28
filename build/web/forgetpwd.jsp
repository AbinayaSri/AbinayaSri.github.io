<%-- 
    Document   : forgetpwd
    Created on : 25 Dec, 2017, 11:07:17 AM
    Author     : Senthil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import ="java.sql.*" %>
        <%@ page import ="javax.sql.*" %>
        <%
            String userid = request.getParameter("user");
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/infodb", "Abinaya", "welcome123");

            Statement st = con.createStatement();
            ResultSet rs;
            //rs = st.executeQuery("select firstname,password from userinfo where firstname='" + userid + "'");
        %>
        <br><br><br><br><br><br><br>
    <center>
        <h3> Change password</h3><br>
        <form action="password.jsp" method="post">
            <table>
                <tr><th style="float:left">    Enter Username</th><td style="padding:10px"><input type="text" name="user"></td></tr>
                <tr><th style="float:left"> Enter new password</th><td style="padding:10px">
                        <input type="password" name="newpwd"></td></tr>
            </table>
            <button type="submit" style="font-family: algerian;font-size: 18px">Click</button> 
            </table>
          
        </form>
        

    </center>

    </body>
</html>
