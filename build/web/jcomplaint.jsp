<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL" %>
<%@page import="java.net.URLConnection"%>
<%@page import=" java.net.URLEncoder"%>
 <%@ page import ="java.sql.*" %>
        <%@ page import ="javax.sql.*" %>
         <%@ page import ="javax.net.*" %>
        <%@ page import ="java.util.*" %>
        <%@ page import ="java.io.*" %>
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
    body,a{
        background-image: url("webimag/color.jpg");
        color:white;
    }
 </style>
</head>
<body>
    <center>
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
    
    String bkno=request.getParameter("blk");
    String textmessage=request.getParameter("comp");
    String status=null;
    if(textmessage!=null)
    {
        status="open";
    }

Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/infodb", "Abinaya", "welcome123");

            Statement st = con.createStatement();
            ResultSet rs;
            java.util.Date d=new java.util.Date();    
            rs=st.executeQuery("select mobileno from residentinfo where blockno='"+bkno+"'"); 
           String mob=null; 
                if(rs.next())    
                 {
                     //out.write("hello");
              mob=rs.getString(1);
                 }
                HttpSession sess=request.getSession();
                sess.setAttribute("phno",mob);
                sess.setAttribute("comp", textmessage); 
            
            ResultSet rs1; 
            rs1=st.executeQuery("select id from complaint");
              int id=0;
              if(rs1.last())
              {
                 id=rs1.getInt(1)+1; 
                 
                  
              }
             int i=st.executeUpdate("insert into complaint(id,description,datetime,status,residentphno) values('"+id+"','"+textmessage+"','"+d.toString()+"','"+status+"','"+mob+"')");
             
            /*ResultSet rs2;
rs2=st.executeQuery("select id,datetime,description,status from complaint where id=mysql_insert_id()")  ;
out.write("<table border=1px style='width:1000px'>");
out.print("COMPLAINT ID\t\t\tDATE & TIME\t\t\tCOMPLAINT DESCRIPTION\t\t\tCOMPLAINT STATUS");
while(rs2.next())
{
    out.write("<tr><td>"+rs2.getString(1)+"</td>");
    out.write("<td>"+rs2.getString(2)+"</td>");
    out.write("<td>"+rs2.getString(3)+"</td>");
    out.write("<td>"+rs2.getString(4)+"</td></tr>");
    
}*/
String authkey = "189881AkgTEoOgI5a42787f";
//String authkey="abiakW7OaNiybFcMokn14SG";

String mobiles = "9444999732";

String senderId = "ABCDEF";

String message = textmessage+" "+bkno;

String route="4";

URLConnection myURLConnection=null;
URL myURL=null;
BufferedReader reader=null;

String encoded_message=URLEncoder.encode(message);
//String mainUrl="https://smsapi.engineeringtgr.com/send/?Mobile=9444999732&Password=welcome123&authkey=abiakW7OaNiybFcMokn14SG&To=9444999732&country=91&route=4&message=encoded_message";
String mainUrl="http://api.msg91.com/api/sendhttp.php?sender=MSGIND&route=4&mobiles=+91 mobiles&authkey=189881AkgTEoOgI5a42787f&country=91&message=message";
StringBuilder sbPostData= new StringBuilder(mainUrl);
sbPostData.append("authkey="+authkey); 
sbPostData.append("&mobiles="+mobiles);
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

reader.close();
}

catch (Exception e)
{
    out.print(e);
e.getMessage();
out.write("no success");
}

            
            
%>
<br>

<center style='font-family: arial black; font-size: 18px;color: white'><br><br><br><br>
    Your complaint has been sent to MOWA maintenance admin.<br>
    You will be provided the required maintenance service in short span of time.<br>
    As an initiation you will receive response message to your mobile number.<br>

    <a href='response.jsp'>Click here</a>

</center>

</body>
</html>
