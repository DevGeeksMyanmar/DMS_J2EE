package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Student;
import util.DBConnection;

public class StudentDAO{
Connection connection = null;
ResultSet resultSet = null;
Statement statement = null;
PreparedStatement preparedStatement = null;

public List<Student> get() {
	List<Student> list = null;
	Student student = null;

	try {
	    list = new ArrayList<Student>();
	    String sql = "SELECT * FROM tbl_student";
	    connection = DBConnection.openConnection();
	    statement = connection.createStatement();
	    resultSet = statement.executeQuery(sql);
	    while(resultSet.next()) {
			student = new Student();
			
			student.setId(resultSet.getInt("id"));
			student.setName(resultSet.getString("name"));
			student.setRollno(resultSet.getString("rollno"));
			student.setEmail(resultSet.getString("email"));
			list.add(student);
	    }
	}catch(SQLException e) {
	   e.printStackTrace();
	}
	
	
	return list;
	}

public Student get(int id) {
	   Student student = null;
	   try {
		student = new Student();
		String sql = "SELECT * FROM tbl_student where id="+id;
		connection = DBConnection.openConnection();
		statement = connection.createStatement();
		resultSet = statement.executeQuery(sql);
		if(resultSet.next()) {
			student.setId(resultSet.getInt("id"));
			student.setName(resultSet.getString("name"));
			student.setRollno(resultSet.getString("rollno"));
			student.setEmail(resultSet.getString("email"));
			}
		}catch(SQLException e) {
		e.printStackTrace();
	      }
	    return student;
	}

public boolean save(Student stu) {
	   boolean flag = false;
	   try {
		String sql = "INSERT INTO tbl_student(name, rollno, email) VALUES (?,?,?)";
		connection = DBConnection.openConnection();
		preparedStatement = 	connection.prepareStatement(sql);
		preparedStatement.setString(1, stu.getName());
		preparedStatement.setString(2, stu.getRollno());
		preparedStatement.setString(3, stu.getEmail());
		int rowInserted = preparedStatement.executeUpdate();
		if (rowInserted > 0) flag = true;
		}catch(SQLException ex) {
		ex.printStackTrace();
	      }
	   return flag;
	}

public boolean delete(int id) {
	   boolean flag = false;
	   try {
	   String sql = "DELETE FROM tbl_student where id="+id;
		connection = DBConnection.openConnection();
		preparedStatement = connection.prepareStatement(sql);
		int rowDeleted = preparedStatement.executeUpdate();
		if(rowDeleted>0) flag = true;
		}catch(SQLException e) {
		e.printStackTrace();
		}
	   return flag;
	}

public boolean update(Student stu) {
	   boolean flag = false;
	   try {
		String sql = "UPDATE tbl_student SET name = ?, rollno = ?, email = ? where id = ?";
		connection = DBConnection.openConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, stu.getName());
		preparedStatement.setString(2, stu.getRollno());
		preparedStatement.setString(3, stu.getEmail());
		preparedStatement.setInt(4, stu.getId());
		int rowUpdated = preparedStatement.executeUpdate();
		if (rowUpdated>0) flag = true;
		}catch(SQLException e) {
		e.printStackTrace();
		}
		return flag;
	   }
	}


