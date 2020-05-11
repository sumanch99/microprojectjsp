<html>
    <head>
        <title>DA Book || Search record</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <%@ page import = "java.sql.*"%>
        <%@ page import = "javax.sql.*"%>
        <%@ page import="java.util.*,user_pkg.*"%>
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
        </script>
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
        <hr><b><font size="5">Showing All Records</font></b><hr>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digitaladdressbook","root","2311");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from records");
            %>
            <form method="POST" action="view.jsp" name="viewform" onsubmit="return validate();">
                <input type="search" name="name" id="name" placeholder="Search Name here">&nbsp;<input type="submit" value="Search">
                <br>
                <table border="1" width=60%>
                    <tr><td><b>Name</b></td><td><b>Number</b></td><td><b>Address</b></td><td><b>DOB</b></td><td><b>Sex</b></td><td><b>Description</b></td></tr>
                <%
                    int flag=0;
                    while(rs.next())
                    {   flag=1;
                        %> 
                    <tr><td><%=rs.getString("name")%></td><td><%=rs.getString("number")%></td><td><%=rs.getString("address")%></td><td><%=rs.getString("dob")%></td><td><%=rs.getString("sex")%></td><td><%=rs.getString("description")%></td></tr>
                    <br>
                    <%}
                    if(flag==0)
                    {
                        out.print("No Records Found!");
                    }
                %>
                </table>
                <br><br>
                <input type="button" value="Go To Dashboard" onclick="location.href='digitaladdressbook.jsp'">
        </form>
        </center>
        <%@include file="footer.jsp"%>
    </body>
</html>
