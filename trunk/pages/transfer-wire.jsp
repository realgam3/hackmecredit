<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.hackme.Mysql"%>
<%@ page import="java.sql.Statement"%>
<%
	int result = 0;
	int from = (Integer)session.getAttribute("bankID");	
	String to = request.getParameter("to");
	String amount = request.getParameter("amount");
	String comment = "" + request.getParameter("comment");
	
	if( from == Integer.parseInt(to) ) {
		session.setAttribute("error", "You cant send money to your self!");
	}
	else {
		Statement statement = Mysql.connectDB();
		try {
			result = statement.executeUpdate( "INSERT INTO `tblactivities`(`from`, `to`, `amount`, `dateTime`, `comment`) " + 
					  						  "VALUES (" + from + "," + to + "," + amount + ",NOW(),'" + comment + "')" );
		} catch(Exception e) {
			session.setAttribute("error", "The user does not exist!");
		}
	}
			
	response.sendRedirect("../index.jsp?page=transfer");
%>	