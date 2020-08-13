package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static DBConnection instance;
	
	private DBConnection() {}
	
	public static DBConnection getInstance() {
		return (instance == null) ? new DBConnection() : instance;
	}
	
	public Connection getConnection() {
		Connection connection = null;
		String url = "jdbc:oracle:thin:@15.165.66.140:1521:xe",
				user = "ttestt",
				password = "ttestt11";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}