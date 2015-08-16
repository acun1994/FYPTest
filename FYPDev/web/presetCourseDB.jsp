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
            String buttonValue = request.getParameter("SUBMITION");
            if(buttonValue.equals("SAVE")){
                try{
                  Statement st = connection.createStatement();
                  String courseID = request.getParameter("courseID");
                  String courseName = request.getParameter("courseName");
                  ResultSet rs = st.executeQuery("SELECT courseID FROM course WHERE courseID='"+courseID+"'");
                  rs.next();
                  st.executeUpdate("UPDATE course SET courseID='"+courseID+"',courseName='"+courseName+"' WHERE courseID='"+rs.getString(1)+"'");
                  response.sendRedirect("presetCourseView.jsp?insert=true");

                }catch(Exception e){
                    out.println(e.toString());
                    //response.sendRedirect("presetSubjectView.jsp?insert=false");
                }
            }
            else if(buttonValue.equals("NEW COURSE")){
                try{
                  Statement st = connection.createStatement();
                  String courseID = request.getParameter("newCourseID");
                  String courseName = request.getParameter("newCourseName");
                  st.execute("INSERT INTO course(courseID,courseName) VALUES('"+courseID+"','"+courseName+"')");
                  response.sendRedirect("presetCourseView.jsp?insert=true");

                }catch(Exception e){
                    out.println(e.toString());
                    //response.sendRedirect("presetSubjectView.jsp?insert=false");
                }
            }
            else{
                try{
                    Statement st = connection.createStatement();
                    String[] valueHolder = buttonValue.split("-");
                    String courseID = valueHolder[0];
                    st.executeUpdate("DELETE FROM course WHERE courseID='"+courseID+"'");
                    response.sendRedirect("presetCourseView.jsp?insert=delete");
                    
                }catch(Exception e){
                    out.println(e.toString());
                    //response.sendRedirect("presetSubjectView.jsp?insert=false");
                }

            }
        %>
    </body>
</html>
