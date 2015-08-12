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
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>Preset Subject View</title>
        
        <script> 
        function setValue(value)
        {
            var valueHolder = value.split("-");
            var subjectID = valueHolder[0];
            var subjectName = valueHolder[1];
            
            $("#subID").val(subjectID);
            $("#subName").val(subjectName);
        }
        </script>
        
    </head>
    <body>
        <% Connection connection = null; %> <!-- This variable must be declared above dbCon.jsp -->
        <%@include file="dbCon.jsp"%>
        <%@include file="checkLogin.jsp" %>
        <%@include file="navbar_session.jsp" %>
        
        
        <table class="the-table table-bordered">
            <thead>
                <th>No.</th>
                <th>Subject ID</th>
                <th>Subject Name</th><th>Action</th>
            </thead>
            <tbody>
                
                <% 
                    Statement st = connection.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM subject");
                    int count = 1;
                    
                    while(rs.next()){
                %>
                <tr>
                    <td><% out.print(count); count++;%></td>
                    <td><% out.print(rs.getString(1));%></td>
                    <td><% out.print(rs.getString(2));%></td>
                    <td>
                        <button value="<%= rs.getString(1) + "-" + rs.getString(2) %>"  class="btn btn-info" data-toggle="modal" data-target="#myModal" onclick="setValue(this.value)">EDIT</button>
                        <button  class="btn btn-danger" >DELETE</button>
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
                    <h4 class="modal-title">Modal Header</h4>
                  </div>
                  <div class="modal-body">
                    <form role="form" name="form" method="post" action="presetSubjectViewDB.jsp">
                      <table>
                          <tr>
                              <td><label>Subject ID : </label><input id="subID" type="text" name="subjectID"/><br></td>
                          </tr>
                          <tr>
                              <td>
                                  <label>Subject Name :</label><input id="subName" type="text" name="subjectID"/>
                              </td>

                          </tr>
                      </table>
                            <input type="submit" class="btn btn-success"  value="Save">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </form>

                  </div>
                  <div class="modal-footer">
                    
                  </div>
            </div>
            
          </div>
        </div>
            
    </body>
</html>
