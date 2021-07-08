package kr.co.Kjw.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {

	private static DBConfig instance = new DBConfig();
	private DBConfig() {}
	
	public static DBConfig getInstance() {
		return instance;
	}
	
	// DB 정보
	private final String HOST = "jdbc:mysql://54.180.105.158:3306/kim415272";
	private final String USER = "kim415272";
	private final String PASS = "1234";
	
	public Connection getConnection() throws Exception {
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		// 2단계
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
	}
}
