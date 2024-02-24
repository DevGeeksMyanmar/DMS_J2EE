<%@ include file="../../layout/header.jsp" %>
	
<%@ include file="../../layout/admin_sidenav.jsp" %>

<%@ page import="model.User" %>

<%

Object userObj = session.getAttribute("user");

if (userObj == null) {
    response.sendRedirect("/DMS/views/login.jsp");
} else if (userObj == null || !(userObj instanceof User)) {
    response.sendRedirect("/DMS/views/login.jsp");
} else {
    User user = (User) userObj;
    if (!"admin".equals(user.getRole())) {
        response.sendRedirect("/DMS/views/login.jsp");
    }
}
%>

<!-- Main content -->
<div class="p-5 md:p-10  sm:ml-64">
   <input type="hidden" id="status" value="<%= request.getAttribute("status") %>" />
<div class="flex flex-column sm:flex-row flex-wrap space-y-4 sm:space-y-0 items-center justify-between pb-4">
        <div>
        
                <!-- Modal toggle -->
<button data-modal-target="default-modal" data-modal-toggle="default-modal" class="inline-flex items-center text-gray-500 bg-white border border-gray-300 focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-200 font-medium rounded-lg text-sm px-3 py-1.5 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700" type="button">
  Filter 
  <svg class="w-2.5 h-2.5 ms-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                </svg>
  </button>

<!-- Main modal -->
<div id="default-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative p-4 w-full max-w-xl max-h-full">
        <!-- Modal content -->
        <form action="/DMS/views/admin/home" method="get" class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                    Filter Order List
                </h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="default-modal">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <!-- Modal body -->
            <div class="p-4 md:p-5 space-y-4">
                <div class="mx-auto">
				  <label for="status" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Filter by order status</label>
				  <select name="filterStatus" id="filterStatus" class="mb-4 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				    <option value="" selected >Select Order Status</option>
				    <option value="">all</option>
				    <option>requesting</option>
				    <option>assigned</option>
				    <option>onDelivery</option>
				    <option>delivered</option>
				    
				  </select>
				  <label for="township" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Filter by township</label>
				  
				  <select name="township" id="township" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				    <option value="" selected >Select Township</option>
				    <option value="">all</option>
				    <option>south dagon</option>
				    <option>shwe pyi thar</option>
				    
				    
				  </select>
				</div>
            </div>	
            <!-- Modal footer -->
            <div class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600">
                <button type="submit" data-modal-hide="default-modal" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Filter</button>
                <button data-modal-hide="default-modal" type="button" class="py-2.5 px-5 ms-3 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">Cancel</button>
            </div>
        </form>
    </div>
</div>

            
        </div>
        
        <p class=" px-4  py-2 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 dark:bg-gray-700 dark:border-gray-600 dark:text-white ">Showing <span class="text-blue-600 font-semibold">${filterStatus}</span> orders from <span class="text-blue-600 font-semibold">${township}</span> </p>
        <!-- Modal toggle -->
<button data-modal-target="default-modal2" data-modal-toggle="default-modal2" class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">
  Assign Driver
  
  <svg class="w-6 h-6 inline-block ms-2" xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24"><path fill="currentColor" d="M3 4h14v4h3l3 4v5h-2a3 3 0 0 1-3 3a3 3 0 0 1-3-3H9a3 3 0 0 1-3 3a3 3 0 0 1-3-3H1V6a2 2 0 0 1 2-2m14 5.5V12h4.47L19.5 9.5zm-11 6A1.5 1.5 0 0 0 4.5 17A1.5 1.5 0 0 0 6 18.5A1.5 1.5 0 0 0 7.5 17A1.5 1.5 0 0 0 6 15.5m12 0a1.5 1.5 0 0 0-1.5 1.5a1.5 1.5 0 0 0 1.5 1.5a1.5 1.5 0 0 0 1.5-1.5a1.5 1.5 0 0 0-1.5-1.5M8 14l6-6l-1.41-1.42L8 11.17L5.91 9.08L4.5 10.5z"/></svg>
</button>

