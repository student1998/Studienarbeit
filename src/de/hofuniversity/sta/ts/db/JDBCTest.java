package de.hofuniversity.sta.ts.db;


import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCTest {
	private static final String URL = "jdbc:mysql://localhost/studienArbeitDB";
	private static final String USER = "root";
	private static final String PASS = "root";
	
	public static void main(String[] args) throws Exception {
		Driver driver = (Driver) Class.forName("com.mysql.jdbc.Driver").newInstance();
		DriverManager.registerDriver(driver);
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmt = con.createStatement();
		ResultSet res = stmt.executeQuery("select * from users");
		while(res.next()){
			int id = res.getInt(1);
			String name = res.getString(2);
			String hgid = res.getString(3);
			System.out.printf("%d\t%s\t%d%n", id, name, hgid);
		}
		con.close();
	}

}