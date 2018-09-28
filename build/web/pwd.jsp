<%-- 
    Document   : pwd
    Created on : 25 Dec, 2017, 11:09:25 AM
    Author     : Senthil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-image: url("webimag/pink.jpg");
            }
        </style>
    </head>
    <body>
        <%@ page import ="java.sql.*" %>
        <%@ page import ="javax.sql.*" %>
        <% String userid = request.getParameter("user");
            String newpassword = request.getParameter("newpwd");
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/infodb", "Abinaya", "welcome123");

            Statement st1 = con.createStatement();
            ResultSet rs1;
            int i = st1.executeUpdate("update residentinfo set password='" + newpassword + "' where firstname='" + userid + "'");

        %>
        Successfully changed your password<br><br><br>
         <a href="index.html">Click here to go for main page</a>
    </body>
</html>
