	package util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static Connection connection = null;
	public static Connection openConnection() {
	try{
            Class.forName("com.mysql.cj.jdbc.Driver"); 
<<<<<<< HEAD
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/DMS","root","Pkko300274#");
=======
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dms","root","");
>>>>>>> 551139d99aab8da241b1b3cb7f942aedbb41ecdd
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            } 
            return connection;
     }
}
