<!DOCTYPE html>
<%@page import="java.util.*,user_pkg.*"%>
<html>
<head>
	<title>Welcome to Digital Address Book</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<center>
		<hr><b><h2>Digital Address Book</h2></b><hr>
		<%
		User user = (User)session.getAttribute("user");
		if(user==null)
		{%>
			<div style="position:absolute;top: 50%; left: 35%;">
				<center>
			<h1>You are not logged in, Please <a href="login.jsp">log in</a> </h1>
				</center>
			</div>
			<%@include file="footer.jsp"%>
		<%}
		else{%>
		<jsp:forward page="digitaladdressbook.jsp"/>
		<%
		}
		%>
	</center>
</body>
</html>
