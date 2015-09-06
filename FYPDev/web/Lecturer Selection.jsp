<%-- 
    Document   : Form02
    Created on : Jul 27, 2015, 9:54:25 AM
    Author     : Amirul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@include file="resources.jsp" %>
<html>
<head>
   <title>Lecturer Selection</title>
</head>
<body>
<% Connection connection = null; %> <!-- This variable must be declared above dbCon.jsp -->
<%@include file="dbCon.jsp"%>
<% Statement st = connection.createStatement(); %>
<%@include file = "checkLogin.jsp" %>
<%@include file="navbar_session.jsp" %>

    <div id="wrapper">
    <%@include file="sidebar.jsp" %>
    <div id="page-content-wrapper">
    <% if (request.getParameter("insert")!=null){
        if (request.getParameter("insert").equals("false"))
            {%><div class="text-center alert-danger alert">Error in saving data.</div><%}
        else if (request.getParameter("insert").equals("true"))
            {%><div class="text-center alert-success success">Data has been successfully saved.</div><%}
        else if (request.getParameter("insert").equals("duplicate"))
            {%><div class="text-center alert-warning warning">There exist duplicates for subjectID and section.</div><%}
        }
        String adminID = "";
        if (session.getAttribute("userid")!=null){
            if (checkAccess(session, 1)){
                adminID = (session.getAttribute("userid")).toString();
            }
        }
        if (adminID.equals("")){
            %><div class="alert alert-warning">No request found</div><%
        }
        else{%>
            
    <div class='row'>
        <div class='col-lg-offset-4'>
            <%
                ResultSet dropdownRS = null;
            %>
            <form name='thisForm' method='post' action='Lecturer Selection.jsp'>
            <table>
                <tr>
                    <td width='80px'><label>Course :</label></td>
                    <td>
                        <select name='courseID' style="width: 185px" required>
                            <option value=''>Please select a course</option>
                            <%
                                try{
                                    String courseID = "",courseDD = "";
                                    dropdownRS = st.executeQuery("SELECT * FROM course");
                                    courseID = request.getParameter("courseID");
                                    while(dropdownRS.next()){ courseDD = dropdownRS.getString("courseID");%> 
                                    <option <%if(dropdownRS.getString("courseID").equals(courseID)){%>selected<%}%> value="<%=courseDD%>"><%=courseDD%></option>
                                    <%}
                                }catch(Exception e) {
                                    out.println(e.toString());
                                }%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width='80px'><label>Semester :</label></td>
                    <td>
                        <select name='semesterYear' required >
                            <option value=''>Please select a semester</option>
                            <%
                                try{
                                    String semester = "",semesterDD = "";
                                    dropdownRS = st.executeQuery("SELECT DISTINCT semYear FROM coordinatorlist");
                                    semester = request.getParameter("semesterYear");
                                    while(dropdownRS.next()){semesterDD = dropdownRS.getString("semYear");%> 
                                    <option <%if(dropdownRS.getString("semYear").equals(semester)){%>selected<%}%> value="<%=semesterDD%>"><%=semesterDD%></option>
                                    <%}
                                }catch(Exception e) {
                                    out.println(e.toString());
                                }%>
                        </select>
                    </td>
                </tr>
                <%if(request.getParameter("semesterYear")!=null){%>
                <tr>
                    <td colspan="2">
                    <select name='subjectID' required onchange="this.form.submit()" style="width: 266px">
                        <option value=''>Please select a subject</option>
                        <%
                            try{
                                String subjectID = "",subjectDD = "",courseEntryID="";
                                String courseID = request.getParameter("courseID");
                                String semesterYear = request.getParameter("semesterYear");
                                ResultSet courseEntryID_RS = st.executeQuery("SELECT courseEntryID FROM courseentry WHERE courseID='"+courseID+"' AND semYear = '"+semesterYear+"'");
                                courseEntryID_RS.next();
                                courseEntryID = courseEntryID_RS.getString(1);
                                dropdownRS = st.executeQuery("SELECT coordinatorlist.subjectID, subject.subjectName "+
                                                             "FROM coordinatorlist "+
                                                             "INNER JOIN subject "+
                                                             "ON coordinatorlist.subjectID=subject.subjectID "+
                                                             "WHERE coordinatorlist.courseEntryID='"+courseEntryID+"' AND status='Incomplete'");
                                subjectID = request.getParameter("subjectID");
                                while(dropdownRS.next()){ subjectDD = dropdownRS.getString(1); %>
                                <option <%if(dropdownRS.getString(1).equals(subjectID)){%>selected<%}%> value="<%=subjectDD%>"><%=subjectDD + " - " + dropdownRS.getString(2) %></option>
                                <%}
                            }catch(Exception e) {
                                out.println(e.toString());
                            }%>
                    </select>
                    </td>
                </tr>
                <%}%>
                <%if(request.getParameter("semesterYear")==null){%>
                <tr>
                    <td colspan="2" align="center"><input type='submit' value='SUBMIT' class='btn btn-submit'/></td>
                </tr>
                <%}%>
            </table>
            </form>
        </div>
    </div>
    <div class='row'>
        <div class='col-md-offset-3'>
            <%if(request.getParameter("subjectID")!=null){
                
                String semYear = request.getParameter("semesterYear");
                String courseID = request.getParameter("courseID");
                String subjectID = request.getParameter("subjectID");
                ResultSet lectTable = null;
                int count = 0,sectionCount = 0;
                lectTable = st.executeQuery("SELECT * FROM coordinatorlist WHERE semYear='"+semYear+"' AND subjectID='"+subjectID+"'");
                lectTable.next();
                sectionCount = Integer.parseInt(lectTable.getString("sectionCount"));
            %>
            <form name='LecturerSelection' method='post' action='LecturerSelectionDB.jsp' class="form form-inline">
                <table style="margin-top: 40px" class="table-responsive">
                    <tr>
                        <td><label>Coordinator ID</label></td>
                        <td><input type="text" autocomplete='off' name="coordinatorID" placeholder="Enter coordinator ID here" list="userInfoData" class="form-control" /></td>
                    </tr>
                    <tr>
                        <td><label>Assign Lecturer</label></td>
                        <td><label>Assign Section</label></td>
                    </tr>
                    <%for(count = 1 ; count <= sectionCount ; count++){;%>
                    <tr>
                        <td><input autocomplete='off' type="text" name="lecturerID" placeholder="Enter lecturer ID here" list="userInfoData" class="form-control" /></td>
                        <td style="padding-left: 40px"><%=count+1%>
                            <input type="hidden" value="<%=count%>" />
                        </td>
                    </tr>
                    <%}%>
                    <tr>
                        <td colspan="2" align='center'><input type="submit" value="SUBMIT"/></td>
                    </tr>
                </table>
                    <%
                        ResultSet courseEntryRS = st.executeQuery("SELECT courseEntryID FROM courseentry WHERE semYear='"+semYear+"' AND courseID='"+courseID+"'");
                        courseEntryRS.next();
                    %>
                    <input type="hidden" name="semYear"   value="<%=semYear%>" />
                    <input type="hidden" name= "courseID" value="<%=courseID%>" />
                    <input type="hidden" name="subjectID" value="<%=subjectID%>" />
                    <input type="hidden" name="courseEntryID" value="<%=courseEntryRS.getString(1)%>" />
            </form>
            <%}%>
        </div>
    </div>
    <%}%>
</div>
</div>
        <script>
            //FORM SUBMITION ACTION
            function submitForm() {
            // Get the first form with the name
            // Hopefully there is only one, but there are more, select the correct index
            var frm = document.getElementsByName('Lecturer_Selection')[0];
            frm.submit(); // Submit
            frm.reset();  // Reset
            return false; // Prevent page refresh
            }
        </script>
        
        <!-- Remove GET variable when refresh -->
        <script>    
        if(typeof window.history.pushState === 'function') {
            window.history.pushState({}, "Hide", "http://localhost:8080/FYPDev/Lecturer Selection.jsp");
        }
        </script>
        <!-- DROP DOWN DATA FOR coordinator AND LECTURER -->    
        <%
            ResultSet penyelarasRS = st.executeQuery("SELECT userID,name FROM userinfo");
        %>
            <datalist id="userInfoData">
        <%
            while(penyelarasRS.next()){
        %>  <option value="<%=penyelarasRS.getString(1) + "  -  " + penyelarasRS.getString(2)%>"><%}%>
            </datalist>
    </body>
    
    
</html>
