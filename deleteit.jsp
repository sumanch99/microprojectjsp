<html>
    <head>
        <title>DA Book || Record deleted</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <%@page import="java.sql.*"%>
        <%@ page import="java.util.*,user_pkg.*"%>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <%
        User user = (User)session.getAttribute("user");
        if(user==null)
        {%> 
            <jsp:forward page="index.jsp"/>
        <%}%>
        <center>
            <%
            String num=request.getParameter("number");
            try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/digitaladdressbook", "root", "2311");
            Statement st=conn.createStatement();
            int i=st.executeUpdate("DELETE FROM records WHERE number="+num);
            if(i>0){out.println("Data Deleted Successfully!");}
            else{out.println("Data Deletion Unsuccessful!");}
            %>
            <br><br>
            <input type="button" value="Go To Dashboard" onclick="location.href='digitaladdressbook.jsp'">
            <%
            }
            catch(Exception e)
            {
            }
            %>
            
        </center>
        <%@include file="footer.jsp"%>
    </body>
</html>
