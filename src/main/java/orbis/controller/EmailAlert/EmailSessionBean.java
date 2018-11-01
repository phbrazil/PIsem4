/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.EmailAlert;

import javax.mail.Authenticator;
import java.util.Date;
import java.util.Properties;
import javax.ejb.Stateless;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author paulo.bezerra
 */
@Stateless
public class EmailSessionBean {

    // private int port = 465; // 587;
    // private String host = "smtp.gmail.com";
    private String from = "orbis.notification@gmail.com";
    //private boolean auth = true;
    private String username = "orbis.notification@gmail.com";
    private String password = "orbis2018";
    //private Protocol protocol = Protocol.SMTP;
    private boolean debug = true;

    public boolean sendEmail(String to1, String subject, String body) {

        boolean emailenviado = false;

        Properties props = new Properties();
        props.put("mail.smtp.host", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Authenticator authenticator = null;
        authenticator = new Authenticator() {
            private javax.mail.PasswordAuthentication pa = new javax.mail.PasswordAuthentication(username, password);

            @Override
            public javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return pa;
            }
        };

        Session session = Session.getInstance(props, authenticator);
        session.setDebug(debug);

        MimeMessage message = new MimeMessage(session);
        try {

            message.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to1)};
            message.setRecipients(Message.RecipientType.TO, address);
            message.setSubject(subject);
            message.setSentDate(new Date());
            message.setText(body);
            Transport.send(message);
            emailenviado = true;
            
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
        return emailenviado;
    }

}
