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
                //String userID = (String)session.getAttribute("userid");
                int i = 0,q = 0;
  
                Statement st = connection.createStatement();
                String query = null;
                
                
                String checkDuplicate = "SELECT courseID,semYear FROM courseentry WHERE courseID='"+cID+"' AND semYear='"+semesterYear+"' ";
                ResultSet duplicateProof = st.executeQuery(checkDuplicate);
                
                if(duplicateProof.next()){
                   q++;
                }
                
                if(q==0){
                    query = "INSERT INTO courseentry(courseID,semYear) VALUES('"+cID+"','"+semesterYear+"')";
                    st.executeUpdate(query);
                }
                else{
                     for(String listSubject : sID){
                       /* ResultSet  rs = st.executeQuery("SELECT courseEntryID FROM courseentry WHERE courseID = '"+cID+"' AND semYear = '"+semesterYear+"'");
                        rs.next();
                        int courseEntryID = rs.getInt("courseEntryID");

                        query = "INSERT INTO subject(subjectID, subjectName) VALUES('"+sID[i]+"','"+sN[i]+"')";
                        st.executeUpdate(query);*/
                        query = "INSERT INTO coordinatorlist(subjectID,sectionCount,semYear) VALUES('"+listSubject+"','"+Section[i]+"','"+semesterYear+"')";
                        st.execute(query); 
                        i++;  
                    
                }
            } response.sendRedirect("CourseCreation.jsp?insert=true");
        }
          catch(Exception e){
              out.println("Unsuccessful insertion" + "<br/>" + e.toString());
              //response.sendRedirect("CourseCreation.jsp?insert=false");
           } %>
    </body>
</html>
