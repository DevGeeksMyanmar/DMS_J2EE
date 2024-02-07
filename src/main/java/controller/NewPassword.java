package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/views/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confirmPass = request.getParameter("confirm_password");
		String hashPassword = Hash.hashPassword(newPassword);
		
		RequestDispatcher dispatcher = null;
		
		if (newPassword != null && confirmPass != null && newPassword.equals(confirmPass)) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register?useSSL=false", "root","Pkko300274#");
				PreparedStatement ps = con.prepareStatement("update users set hashPassword = ? where email = ? ");
				ps.setString(1, hashPassword);
				ps.setString(2, (String) session.getAttribute("email"));

				int rowCount = ps.executeUpdate();
				if (rowCount > 0) {
					request.setAttribute("status", "resetSuccess");
					dispatcher = request.getRequestDispatcher("home.jsp");
				} else {
					request.setAttribute("status", "resetFail");
					dispatcher = request.getRequestDispatcher("login.jsp");
				}
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
