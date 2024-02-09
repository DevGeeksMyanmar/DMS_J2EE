<%@ include file="../../layout/header.jsp" %>
	
<%@ include file="../../layout/shop_sidenav.jsp" %>


<%=2+3%>
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
         <div class="col-span-2 flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
            <p class="text-2xl text-gray-400 dark:text-gray-500">
               Order item form
            </p>
         </div>
         
      </div>

</div>



<%@ include file="../../layout/footer.jsp" %>