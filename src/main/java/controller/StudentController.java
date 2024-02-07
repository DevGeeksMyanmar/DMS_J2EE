package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.StudentDAO;
import model.Student;


public class StudentController extends HttpServlet {

    RequestDispatcher dispatcher = null;
    StudentDAO studentDAO = null;

    public StudentController() {
	studentDAO = new StudentDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String action = request.getParameter("action");
    	if(action == null) {
    	action = "LIST";
    	}
    	switch(action) {
    	case "LIST":
    	listStudent(request, response);
    	break;

    	case "EDIT":
    	getStudent(request, response);
    	break;

    	case "DELETE":
    	deleteStudent(request, response);
    	break;

    	default:
    	listStudent(request, response);
    	break;
    	}
    }

    private void listStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Student> stuList = studentDAO.get();
    	request.setAttribute("studentlist", stuList);
    	dispatcher = request.getRequestDispatcher("/student-list.jsp");
    	dispatcher.forward(request, response);
    }

    private void getStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	String id = request.getParameter("id");
    	Student stu = studentDAO.get(Integer.parseInt(id));
    	request.setAttribute("student", stu);
    	dispatcher = request.getRequestDispatcher("/student-form.jsp");
    	dispatcher.forward(request, response);
    }
    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String id = request.getParameter("id");
    	if(studentDAO.delete(Integer.parseInt(id))) {
    		request.setAttribute("MSG", "Successfully Deleted");
    	}
    	listStudent(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String id = request.getParameter("id");
    	Student stu = new Student();
    	stu.setName(request.getParameter("name"));
    	stu.setRollno(request.getParameter("rollno"));
    	stu.setEmail(request.getParameter("email"));
    	if(id.isEmpty() || id == null) {
    		if(studentDAO.save(stu)) {
    		request.setAttribute("MSG", "Successfully Saved!");
    		}
    	}
    	else {
    		stu.setId(Integer.parseInt(id));
    		if(studentDAO.update(stu)) {
    		request.setAttribute("MSG", "Successfully Updated!");
    		}
    	}
    	listStudent(request, response);
       }
    }

