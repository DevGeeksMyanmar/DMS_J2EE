package controller;

import java.io.IOException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import model.Customer;

import javax.servlet.RequestDispatcher;

import javax.servlet.annotation.WebServlet;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/views/shop/order")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("createOrder.jsp");
	    dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // Read the data from the request body
        BufferedReader reader = request.getReader();
        StringBuilder stringBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            stringBuilder.append(line);
        }
        
        // Convert the JSON data to a Java object
        String jsonData = stringBuilder.toString();
        
        // Parse JSON using Gson
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(jsonData, JsonObject.class);
        
        // Access the 'customer' property
        JsonObject customerObject = jsonObject.getAsJsonObject("customer");

        
        
        Customer customer = new Customer();
        customer.setCustomer_name(customerObject.get("cusName").getAsString());
        customer.setCustomer_phone(customerObject.get("cusPhone").getAsString());
        customer.setCity(customerObject.get("city").getAsString());
        customer.setTownship(customerObject.get("township").getAsString());
        customer.setDetail_address(customerObject.get("detailAddress").getAsString());
        
        
        
        // Optionally, you can send a response back to the client
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Data received successfully!");
	}

}