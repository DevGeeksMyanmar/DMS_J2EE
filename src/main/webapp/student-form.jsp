<%@ include file="./layout/header.jsp" %>


<%@ include file="./layout/topNav.jsp" %>

<div class = "container"> 
<div class = "row">
<div class = "col-md-4">
<form action = "${pageContext.request.contextPath}/StudentController" method="POST">
<div class = "form-group"> <label>Student Name</label> <input type = "text" class = "form-control" name = "name"  value = "${student.name}"/></div>
<div class = "form-group"> <label>Roll No.</label><input type = "text" class = "form-control" name = "rollno" value = "${student.rollno}"/> </div>
<div class="form-group"> <label>Email</label><input type = "text" class = "form-control" name = "email" value = "${student.email}"/> </div>
<input type = "hidden" name = "id" value = "${student.id}"/>
<button type = "submit" class = "btn btn-primary">Save</button>
</form> </div> </div>
<a href = "${pageContext.request.contextPath}/StudentController?action=LIST">Back to Student List</a>
</div>

	


<%@ include file="./layout/footer.jsp" %>


