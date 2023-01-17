package com.dollop.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	static Connection con = null;

	public static Connection getConnection() {
		if (con != null)
			return con;
		return getConnection("contact_book", "root", "Rahul@9981");
	}

	private static Connection getConnection(String dbname, String username, String pass) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbname, username, pass);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
	}
}
