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
            String buttonValue = request.getParameter("SUBMITION");
            if(buttonValue.equals("SAVE")){
                try{
                  Statement st = connection.createStatement();
                  String subjectID = request.getParameter("subjectID");
                  String subjectName = request.getParameter("subjectName");
                  String subjectCount = request.getParameter("subjectCount"); 
                  st.executeUpdate("UPDATE subject SET subjectID='"+subjectID+"',subjectName='"+subjectName+"' WHERE subjectCount='"+subjectCount+"'");
                  response.sendRedirect("presetSubjectView.jsp?insert=true");

                }catch(Exception e){
                    out.println(e.toString());
                    //response.sendRedirect("presetSubjectView.jsp?insert=false");
                }
            }
            else{
                try{
                    Statement st = connection.createStatement();
                    String[] valueHolder = buttonValue.split("-");
                    String subjectID = valueHolder[0];
                    st.executeUpdate("DELETE FROM subject WHERE subjectID='"+subjectID+"'");
                    response.sendRedirect("presetSubjectView.jsp?insert=delete");
                    
                }catch(Exception e){
                    out.println(e.toString());
                    //response.sendRedirect("presetSubjectView.jsp?insert=false");
                }

            }
        %>
    </body>
</html>
