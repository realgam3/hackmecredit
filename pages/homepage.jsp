<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.hackme.Files"%>
<%
	if(request.getParameter("page").equals("homepage")) {
		String pageInc = request.getParameter("post");
		
		if(pageInc != null && !pageInc.equals("")) {
			Files.fileShow(request, pageInc.trim(), out);
		}
		else {
			Files.fileShow(request, "home", out);
		}
		
	}
%>