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
				user = "ttestt",
				password = "ttestt11#";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}