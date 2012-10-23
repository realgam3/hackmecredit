<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.hackme.Mysql"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%
	String uid = null;
	uid = request.getParameter("uid");
	ResultSet rs;
	Statement statement = Mysql.connectDB();
	
	rs = statement.executeQuery( "SELECT `bankID`, `nino`, `firstName`, `lastName`, `gender`, `address`, c.name as cityName, " +
								 "`passcode`, `phone`, DATE_FORMAT(`birthday`,'%d/%m/%Y') as birthday, `occupation`, `username`, `email`, `pictureURL` FROM tblusers as u " +
								 "INNER JOIN tblcities as c " + 
								 "ON u.`city` = c.id " + 
								 "WHERE bankID = " + uid );
	while (rs.next()) {
%>
	<h2>Profile</h2>
	<div class="posts">
		<img src="<%= rs.getString("pictureURL") %>" alt="<%= rs.getString("firstName") + " " + rs.getString("lastName") %>" />
		<p>BankID: <span><%= rs.getInt("bankID") %></span></p>
        <p>NINO: <span><%= rs.getString("nino") %></span></p>
		<p>First Name: <span><%= rs.getString("firstName") %></span></p>
		<p>last Name: <span><%= rs.getString("lastName") %></span></p>
		<p>Gender: <span><%= rs.getBoolean("gender") ? "Male" : "Female" %></span></p>
        <p>City: <span><%= rs.getString("cityName") %></span></p>
        <p>Address: <span><%= rs.getString("address") %></span></p>
		<p>Passcode: <span><%= (rs.getString("passcode") != null) ? rs.getString("passcode") : "" %></span></p>
        <p>Phone: <span>0<%= rs.getString("phone") %></span></p>
        <p>Birth Date: <span><%= rs.getString("birthday") %></span></p>
        <p>Occupation: <span><%= (rs.getString("occupation") != null) ? rs.getString("occupation") : "" %></span></p>
        <p>User Name: <span><%= rs.getString("username") %></span></p>
        <p>Email: <span><%= rs.getString("email") %></span></p>
	</div>
<%	
	} 
	rs.close();
%>