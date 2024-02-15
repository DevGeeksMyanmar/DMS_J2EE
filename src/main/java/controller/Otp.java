package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/views/validateOtp")
public class Otp extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int value=Integer.parseInt( request.getParameter("otp"));
		
		HttpSession mySession = request.getSession();
	
		String storedOtp = (String) mySession.getAttribute("otp");
		
		RequestDispatcher dispatcher=null;
		
		String[] otpParts = storedOtp.split("-");
		int otp = Integer.parseInt(otpParts[0]);
		long storedExpirationTime = Long.parseLong(otpParts[1]);
		
		long currentTime = System.currentTimeMillis();
		if (currentTime > storedExpirationTime) {
		    // OTP expired
		    request.setAttribute("status", "otp");
		    dispatcher=request.getRequestDispatcher("otp.jsp");
		    dispatcher.forward(request, response);
		}
		
		if (value==otp ){
			request.setAttribute("email", request.getParameter("email"));
			request.setAttribute("status", "success");
			dispatcher=request.getRequestDispatcher("newPassword.jsp");
			dispatcher.forward(request, response);
			
		}else{
			request.setAttribute("message","wrong otp");
		    dispatcher=request.getRequestDispatcher("otp.jsp");
			dispatcher.forward(request, response);
		}
	}
}
