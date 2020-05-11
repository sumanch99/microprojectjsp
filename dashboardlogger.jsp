<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <%@ page import = "java.sql.*"%>
        <%@ page import = "javax.sql.*"%>
        <%@ page import="java.util.*,user_pkg.*"%>
    <title>Dashboard</title>
    <script language="javascript">
        function not_permitted()
        {
            alert("Username updation not permitted!");
        }
    </script>
</head>
<body>
    <%@include file="header.jsp"%>
    <%
        User user = (User)session.getAttribute("user");
        if(user==null)
        {%> 
            <jsp:forward page="index.jsp"/>
        <%}%>
        <hr>
        <div style="height: 25px;width: 100%; background-color: rgb(244, 246, 247);">
            <input type="button" style="background-color: rgb(32, 41, 41);color: white;" onclick="location.href='dashboardlogger.jsp?username=<%=user.getUsername()%>'" value="Welcome <%=user.getName()%>">
            <input type="button" onclick="location.href='logout.jsp'" value="Log Out">
            <input type="button" onclick="location.href='myrecord.jsp'" value="My contribution">
            <input type="button" onclick="location.href='digitaladdressbook.jsp'" value="Address Book">
            </div>
            <hr>
	<center>
        
    <b>Dashboard</b><hr>
    <br><br>
    <br><br>
    <form method="POST" action="updateuser.jsp" onsubmit="return validate();">
        <table>
        <tr><td>Name:</td><td><input type="text" name="name" value=<%=user.getName()%>><br></td></tr>
        <tr><td>Username:</td><td><input type="text" readonly onclick="return not_permitted();" name="username" value=<%=user.getUsername()%>><br></td></tr>
        <tr><td>Email id:</td><td><input type="email" name="email" value=<%=user.getEmail()%>><br></td></tr>
        <tr><td>password:</td><td><input type="text" name="password" value=<%=user.getPassword()%>><br></td></tr>
        </table>
        <br><br>
        <input type="submit" value="Update details">
        <input type="button" value="Go To Address Book" onclick="location.href='digitaladdressbook.jsp'"> &nbsp; <input type="button" value="Log Out" onclick="location.href='logout.jsp'">
    </form>
    <br><br>
	</center>
	<%@include file="footer.jsp"%>
</body>
</html>