package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import controller.Hash;
import model.Customer;
import model.Student;
import model.User;
import util.DBConnection;
public class CustomerDAO{
Connection connection = null;
ResultSet resultSet = null;
Statement statement = null;
PreparedStatement preparedStatement = null;


public int add(Customer customer) {
    int customer_id = -1; // Initialize customer_id to a default value

    try {
        String sql = "INSERT INTO customer (customer_name, customer_phone, city, township, detail_address) VALUES (?, ?, ?, ?, ?)";
        connection = DBConnection.openConnection();
        preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        preparedStatement.setString(1, customer.getCustomer_name());
        preparedStatement.setString(2, customer.getCustomer_phone());
        preparedStatement.setString(3, customer.getCity());
        preparedStatement.setString(4, customer.getTownship());
        preparedStatement.setString(5, customer.getDetail_address());

        int rowsInserted = preparedStatement.executeUpdate();
        if (rowsInserted > 0) {
            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                customer_id = generatedKeys.getInt(1);
               
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
    return customer_id;
}

}

