<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
	<title>Registration Page</title>
	<script type="text/javascript">
		function validate()
		{
            var name=document.getElementById("name").value;
            var username=document.getElementById("username").value;
            var email=document.getElementById("email").value;
			var a=document.getElementById("password").value;
            var b=document.getElementById("password2").value;
            if(name=="")
            {
                alert("Provide name.");
                document.getElementById("name").focus();
                return false;
            }
            if(username=="")
            {
                alert("Provide username.");
                document.getElementById("username").focus();
                return false;
            }
            if(email=="")
            {
                alert("Provide email id.");
                document.getElementById("email").focus();
                return false;
            }
            var at=email.indexOf('@');
            email=email.split("").reverse().join("");
            var dot=email.length-1-email.indexOf('.');
            email=email.split("").reverse().join("");
            if(at==-1||dot==-1||dot-at<2||dot==email.length-1)
            {
                alert("Provide email id in correct format.");
                document.getElementById("email").focus();
                return false;
            }
			if(a!=b)
			{
				alert("Passwords didn't match");
				document.getElementById("password2").focus();
				return false;
			}
			if(a.length<5)
			{
				alert("Password should be of atleast 5 characters");
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
    
    <form action="dashboard.jsp" method="POST" onsubmit="return validate();">
        <hr><h2>Provide Sign Up details</h2><hr><br>
		<table>
			<tr>
				<td align="right">Enter Name:</td>
                <td><input type="text" name="name" id="name" size="30"/></td>
            </tr>
            <tr>
				<td align="right">Enter User Name:</td>
                <td><input type="text" name="username" id="username" size="30"/></td>
            </tr>
            <tr>
				<td align="right">Email:</td>
				<td><input type="text" name="email" id="email" size="30"></td>
			</tr>
			<tr>
				<td align="right">Password:</td>
				<td><input type="password" name="password" id="password" size="30"/></td>
            </tr>
            <tr>
                <td align="right">Confirm Password:</td>
				<td><input type="password" name="password2" id="password2" size="30"/></td>
			</tr>
		</table>
		<br><br>
		<input type="submit" value="SIGN UP">
		<input type="reset" value="CLEAR">
		
    </form>
    <br>Already registered? <a href="login.jsp">Log in here</a>
</center>
<%@include file="footer.jsp"%>
</body>
</html>