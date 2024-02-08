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
         <div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
            <p class="text-2xl text-gray-400 dark:text-gray-500">
               Customer Info Form
            </p>
         </div>
         <div class="col-span-2 flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
            <p class="text-2xl text-gray-400 dark:text-gray-500">
               Order item form
            </p>
         </div>
         
      </div>

</div>



<%@ include file="../../layout/footer.jsp" %>