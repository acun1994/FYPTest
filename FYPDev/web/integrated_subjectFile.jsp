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
        <%@ include file="resources.jsp"%>
        <%@ include file="dbCon.jsp"%>
        <%@ include file="checkLogin.jsp"%>
        <%@ include file="navbar_session.jsp"%>
        
        <% if (!checkAccess(session,4)) response.sendRedirect("index.jsp"); %>
        
        <SCRIPT language="javascript">
        function addKid()
        {
        	var div = document.createElement('div');

        	div.innerHTML = '<table class="text-center"><tr><td style="padding:10px"><select class="form-control" name="filetype">\n\
                                 <option value ="Appointment Letter"> Appointment Letter </option>\n\
                                 <option value ="Course Outline"> Course Outline </option>\n\
                                 <option value ="Student List"> Student List </option>\n\
                                 <option value ="Notes"> Notes/Slides </option>\n\
                                 <option value ="Student Work"> Assignment/Tutorial/Lab </option>\n\
                                 <option value ="Quiz MidTerm"> Quiz/Mid Term </option>\n\
                                 <option value ="Final Exam"> Final Exam </option>\n\
                                 <option value ="Course Work Grade"> Course Work Grades </option>\n\
                                 <option value ="Grade Sheet"> Grade Sheet & Report </option>\n\
                                 <option value ="Attendance"> Attendance List </option>\n\
                                 <option value ="E-Learning"> E-Learning Snapshot </option>\n\
                                 <option value ="Survey"> Course Survey </option>\n\
                                 <option value ="Other Material"> Other Teaching Materials </option>\n\
                                 <option value ="Coordinator Report"> Course Coordinator Report </option>\n\
                                 <option value ="Review Report"> Course Review Report </option>\n\
                                 </select></td>\n\
                                 <td style="padding:10px"><input class = "btn btn-default" type="file" name="file"/></td>\n\
                                 </tr></table>';
                document.getElementById('kids').appendChild(div);
         }

        </SCRIPT>
        
        
        <title>Subject File View</title>
    </head>

    <body>
        <%        
            String lecturerID ="";
            String lecturerName;
            ResultSet fileListRS = null;
            String section = "";
            String subject = "";
            String curSemYear = "";
            
            String getSemYearSQL = "SELECT DISTINCT semYear from courseentry ORDER BY courseEntryID DESC";
            PreparedStatement getSemYear = connection.prepareStatement(getSemYearSQL);
            ResultSet semYearRS = getSemYear.executeQuery();
            
            if (request.getParameter("semYear")!=null){
                curSemYear = request.getParameter("semYear");
            }
            else{
                semYearRS.next();
                curSemYear = semYearRS.getString(1);
                semYearRS.beforeFirst();
            }
            
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
            
            String getClassesSQL = "SELECT DISTINCT listID, subjectID, sectionNo FROM lectlist JOIN courseentry ON lectlist.courseEntryID=courseentry.courseEntryID WHERE lecturerID = ? AND semYear = ?";
                PreparedStatement getClasses = connection.prepareStatement(getClassesSQL);
                    getClasses.setString(1, lecturerID);
                    getClasses.setString(2, curSemYear);
                ResultSet classListRS = getClasses.executeQuery();
           
            if (request.getParameter("class")!=null && !request.getParameter("class").equals("")){
                String[] splitText = request.getParameter("class").toString().split("-");
                subject = splitText[0];
                section = splitText[1];
                int classID = 0;
                
                while (classListRS.next()){
                    if (classListRS.getString("subjectID").equals(subject) && classListRS.getInt("sectionNo")==Integer.parseInt(section)){
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
        
        <form class="form text-center" action="./integrated_subjectFile.jsp" method="POST">
            <label> Lecturer :  </label> <%= lecturerID %> - <%= lecturerName %> <br/>
            <% // So that form remembers lectID %>
            <input hidden name="lecturerID" value=<%= quote(lecturerID) %>></input>
            <div class="col-sm-2 col-sm-offset-5">
                <select class="form-control text-center" name = "semYear" onchange="this.form.submit()">
                <% while (semYearRS.next()) {
                    %>
                    <option <%if(semYearRS.getString(1).equals(curSemYear)){%>selected<%}%> <%= quote(semYearRS.getString(1)) %>> <%= semYearRS.getString(1) %></option>
                    <%
                }%>        
                </select>
            </div>
        </form><form class="form text-center" action="./integrated_subjectFile.jsp" method="POST">
            <div class="col-sm-2 col-sm-offset-5">
                <input type="text" hidden name="semYear" value="<%= curSemYear %>">
            <select class="form-control text-center" name = "class" onchange="this.form.submit()">
                <option disabled <% if (section == ""){ %>selected<% } %>>Choose a class</option>
                <% while (classListRS.next()) {
                    String className = classListRS.getString("subjectID") + "-" + classListRS.getInt("sectionNo"); %>
                    <option <%if((subject + "-" + section).equals(className)){%>selected<%}%> value = <%= quote(className) %>> <%= className %></option>
                <% } %>        
            </select>
            </div>
        </form>
    
            
    <div style="padding-left: 10px">
        <% if (fileListRS!=null && fileListRS.next()){ fileListRS.beforeFirst(); %>
            <table class="table-bordered table text-center" style="width:50%; float:left;">
                <thead>
                <th>Type</th><th>Filename</th><th>Status</th><th>Action</th>
                </thead>
                <% while (fileListRS.next()){%>
                    <tr>
                        <td style="padding-top:16px" ><%= fileListRS.getString("fileType") %></td>
                        <td style="padding-top:16px" ><%= fileListRS.getString("fileName") %></td>
                        <td style="padding-top:16px" ><%= fileListRS.getString("status") %></td>
                        <td><a href="#" class="btn btn-success">View</a> &nbsp;
                            <a href="#" class="btn btn-success">Download</a> &nbsp;
                            <a href="#" class="btn btn-danger">Delete</a> &nbsp;
                        </td>
                    </tr>
                <% } %>
            </table>
            <% }
        else{%>
        <table class="table-bordered table text-center" style="width:50%; float:left;">
            <tr><td>No files found</td></tr>
        </table>
        <%} %>
            </div><div class="text-center col-sm-5" style="width:45%; float:left;">
                <label> File Upload </label> <br/>
                Max File Size : 20MB
                <form action="upload.jsp" method="post" enctype="multipart/form-data">
                    <input hidden name="semYear" value="<%= curSemYear %>" >
                    <input hidden name="subject" value="<%= subject %>">
                    <input hidden name="section" value="<%= section %>">
                    <input hidden name="lectID" value="<%= lecturerID %>">
                    <table class="text-center">
                    <tr>
                        <td id="kids"></td>
                    </tr>
                    </table>
                    <input class = "btn btn-default" type="button" onClick="addKid()" value="Add File" /> &nbsp;
                    <input class = "btn btn-success" type="submit" value="Upload File(s)" />
                </form>
            </div>
        <% } %>
    </body>
</html>