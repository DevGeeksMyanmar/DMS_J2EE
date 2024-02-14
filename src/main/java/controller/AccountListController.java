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

@WebServlet("/views/admin/accountList")
public class AccountListController extends HttpServlet {

    RequestDispatcher dispatcher = null;
    UserDAO userDAO = null;

    public AccountListController() {
	userDAO = new UserDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	String role = request.getParameter("role");
    	List<User> accountList = userDAO.get(role);
    	
    	request.setAttribute("accountList", accountList);
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("accountList.jsp");
	    dispatcher.forward(request, response);
    	
    }
    
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
    
}