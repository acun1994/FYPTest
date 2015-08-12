<%-- 
    Document   : integrated_subjectFile
    Created on : 11-Aug-2015, 12:34:35
    Author     : alvinsoock
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% Connection connection = null; %>
        <%@ include file="dbCon.jsp"%>
        <%@ include file="checkLogin.jsp"%>
        
        <title>Subject File View</title>
    </head>

    <body>
        <%        
            String lecturerID ="";
            String lecturerName;
            ResultSet fileListRS = null;
            int section = 0;
            String subject = "";
            
            if (session.getAttribute("userid")!=null){
                if (checkAccess(session, 4)){
                    lecturerID = (session.getAttribute("userid")).toString();
                }
            }
            //Prep case for other level of access
            else if (request.getParameter("lecturerID")!= null && !request.getParameter("lecturerID").equals("")){
                lecturerID = request.getParameter("lecturerID");
            }
            
            if (lecturerID.equals("")){
                %><div class="alert alert-warning">No request found</div><%
            }
            else{
            
            String getLectNameSQL = "SELECT userName FROM userinfo WHERE userID = ?";
                PreparedStatement getLectName = connection.prepareStatement(getLectNameSQL);
                    getLectName.setString(1, lecturerID);
                ResultSet lectNameRS = getLectName.executeQuery();
                    lectNameRS.next();
                lecturerName = lectNameRS.getString("userName");
            
            String getClassesSQL = "SELECT listID, subjectID, sectionNo FROM lectlist WHERE lecturerID = ?";
                PreparedStatement getClasses = connection.prepareStatement(getClassesSQL);
                    getClasses.setString(1, lecturerID);
                ResultSet classListRS = getClasses.executeQuery();
           
            if (request.getParameter("class")!=null && !request.getParameter("class").equals("")){
                String[] splitText = request.getParameter("class").toString().split("-");
                subject = splitText[0];
                section = Integer.parseInt(splitText[1]);
                int classID = 0;
                
                while (classListRS.next()){
                    if (classListRS.getString("subjectID").equals(subject) && classListRS.getInt("sectionNo")==section){
                        classID = classListRS.getInt("listID");
                    }
                }
                classListRS.beforeFirst();
                
                if (classID!=0){
                String fileListSQL = "SELECT fileType, fileName, status FROM subjectfile WHERE sub_sectionID = ?";
                    PreparedStatement fileList = connection.prepareStatement(fileListSQL);
                        fileList.setInt(1, classID);
                    fileListRS = fileList.executeQuery();
                }    
            }
        %>
        
        <label> Lecturer :  </label> <%= lecturerID %> - <%= lecturerName %>
        <form action="./integrated_subjectFile.jsp" method="POST">
            <label> Class : </label>
            <% // So that form remembers lectID %>
            <input hidden name="lecturerID" value=<%= quote(lecturerID) %>></input>
            <select name = "class" onchange="this.form.submit()">
                <option disabled <% if (section == 0){ %>selected<% } %>>Choose a class</option>
                <% while (classListRS.next()) {
                    String className = classListRS.getString("subjectID") + "-" + classListRS.getInt("sectionNo");
                    %>
                    <option <%if((subject + "-" + section).equals(className)){%>selected<%}%> value = <%= quote(className) %>> <%= className %></option>
                    <%
                }%>        
            </select>
        </form>

        <% if (fileListRS!= null){ %>
            <table class="table-bordered table">
                <thead>
                    <th>Type</th><th>Filename</th><th>Status</th>
                </thead>
                <% while (fileListRS.next()){%>
                    <tr>
                        <td><%= fileListRS.getString("fileType") %></td>
                        <td><%= fileListRS.getString("fileName") %></td>
                        <td><%= fileListRS.getString("status") %></td>
                    </tr>
                <% } %>
            </table>
        <% } }%>
    </body>
</html>