<html>
    <head>
        <title>DA Book || Action my record</title>
    </head>
    <body>
        
        <%
            String number = request.getParameter("number");
            String action=request.getParameter("action");
            if(action.compareTo("update")==0)
            {%>
                <jsp:forward page="updateit.jsp"/>
            <%}
            if(action.compareTo("delete")==0)
            {%>
                <jsp:forward page="deleteit.jsp"/>
            <%}
            else{
                out.print("Error!");
            }
        %>
    </body>
</html>