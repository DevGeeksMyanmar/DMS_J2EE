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
<div class="p-5 md:p-10  sm:ml-64">
   


</div>



<%@ include file="../../layout/footer.jsp" %>