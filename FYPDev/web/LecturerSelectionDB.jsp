<%-- 
    Document   : Form02_DB
    Created on : Aug 1, 2015, 5:51:09 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<html>
    <head>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <title>JSP Page</title>
    </head>  
    <body>
    <% Connection connection = null; %> <!-- This variable must be declared above dbCon.jsp -->
    <%@include file="dbCon.jsp"%>
    <%  
        try {
            Statement st = connection.createStatement();
            String subjectID = request.getParameter("subjectID");
            String courseID = request.getParameter("courseID");
            String semYear = request.getParameter("semYear");
            String courseEntryID = request.getParameter("courseEntryID");
            
            String coorValue = request.getParameter("coordinatorID");
            String[] coorHolder = coorValue.split("  -  ");
            String coordinatorID = coorHolder[0];
            String tempCoorID = "";
            
            
            String[] lectValue = request.getParameterValues("lecturerID");
            String[] lectHolder = null;
            String[] lecturerID = new String[lectValue.length];
            int count = 0;
            
            //SET lecturer ID
            while(count < lectValue.length){
                lectHolder = lectValue[count].split("  -  ");
                lecturerID[count] = lectHolder[0]; 
                count++;
            }
            boolean check = false; 
            count = 0;
            ResultSet checkUserInfo = st.executeQuery("SELECT userID,name FROM userinfo");

            //check whether database has same data as user input
            while(checkUserInfo.next()){
                tempCoorID = checkUserInfo.getString("userID");
                if(coordinatorID.equals(tempCoorID)){
                    check = true;
                }
            }
            
            //if there is no same data in database, display appropriate error.
            if(check == false){
                response.sendRedirect("Lecturer Selection.jsp?insert=false");
            }
            //if there exist same data
            else
            {
                try{
                    count = 0;
                    for (int i = 0 ; i < lectValue.length ; i++) {
                        st.execute("INSERT INTO lectlist(subjectID,sectionNo,lecturerID,courseEntryID) "
                                 + "VALUES('"+subjectID+"','"+count+"','"+lecturerID[count]+"','"+courseEntryID+"')");
                        count++;
                    }
                    response.sendRedirect("Lecturer Selection.jsp?insert=true"); 
            }catch(Exception e){
                out.println("ERROR!!" + "<br>" + e.toString());
            } 
        } 
    }catch(Exception e){
        out.println(e.toString());
    }
        %>
    </body>
</html>
