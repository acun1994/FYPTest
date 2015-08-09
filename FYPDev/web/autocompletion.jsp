<%-- 
    Document   : autocompletion
    Created on : Aug 5, 2015, 9:39:50 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%Connection connection = null;%>
        <%@include file="dbCon.jsp"%>
        <%@page import="java.util.Iterator"%>
        <%@page import="java.util.List"%>
        <%@page import="java.util.ArrayList"%>
        <%
            String search = request.getParameter("Subject_ID");
            String sql = "SELECT subjectID FROM subject";
            PreparedStatement theStatement = null;
            theStatement = connection.prepareStatement("SELECT subjectID FROM subject WHERE subjectID=?");
            theStatement.setString(1,search);
            
            String query = (String)request.getParameter("q");
            //System.out.println("1"+request.getParameterNames().nextElement());
            response.setHeader("Content-Type", "text/html");
            int cnt=1;
            for(int i=0;i<countries.length;i++)
            {
                if(countries[i].toUpperCase().startsWith(query.toUpperCase()))
                {
                    out.print(countries[i]+"\n");
                    if(cnt>=10)
                        break;
                    cnt++;
                }
            }
        %>
    </body>
</html>