<!-- Main modal -->
<div id="default-modal2" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative p-4 w-full max-w-xl max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                    Assign Delivery to Driver
                </h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="default-modal2">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <!-- Modal body -->
            <div class="p-4 md:p-5 space-y-4">
                <form class="mx-auto">
				  <label for="driver" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select an option</label>
				  <select id="driver" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				    <option selected disabled>Select Driver</option>
				    <c:forEach items="${driverList}" var="driver"> 
				    
				    <option value="${driver.id }" data-driver-id="${driver.id }" >${driver.name }</option>
				    </c:forEach>
				  </select>
				</form>
            </div>	
            <!-- Modal footer -->
            <div class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600">
                <button data-modal-hide="default-modal2" type="submit" id="btn-submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Assign</button>
                <button data-modal-hide="default-modal2" type="button" class="py-2.5 px-5 ms-3 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">Cancel</button>
            </div>
        </div>
    </div>
</div>
        <div class="relative">
            <div class="absolute inset-y-0 left-0 rtl:inset-r-0 rtl:right-0 flex items-center ps-3 pointer-events-none">
                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
            </div>
            <form action="home" method="get">
             <input name="searchKey" value="${searchKey}" type="text" id="table-search" class="block p-2 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg w-80 bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Search by shop or customer name">
            </form>
           
        </div>
        
    </div>
    
<div class="relative overflow-x-auto shadow-md sm:rounded-lg">

    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">


            <tr>
            <th scope="col" class="p-4">
                    <div class="flex items-center">
                        <input id="checkbox-all-search" type="checkbox" class="order-checkbox cursor-pointer w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                        <label for="checkbox-all-search" class="sr-only">checkbox</label>
                    </div>
                </th>
                <th scope="col" class="px-6 py-3">
                    Order ID
                </th>
                <th scope="col" class="px-6 py-3">
                    Shop Name
                </th>
                <th scope="col" class="px-6 py-3">
                    Customer Name
                </th>
                <th scope="col" class="px-6 py-3">
                    City
                </th>
                <th scope="col" class="px-6 py-3">
                    Township
                </th>
                <th scope="col" class="px-6 py-3">
                    Deliver Status
                </th>
                <th scope="col" class="px-6 py-3">
                    Assigned Driver
                </th>
                <th scope="col" class="px-6 py-3">
                    Action
                </th>
            </tr>
           
        </thead>
        <tbody>
        
		
		<c:forEach items="${orderList}" var="order"> 
            <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                <td class="w-4 p-4">
                    <div class="flex items-center ">
                        <input id="checkbox_${order.id}" data-order-id="${order.id}" type="checkbox" class="order-checkbox cursor-pointer w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                        <label for="checkbox_${order.id}" class="sr-only">checkbox</label>
                    </div>
                </td>
                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                    ${order.id}
                </th>
                <td class="px-6 py-4">
                    ${order.shop_name}
                </td>
                <td class="px-6 py-4">
                    ${order.customer_name}
                </td>
                <td class="px-6 py-4">
                    ${order.customer_city}
                </td>
                <td class="px-6 py-4">
                    ${order.customer_township}
                </td>
                <td class="px-6 py-4">
                    ${order.order_status}
                    
                </td>
                <c:if test="${order.driver_name != null && !order.driver_name.isEmpty()}">
                <td class="px-6 py-4">
                    ${order.driver_name}
                </td>
                
                </c:if>
                
                <c:if test="${order.driver_name == null || order.driver_name.isEmpty()}">
                	<td class="px-6 py-4">
                    not assigned
                </td>
                </c:if>
                <td class=" py-4 space-x-2 flex px-2 md:px-0">
                    <a href="order?action=view&orderId=${order.id}" class="font-medium text-blue-600 dark:text-blue-500 hover:underline bg-blue-600 shadow text-white px-3 py-2 rounded-md">view</a>
                	
                </td>
            </tr>
             </c:forEach>
            
        </tbody>
    </table>
</div>

</div>


<script src="/DMS/assets/js/adminOrder.js"></script>
<%@ include file="../../layout/footer.jsp" %>