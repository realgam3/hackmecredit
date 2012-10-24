<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.hackme.*" %>
<%@ page import="java.net.URL" %>
<%! public URL fileURL;%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>HackMe Credit</title>
    <link rel="stylesheet" href="css/default.css" />
	<!--[if IE]>
		<script src="js/html5.js"></script>
	<![endif]-->
	<script src="js/jquery-1.4.min.js"></script>
	<script src="js/jquery.md5.js"></script>
	<script src="js/index.js"></script>
	
    <% 
    	Files.setRsp(response);
    
    	String pageInclude = request.getParameter("page");
    
    	if(pageInclude != null) { 
    		if(pageInclude.equals("signup") || pageInclude.equals("admin")) { %>
    			<script type="text/javascript" src="js/jquery.validate.min.js"></script>
			   	<link rel="stylesheet" href="css/signup.css" />
			<%	if(pageInclude.equals("signup")) { %>
			    	<script src="js/signup.js"></script>
			<%	} %>
			<%	if(pageInclude.equals("admin")) { %>
			    	<script src="js/admin-edit.js"></script>
			<%	} %> 	
    	<% 	} 
    		else if(pageInclude.equals("profile")) { %>
			   	<style>
			   		#main-content .posts img {
			        	display: block;
			            margin: 0 75px;
			            border-radius: 5px;
			   		}
			   		#main-content .posts p {
			   			width: 100%;
			   		}
				   		#main-content .posts p span {
				   			float: right;
				   			width: 300px;
				   			text-align: left;
				   			color: white;
				   		}
			   	</style>
    	<% 	} 
    		else if(pageInclude.equals("notfound")) { %>
			   	<style>
			        #main-content .posts #notfound {
			        	margin: 0 80px;
			        }
				        #main-content .posts #notfound h1 {
				        	color: red;
							font-size: 40px;
							text-shadow: 0.07em 0.07em #333;
				        }
				        #main-content .posts #notfound p {
				        	margin: 0 30px;
				        }
			   	</style>
    	<% 	} 
    		else if(pageInclude.equals("transfer")) { %>
			   	<style>
			        #main-content .posts input {
			        	width: 98%;
			        }
			   	</style>
    	<% 	} %>
    <% } %>
</head>
<body>
    <div id="page-wrap" class="group">
        <div id="main-content">
            <header></header>
			<% 
				//Include Pages
				
				if(pageInclude != null && !pageInclude.equals("")) {
					pageInclude = "/pages/" + pageInclude.trim() + ".jsp";
					fileURL = pageContext.getServletContext().getResource(pageInclude);
					//try {
					if(fileURL != null){ 
			%>
						<jsp:include page="<%= pageInclude %>"></jsp:include>
			<% 		
					//catch(Exeption e) {
					} else { 
							response.sendRedirect("index.jsp?page=notfound");
							return;
				   		}
				} else {
					response.sendRedirect("index.jsp?page=homepage");
					return;
				}
				//To Check If User/Admin
        		int userClass = 0;
        		if(session.getAttribute("class") != null) {
        			userClass = (Integer)session.getAttribute("class");
        		}

			%>
        </div><!-- End main-content -->
        <aside>
            <div id="cards">
                <img src="images/visa.png" alt="visa" />
                <img src="images/mestercard.png" alt="mastercard" />
            </div>
            <div id="members">
            	<% if( userClass <= 0) { %>
                <form id="sign" action="pages/signin.jsp" method="post" onsubmit="return $.checkMembers();">
                    <h3>Members <em>area</em></h3>
                    
                    <label for="user" class="labels">User Name:</label>
					<input type="text" name="user" id="user" class="box" />                    
                    
                    <div class="spacer"></div><!-- Spacer -->
                    <label for="pass" class="labels">Password:</label>
                    <input type="password" name="pass" id="pass" class="box" />
                    
                    <div class="spacer"></div><!-- Spacer -->
                    <button type="submit" form="sign" id="signin" name="signin" value="signin" class="btns"></button>
                    <a href="index.jsp?page=signup" id="signup" class="btns"></a>
                </form>
                <% } else if (userClass == 1) {
                	 	String nino = session.getAttribute("nino").toString();  
                	 	String name = session.getAttribute("name").toString();
                %>
                	<div class="profile">
                		<a href="index.jsp?page=profile&uid=<%= session.getAttribute("bankID") %>"><img src="<%= session.getAttribute("profilePic") %>" alt="<%= nino %>"  /></a>
                		<p><%= name %></p>
                	</div>
                <% } else {%>
                	<div class="profile">
                		<img src="images/profiles/admin.png" alt="admin" />
                		<p>Administrator</p>
                	</div>	
                <% } %>
            </div><!-- End members -->
			<% if (userClass == -1) { %>
				<p class="errors" id="loginErr">forgot your password?</p>
			<% 	session.removeAttribute("class");
				}
				else { 
			%>
				<p class="errors" id="loginErr"></p>
			<%
				}
			%>
            <nav>
                <ul>
                    <li><a href="index.jsp?page=homepage" id="homepage">Home Page</a></li>
                    <!-- <li><a href="index.jsp?page=deals" id="deals">Deals</a></li> -->
                    <% if( userClass == 1) { %>
                     <!-- <li><a href="index.jsp?page=settings" id="settings">Account Settings</a></li> -->
                    <li><a href="index.jsp?page=activities" id="activities">Activities</a></li>
                    <li><a href="index.jsp?page=transfer" id="transfer">Transference</a></li>
                    <% } else if(userClass == 2) { %>
                    <li><a href="index.jsp?page=admin" id="admin">Admin</a></li>
                    <% } if(userClass > 0) { %>
                    <li><a href="pages/signout.jsp">Sign Out</a></li>
                    <% } %>
                    <li><a href="index.jsp?page=thanks" id="thanks">Thanks</a></li>
                </ul>
            </nav>
            <div id="services">
	            <h3>Services <em>Overviews</em></h3>
	            <p>
					HackMe provides you transferring money to friends and family<br />
					using their code number without paying any fee.
	            </p>
	            <a href="index.jsp?page=homepage&post=services" class="more">read more</a>
            </div><!-- End services -->
        </aside>
    </div><!-- End page-wrap -->
    <footer>
        <p>Copyright© HackMe Credit, All rights Reserved.</p>
    </footer>
</body>
</html>
