<%@ include file="./layout/header.jsp" %>


<%@ include file="./layout/topNav.jsp" %>

<div class = "container"> <h1>Student List</h1>
<p>${MSG}</p>
<p> <button class = "btn btn-primary" onclick="window.location.href = 'student-form.jsp'">Add Student</button> </p>
<table class = "table table-bordered">
<tr> <th>Name</th> <th>Roll No.</th> <th>Email</th> <th>Actions</th> </tr>
<c:forEach items="${studentlist}" var="stu"> 
<tr> <td>${stu.name}</td>
<td>${stu.rollno}</td>
<td>${stu.email}</td>
<td> <a href = "${pageContext.request.contextPath}/StudentController?action=EDIT&id=${stu.id}">Edit</a> 
| 
<a href = "${pageContext.request.contextPath}/StudentController?action=DELETE&id=${stu.id}">Delete</a> </td> </tr>
</c:forEach>
</table> </div>

	


<%@ include file="./layout/footer.jsp" %>


