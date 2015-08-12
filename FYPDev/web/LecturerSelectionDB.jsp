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
        <%Connection connection = null;%>
        <%@ include file="dbCon.jsp"%>
        <% if(request.getParameter("Subject_ID") != null){
            String subjectIn = request.getParameter("Subject_ID");
            String[] str = subjectIn.split("  -  ");
            String subID = str[0];  //hold value of subjectID
            String subName = str[1];//value of second subjectName
            String tempSubID = null;
            boolean check = false;
            
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT subjectID FROM subject");
            
            //check whether database has same data as user input
            while(rs.next()){
                tempSubID = rs.getString(1);
                if(subID.equals(tempSubID)){
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
                    
                    String yearHolder = request.getParameter("semesterYear");   //used for later use
                    String[] lecturerID = request.getParameterValues("lecturerID");
                    String[] lecturerSection = request.getParameterValues("lecturerSection");
                    int[] assignSection = new int[lecturerID.length];
                    int q = 0;
                    
                    //retrieve value(s) from user input.
                    for (int i = 0 ; i < lecturerSection.length ; i++) {
                        assignSection[i] = Integer.parseInt(lecturerSection[i]);
                        String checkDuplicate = "SELECT subjectID,sectionNo FROM lectlist WHERE subjectID='"+subID+"' AND sectionNo='"+assignSection[0]+"' ";
                        ResultSet duplicateProof = st.executeQuery(checkDuplicate);

                        if(duplicateProof.next()){
                           q++;
                           response.sendRedirect("Lecturer Selection.jsp?insert=duplicate");
                        }
                        
                    }
                    
                    
                    
                    if(q==0){
                        for (int i = 0 ; i < lecturerSection.length ; i++) {
                        st.execute(""
                                + "INSERT INTO lectlist(subjectID,sectionNo,lecturerID) "
                                + "VALUES('"+subID+"','"+assignSection[i]+"','"+lecturerID[i]+"')"
                                + "");
                        }
                        response.sendRedirect("Lecturer Selection.jsp?insert=true");
                    }
                    
                }catch(Exception e){
                    out.println("ERROR!!" + "<br>" + e.toString());
                }
            }
        }if(request.getParameter("Subject_ID") == ""){
            out.println("Pick something lol");
        }
            %>
    </body>
</html>
