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
<div class="p-5 md:p-10  sm:ml-64">
   
<h1>
profile
</h1>

</div>



<%@ include file="../../layout/footer.jsp" %>