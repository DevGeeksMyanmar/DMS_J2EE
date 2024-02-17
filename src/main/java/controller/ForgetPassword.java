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
import dao.OtpDAO;
import model.Otp;

@WebServlet("/views/forgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO = null;
	OtpDAO otpDAO =null;
	int otp ;
	public ForgetPassword() {
		userDAO = new UserDAO();
		otpDAO = new OtpDAO();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("forgetpassword.jsp");
	    dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String email = request.getParameter("email");
		Boolean emailExit = userDAO.checkEmail(email);
		
		RequestDispatcher dispatcher = null;
		
		HttpSession mySession = request.getSession();

		if(emailExit) {
			
			Random rand = new Random();								 
			long currentTime = System.currentTimeMillis();

			int otp = 100000 + rand.nextInt(900000);
			System.out.println(otp);
			
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
				message.setText("your OTP is: " + otp);
				
				Transport.send(message);
				System.out.println("message sent successfully");
			}

			catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			dispatcher = request.getRequestDispatcher("otp.jsp");
			request.setAttribute("message","OTP is sent to your email id");

			mySession.setAttribute("email",email); 
			dispatcher.forward(request, response);	
			
				Otp otpUser = otpDAO.getByEmail(email);
				if (otpUser != null) {
					otpUser.setOtp(otp);
					otpDAO.update(otpUser);
		    	}else {
		    		otpUser = new Otp();
		    	    otpUser.setEmail(email);
		    	    otpUser.setOtp(otp);
		    	    otpDAO.createUser(otpUser);
		    	}
		
		}else {			
				
				request.setAttribute("status", "emailNotExit");
				dispatcher = request.getRequestDispatcher("forgetPassword.jsp");
				dispatcher.forward(request, response);
			}
		try {
			Otp newOtp = new Otp();
			newOtp.setOtp(otp);
			newOtp.setEmail(email);		
			otpDAO.createUser(newOtp);
			mySession.setAttribute("code_sent","true");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	}
