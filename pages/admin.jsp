<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.hackme.Mysql"%>
<%@ page import="com.hackme.Files" %>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%
	HttpServletResponse rsp = Files.getRsp();
	
	String uid = null;
	uid = request.getParameter("uid");
	Integer userClass = null;
	userClass = (Integer)session.getAttribute("class");
	
	if( userClass == null || userClass != 2 ) {
		rsp.sendRedirect("index.jsp?page=homepage");
	}
%>
	<h2>Admin</h2>
	<div class="posts">
<%
	if(uid != null && !uid.equals("")) {
		//Action: 1=Edit, -1=Delete
		int action = 0;
		action = Integer.parseInt(request.getParameter("action"));
		
		Statement statement = Mysql.connectDB();
		switch (action) {
			case 1:
				ResultSet rs;
				String options = "";
				int gender = 1;
				int city = 1;
				
				rs = statement.executeQuery( "SELECT * FROM tblcities" );
		        while (rs.next()) {
		        	options += "<option value=\"" + rs.getInt("id") + "\">" + rs.getString("name").toLowerCase() + "</option>\n";
				} 
				rs.close();
				
				rs = statement.executeQuery( "SELECT `bankID`, `nino`, `firstName`, `lastName`, `gender`, `address`, `city`, `passcode`, `phone`, DATE_FORMAT(`birthday`,'%d/%m/%Y') as birthday, " +
											 "`occupation`, `username`, `password`, `email`, `pictureURL` FROM `tblusers` WHERE bankID = " +  uid);
		        while (rs.next()) {
%>
				<form id="regform" action="pages/admin-update.jsp" method="post">
				    <div class="formLayout">
				    	<input type="hidden" id="bankID" name="bankID" value="<%= rs.getInt("bankID") %>" />
				    	
				        <label for="nino">NINO:</label>
				        <input type="text" id="nino" name="nino" maxlength="9" value="<%= rs.getString("nino") %>" />
				        <br />
				        <label for="fname">First Name:</label>
				        <input type="text" id="fname" name="fname" maxlength="30" value="<%= rs.getString("firstName") %>" />
						<br />
				        <label for="lname">Last Name:</label>
				        <input type="text" id="lname" name="lname" maxlength="30" value="<%= rs.getString("lastName") %>" />
				        <br />
				        <label for="gender">Gender:</label>
				        <input id="genderValue" type="hidden" value="<%= rs.getInt("gender") %>" />
				        <select id="gender" name="gender">
				            <option value="1">Male</option>
				            <option value="0">Female</option>
				        </select>
				        <br />
				        <label for="city">City:</label>
				        <input id="cityValue" type="hidden" value="<%= rs.getInt("city") %>" />
				        <select id="city" name="city">
				        	<%= options %>
				        </select>
				        <br />
				        <label for="address">Address:</label>
				        <input type="text" id="address" name="address" maxlength="35" value="<%= rs.getString("address") %>" />
				        <br />
				        <label for="passcode">Passcode:</label>
				        <input type="text" id="passcode" name="passcode" maxlength="7" value="<%= rs.getString("passcode") %>" />
				        <br />
				        <label for="phone">Phone:</label>
				        <input type="text" id="phone" name="phone" maxlength="11" value="0<%= rs.getString("phone") %>" />
				        <br />
				        <label for="birthdate">Birth Date:</label>
				        <input type="text" id="birthdate" name="birthdate" maxlength="10" value="<%= rs.getString("birthday") %>" />
				        <br />
				        <label for="occupation">Occupation:</label>
				        <input type="text" id="occupation" name="occupation" maxlength="40" value="<%= rs.getString("occupation") %>" />
				        <br />
				        <label for="usern">User Name:</label>
				        <input type="text" id="usern" name="usern" maxlength="30" value="<%= rs.getString("username") %>" />
				        <br />
				        <label for="passwd">Password:</label>
				        <input type="password" id="passwd" name="passwd" maxlength="32" />
				        <br />
				        <label for="email">Email:</label>
				        <input type="text" id="email" name="email" maxlength="100" value="<%= rs.getString("email") %>" />
				        <br />
				        <label for="picture">Picture:</label>
				        <input type="text" id="picture" name="picture" maxlength="150" value="<%= rs.getString("pictureURL") %>" />
					</div>
					<div class="spacer"></div><!-- Spacer -->
					<button type="submit" form="regform" name="send" id="send" value="send" class="btns"></button>
				</form>
<%
				} 
				rs.close();
				break;
			case -1:
				int result = 0;
				result = statement.executeUpdate("DELETE FROM tblusers WHERE bankID = " + uid);
			default:
				rsp.sendRedirect("index.jsp?page=admin");
				break;
		}

	} else { 
%>
<%
		ResultSet rs;
		Statement statement = Mysql.connectDB();
		
		rs = statement.executeQuery( "SELECT `bankID`, `firstName`, `lastName`, `username`, `email` FROM tblusers" );
	%>
			<table>
				<tr>
					<td>BankID</td>
					<td>First Name</td>
					<td>last Name</td>
					<td>User Name</td>
					<td>Action</td>
				</tr>
	<%
		int i = 1;
		while (rs.next()) {
	%>
				<tr>
					<td><p><%= rs.getInt("bankID") %></p></td>
					<td><p><%= rs.getString("firstName") %></p></td>
					<td><p><%= rs.getString("lastName") %></p></td>
					<td><p><%= rs.getString("username") %></p></td>
					<%-- Action: 1=Edit, -1=Delete --%>
					<td><p><a href="index.jsp?page=admin&action=1&uid=<%= rs.getInt("bankID") %>">Edit</a> / <a href="index.jsp?page=admin&action=-1&uid=<%= rs.getInt("bankID") %>">Delete</a></p></td>
				</tr>
	<%	} rs.close(); %>
	        </table>
<% 	} %>
	</div>