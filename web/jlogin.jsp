<%-- 
    Document   : jlogin
    Created on : 25 Dec, 2017, 11:04:55 AM
    Author     : Senthil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Maintenance Service</title>
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            h1,i{
                font-family: algerian;
                background-color:  gainsboro;
            }
             body{
                color: whitesmoke;
                background-image: url("webimag/violet.jpg");
            }
           
            .popup {
    position: relative;
    display: inline-block;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
.popup .popuptext {
    visibility: hidden;
    width: 260px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 8px 0;
    position: absolute;
    z-index: 1;
    bottom: 125%;
    left: 50%;
    margin-left: -80px;
}
.popup .popuptext::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
    visibility: visible;
    -webkit-animation: fadeIn 1s;
    animation: fadeIn 1s;
}

/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
    from {opacity: 0;} 
    to {opacity: 1;}
}

@keyframes fadeIn {
    from {opacity: 0;}
    to {opacity:1 ;}
}
#complaint {
                top: 230px;
                background-color: #DBE9F4;
        </style>
    </head>
    <body>
       <%@ page import ="java.sql.*" %>
        <%@ page import ="javax.sql.*" %>
        <%
            String userid = request.getParameter("user");
            session.putValue("userid", userid);
            String pwd = request.getParameter("pwd");
           
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/infodb", "Abinaya", "welcome123");

            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select fname,password from residentinfo where fname='" + userid + "'");
            boolean empty = true;
                        if (rs.next()) {
                empty = false;
                String s1 = rs.getString(1);
                String s2 = rs.getString(2);
                if (s1.equals(userid) && s2.equals(pwd)) {

        %>
        <center>
            <h1 style="color:black">Minerva Owner's Welfare Association (MOWA) Maintenance Management </h1> </center>
        <nav>
            <% out.write(s1); %><i class="fa fa-user" style="font-size:36px;color: black"></i><br><br>
            
            <table style="background-color:white">
                <tr>
                    
                    <td>
                         <a href="complaint.html">Click here to go for COMPLAINT FORM</a>
                    </td>
                </tr>
            </table>
        </nav>
        <center>    
<div class="popup" onclick="myFunction()">Click to know about admin!
    <span class="popuptext" id="myPopup">
        ADMIN NAME: ABINAYA and KOWSALYA <BR>
        CONTACT NUMBER:9444999732,9597811604
    </span>
</div>
        

<script>
// When the user clicks on div, open the popup
function myFunction() {
    var popup = document.getElementById("myPopup");
    popup.classList.toggle("show");
}
</script>

            <p> 500 FLATS </p>
            <img src="webimag/Minerva.jpg" alt="vgn" width="420" height="310" ><br>
        
        
            MAINTENANCE WORKS<BR>
           
                
            Carpentry<br>
                
                Plumbing<br>
                Electrical<br>
                Whitewashing<br>
                Miscellaneous<br>
   </center> 

        <%
            }
       else {
        out.write("Invalid username/password");
        }
        }
        if (empty == true) {
        out.write("Invalid username/password");
        }
        %>
        <!--
        <center>
        <h1>COMPLAINT FORM</h1>
        <form action="jcomplaint.jsp" method="post">
            BLOCK NUMBER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="blk"><br><br><br><br>
            ENTER YOUR QUERY WITH BLOCK NUMBER&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="nocomp"><br><br><br><br>
            
            <input type="submit" value="click">
        </form>
    </center>
        -->
        
    </body>
</html>
