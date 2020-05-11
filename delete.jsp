<html>
    <head>
        <title>DA Book || Delete record</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <%@ page import = "java.sql.*"%>
        <%@ page import = "javax.sql.*"%>
        <%@ page import="java.util.*,user_pkg.*"%>
        <%
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digitaladdressbook","root","2311");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from records");
                
        %>
        <script type="text/javascript">
        function validate()
            {
                var name=document.getElementById("name").value;
                if(name=="")
                {
                    alert("Provide a name to search");
                    document.getElementById("name").focus();
                    return false;
                }
                return true;
            }
            function confirmit()
            {
                if(confirm("Are you sure you want to delete it the record?"))
                {
                    return true;
                }
                else{
                    return false;
                }

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
        <center>
            <hr><font size="5"><b>Delete Records</b></font><hr>
                <form name="deleteform" method="POST" action="viewdelete.jsp" onsubmit="return validate();"> 
                <input type="search" name="name" id="name" placeholder="Search Name here">&nbsp;<input type="submit" value="Search">
                <br>
                <table border="1" width=80% >
                    <tr><td><b>Name</b></td><td><b>Number</b></td><td><b>Address</b></td><td><b>DOB</b></td><td><b>Sex</b></td><td><b>Description</b></td><td><b>Activity</b></td></tr>
                <%
                    while(rs.next())
                    {%> 
                    <tr><td><%=rs.getString("name")%></td><td><%=rs.getString("number")%></td><td><%=rs.getString("address")%></td><td><%=rs.getString("dob")%></td><td><%=rs.getString("sex")%></td><td><%=rs.getString("description")%></td><td><a href="deleteit.jsp?number=<%=rs.getString("number") %>"><button type="button" onclick="return confirmit();" >Delete</button></a></td></tr>
                    <br>
                    <%}
                %>
                </table>
            </form>
                <br><br>
                <input type="button" value="Go To Dashboard" onclick="location.href='digitaladdressbook.jsp'">
        </center>
        <%@include file="footer.jsp"%>
    </body>
</html>
