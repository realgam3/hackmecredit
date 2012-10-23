<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.hackme.Mysql"%>
<%@ page import="com.hackme.Files" %>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%
	HttpServletResponse rsp = Files.getRsp();
	
	Integer userClass = (Integer)session.getAttribute("class");
	if( userClass ==null || userClass != 1 ) {
		rsp.sendRedirect("index.jsp?page=homepage");
		return;
	}
%>
<h2>Activities</h2>
<div class="posts">
	<table>
		<tr>
			<td colspan="5">
				<h3>Outgoing actions</h3>
			</td>
		</tr>		
		<tr>
			<td>
				<h4>ID</h4>
			</td>		
			<td>
				<h4>From</h4>
			</td>
			<td>
				<h4>To</h4>
			</td>
			<td>
				<h4>Amount</h4>
			</td>
			<td>
				<h4>Date And Time</h4>
			</td>
		</tr>
		<%
			ResultSet rs;
			Statement statement = Mysql.connectDB();
			int bankID = (Integer)session.getAttribute("bankID");
			
			rs = statement.executeQuery( "SELECT `id`, ua.bankID as from_id, CONCAT(ua.firstName,' ',ua.lastName) as from_name, " +
										 "`amount`, ub.bankID as to_id, `dateTime`, CONCAT(ub.firstName,' ',ub.lastName) as to_name, `comment` " +
										 "FROM `tblactivities` as a " +
										 "INNER JOIN tblusers ua " +
										 "ON a.`from` = ua.bankID " +
										 "INNER JOIN tblusers ub " +
										 "ON a.`to` = ub.bankID " +
									     "WHERE `from` = " + bankID );
			while (rs.next()) {
		%>
			<tr>
				<td rowspan="2">
					<p><%= rs.getInt("id") %></p>
				</td>
				<td>
					<p>
						<a href="index.jsp?page=profile&uid=<%= rs.getInt("from_id") %>"><%= rs.getString("from_name") %></a>
					</p>
				</td>
				<td>
					<p>
						<a href="index.jsp?page=profile&uid=<%= rs.getInt("to_id") %>"><%= rs.getString("to_name") %></a>
					</p>
				</td>
				<td>
					<p><%= rs.getInt("amount") %>$</p>
				</td>
				<td>
					<p><%= rs.getDate("dateTime") %></p>
					<p><%= rs.getTime("dateTime") %></p>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<p><%= (rs.getString("comment") != null) ? rs.getString("comment") : "" %></p>
				</td>
			</tr>
		<%
			}
			rs.close();
		%>
		<tr>
			<td colspan="5">
				<h3>Incoming actions</h3>
			</td>
		</tr>
		<%
			rs = statement.executeQuery( "SELECT id, ua.bankID as from_id, CONCAT(ua.firstName,' ',ua.lastName) as from_name, " +
										 "amount, ub.bankID as to_id, dateTime, CONCAT(ub.firstName,' ',ub.lastName) as to_name, `comment` " +
										 "FROM `tblactivities` as a " +
										 "INNER JOIN tblusers ua " +
										 "ON a.`from` = ua.bankID " +
										 "INNER JOIN tblusers ub " +
										 "ON a.`to` = ub.bankID " +
									     "WHERE `to` = " + bankID );
		
			while (rs.next()) {
		%>
			<tr>
				<td rowspan="2">
					<p><%= rs.getInt("id") %></p>
				</td>
				<td>
					<p>
						<a href="index.jsp?page=profile&uid=<%= rs.getInt("from_id") %>"><%= rs.getString("from_name") %></a>
					</p>
				</td>
				<td>
					<p>
						<a href="index.jsp?page=profile&uid=<%= rs.getInt("to_id") %>"><%= rs.getString("to_name") %></a>
					</p>
				</td>
				<td>
					<p><%= rs.getInt("amount") %>$</p>
				</td>
				<td>
					<p><%= rs.getDate("dateTime") %></p>
					<p><%= rs.getTime("dateTime") %></p>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<p><%= (rs.getString("comment") != null) ? rs.getString("comment") : "" %></p>
				</td>
			</tr>
		<%
			}
			rs.close();
		%>		
	</table>
</div>