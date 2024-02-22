package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.Student;
import model.User;

@WebServlet("/views/admin/deleteAccount")
public class DeleteAccountController extends HttpServlet {

    RequestDispatcher dispatcher = null;
    UserDAO userDAO = null;

    public DeleteAccountController() {
	userDAO = new UserDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	
    	
    }
    
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String account_id = request.getParameter("acc_id");
	boolean status = userDAO.delete(account_id);
	if(status) {
    	request.setAttribute("status", "deleteSuccess");
    }else {
    	request.setAttribute("status", "fail");
    }
    
	RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
    dispatcher.forward(request, response);
}
    
}