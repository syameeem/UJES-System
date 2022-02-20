package ujes.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	static Connection con;
	private static final String DB_DRIVER= "org.postgresql.Driver";
	private static final String DB_CONNECTION= "jdbc:postgres://qzwklakdeifcap:fd2e800c27fb0a95959d3f7955ddb5a52b0508dcd9ed2f7fa3e9c5ddf70517b7@ec2-54-198-213-75.compute-1.amazonaws.com:5432/dbbdc6o3astnk";
	private static final String DB_USER= "qzwklakdeifcap";
	private static final String DB_PASSWORD= "fd2e800c27fb0a95959d3f7955ddb5a52b0508dcd9ed2f7fa3e9c5ddf70517b7";
	
	public static Connection getConnection() {
		// TODO Auto-generated method stub
		try {
			//load driver
			Class.forName(DB_DRIVER);
			
			try {
				//create connection
				con = DriverManager.getConnection(DB_CONNECTION,DB_USER,DB_PASSWORD);
				System.out.println("Connected");
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;
	}
}
