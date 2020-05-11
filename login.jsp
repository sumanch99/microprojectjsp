<!DOCTYPE html>
<%@page import="java.util.*,user_pkg.*"%>
<link rel="stylesheet" type="text/css" href="style.css">
<html>
<head>
	<title>Welcome to Digital Address Book</title>
	<script language="javascript">
		function validate()
		{
		var n=document.getElementById("username").value;
		var p=document.getElementById("password").value;
		if(n=="")
		{
			alert("use name cannot be empty!");
			document.getElementById("username").focus();
			return false;
		}
		if(p=="")
		{
			alert("password cannot be empty");
			document.getElementById("password").focus();
			return false;
		}
		return true;
		}
	</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<center>
		<%
		User user = (User)session.getAttribute("user");
		if(user==null)
		{%>
			<form method="POST" form="loginform" action="digitaladdressbook.jsp" onsubmit="return validate();">
                <h2>Enter Login Credentials</h2><hr><br><br><br>
                <table>
                    <tr><td>User Name:</td><td><input type="text" name="username" id="username" placeholder="Enter your user name here"></td></tr>
                    <tr><td>Password:</td><td><input type="password" name="password" id="password" placeholder="Enter your password here"></td></tr>
                </table><br>
                <table>
                    <tr><td><input type="submit" name="submit" id="submit" value="log in"></td><td><input type="reset" name="reset" id="reset" value="clear"></td></tr>
                </table>
                <br>Not registered? <a href="signup.jsp">Sign Up here</a>
            </form>
			<%@include file="footer.jsp"%>
		<%}
		else{%>
			You are logged in as <%=user.getName()%><br><br>
		<a href="digitaladdressbook.jsp">Go to Address book</a>
		<%@include file="footer.jsp"%>
		<%
		}
		%>
	</center>
</body>
</html>

