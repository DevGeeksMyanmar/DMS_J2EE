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

import model.Order;
import model.User;


@WebServlet("/views/shop/home")
public class ShopHomeController extends HttpServlet {

    RequestDispatcher dispatcher = null;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String searchKey = request.getParameter("searchKey");
    	 HttpSession session = request.getSession(false);
         Object userObj = session.getAttribute("user");
         User user = (User) userObj;
         OrderDAO orderDAO = new OrderDAO();
         

		if(searchKey != null) {
		    		
		    		
		    		List<Order> orderList = orderDAO.get(user.getId() ,searchKey);
		    		request.setAttribute("searchKey", searchKey);
		        	request.setAttribute("orderList", orderList);
		        	dispatcher = request.getRequestDispatcher("home.jsp");
		        	dispatcher.forward(request, response);
		    	}else {
		    		
		    		List<Order> orderList = orderDAO.get(user.getId() ,"");
		        	request.setAttribute("orderList", orderList);
		        	dispatcher = request.getRequestDispatcher("home.jsp");
		        	dispatcher.forward(request, response);
		    	}
    	
    		
    	
    	
    }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
  }
    }