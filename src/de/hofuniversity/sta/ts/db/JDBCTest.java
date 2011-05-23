package de.hofuniversity.sta.ts.db;


import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

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
			int userID = res.getInt(1);
			String username = res.getString(2);
			String passwort = res.getString(3);
			String firstname = res.getString(4);
			String lastname = res.getString(5);
			Date dateofBirth = res.getDate(6);
			Date regDate = res.getDate(7);
			String city = res.getString(8);
			String street = res.getString(9);
			String housenumber = res.getString(10);
			String postCode = res.getString(11);
			String country = res.getString(12);
			System.out.printf("%d\n%s\n%s\n",userID, username, passwort);
			System.out.printf("%s\n%s\n%s\n",firstname, lastname, dateofBirth);
			System.out.printf("%s\n%s\n%s\n",regDate, city, street);
			System.out.printf("%s\n%s\n%s\n",housenumber, postCode, country);
			
		}
		con.close();
	}

}