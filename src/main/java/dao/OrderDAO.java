package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Customer;
import model.Order;
import model.OrderItem;
import model.Student;
import model.User;
import util.DBConnection;

public class OrderDAO{
Connection connection = null;
ResultSet resultSet = null;
Statement statement = null;
PreparedStatement preparedStatement = null;

public int add(Order order) {
    int order_id = -1; // Initialize order_id to a default value

    try {
        String sql = "INSERT INTO orders (user_id, customer_id, order_status) VALUES (?, ?, ?)";
        connection = DBConnection.openConnection();
        preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        preparedStatement.setInt(1, order.getUser_id()); // Assuming user_id is constant
        preparedStatement.setInt(2, order.getCustomer_id());
        preparedStatement.setString(3, order.getOrder_status());

        int rowsInserted = preparedStatement.executeUpdate();
        if (rowsInserted > 0) {
            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                order_id = generatedKeys.getInt(1); // Get the generated order_id
            } else {
                throw new SQLException("Creating order failed, no ID obtained.");
            }
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        // Close resources in a finally block
        try {
            if (preparedStatement != null) {	
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    return order_id;
}



}


