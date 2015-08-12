<%-- 
    Document   : presetSubjectViewDB
    Created on : Aug 12, 2015, 3:51:12 PM
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
        <%@ include file="dbCon.jsp"%>
        <%
          try{
            Statement st = connection.createStatement();
            ResultSet rs = null;
            
            String subjectID = request.getParameter("subjectID");
            String subjectName = request.getParameter("subjectName");
        
            st.executeUpdate("UPDATE subject SET subjectID='"+subjectID+"',subjectName='"+subjectName+"' WHERE subjectID='"+subjectID+"'");
          }catch(Exception e){
              out.println(e.toString());
          }
        
        
        
        
        
        %>
    </body>
</html>
