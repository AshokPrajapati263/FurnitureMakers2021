package com.furnituremakers.util;

import java.util.Properties;
import javax.mail.*;    
import javax.mail.internet.*; 

public class MailUtil {
	public static void send(String to,String sub,String msg){  
		// Assuming you are sending email from through gmails smtp
	    String host = "smtp.gmail.com";
	    String from = "furnituremakers2021@gmail.com";
	    String password = "Furniture@123akj";
	    // Get system properties
	    Properties properties = System.getProperties();

	    // Setup mail server
	    properties.put("mail.smtp.host", host);
	    properties.put("mail.smtp.port", "465");
	    properties.put("mail.smtp.ssl.enable", "true");
	    properties.put("mail.smtp.auth", "true");

	    // Get the Session object.// and pass username and password
	    Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

	        protected PasswordAuthentication getPasswordAuthentication() {

	            return new PasswordAuthentication(from, password);

	        }

	    });

	    // Used to debug SMTP issues
	    session.setDebug(true);

	    try {
	        // Create a default MimeMessage object.
	        MimeMessage message = new MimeMessage(session);

	        // Set From: header field of the header.
	        message.setFrom(new InternetAddress(from));

	        // Set To: header field of the header.
	        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

	        // Set Subject: header field
	        message.setSubject(sub);

	        // Now set the actual message
	        message.setText(msg);

	        // Send message
	        Transport.send(message);
	        System.out.println("Sent message successfully....");
	    } catch (MessagingException mex) {
	        mex.printStackTrace();
	    }
	}
}
