package controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;

@WebServlet("/views/forgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO user = new UserDAO();
		
		String email = request.getParameter("email");
		Boolean emailExit = user.checkEmail(email);
		RequestDispatcher dispatcher = null;
		int otpvalue = 0;
		HttpSession mySession = request.getSession();

		if(emailExit) {
			
			Random rand = new Random();
			otpvalue = rand.nextInt(1255650);

			String to = email;
			
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("pkkoo239@gmail.com", "dtpy ecgm ygkh wpog");
				}
			});
			
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(email));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject("Hello");
				message.setText("your OTP is: " + otpvalue);
				
				Transport.send(message);
				System.out.println("message sent successfully");
			}

			catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			dispatcher = request.getRequestDispatcher("otp.jsp");
			request.setAttribute("message","OTP is sent to your email id");
			mySession.setAttribute("otp",otpvalue); 
			mySession.setAttribute("email",email); 
			dispatcher.forward(request, response);	
			
		
			}else {			
				System.out.println("Email exists: " + emailExit + " else");

				request.setAttribute("status", "emailNotExit");
				dispatcher = request.getRequestDispatcher("forgetPassword.jsp");
				dispatcher.forward(request, response);
			}
	}

	}
