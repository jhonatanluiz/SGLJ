/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

//import org.hibernate.Session;
//import org.hibernate.Transaction;
//import javax.validation.ValidationException;

import tcc.sglj.dao.*;
import tcc.sglj.model.*;
import tcc.sglj.util.*;
import org.hibernate.*;

import javax.mail.*;
import javax.mail.Session;
import javax.mail.internet.*;

import java.util.Properties;

/**
 *
 * @author Leandro
 */
@WebServlet(name = "Teste", urlPatterns = {"/teste.js"})
public class Teste extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, AddressException, MessagingException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String mailServer = "smtp.gmail.com";
        String assunto = "teste";
        String para = "jhonatan.luiz.santos@gmail.com";
        String de = "jhonatan.luiz.santos@gmail.com";
        String mensagem = "um teste";
        //try {

        out.println(send(mailServer, assunto, de, para, mensagem));

        /*
         * } catch (AddressException e) { out.println(e.getMessage()); } catch
         * (MessagingException a) { out.println(a.getMessage());
        }
         */


    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            processRequest(request, response);
        } catch (AddressException e) {
            out.println(e.getMessage());
        } catch (MessagingException a) {
            out.println(a.getMessage());
        }

    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            processRequest(request, response);
        } catch (AddressException e) {
            out.println(e.getMessage());
        } catch (MessagingException a) {
            out.println(a.getMessage());
        }

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

    public String send(String mailServer, String subject, String to, String from, String mensagem) throws AddressException, MessagingException {

        Properties props = System.getProperties();
        /*
         * props.put("mail.smtp.host", mailServer); props.put("mail.smtp.auth",
         * "true"); props.put("mail.smtp.port", "587");
         */
        //testes  
        props.put("mail.smtp.host", mailServer);
        props.put("mail.smtp.auth", "true");
        props.put("mail.debug", "true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.mime.charset", "ISO-8859-1");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.fallback", "false");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getDefaultInstance(props);//recebe props  



        InternetAddress destinatario = new InternetAddress(to);
        InternetAddress remetente = new InternetAddress(from);

        Message msg = new MimeMessage(session);
        msg.setSentDate(new Date());//novo  
        msg.setFrom(remetente);
        msg.setRecipient(Message.RecipientType.TO, destinatario);
        msg.setSubject(subject);
        msg.setContent(mensagem.toString(), "text/HTML");

        Transport transport = session.getTransport("smtp");
        transport.connect(mailServer, "seu_Usuario", "Sua_senha");
        msg.saveChanges();
        transport.sendMessage(msg, msg.getAllRecipients());
        transport.close();
        return "<center><h2>email enviado com sucesso!!</h2></center>";
    }
}
