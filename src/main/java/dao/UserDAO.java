package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import controller.Hash;
import model.Student;
import model.User;
import util.DBConnection;

public class UserDAO{
Connection connection = null;
ResultSet resultSet = null;
Statement statement = null;
PreparedStatement preparedStatement = null;


public void createUser(User user) {
	try {
		String sql = "INSERT INTO users(name, email, hashed_password) VALUES (?,?,?)";
		connection = DBConnection.openConnection();
		preparedStatement = 	connection.prepareStatement(sql);
		preparedStatement.setString(1, user.getName());
		preparedStatement.setString(2, user.getEmail());
		preparedStatement.setString(3, user.getHashed_password());
		preparedStatement.executeUpdate();
	}catch(SQLException ex) {
		ex.printStackTrace();
	}
}

public List<User> get() {
	List<User> list = null;
	User user = null;

	try {
	    list = new ArrayList<User>();
	    String sql = "SELECT * FROM users";
	    connection = DBConnection.openConnection();
	    statement = connection.createStatement();
	    resultSet = statement.executeQuery(sql);
	    while(resultSet.next()) {
			user = new User();
			
			user.setName(resultSet.getString("name"));
			user.setEmail(resultSet.getString("email"));
//			user.setHashed_password(resultSet.getString("hashed_password"));
			list.add(user);
	    }
	}catch(SQLException e) {
	   e.printStackTrace();
	}
    return list;
}



public User get(int id) {
	   User user = null;
	   try {
		user = new User();
		String sql = "SELECT * FROM users where id="+id;
		connection = DBConnection.openConnection();
		statement = connection.createStatement();
		resultSet = statement.executeQuery(sql);
		if(resultSet.next()) {
			
			user.setName(resultSet.getString("name"));
			user.setEmail(resultSet.getString("email"));
//			user.setHashed_password(resultSet.getString("hashed_password"));
			}
		}catch(SQLException e) {
		e.printStackTrace();
	      }
	    return user;
	}

public boolean validateUser(String email, String password) {
    boolean isValid = false;

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        // Establish the connection
    	connection = DBConnection.openConnection();

        // Prepare the statement
        String sql = "SELECT hashed_password FROM users WHERE email = ?";
        pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, email);
        

        // Execute the query
        rs = pstmt.executeQuery();

        // Process the result set
        if (rs.next()) {
        	boolean isMatch = Hash.verifyPassword(password, rs.getString("hashed_password"));
        	if(isMatch) {
        		isValid = true;
        	}
        }
    } catch (SQLException e) {
        // Handle the exception
        e.printStackTrace();
    } finally {
        // Close the resources
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return isValid;
}

}

