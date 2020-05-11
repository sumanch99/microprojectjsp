<html>
    <head>
        <title>DA Book || Add record </title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <%@page import="java.util.*,user_pkg.*"%>
    </head>
    <script type="text/javascript">
        function validate()
        {
            var name=document.getElementById("name").value;
            var number=document.getElementById("number").value;
            var address=document.getElementById("address").value;
            if(name=="")
            {
                alert("Provide name");
                document.getElementById("name").focus();
                return false;
            }
            if(number=="")
            {
                alert("Provide number");
                document.getElementById("number").focus();
                return false;
            }
            if(number.length>10)
            {
                alert("Number should not be greater than 10 digits");
                document.getElementById("number").focus();
                return false;
            }
            if(address=="")
            {
                alert("Provide address");
                document.getElementById("address").focus();
                return false;
            }
            return true;
        }
    </script>
    <body>
        <%@include file="header.jsp"%>
        <%
        User user = (User)session.getAttribute("user");
        if(!(user==null))
        {%>
            
        <%}
		if(user==null)
		{%> 
			<jsp:forward page="index.jsp"/>
		<%}%>
        <center>
            
            <div>
                <hr><font size="5"><b>Add Record</b></font><hr>
            </div>
            
            <form method="POST" name="frm" action="addrecord.jsp" onsubmit="return validate();">
                <table class =frm>
                    <tr>
                        <td>Name:</td><td><input type="text" size="30" name="name" id="name" placeholder="Enter Name"></td>
                    </tr>
                    <tr>
                        <td>Address:</td><td><input type="text" size="30" name="address" id="address" placeholder="Enter Address"></td>
                    </tr>
                    <tr>
                        <td>Phone Number:</td><td><input type="number" size="30" name="number" id="number" placeholder="Enter phone number"></td>
                    </tr>
                    <tr>
                        <td>Date of Birth:</td><td><input type="date" size="30" name="dob" placeholder="Enter DOB"></td>
                    </tr>
                    <tr>
                        <td>Sex:</td><td><input type="radio" name="sex" id="sex" value="M" checked>Male<input type="radio" name="sex" id="sex" value="F">Female</td>
                    </tr>
                    <tr>
                        <td>Description:</td><td><textarea size="30" rows="5" cols="41" name="notes" placeholder="Add Description here"></textarea></td>
                    </tr>
                    <tr></tr><tr></tr><tr></tr><tr></tr>
                    <tr>
                        <td></td><td><input type="submit" value="SUBMIT">&nbsp;<input type="reset" value="CLEAR">&nbsp;<input type="button" value="Go To Dashboard" onclick="location.href='digitaladdressbook.jsp'"></td>
                    </tr>
                </table>
            </form>
        </center>
        <%@include file="footer.jsp"%>
    </body>
</html>
