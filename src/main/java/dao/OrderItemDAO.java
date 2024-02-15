package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.OrderItem;
import model.Student;
import model.User;
import util.DBConnection;

public class OrderItemDAO{
Connection connection = null;
ResultSet resultSet = null;
Statement statement = null;
PreparedStatement preparedStatement = null;


	
public boolean add(OrderItem orderItem) {
	
	try {
		String sql = "INSERT INTO order_item (order_id, product_name, order_count , price) VALUES (? , ?, ?, ?)";
		connection = DBConnection.openConnection();
		preparedStatement = 	connection.prepareStatement(sql);
		preparedStatement.setInt(1, orderItem.getOrder_id());
		preparedStatement.setString(2, orderItem.getProduct_name());
		preparedStatement.setInt(3, orderItem.getOrder_count());
		preparedStatement.setInt(4, orderItem.getPrice());
		
		int rowsInserted = preparedStatement.executeUpdate();
		return rowsInserted > 0;
	}catch(SQLException ex) {
		ex.printStackTrace();
	}
	return false;
}

}

