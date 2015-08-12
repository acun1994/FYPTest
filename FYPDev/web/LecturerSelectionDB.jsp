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
            String courseID = subID.substring(4,5) + subID.substring(0,4); //contain value of courseID
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
                    int duplicateCounter = 0;
                    
                    //retrieve value(s) from user input.
                    for (int i = 0 ; i < lecturerSection.length ; i++) {
                        assignSection[i] = Integer.parseInt(lecturerSection[i]);
                        String checkDuplicate = "SELECT subjectID,sectionNo FROM lectlist WHERE subjectID='"+subID+"' AND sectionNo='"+assignSection[0]+"' ";
                        ResultSet duplicateProof = st.executeQuery(checkDuplicate);
                        
                        //If there is a duplicate
                        if(duplicateProof.next()){
                           duplicateCounter++;
                           response.sendRedirect("Lecturer Selection.jsp?insert=duplicate");
                        }
                        
                    }
                    
                    
                    //If there is no duplicate
                    if(duplicateCounter==0){
                        //Get value of courseEntryID from courseentry table
                        rs = st.executeQuery("SELECT courseEntryID FROM courseentry WHERE semYear = '"+yearHolder+"' AND courseID = '"+courseID+"'");
                        rs.next();
                        String courseEntryResult = rs.getString(1);
                        for (int i = 0 ; i < lecturerSection.length ; i++) {
                            st.execute(""
                                    + "INSERT INTO lectlist(subjectID,sectionNo,lecturerID,courseEntryID) "
                                    + "VALUES('"+subID+"','"+assignSection[i]+"','"+lecturerID[i]+"','"+courseEntryResult+"')"
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
