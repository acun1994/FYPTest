<%-- 
    Document   : Form02_DB
    Created on : Aug 1, 2015, 5:51:09 PM
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
               String sN =  null;
               String sID = null;
               String penyelaras = null;
               String query = null;

                sN = request.getParameter("Subject_Name");
                sID = request.getParameter("subject_ID");
                penyelaras = request.getParameter("Penyelaras_Name");
                
                
                int i = 0;
  
                Statement st = connection.createStatement();
                
                
   
                query = "UPDATE subject_list SET penyelarasID = '"+penyelaras+"' WHERE subjectID = 'ANA1234'";
                st.executeUpdate(query);  
                out.println("Successful insertion</br>" + penyelaras);
             }
               
          catch(Exception e){
              out.println("Unsuccessful insertion" + "<br/>" + e.toString());
              
              
           } %>
    </body>
</html>
