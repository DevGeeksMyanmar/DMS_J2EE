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

import dao.OrderDAO;
import dao.UserDAO;
import model.Order;
import model.User;


@WebServlet("/views/admin/home")
public class AdminHomeController extends HttpServlet {

    RequestDispatcher dispatcher = null;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String searchKey = request.getParameter("searchKey");
    	
//    	for order status filter
    	String filterStatus = request.getParameter("filterStatus");
    	
    	if(filterStatus == null) {
    		filterStatus = "";
    	}
    	
    	 HttpSession session = request.getSession(false);
         Object userObj = session.getAttribute("user");
         User user = (User) userObj;
         OrderDAO orderDAO = new OrderDAO();
         
         

         if(user != null) {
        	 if (searchKey != null) {
         	    List<Order> orderList = orderDAO.get(searchKey, filterStatus);
         	    request.setAttribute("searchKey", searchKey);
         	    request.setAttribute("orderList", orderList);
         	} else {
         		
         	    List<Order> orderList = orderDAO.get("", filterStatus);
         	    request.setAttribute("orderList", orderList);
         	}
          
          	if(!filterStatus.isEmpty()) {
          		request.setAttribute("filterStatus", filterStatus);
          	}else {
          		request.setAttribute("filterStatus", "all");
          	}
         }
         
         UserDAO userDAO = new UserDAO();
         
         List<User> driverList = userDAO.get("driver");
     	
     		request.setAttribute("driverList", driverList);
         	

        	// Forward the request to the appropriate JSP page
        	RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        	dispatcher.forward(request, response);
    	
    		
    	
    	
    }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
  }
    }