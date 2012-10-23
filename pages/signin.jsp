<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.hackme.Mysql"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%!
	boolean isValidValue(String value) {
		if(value == null || (value.trim()).equals(""))
			return false;
		return true;
	}
%>
<%
	ResultSet rs;
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	String signin = request.getParameter("signin");
	int userClass = -1; // 1=User, 2=Admin. -1=Password Unknown
	//String method = request.getMethod().toUpperCase();
	
	//if( signin != null && method.equals("POST")) {
	if(isValidValue(signin)) {
		//a1887551fcac53a7a752561462fe676c = MadeByTomerZait
		if(user.toLowerCase().equals("admin") && pass.equals("a1887551fcac53a7a752561462fe676c")) {
			userClass = 2;
		} else {
			Statement statement = Mysql.connectDB();
			rs = statement.executeQuery("SELECT firstName, lastName, bankID, nino, pictureURL FROM tblusers " +
										"WHERE userName = '" + user + "'" + 
										" AND " +
										"password = '" + pass + "'");
			
			if( isValidValue(user) && isValidValue(pass) && rs.next() ) {
				userClass = 1;
				
				session.setAttribute("name", rs.getString("firstName") + " " + rs.getString("lastName"));
				session.setAttribute("bankID", rs.getInt("bankID"));
				session.setAttribute("nino", rs.getString("nino"));
				session.setAttribute("profilePic", rs.getString("pictureURL"));
				rs.close();
			}
		}
		session.setAttribute("class", userClass);
%>
<%	}
	response.sendRedirect("../index.jsp?page=homepage");
%>	