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
		String url = "jdbc:mysql://15.165.66.140:3306/TTMarketDB?useSSL=false",
				user = "root",
				password = "1234";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}