<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.hackme.Mysql"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%
	ResultSet rs;
	Statement statement = Mysql.connectDB();
	
	rs = statement.executeQuery( "SELECT * FROM tblcities" );
%>
<h2>SignUp Form</h2>
<div class="posts">
	<form id="regform" action="pages/signup-reg.jsp" method="post">
	    <div class="formLayout">
	        <label for="nino">NINO:</label>
	        <input type="text" id="nino" name="nino" maxlength="9" />
	        <br />
	        <label for="fname">First Name:</label>
	        <input type="text" id="fname" name="fname" maxlength="30" />
			<br />
	        <label for="lname">Last Name:</label>
	        <input type="text" id="lname" name="lname" maxlength="30" />
	        <br />
	        <label for="gender">Gender:</label>
	        <select id="gender" name="gender">
	            <option value="1">Male</option>
	            <option value="0">Female</option>
	        </select>
	        <br />
	        <label for="city">City:</label>
	        <select id="city" name="city">
	        <% while (rs.next()) {%>    	
	            <option value="<%= rs.getInt("id") %>"><%= rs.getString("name").toLowerCase() %></option>
	        <% } 
	           rs.close();
	        %>
	        </select>
	        <br />
	        <label for="address">Address:</label>
	        <input type="text" id="address" name="address" maxlength="35" />
	        <br />
	        <label for="passcode">Passcode:</label>
	        <input type="text" id="passcode" name="passcode" maxlength="7" />
	        <br />
	        <label for="phone">Phone:</label>
	        <input type="text" id="phone" name="phone" maxlength="11" />
	        <br />
	        <label for="birthdate">Birth Date:</label>
	        <input type="text" id="birthdate" name="birthdate" maxlength="10" />
	        <br />
	        <label for="occupation">Occupation:</label>
	        <input type="text" id="occupation" name="occupation" maxlength="40" />
	        <br />
	        <label for="usern">User Name:</label>
	        <input type="text" id="usern" name="usern" maxlength="30" />
	        <br />
	        <label for="passwd">Password:</label>
	        <input type="password" id="passwd" name="passwd" maxlength="32" />
	        <br />
	        <label for="confirm">Confirm:</label>
	        <input type="password" id="confirm" name="confirm" maxlength="32" />
	        <br />
	        <label for="email">Email:</label>
	        <input type="text" id="email" name="email" maxlength="100" />
	        <br />
	        <label for="picture">Picture:</label>
	        <input type="text" id="picture" name="picture" maxlength="150" />
		</div>
		<div class="spacer"></div><!-- Spacer -->
		<button type="submit" form="regform" name="send" id="send" value="send" class="btns"></button>
		<% if(session.getAttribute("error") != null) { %>
				<p id="error" class="errors"><%= session.getAttribute("error") %></p>
		<% 
				session.removeAttribute("error");
			}
		%>
	</form>
</div>