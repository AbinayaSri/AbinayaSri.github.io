/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

import java.net.InetAddress;

import java.util.Properties;

import java.util.Date;

import javax.mail.*;

import javax.mail.internet.*;

import javax.activation.*;



/**
 *
 * @author Senthil
 */
@WebServlet(urlPatterns = {"/sms"})
public class sms extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void msgsend() {

String username = "9444999732";

String password = "welcome123";

String smtphost = "http://site24.way2sms.com/main.action?Token=0C3331A661E2F30687BEA8F04B22893C.w803&section=s";

String compression = "My SMS Compression Information";

String from = username + smtphost;

String to = "PhoneNumberToText@http://site24.way2sms.com/main.action?Token=0C3331A661E2F30687BEA8F04B22893C.w803&section=s";

String body = "Hello SMS World!";

Transport myTransport = null;
try {

Properties props = System.getProperties();

props.put("mail.smtp.auth", "true");

Session mailSession = Session.getDefaultInstance(props, null);

Message msg = new MimeMessage(mailSession);

msg.setFrom(new InternetAddress(from));

InternetAddress[] address = {new InternetAddress(to)};

msg.setRecipients(Message.RecipientType.CC, address);

msg.setSubject(compression);

msg.setText(body);

msg.setSentDate(new Date());
myTransport = mailSession.getTransport("smtp");

myTransport.connect(smtphost, username, password);

msg.saveChanges();

myTransport.sendMessage(msg, msg.getAllRecipients());

myTransport.close();
System.out.println("success");

} catch (Exception e) {

e.printStackTrace();

}

}

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
         
        
        try (PrintWriter outx = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           

            outx.println("<!DOCTYPE html>");
            outx.println("<html>");
            outx.println("<head>");
            outx.println("<title>Servlet sms</title>");            
            outx.println("</head>");
            outx.println("<body>");
            outx.println("<h1>Servlet sms at " + request.getContextPath() + "</h1>");
            outx.println("</body>");
            outx.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
