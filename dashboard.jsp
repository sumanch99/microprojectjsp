<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <%@ page import = "java.sql.*"%>
        <%@ page import = "javax.sql.*"%>
        <%@page import="java.util.*,user_pkg.*"%>
	<title>Dashboard</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<center>
    <%
        String name =request.getParameter("name");
        String username =request.getParameter("username");
        String email =request.getParameter("email");
        String password =request.getParameter("password");
        if(name==null&&username==null&&email==null&&password==null)
        {%>
            <jsp:forward page="index.jsp"/> 
        <%}
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digitaladdressbook","root","2311");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from users where username ='"+username+"'" );
        if(rs.next())
        {%>
            <jsp:forward page="duplicateuser.jsp"/>
        <%}
        int i=st.executeUpdate("INSERT INTO users (username, name, email, password) VALUES ('"+username+"','"+ name+"','"+ email+"','"+password+"')");
        out.print("Successfully registered!");
    %>
    <br><br>
    <table border="1" width="40%">
        <tr><td align="center"><h3>Name:</h3></td> <td align="center"><h3><%=name%></h3></td></tr>
        <tr><td align="center"><h3>Username:</h3></td> <td align="center"><h3><%=username%></h3></td></tr>
       <tr><td align="center"><h3>Email id:</h3></td> <td align="center"><h3><%=email%></h3></td></tr>
        <tr><td align="center"><h3>password: </h3></td><td align="center"><h3><%=password%></h3></td></tr>
    </table>
    <br>
    <input type="button" value="Go To Log In Page" onclick="location.href='login.jsp'">
	</center>
	<%@include file="footer.jsp"%>
</body>
</html>