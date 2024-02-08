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
<div class="p-5 md:p-10 grid grid-cols-2 sm:ml-64">
   
<div class="bg-white p-5 max-w-2xl mx-auto rounded-xl mt-10 md:mt-20">
	


</div>
<div class="bg-white p-5 max-w-2xl mx-auto rounded-xl mt-10 md:mt-20">
	


</div>

</div>



<%@ include file="../../layout/footer.jsp" %>