<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import=" java.net.URLEncoder"%>
 <%@ page import ="java.sql.*" %>
        <%@ page import ="javax.sql.*" %>
         <%@page import="javax.net.ssl.HttpsURLConnection" %>
        <%@page import ="javax.net.ssl.SSLContext" %>
        <%@page import ="javax.net.ssl.TrustManager" %>
        <%@page import ="javax.net.ssl.X509TrustManager" %>
        <%@page import ="java.io.OutputStream" %>
      
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
    body{
        background-image: url("webimag/pink.jpg");
        color: black;
        font-size: 18px;
        
    }
 </style>
</head>
<body>
<%
    TrustManager[] trustAllCerts = new TrustManager[]{
        new X509TrustManager() {

            public java.security.cert.X509Certificate[] getAcceptedIssuers()
            {
                return null;
            }
            public void checkClientTrusted(java.security.cert.X509Certificate[] certs, String authType)
            {
                //No need to implement.
            }
            public void checkServerTrusted(java.security.cert.X509Certificate[] certs, String authType)
            {
                //No need to implement.
            }
        }
};
try 
{
    SSLContext sc = SSLContext.getInstance("SSL");
    sc.init(null, trustAllCerts, new java.security.SecureRandom());
    HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
} 
catch (Exception e) 
{
  out.print(e);
}
    
  
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/infodb", "Abinaya", "welcome123");
            HttpSession sess=request.getSession(false);
           String cellno=(String)sess.getAttribute("phno");
           String complaint=(String)sess.getAttribute("comp");
           Statement st = con.createStatement();
            ResultSet rs;
            rs=st.executeQuery("select id,description,datetime,status from complaint where residentphno='"+cellno+"'"); 
            while(rs.next())
            {
              %>
              <table>
                  <tr><td><%=rs.getString(1)%></td>
                  <td><%=rs.getString(2)%></td>
                  <td><%=rs.getString(3)%></td>
                  <td><%=rs.getString(4)%></td></tr>
              </table><br><br>
              <% }
ResultSet rs1;
               Statement st1=con.createStatement();
               rs1=st1.executeQuery("select name,contactno from maintenanceteam where WorkType='"+complaint+"'");
String name,contactno;
while(rs1.next()){
name=rs1.getString(1);
contactno=rs1.getString(2);
%>
 WORKER DETAILS<br>
<table>
    <tr><td><%=rs1.getString(1)%></td></tr>
    <tr><td><%=rs1.getString(2)%></td></tr>
</table>
<%

String authkey = "189881AkgTEoOgI5a42787f";
String senderId = "ABCDEF";
//String authkey="abiakW7OaNiybFcMokn14SG";
String message = "Will provide you MOWA service within short span of time.the name and contact number of the maintenance team member is given   \n"+name+"   "+contactno;
//define route
String route="4";
//Prepare Url
URLConnection myURLConnection=null;
URL myURL=null;
BufferedReader reader=null;
//encoding message
String encoded_message=URLEncoder.encode(message);
//String mainUrl="https://smsapi.engineeringtgr.com/send/?country=91&Mobile=9444999732&Password=welcome123&To=9444999732";

String mainUrl="http://api.msg91.com/api/sendhttp.php?sender=MSGIND&route=4&mobiles=+91 cellno&authkey=189881AkgTEoOgI5a42787f&country=91&message=message";
StringBuilder sbPostData= new StringBuilder(mainUrl);
sbPostData.append("authkey="+authkey);
sbPostData.append("&mobiles="+cellno); 
sbPostData.append("&message="+encoded_message);
sbPostData.append("&route="+route);
sbPostData.append("&sender="+senderId);
mainUrl = sbPostData.toString();
try
{
myURL = new URL(mainUrl);
myURLConnection = myURL.openConnection();
myURLConnection.connect();
reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
//out.write("successfully sent");
reader.close();
}
catch (IOException e)
{
e.printStackTrace();
}

%>
<center>
    <h1>THANK YOU FOR USING MOWA MAINTENANCE WEBAPP</h1><br><BR>
    <B> MAINTENANCE SERVICE WILL ARRIVE AT YOUR DOOR STEP SHORTLY</B>
</center>

             
              

<% } %>
</body>
</html>
