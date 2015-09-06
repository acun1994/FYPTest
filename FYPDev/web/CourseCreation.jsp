<%-- 
    Document   : Form01
    Created on : Jul 26, 2015, 11:48:23 AM
    Author     : Amirul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Course creation</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="resources.jsp"%>
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
        <%
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
        <%-- Form for course creation --%>
            <form role="form" class="form-inline" name="thisForm" method="post" action="CourseCreation.jsp">
                <div class='row'>
                    <div class='col-lg-offset-4'>
                        <table id="firstTable">
                            <tr>
                                <td width="100px"><label>Year : </label></td>
                                <td><input class="form-control" type="text" placeholder="Example 13/14" name="courseYear" id="courseyear" autocomplete="off" required></td>
                            </tr>
                            <tr>
                                <td><label>Semester :</label></td>
                                <td>
                                    <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="sem1">
                                        <input class="mdl-radio__button" type="radio" name="semester" value="1" id="sem1" required>1
                                    </label>
                                     <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="sem2">
                                        <input class="mdl-radio__button" type="radio" name="semester" value="2" id="sem2">2 
                                    </label>
                                    <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="sem3">
                                        <input class="mdl-radio__button" type="radio" name="semester" value="3" id="sem3">3 
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td><label>Course</label></td>
                                <td>
                                    <select name="COURSEID" required>
                                        <option value="" >Please select a course</option>
                                        <%
                                              try{
                                                  ResultSet rs = st.executeQuery("SELECT courseID FROM course");
                                                  while(rs.next()){%> 
                                                  <option value="<%=rs.getString("courseID")%>"><%=rs.getString("courseID")%></option>
                                                  <%}
                                              }catch(Exception e) {
                                                  out.println(e.toString());
                                              }

                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" style="padding-top:10px"><button type="submit" class="btn btn-submit">Submit</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </form>

            <%if(request.getParameter("COURSEID")!=null){
                String courseID = request.getParameter("COURSEID");
                String semester = request.getParameter("semester");
                String year = request.getParameter("courseYear");
                ResultSet rs = st.executeQuery("SELECT presetsubjects.subjectID, subject.subjectName "+
                                               "FROM presetsubjects "+
                                               "INNER JOIN subject "+
                                               "ON presetsubjects.subjectID=subject.subjectID "+
                                               "WHERE presetsubjects.courseID='"+courseID+"' AND presetsubjects.semester='"+semester+"'");
            %>
            <form name="courseCreationForm" method="POST" action="CourseCreationDB.jsp">
                <div class='row'>
                    <div class='col-lg-offset-4'>
                        <table style="margin-top:30px" class="table-responsive table-bordered"> 
                            <thead>
                                <tr>
                                    <th>SUBJECT</th>
                                    <th>NO. OF SECTION</th>
                                </tr>
                            </thead>
                            <%while(rs.next()){%>
                            <tr>
                                <td>
                                    <%=rs.getString(1)+"  -  "+rs.getString(2)%>
                                    <input type="hidden" name="subjectID" value="<%=rs.getString(1)%>"></td>
                                    <td align='center'><input type="number" name="section" min="1" max="5">
                                </td>
                            </tr>
                            <%}%>
                        </table>
                        <input type='submit' value='SUBMIT' class='btn btn-success col-lg-offset-4'/>
                        <!-- PASS VALUE TO CourseCreationDB.jsp-->
                        <input type='hidden' value='<%=courseID%>' name='COURSEID'>
                        <input type='hidden' value='<%=semester%>' name='semester'>
                        <input type='hidden' value='<%=year%>' name='CourseYear'>
                    </div>
                </div>
            </form>
            <%}%>
        <%}%>
    </div>
    </div>
    <!-- Remove GET variable when refresh -->
    <script>    
    if(typeof window.history.pushState === 'function') {
        window.history.pushState({}, "Hide", "http://localhost:8080/FYPDev/CourseCreation.jsp");
    }
    </script>

    <!-- DROP DOWN DATA FOR SUBJECT -->
    <%
        ResultSet subjectRS = st.executeQuery("SELECT subjectID,subjectName FROM subject");
    %>
        <datalist id="subjectData">
    <%
        while(subjectRS.next()){
    %>  <option value="<%=subjectRS.getString(1)+"  -  "+subjectRS.getString(2)%>"><%}%>
        </datalist>
    </body>
</html>
