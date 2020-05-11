<!DOCTYPE html>
<%@ page import="user_pkg.*"%>
<html>
<head>
	<title></title>
</head>
<body>
	<%
	session.invalidate();
	%>
	<jsp:forward page="login.jsp"/>
</body>
</html>