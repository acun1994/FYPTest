<%-- 
    Document   : presetCourseDB
    Created on : Aug 13, 2015, 12:18:11 AM
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
            if(request.getParameter("saveValue") == null){
                out.println("This is save value");
            }
            else if(request.getParameter("deleteValue") != null){
                out.println("This is save value");
            }
          /*try{
            Statement st = connection.createStatement();
            ResultSet rs = null;
            
            String subjectID = request.getParameter("subjectID");
            String subjectName = request.getParameter("subjectName");
            String subjectCount = request.getParameter("subjectCount"); 
            st.executeUpdate("UPDATE subject SET subjectID='"+subjectID+"',subjectName='"+subjectName+"' WHERE subjectCount='"+subjectCount+"'");
            
            response.sendRedirect("presetSubjectView.jsp?insert=true");
            
          }catch(Exception e){
              out.println(e.toString());
              //response.sendRedirect("presetSubjectView.jsp?insert=false");
          }*/
        %>
    </body>
</html>
