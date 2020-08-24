package control;
import java.util.Properties;
import java.util.*;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.eclipse.jdt.internal.compiler.batch.Main;

public class Mail {
	public static String generateOtp()  
    {  //int randomPin declared to store the otp 
        //since we using Math.random() hence we have to type cast it int 
        //because Math.random() returns decimal value 
        int randomPin   =(int) (Math.random()*9000)+1000; 
        String otp  = String.valueOf(randomPin); 
        return otp; //returning value of otp 
    } 
	

	public static String sendEmail(String to) throws MessagingException{
	 String receiver=to;
		System.out.println("message senting....");
		Properties properties=System.getProperties();
		//mail.smtp.authentication
		//mail.smtp.start tls.enable
		//mail.smtp.host -smtp.gmail.com
		//mail.smtp.port -587
		properties.put("mail.smtp.auth","true");
		properties.put("mail.smtp.starttls.enable","true");
		properties.put("mail.smtp.host","smtp.gmail.com");
		properties.put("mail.smtp.port","587");
		
		final String from="weatherpredictor99@gmail.com";
		final String pass="Dhanya@123";
		Session session=Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new  PasswordAuthentication(from, pass);
			}
	});
   		    Message message=new  MimeMessage(session);
            message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO,new  InternetAddress(to));
			message.setSubject("LOGIN DETAILS");
			String otp=Mail.generateOtp();
			message.setText("YOUR PASSWORD IS "+otp);
			
           Transport.send(message);
           System.out.println("message sent succesfully");
           System.out.println(otp);
		return otp;
		
	}
public static void main(String[] args) throws MessagingException {
	String otp =Mail.sendEmail("ranjitprasath955@gmail.com");
}	
}
