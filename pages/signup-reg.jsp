<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.hackme.Mysql"%>
<%@ page import="com.hackme.Security"%>
<%@ page import="java.sql.Statement"%>
<%
	if(request.getParameter("send") != null) {	
		int result = 0;
		String nino = request.getParameter("nino");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String gender = request.getParameter("gender");
		String city = request.getParameter("city");
		String address = request.getParameter("address");
		String passcode = request.getParameter("passcode");
		String phone = request.getParameter("phone");
		String birthdate = request.getParameter("birthdate");
		String occupation = request.getParameter("occupation");
		String usern = request.getParameter("usern");
		String passwd = request.getParameter("passwd");
		String email = request.getParameter("email");
		String picture = request.getParameter("picture");
		
		Statement statement = Mysql.connectDB();
		try {
			passwd = Security.MD5(passwd);
			result = statement.executeUpdate( "INSERT INTO `tblusers`(`nino`, `firstName`, `lastName`, `gender`, `address`, `city`, " +
									  		  "`passcode`, `phone`, `birthday`, `occupation`, `username`, `password`, `email`, `pictureURL`) " +
									  		  "VALUES ('" + nino + "','" + fname + "','" + lname + "'," + gender + ",'" + address + "'," + city + ",'" + passcode +
											  "'," + phone + ",STR_TO_DATE('" + birthdate + "','%d/%m/%Y'),'" + occupation + "','" + usern + "','" + passwd + "','" + email + "','" + picture + "')" );			
		} catch(Exception e) {
			session.setAttribute("error", "The user already exist!");
			System.out.println(e);
			response.sendRedirect("../index.jsp?page=signup");
		}
	}
	response.sendRedirect("../index.jsp?page=homepage");
%>	