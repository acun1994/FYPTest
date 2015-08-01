<%-- 
    Document   : CourseCreationDB
    Created on : Jul 28, 2015, 1:53:46 PM
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
            
           try {
               String sN[]= null;
               String sID[] = null;
               String Section[] = null;

                sN = request.getParameterValues("subjectname");
                sID = request.getParameterValues("subjectID");
                Section = request.getParameterValues("section");

               
                String sM = request.getParameter("semester");
                String cID = request.getParameter("COURSEID");
                String courseYear = request.getParameter("CourseYear");
                String semesterYear = sM + "-" + courseYear;
                int i = 0;
  
                Statement st = connection.createStatement();
                
                String query = null;
                for(String listSN : Section){
                   
                    out.println(listSN + "</br>");
                    
                    query = "insert into subject_list(subjectID, subjectName) values('"+sID[i]+"','"+sN[i]+"')";
                    st.executeUpdate(query);  
                    
                    query = "insert into course_sub(courseID,semYear,sectionCount,subjectID) values('"+cID+"','"+semesterYear+"','"+Section[i]+"','"+sID[i]+"')";
                    st.executeUpdate(query);  
                    i++;
                }
                out.println("Successful insertion");
             }
               
          catch(Exception e){
              out.println("Unsuccessful insertion" + "<br/>" + e.toString());
              
              
           } %>
    </body>
</html>
