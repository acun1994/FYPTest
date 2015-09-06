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
               String sID[] = null;
               String Section[] = null;

                sID = request.getParameterValues("subjectID");
                Section = request.getParameterValues("section");
                
                String sM = request.getParameter("semester");
                String cID = request.getParameter("COURSEID");
                String courseYear = request.getParameter("CourseYear");
                String semesterYear = sM + "-" + courseYear;
                int i = 0,q = 0;
  
                Statement st = connection.createStatement();
                String query = null;
                
                
                String checkDuplicate = "SELECT courseID,semYear FROM courseentry WHERE courseID='"+cID+"' AND semYear='"+semesterYear+"'";
                ResultSet duplicateProof = st.executeQuery(checkDuplicate);
                
                if(duplicateProof.next()){
                   q++;
                }
                
                if(q==0){
                    st.executeUpdate("INSERT INTO courseentry(courseID,semYear) VALUES('"+cID+"','"+semesterYear+"')");
                }
                
                ResultSet courseEntryID_RS = st.executeQuery("SELECT courseEntryID FROM courseentry WHERE courseID='"+cID+"' AND semYear='"+semesterYear+"'");
                courseEntryID_RS.next();     //Get courseEntryID for this course addition
                String courseEntryID = courseEntryID_RS.getString(1);
                
                for(String listSubject : sID){
                   query = "INSERT INTO coordinatorlist(subjectID,sectionCount,semYear,courseEntryID) "
                           + "VALUES('"+listSubject+"','"+Section[i]+"','"+semesterYear+"','"+courseEntryID+"')";
                   st.execute(query); 
                   i++;  
                }
             response.sendRedirect("CourseCreation.jsp?insert=true"); 
        }
          catch(Exception e){
              out.println("Unsuccessful insertion" + "<br/>" + e.toString());
              //response.sendRedirect("CourseCreation.jsp?insert=false");
           } %>
    </body>
</html>
