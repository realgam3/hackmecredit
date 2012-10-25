package com.hackme;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
//import java.sql.ResultSet;

public class Mysql {
	public static Statement connectDB() {
		String connectionURL = "jdbc:mysql://localhost:3306/hackmedb";
		Connection connection = null;
		Statement statement = null;
		//ResultSet rs = null;
		//String queryString;
		
		try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(connectionURL, "root", "hackme");
		statement = connection.createStatement();
		} catch (Exception e) {
			System.out.println("error in connecting\n" + e.toString());
		}
		return statement;
	}
}
