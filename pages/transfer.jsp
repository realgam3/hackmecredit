<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.hackme.Mysql"%>
<%@ page import="com.hackme.Files" %>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%
	HttpServletResponse rsp = Files.getRsp();
	
	Integer userClass = (Integer)session.getAttribute("class");
	if( userClass == null || userClass != 1 ) {
		rsp.sendRedirect("index.jsp?page=homepage");
	}
%>
<h2>Transference</h2>
<div class="posts">
	<form id="transfer-wire" action="pages/transfer-wire.jsp" method="post" onsubmit="return $.checktransference()">
		<table>		
			<tr>
				<td>
					<h4>To</h4>
				</td>
				<td>
					<h4>Amount (In $)</h4>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="to" id="to" />
				</td>
				<td>
					<input type="text" name="amount" id="amount" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<h4>Comments</h4>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea rows="8" cols="60" name="comment"></textarea>
				</td>
			</tr>
		</table>
		<button type="submit" form="transfer-wire" name="send" id="send" value="send" class="btns"></button>
		<% if(session.getAttribute("error") != null) { %>
				<p id="transErr" class="errors"><%= session.getAttribute("error") %></p>
		<% 
				session.removeAttribute("error");
			} else {
		%>
				<p id="transErr" class="errors"></p>
		<%	} %>
	</form>
</div>