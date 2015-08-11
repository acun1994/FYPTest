<%-- 
    Document   : integrated_subjectFile
    Created on : 11-Aug-2015, 12:34:35
    Author     : alvinsoock
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% Connection connection = null; %>
        <%@ include file="dbCon.jsp"%>
        <%@ include file="checkLogin.jsp"%>
        <title>Subject File View</title>
    </head>
    <body>
        <% 
            String userID = (session.getAttribute("userID")).toString(); 
            String getClassesSQL = "SELECT * FROM lectlist WHERE lecturerID = " + quote(userID);
                PreparedStatement getClasses = connection.prepareStatement(getClassesSQL);
                ResultSet classList = getClasses.executeQuery();
                   
        %>
        
        <form>
            <label> Class : </label>
            <select>
                <% while (classList.next()) {
                    %>
                    <option> <%= classList.getString("subjectID") %> - <%= classList.getInt("sectionNo") %></option>
                    <%
                }%>
            </select>
            
            
        </form>

    </body>
</html>