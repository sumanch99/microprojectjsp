<html>
    <head>
        <title>DA Book || My Records</title>
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
        <%
            User user = (User)session.getAttribute("user");
            if(user==null)
            {%> 
                <jsp:forward page="index.jsp"/>
        <%}%>
        <%
        if(!(user==null))
        {%>
            <hr>
            <div style="height: 27px;width: 100%; background-color: rgb(241, 243, 245);">
            <input type="button" onclick="location.href='dashboardlogger.jsp?username=<%=user.getUsername()%>'" value="Welcome <%=user.getName()%>">
            <input type="button" onclick="location.href='logout.jsp'" value="Log Out">
            <input type="button" style="background-color: rgb(32, 41, 41); color: white;" onclick="location.href='myrecord.jsp'" value="My contribution">
            <input type="button" onclick="location.href='digitaladdressbook.jsp'" value="Address Book">
            </div>
            <hr>
        <%}
        if(user==null)
		{%> 
			<jsp:forward page="index.jsp"/>
        <%}%>
        <center>
        <%
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digitaladdressbook","root","2311");
                Statement st=con.createStatement();
                String username=user.getUsername();
                String delete="delete";
                String update="update";
                ResultSet rs=st.executeQuery("select * from records where adder like'"+username+"%"+"'" );
            %>
            <hr><h2>Records added by <%=user.getName()%></h2><hr>
            <form method="POST" action="viewmyrecords.jsp" name="viewform" onsubmit="return validate();">
                <input type="search" name="name" id="name" placeholder="Search here">&nbsp;<input type="submit" value="Search">
            </form>
            <form name="frm2" action="actionmyrecords.jsp">
            <table border="1" width=60%>
                <tr><td><b>Name</b></td><td><b>Number</b></td><td><b>Address</b></td><td><b>DOB</b></td><td><b>Sex</b></td><td><b>Description</b></td><td><b>Action</b></td></tr>
            <%
            int flag=0;
            while(rs.next())
            {   flag=1;
                String num = rs.getString("number");
                %> 
            <tr><td><%=rs.getString("name")%></td><td><%=rs.getString("number")%></td><td><%=rs.getString("address")%></td><td><%=rs.getString("dob")%></td><td><%=rs.getString("sex")%></td><td><%=rs.getString("description")%></td><td><a href="actionmyrecords.jsp?number=<%=num%>&action=<%=update%>" style="background-color: darkslategray; padding: 1%;text-decoration: none;color: snow;"> Edit </a>&nbsp;<a href="actionmyrecords.jsp?number=<%=num%>&action=<%=delete%>" style="background-color: darkslategray; padding: 1%;text-decoration: none;color: snow;">Delete</button></td></tr>
            <%}
            if(flag==0)
            {
                out.print("No Records Found!");
            }
            %>
            
        </form>
        
        </center>
        
        <%@include file="footer.jsp"%>
        
    </body>
</html>
