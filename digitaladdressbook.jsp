<html>
    <head>
        <title>Digital Address Book</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <%@ page import = "java.sql.*"%>
        <%@ page import = "javax.sql.*"%>
        <%@ page import="java.util.*,user_pkg.*"%>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <%
        User user1 = (User)session.getAttribute("user");
        if(user1==null)
        {%>
            <jsp:useBean id="user" scope="session" class="user_pkg.User"/>
            <%String uname=request.getParameter("username");
            String pass=request.getParameter("password");
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digitaladdressbook","root","2311");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from users where username like'"+uname+"%"+"'" );
            if(rs.next())
            {
                if(rs.getString("password").compareTo(pass)==0)
                {
                %>
                <jsp:setProperty name="user" property="username" value='<%=rs.getString("username")%>'/>
                <jsp:setProperty name="user" property="password" value='<%=rs.getString("password")%>'/>
                <jsp:setProperty name="user" property="name" value='<%=rs.getString("name")%>'/>
                <jsp:setProperty name="user" property="email" value='<%=rs.getString("email")%>'/>
                <%user1=user;
                }
                else{
                    session.invalidate();%>
                    <script language="javascript">alert("Invalid login credentials");</script>
                    <jsp:forward page="notfound.jsp"/>   
                <%}
            }
        }
        if(!(user1==null))
        {%>
            <hr>
            <div style="height: 25px;width: 100%; background-color: rgb(244, 246, 247);">
            <input type="button" onclick="location.href='dashboardlogger.jsp?username=<%=user1.getUsername()%>'" value="Welcome <%=user1.getName()%>">
            <input type="button" onclick="location.href='logout.jsp'" value="Log Out">
            <input type="button" onclick="location.href='myrecord.jsp'" value="My contribution">
            <input type="button" style="background-color: rgb(32, 41, 41); color: white;" onclick="location.href='digitaladdressbook.jsp'" value="Address Book">
            </div>
            <hr>
        <%}
        else{
            session.invalidate();%>
            <script language="javascript">alert("Invalid login credentials");</script>
            <jsp:forward page="notfound.jsp"/>   
        <%}%>
        <center>
            <div >
                <button name="add" id="add" class="add" onclick="location.href='add.jsp'"><b>Add new record</b></button>&nbsp;&nbsp;
                <button name="delete" id="delete" class="delete" onclick="location.href='delete.jsp'"><b>Delete old record</b></button>&nbsp;&nbsp;
                <button name="update" id="update" class="update" onclick="location.href='update.jsp'"><b>Update a record</b></button>&nbsp;&nbsp;
                <button name="search" id="search" class="search" onclick="location.href='search.jsp'"><b>Search for a record</b></button>
            </div>
        </center>
        <%@include file="footer.jsp"%>
    </body>
</html>
