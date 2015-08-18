<%-- 
    Document   : presetSubjectView
    Created on : Aug 12, 2015, 12:03:04 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Preset Subject View</title>
    </head>
    <body>
        <% Connection connection = null; %> <!-- This variable must be declared above dbCon.jsp -->
        <%@include file="dbCon.jsp"%>
        <%@include file="checkLogin.jsp" %>
        <%@include file="navbar_session.jsp" %>
        <div id="wrapper">
        <%@include file="sidebar.jsp" %>
        <div id="page-content-wrapper">
        <!-- SET GET VARIABLES BASED ON THE presetSubjectDB.jsp values -->
        <% if (request.getParameter("insert")!=null){
            if (request.getParameter("insert").equals("false"))
                {%><span class="text-center alert-danger alert">Error in saving data.</span><%}
            else if (request.getParameter("insert").equals("true"))
                {%><span class="text-center alert-success success">Data has been successfully saved.</span><%}
            else if (request.getParameter("insert").equals("delete"))
                {%><span class="text-center alert-warning warning">Data has been succesfully deleted.</span><%}
            }
        %>
        <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp" align="center">
            <thead>
                <th class="mdl-data-table__cell--non-numeric">No.</th>
                <th>Subject ID</th>
                <th>Subject Name</th>
                <th colspan="2">Action</th>
            </thead>
            <tbody>
                <%  Statement st = connection.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM subject");
                    int count = 0;
                    while(rs.next()){
                %>
                <tr>
                    <td class="mdl-data-table__cell--non-numeric"><% out.print(++count);%></td>
                    <td><% out.print(rs.getString(1));%></td>
                    <td><% out.print(rs.getString(2));%></td>
                    <td><button  value="<%= rs.getString(1)+"-"+rs.getString(2) %>" class="btn btn-info" data-toggle="modal" data-target="#myModal" onclick="setValue(this.value)">EDIT</button></td>
                    <td><button type="submit" name="SUBMITION"  value="<%= rs.getString(1)+" - "+rs.getString(2)%>" class="btn btn-danger" onClick="ConfirmDelete(this.value)" form="myForm">DELETE</button>
                    </td>
                </tr>
                <% }%>
                <tr>
                    <td colspan="5"><button class="btn bg-primary" data-toggle="modal" data-target="#newModal" style="width:100%">CREATE NEW SUBJECT</button><br><br>
                </tr>
            </tbody>
        </table>
        
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit Information</h4>
          </div>
          <div class="modal-body">
            <form role="form" name="form" method="post" action="presetSubjectViewDB.jsp" id="myForm">
              <table class="table-hover table-condensed">
                  <tr>
                    <td align="right"><label> ID : </label></td>
                    <td><input id="subID" type="text" name="subjectID" disabled/><br></td>
                  </tr>
                  <tr>
                    <td align="right"><label> Name :</label></td>
                    <td><input id="subName" type="text" name="subjectName" required/></td>
                  </tr>
              </table>
                    <button name="SUBMITION" type="submit" class="btn btn-success" value="SAVE">Save </button>
                    <button class="btn btn-default" data-dismiss="modal">Cancel</button>
            </form>

          </div>
          <div class="modal-footer">

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
                    <h4 class="modal-title">Create New Subject</h4>
            </div>
            <div class="modal-body">
                <form role="form" name="form" method="post" action="presetSubjectViewDB.jsp" id="newForm">
                    <table class="table-condensed table-hover" >
                        <tr>
                            <td><label>Subject ID :</label></td>
                            <td><input type="text" name="newSubjectID" autocomplete="off" required/></td>
                        </tr>
                        <tr>
                            <td><label>Subject Name :</label></td>
                            <td><input  type="text" name="newSubjectName" required/></td>
                        </tr>
                    </table>
                    <button name="SUBMITION" type="submit" class="btn btn-success" value="NEW SUBJECT">Save </button>
                    <button class="btn btn-default" data-dismiss="modal">Cancel</button>
                </form>
            </div>
            <div class="modal-footer"></div>
        </div>
        </div>
        </div>
<script>
    //REMOVE GET VARIABLES WHEN USER REFRESH PAGE
    if(typeof window.history.pushState === 'function') {
        window.history.pushState({}, "Hide", "http://localhost:8080/FYPDev/presetSubjectView.jsp");
    }
    
    //RE-CONFIRM IF USER WANTS TO DELETE A RECORD
    function ConfirmDelete() {
        var x = confirm("Are you sure you want to delete this data?");
        if (x){
            return true;
        }
        else return false;
    }
    
    //RETRIEVE VALUE FROM RECORD AND SET IT TO EDIT MODAL
    function setValue(value)
    {
        var valueHolder = value.split("-");
        var subjectID = valueHolder[0];
        var subjectName = valueHolder[1];

        $("#subID").val(subjectID);
        $("#subName").val(subjectName);
    }
</script>
        </div>
        </div>
    </body>
</html>
