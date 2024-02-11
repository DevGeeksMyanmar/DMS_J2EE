<%@ include file="../../layout/header.jsp" %>
	
<%@ include file="../../layout/shop_sidenav.jsp" %>


<%@ page import="model.User" %>

<%

Object userObj = session.getAttribute("user");

if (userObj == null) {
    response.sendRedirect("/DMS/views/login.jsp");
} else if (userObj == null || !(userObj instanceof User)) {
    response.sendRedirect("/DMS/views/login.jsp");
} else {
    User user = (User) userObj;
    if (!"shop".equals(user.getRole())) {
        response.sendRedirect("/DMS/views/login.jsp");
    }
}
%>

<!-- Main content -->
<div class="p-5 md:p-10 sm:ml-64">
   
<div class="grid grid-cols-5 gap-4 mb-4">

         <div class="col-span-2 p-5 rounded bg-gray-50 dark:bg-gray-800">
         <h2 class="text-2xl  dark:text-gray-300 text-center mb-4 text-blue-600">
    Customer Information Form
  </h2>
  <hr class="mb-4">
            <div class="mb-4">
		        <label for="cusName" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Customer Name</label>
		        <input type="text" name="cusName" id="cusName" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Enter customer name" >
		    </div> 
		    <div class="mb-4">
		        <label for="cusPhone" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Customer Phone Number</label>
		        <input type="text" name="cusPhone" id="cusPhone" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Enter customer phone number" >
		    </div> 
		    <div class="mb-4">
		        <label for="cusCity" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Customer City</label>
		        <select name="cusCity" id="cusCity" class="mb-4 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				  <option disabled selected>Choose City</option>
				  <option value="shop">Yangon</option>
				  <option value="driver">Bago</option>
				</select>
				<label for="cusTownship" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Customer Township</label>
				<select name="cusTownship" id="cusTownship" class="mb-4 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				  <option disabled selected>Choose Town Ship</option>
				  <option value="shop">South Dagon</option>
				  <option value="driver">Shwe Pyi Thar</option>
				</select>		
				<label for="cusAddress" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Customer Address</label>
				<textarea id="cusAddress" name="cusAddress" rows="4" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Enter customer address"></textarea>			
		    </div> 
         </div>
         
<div class="p-5 col-span-3 rounded bg-gray-50 h-88   dark:bg-gray-800">
  
  <h2 class="text-2xl text-blue-600 dark:text-gray-300 text-center mb-4">
    Order Item Form
  </h2>
  <hr class="mb-4">
  
<form id="orderForm" >
        <div class="w-full">
            <label for="productName" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Product Name</label>
            <input type="text" id="productName" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Enter product name">
        </div>
        <div class="w-full  mt-4">
            <label for="productPrice" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Product Price</label>
            <input min="0" type="number" id="productPrice" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Enter product price">
        </div>
        <div class="w-full  mt-4">
            <label for="orderCount" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Order Count</label>
            <input min="1" type="number" id="orderCount" aria-describedby="helper-text-explanation" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Order Count: " required>
        </div>
        
        <button type="submit" class="mt-4 py-2.5 px-5 me-2 mb-2 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">Add Item</button>
        
    </form>
    
    	 <div class="w-full  mt-4" id="ordersContainer">
        	<h1 class="text-2xl font-bold mb-4">Orders</h1>
        	<div class=" flex-wrap px-4 bg-gray-100 rounded p-3" id="orders" style=" display: flex;">
            
          
          </div>
		</div>
      

</div>
<div class="text-right mt-4">
	<button class="text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Submit Order</button>
</div>
</div>

<script src="/DMS/assets/js/createOrder.js"></script>

<%@ include file="../../layout/footer.jsp" %>