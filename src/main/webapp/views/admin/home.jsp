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
   
<div class="flex flex-column sm:flex-row flex-wrap space-y-4 sm:space-y-0 items-center justify-between pb-4">
        <div>
            <button id="dropdownRadioButton" data-dropdown-toggle="dropdownRadio" class="inline-flex items-center text-gray-500 bg-white border border-gray-300 focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-200 font-medium rounded-lg text-sm px-3 py-1.5 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700" type="button">
                
                    <svg class="w-3 h-3 text-gray-500 dark:text-gray-400 me-3" xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24"><path fill="currentColor" d="M10 18h4v-2h-4zM3 6v2h18V6zm3 7h12v-2H6z"/></svg>
                Filter by order status
                <svg class="w-2.5 h-2.5 ms-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                </svg>
            </button>
            <!-- Dropdown menu -->
            <div id="dropdownRadio" class="z-10 hidden w-48 bg-white divide-y divide-gray-100 rounded-lg shadow dark:bg-gray-700 dark:divide-gray-600" data-popper-reference-hidden="" data-popper-escaped="" data-popper-placement="top" style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(522.5px, 3847.5px, 0px);">
                <ul class="p-3 space-y-1 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownRadioButton">
                    <li>
                    <a href="home" class="flex items-center p-2 rounded hover:bg-gray-100 dark:hover:bg-gray-600">
                            
                            <div class="w-full ms-2 text-sm font-medium text-gray-900 rounded dark:text-gray-300">All</div>
                        </a>
                        <a href="home?filterStatus=requesting" class="flex items-center p-2 rounded hover:bg-gray-100 dark:hover:bg-gray-600">
                            
                            <div class="w-full ms-2 text-sm font-medium text-gray-900 rounded dark:text-gray-300">Requesting</div>
                        </a>
                    </li>
                    <li>
                        <a href="home?filterStatus=assigned" class="flex items-center p-2 rounded hover:bg-gray-100 dark:hover:bg-gray-600">
                            <div class="w-full ms-2 text-sm font-medium text-gray-900 rounded dark:text-gray-300">Delivery Assigned</div>
                        </a>
                    </li>
                    <li>
                        <a href="home?filterStatus=onDelivery" class="flex items-center p-2 rounded hover:bg-gray-100 dark:hover:bg-gray-600">
                           <div class="w-full ms-2 text-sm font-medium text-gray-900 rounded dark:text-gray-300">On Delivery</div>
                        </a>
                    </li>
                    <li>
                        <a href="home?filterStatus=delivered" class="flex items-center p-2 rounded hover:bg-gray-100 dark:hover:bg-gray-600">
                           <div class="w-full ms-2 text-sm font-medium text-gray-900 rounded dark:text-gray-300">Delivered</div>
                        </a>
                    </li>
                    
                </ul>
            </div>
        </div>
        <p class=" px-4  py-2 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 dark:bg-gray-700 dark:border-gray-600 dark:text-white ">Showing <span class="text-blue-600 font-semibold">${filterStatus}</span> orders</p>
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
                        <input id="checkbox-all-search" type="checkbox" class="cursor-pointer w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
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
                        <input id="checkbox-table-search-1" type="checkbox" class="cursor-pointer w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                        <label for="checkbox-table-search-1" class="sr-only">checkbox</label>
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



<%@ include file="../../layout/footer.jsp" %>