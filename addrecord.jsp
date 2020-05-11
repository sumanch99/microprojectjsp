<html>
    <head>
        <title>DA Book || New record added</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <%@ page import = "java.sql.*"%>
        <%@ page import = "javax.sql.*"%>
        <%@page import="java.util.*,user_pkg.*"%>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <center>
            <%
            User user = (User)session.getAttribute("user");
            if(user==null)
            {%> 
                <jsp:forward page="index.jsp"/>
            <%}%>
            <%
                String name=request.getParameter("name");
                String address=request.getParameter("address");
                String number = request.getParameter("number");
                String dob=request.getParameter("dob");
                String sex = request.getParameter("sex");
                String notes = request.getParameter("notes");
            %>
            Record added successfully<br><br><br>
            <table border="2px">
                <tr><td>Name</td><td>Address</td><td>Phone Number</td><td>DOB</td><td>Gender</td><td>Notes</td></tr>
                <tr><td><%out.print(name);%></td><td><%out.print(address);%></td><td><%out.print(number);%></td><td><%out.print(dob);%></td><td><%out.print(sex);%></td><td><%out.print(notes);%></td></tr>
            </table>
            <%String username=user.getUsername();%>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digitaladdressbook","root","2311");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from records where number ='"+number+"'" );
                if(rs.next())
                {%>
                    <jsp:forward page="duplicate.jsp"/>
                <%}
                int i=st.executeUpdate("INSERT INTO records VALUES ('"+number+"','"+ name+"','"+ address+"','"+dob+"','"+sex+"','"+notes+"','"+username+"')");
            %>
            <br><br>
            <input type="button" value="Go To Dashboard" onclick="location.href='digitaladdressbook.jsp'">
            <br><br>
        </center>
        <%@include file="footer.jsp"%>
    </body>
</html>
