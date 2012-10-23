<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	//Reset Session
	session.invalidate();
	response.sendRedirect("../index.jsp?page=homepage");
 %>