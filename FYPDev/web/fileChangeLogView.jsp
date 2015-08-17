<%-- 
    Document   : fileChangeLogView
    Created on : Aug 18, 2015, 12:14:29 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="resources.jsp"%>
        <title>File Change Log</title>
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
                    <th style="text-align:center" width="80">Log ID</th>
                    <th style="text-align:center" width="120">File ID</th>
                    <th style="text-align:center" width="160">Action</th>
                    <th style="text-align:center" width="120">Last Edited</th>
                </tr>
                </thead>
                <tbody>
                    <%  Statement st=connection.createStatement(); 
                        ResultSet rs=st.executeQuery( "SELECT * FROM filechangelog");
                        int count=0 ; 
                        while(rs.next()){ 
                    %>
                        <tr>
                            <td class="mdl-data-table__cell--non-numeric" align="center">
                                <% out.print(++count);%>
                            </td>
                            <td>
                                <% out.print(rs.getString("logID"));%>
                            </td>
                            <td>
                                <% out.print(rs.getString("fileID"));%>
                            </td>
                            <td>
                                <button value="logIDValue-fileIDValue" class="btn btn-info" data-toggle="modal" data-target="#myModal" onclick="setValue(this.value)">EDIT</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="submit" name="SUBMITION"  value="logIDValue-fileIDValue" class="btn btn-danger" onClick="ConfirmDelete(this.value)" form="myForm">DELETE</button>
                            </td>
                            <td>
                                <% out.print(rs.getString("timestamp"));%>
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
                            <form role="form" name="form" method="post" action="fileChangeLogView.jsp" id="myForm">
                                <table class="table-condensed table-hover">
                                    <tr>
                                        <td><label>Log ID :</label></td>
                                        <td><input id="logID" type="text" name="courseID" disabled/></td>
                                    </tr>
                                    <tr>
                                        <td><label>File ID :</label></td>
                                        <td><input id="fileID" type="text" name="courseName" /></td>
                                </table>
                                <button name="SUBMITION" type="submit" class="btn btn-success" value="SAVE">Save </button>
                                <button class="btn btn-default" data-dismiss="modal">Cancel</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <h4 class="modal-footer">Copyright of Git Gang 2015</h4>
                        </div>
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
                                <h4 class="modal-title">Create Something</h4>
                        </div>
                        <div class="modal-body">
                            <form role="form" name="form" method="post" action="fileChangeLogView.jsp" id="newForm">
                                <table class="table-condensed table-hover">
                                    <tr>
                                        <td><label>Log ID ID :</label></td>
                                        <td><input type="text" name="newLogID" required /></td>
                                    </tr>
                                    <tr>
                                        <td><label>File ID :</label></td>
                                        <td><input  type="text" name="newFileID" required/></td>
                                </table>
                                <button name="SUBMITION" type="submit" class="btn btn-success" value="New File Change Log">Save </button>
                                <button class="btn btn-default" data-dismiss="modal">Cancel</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <h4 class="modal-footer">Copyright of Git Gang 2015</h4>
                        </div>
                    </div>
                </div>
            </div>
                        <!-- Remove GET variable when refresh -->
    <script>
        if (typeof window.history.pushState === 'function') {
            window.history.pushState({}, "Hide", "http://localhost:8080/FYPDev/fileChangeLogView.jsp");
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
            var logID = valueHolder[0];
            var fileID = valueHolder[1];
            
            $("#logID").val(logID);
            $("#fileID").val(fileID);
        }
    </script>
</div>
</div>
</body>

</html>
