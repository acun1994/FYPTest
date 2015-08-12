<%-- 
    Document   : presetCourseView
    Created on : Aug 13, 2015, 12:16:06 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>Preset Subject View</title>
        
        <script> 
        function setValue(value)
        {
            var valueHolder = value.split("-");
            var courseCount = valueHolder[0];
            var courseID = valueHolder[1];
            var courseName = valueHolder[2];
            
            $("#courseCount").val(courseCount);
            $("#courseID").val(courseID);
            $("#courseName").val(courseName);
        }
        </script>
        
    </head>
    <body>
        <% Connection connection = null; %> <!-- This variable must be declared above dbCon.jsp -->
        <%@include file="dbCon.jsp"%>
        <%@include file="checkLogin.jsp" %>
        <%@include file="navbar_session.jsp" %>
        
        <% if (request.getParameter("insert")!=null){
            if (request.getParameter("insert").equals("false"))
                {%><span class="text-center alert-danger alert">Error in saving data.</span><%}
            else if (request.getParameter("insert").equals("true"))
                {%><span class="text-center alert-success success">Data has been successfully saved.</span><%}
            else if (request.getParameter("insert").equals("delete"))
                {%><span class="text-center alert-warning warning">Data has been succesfully deleted.</span><%}
            }
        %>
        <table class="the-table table-bordered">
            <thead>
                <th>No.</th>
                <th>Course ID</th>
                <th>Course Name</th><th>Action</th>
            </thead>
            <tbody>
                
                <% 
                    Statement st = connection.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM course");
                    int count = 0;
                    while(rs.next()){
                %>
                <tr>
                    <td><% out.print(++count);%></td>
                    <td><% out.print(rs.getString(2));%></td>
                    <td><% out.print(rs.getString(3));%></td>
                    <td>
                        <button  value="<%= rs.getString(1)+"-"+rs.getString(2) + "-" + rs.getString(3) %>" class="btn btn-info" data-toggle="modal" data-target="#myModal" onclick="setValue(this.value)">EDIT</button>
                        <button name="deleteValue" value="<%= rs.getString(1)+"-"+rs.getString(2) + "-" + rs.getString(3) %>" class="btn btn-danger" onClick="ConfirmDelete()">DELETE</button>
                    </td>
                </tr>
                <% }%>
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
                    <form role="form" name="form" method="post" action="presetCourseDB.jsp">
                      <table>
                          <tr>
                              <td><label>Course ID : </label><input id="courseID" type="text" name="subjectID"/><br></td>
                          </tr>
                          <tr>
                              <td>
                                  <label>Course Name :</label><input id="courseName" type="text" name="subjectName"/>
                                  <input id="subCount" name="courseCount" type="hidden"/>
                              </td>

                          </tr>
                      </table>
                            <input type="submit" class="btn btn-success"  value="Save">
                            <button class="btn btn-default" data-dismiss="modal">Cancel</button>
                    </form>

                  </div>
                  <div class="modal-footer">
                    
                  </div>
            </div>
            
          </div>
        </div>
        <!-- Remove GET variable when refresh -->
        <script>    
        if(typeof window.history.pushState === 'function') {
            window.history.pushState({}, "Hide", "http://localhost:8080/FYPDev/presetSubjectView.jsp");
        }
        </script>
        <script>
        function ConfirmDelete()
        {
          var x = confirm("Are you sure you want to delete?");
          if(x)
            return true;
          else
            return false;
        }
        </script>
    </body>
</html>
