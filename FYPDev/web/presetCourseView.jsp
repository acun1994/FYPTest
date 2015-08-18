<%-- Document : presetCourseView Created on : Aug 13, 2015, 12:16:06 AM Author : User --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@include file="resources.jsp"%>
        <title>Preset Subject View</title>
    </head>

    <body>
        <% Connection connection=null; %>
        <!-- This variable must be declared above dbCon.jsp -->
        <%@include file="dbCon.jsp" %>
        <%@include file="checkLogin.jsp" %>
        <%@include file="navbar_session.jsp" %>
        <div id="wrapper">
        <%@include file="sidebar.jsp" %>
        <div id="page-content-wrapper">
        <% if (request.getParameter( "insert")!=null){ 
            if (request.getParameter( "insert").equals( "false")) {%><span class="text-center alert-danger alert">Error in saving data.</span>
            <%} else if (request.getParameter( "insert").equals( "true")) {%><span class="text-center alert-success success">Data has been successfully saved.</span>
                <%} else if (request.getParameter( "insert").equals( "delete")) {%><span class="text-center alert-warning warning">Data has been succesfully deleted.</span>
                    <%} } %>
                        <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp" align="center">
                            <thead align="center">
                            <tr>
                                <th class="mdl-data-table__cell--numeric" style="text-align:center" >No.</th>
                                <th style="text-align:center" width="80">Course ID</th>
                                <th style="text-align:center" width="120">Course Name</th>
                                <th style="text-align:center" width="160">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                                <%  Statement st=connection.createStatement(); 
                                    ResultSet rs=st.executeQuery( "SELECT * FROM course");
                                    int count=0 ; 
                                    while(rs.next()){ 
                                %>
                                    <tr>
                                        <td class="mdl-data-table__cell--non-numeric" align="center">
                                            <% out.print(++count);%>
                                        </td>
                                        <td>
                                            <% out.print(rs.getString("courseID"));%>
                                        </td>
                                        <td>
                                            <% out.print(rs.getString("courseName"));%>
                                        </td>
                                        <td>
                                            <button value="<%= rs.getString("courseID")+" - "+rs.getString("courseName") %>" class="btn btn-info" data-toggle="modal" data-target="#myModal" onclick="setValue(this.value)">EDIT</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button type="submit" name="SUBMITION"  value="<%= rs.getString("courseID")+" - "+rs.getString("courseName")%>" class="btn btn-danger" onClick="ConfirmDelete(this.value)" form="myForm">DELETE</button>
                                        </td>
                                    </tr>
                                    <% }%>
                                    <tr>
                                        <td class="mdl-data-table__cell--numeric" colspan="5"><button class="btn bg-primary" data-toggle="modal" data-target="#newModal" style="width:100%">CREATE NEW COURSE</button></td>
                                    </tr>
                            </tbody>
                        </table>
                        <!-- MODAL FOR EDITING COURSE -->
                        <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                         <h4 class="modal-title">Edit Information</h4>

                                    </div>
                                    <div class="modal-body">
                                        <form role="form" name="form" method="post" action="presetCourseDB.jsp" id="myForm">
                                            <table class="table-condensed table-hover">
                                                <tr>
                                                    <td><label>Course ID :</label></td>
                                                    <td><input id="courseID" type="text" name="courseID" disabled/></td>
                                                </tr>
                                                <tr>
                                                    <td><label>Course Name :</label></td>
                                                    <td><input id="courseName" type="text" name="courseName" /></td>
                                            </table>
                                            <button name="SUBMITION" type="submit" class="btn btn-success" value="SAVE">Save </button>
                                            <button class="btn btn-default" data-dismiss="modal">Cancel</button>
                                        </form>
                                    </div>
                                    <div class="modal-footer"></div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- MODAL FOR CREATION OF NEW COURSE -->
                        <div class="modal fade" id="newModal" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                         <h4 class="modal-title">Create New Course</h4>

                                    </div>
                                    <div class="modal-body">
                                        <form role="form" name="form" method="post" action="presetCourseDB.jsp" id="newForm">
                                            <table class="table-condensed table-hover">
                                                <tr>
                                                    <td><label>Course ID :</label></td>
                                                    <td><input type="text" name="newCourseID" disabled /></td>
                                                </tr>
                                                <tr>
                                                    <td><label>Course Name :</label></td>
                                                    <td><input  type="text" name="newCourseName" required/></td>
                                            </table>
                                            <button name="SUBMITION" type="submit" class="btn btn-success" value="NEW COURSE">Save </button>
                                            <button class="btn btn-default" data-dismiss="modal">Cancel</button>
                                        </form>
                                    </div>
                                    <div class="modal-footer"></div>
                                </div>
                            </div>
                        </div>
                        <!-- Remove GET variable when refresh -->
    <script>
        if (typeof window.history.pushState === 'function') {
            window.history.pushState({}, "Hide", "http://localhost:8080/FYPDev/presetCourseView.jsp");
        }
        
        //RE-CONFIRM IF USER WISH TO DELETE A RECORD
        function ConfirmDelete() {
            var x = confirm("Are you sure you want to delete?");
            if (x){
                return true;
            }
            else return false;
        }
        
        //RETRIEVE VALUE FROM EDIT BUTTON THEN ADD TO EDIT INFORMATION MODAL
        function setValue(value)
        {
            var valueHolder = value.split("-");
            var subjectID = valueHolder[0];
            var subjectName = valueHolder[1];
            
            $("#courseID").val(subjectID);
            $("#courseName").val(subjectName);
        }
                        </script>
        </div>
    </div>
    </body>

</html>
