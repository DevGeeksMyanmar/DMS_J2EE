<%@ include file="../../layout/header.jsp" %>
	
<%@ include file="../../layout/shop_sidenav.jsp" %>


<% 
Object loginStatusObj = session.getAttribute("login_status");
Object role = session.getAttribute("role");
if (loginStatusObj == null || loginStatusObj.equals("false")) {
	 response.sendRedirect("/DMS/views/login.jsp");
}else if(!(role.equals("shop"))){
	response.sendRedirect("/DMS/views/login.jsp");
}
%>

<!-- Main content -->
<div class="p-5 md:p-10 sm:ml-64">
   
<div class="grid grid-cols-3 gap-4 mb-4">
         <div class=" p-5 rounded bg-gray-50 dark:bg-gray-800">
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
         
<div class="p-5 col-span-2 rounded bg-gray-50 h-88 flex flex-col items-center justify-center dark:bg-gray-800">
  
  <h2 class="text-2xl text-gray-400 dark:text-gray-500 text-center mb-8">
    Order item form
  </h2>
  
<form id="orderForm">
        <div class="w-full max-w-xs">
            <label for="productName" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Product Name</label>
            <input type="text" name="productName" id="productName" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Enter product name">
        </div>
        <div class="w-full max-w-xs mt-4">
            <label for="productPrice" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Product Price</label>
            <input type="text" name="productPrice" id="productPrice" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Enter product price">
        </div>
        <div class="w-full max-w-xs mt-4">
            <label for="orderCount" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Order Count</label>
            <input type="number" id="orderCount" aria-describedby="helper-text-explanation" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Order Count: " required>
        </div>
        <button id="addOrder" class="mt-4 mx-auto border-b-4 shadow-lg hover:border-y-2 border-blue-800 bg-blue-600 flex items-center justify-center px-6 py-2 text-gray-900 rounded-lg dark:text-white group">
            <svg class="text-white w-8 h-8" xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24"><path fill="currentColor" d="M11 17h2v-4h4v-2h-4V7h-2v4H7v2h4v4Zm1 5q-2.075 0-3.9-.788t-3.175-2.137q-1.35-1.35-2.137-3.175T2 12q0-2.075.788-3.9t2.137-3.175q1.35-1.35 3.175-2.137T12 2q2.075 0 3.9.788t3.175 2.137q1.35 1.35 2.138 3.175T22 12q0 2.075-.788 3.9t-2.137 3.175q-1.35 1.35-3.175 2.138T12 22Zm0-2q3.35 0 5.675-2.325T20 12q0-3.35-2.325-5.675T12 4Q8.65 4 6.325 6.325T4 12q0 3.35 2.325 5.675T12 20Zm0-8Z"></path></svg> 
            <span class="ml-3 text-white">Add Order</span>
        </button>
    </form>
    	 <div class="w-full max-w-xs mt-4" id="ordersContainer">
        	<h1 class="text-2xl font-bold mb-4">Orders</h1>
        	<div class="border border-gray-300 p-4" id="orders">
    	</div>
</div>
      

</div>
<div class="text-right mt-4">
	<button class="text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Submit Order</button>
</div>
</div>

<script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('#orderForm');    
			const ordersDiv = document.querySelector('#orders');
            const orders = [];
            
            form.addEventListener('submit', (event)=> {
                event.preventDefault();
                // Get the input values
                
                const productName = document.querySelector('#productName').value;       
                const productPrice = document.querySelector('#productPrice').value;       
                const orderCount = document.querySelector('#orderCount').value;              
				 // Add  order to  orders array
				 orders.push({
				               productName: productName,
				               productPrice: productPrice,
				               orderCount: orderCount
				              });				

                document.querySelector('#productName').value = '';
                document.querySelector('#productPrice').value = '';
                document.querySelector('#orderCount').value = '';
                
                allOrders();       
            });
            
            const allOrders =()=> { 
            	ordersDiv.innerHTML = '';
                //let allOrders = '';
                orders.forEach((order, index)=> {
                	const orderDiv = document.createElement("div");

                	orderDiv.style.border = '1px solid black';               	 
                	orderDiv.style.padding = '10px'; 
                	orderDiv.style.marginBottom = '10px'; 
        	
                	orderDiv.innerHTML = 'Order ' + (index + 1) + ':<br>' +
                                       'Product Name: ' + order.productName + '<br>' +
                                       'Product Price: ' + order.productPrice + '<br>' +
                                       'Order Count: ' + order.orderCount + '<br><br>';

                   ordersDiv.appendChild(orderDiv);
                });
                //orderField.value = allOrders;
            }
        });
    </script>

<%@ include file="../../layout/footer.jsp" %>