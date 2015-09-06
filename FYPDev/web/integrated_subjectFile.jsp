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
            String lecturerID = "";
            String lecturerName = "";
            ResultSet fileListRS = null;
            String section = "";
            String subject = "";
            String curSemYear = "";
            boolean isAdmin = false;
            
            String getSemYearSQL = "SELECT DISTINCT semYear from courseentry ORDER BY courseEntryID DESC";
            PreparedStatement getSemYear = connection.prepareStatement(getSemYearSQL);
            ResultSet semYearRS = getSemYear.executeQuery();
            
            if (request.getParameter("semYear")!=null){
                curSemYear = request.getParameter("semYear");
            }
                        
            if (session.getAttribute("userid")!=null){
                if (checkAccess(session, 4) || checkAccess(session, 3)){
                    lecturerID = (session.getAttribute("userid")).toString();
                }
                else{
                    isAdmin = true;
                    if (request.getParameter("subject")!= null && !request.getParameter("subject").equals("")){
                        subject = request.getParameter("subject");
                    }
                    else{
                        response.sendRedirect("./");
                    }
                }
            }
            //Error Case
            else{
                response.sendRedirect("./");
            }
            
            String getClassesSQL = "";
            PreparedStatement getClasses = null;
                if (!isAdmin) {
                    String getLectNameSQL = "SELECT userName FROM userinfo WHERE userID = ?";
                        PreparedStatement getLectName = connection.prepareStatement(getLectNameSQL);
                            getLectName.setString(1, lecturerID);
                        ResultSet lectNameRS = getLectName.executeQuery();
                            lectNameRS.next();
                        lecturerName = lectNameRS.getString("userName");

                    getClassesSQL = "SELECT DISTINCT listID, subjectID, sectionNo FROM lectlist JOIN courseentry ON lectlist.courseEntryID=courseentry.courseEntryID WHERE lecturerID = ? AND semYear = ?";
                    getClasses = connection.prepareStatement(getClassesSQL);
                    getClasses.setString(1, lecturerID);
                    getClasses.setString(2, curSemYear);
                }
                else{
                    getClassesSQL = "SELECT DISTINCT listID, subjectID, sectionNo FROM lectlist JOIN courseentry ON lectlist.courseEntryID=courseentry.courseEntryID WHERE subjectID = ? AND semYear = ?";
                    getClasses = connection.prepareStatement(getClassesSQL);
                    getClasses.setString(1, subject);
                    getClasses.setString(2, curSemYear);
                }
                
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
        
        <% if (!isAdmin) {%>
        <div class="text-center">
            <label> Lecturer :  </label> <%= lecturerID %> - <%= lecturerName %> <br/>
        </div>
        <% } %>
        
        <div class="row">
            <div class="col-sm-2 col-sm-offset-4">
                <form class="form text-center" action="./integrated_subjectFile.jsp" method="POST">
                    <% // So that form remembers lectID %>
                    <input hidden name="lecturerID" value= <%= quote(lecturerID) %> >
                    <select class="form-control text-center" name = "semYear" onchange="this.form.submit()">
                    <option disabled <% if (curSemYear == ""){ %>selected<% } %>>-- Semester --</option>
                    <% while (semYearRS.next()) {
                        %>
                        <option <%if(semYearRS.getString(1).equals(curSemYear)){%>selected<%}%> <%= quote(semYearRS.getString(1)) %>> <%= semYearRS.getString(1) %></option>
                        <%
                    }%>        
                    </select>
                </form>
            </div>

            <div class="col-sm-2">
                <form class="form text-center" action="./integrated_subjectFile.jsp" method="POST">
                    <input type="text" hidden name="semYear" value="<%= curSemYear %>">
                    <select class="form-control text-center" name = "class" onchange="this.form.submit()">
                        <option disabled <% if (section == ""){ %>selected<% } %>>-- Class --</option>
                        <% while (classListRS.next()) {
                            String className = classListRS.getString("subjectID") + "-" + classListRS.getInt("sectionNo"); %>
                            <option <%if((subject + "-" + section).equals(className)){%>selected<%}%> value = <%= quote(className) %>> <%= className %></option>
                        <% } %>        
                    </select>
                </form>
            </div>
        </div>
            
        <div class="col-sm-12">&nbsp;</div><%-- Force an offset --%>

        <div class="row">
            <div class=" <% if (!isAdmin) {%> col-sm-5 col-sm-offset-1 <%} else {%> col-sm-6 col-sm-offset-3 <%} ;%> ">
                <% if (fileListRS!=null && fileListRS.next()){ fileListRS.beforeFirst(); %>
                    <table class="table-bordered table text-center">
                        <thead>
                        <th>Type</th><th>Filename</th><th>Status</th><th>Action</th>
                        </thead>
                        <% while (fileListRS.next()){%>
                            <tr>
                                <td style="padding-top:16px" ><%= fileListRS.getString("fileType") %></td>
                                <td style="padding-top:16px" ><%= fileListRS.getString("fileName") %></td>
                                <td style="padding-top:16px" ><%= fileListRS.getString("status") %></td>
                                <td>
                                    <a href="#" class="btn btn-success">Download</a> &nbsp;
                                    <a href="#" class="btn btn-danger">Delete</a> &nbsp;
                                </td>
                            </tr>
                        <% } %>
                    </table>
                    <% }
                else if (curSemYear == "" || section == ""){%>
                    <div class="alert alert-warning text-center">
                           Please select a class and semester
                    </div>
                <%} else{ %>
                    <div class="alert alert-warning text-center">
                        No files found for that class
                    </div>
                <%} %>
            </div>

            <% if (!isAdmin) { %>
            <div class="text-center col-sm-5">

                <% if (request.getParameter("success")!=null){ %>
                    <div class="text-center alert-success alert">
                        <%= request.getParameter("success") %> file<% if(Integer.parseInt(request.getParameter("success"))>1) {%>s have<%} else{ %> has<% }%> been uploaded.
                    </div>
                <% } %>

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
        </div>
    </body>
</html>
