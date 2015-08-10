<%-- 
    Document   : Form02
    Created on : Jul 27, 2015, 9:54:25 AM
    Author     : Amirul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/bootstrap.css" type="text/css"/>
        <script src="./resources/js/jquery.js" type="text/javascript"></script>
        <script src="./resources/js/bootstrap.js" type="text/javascript"></script>
        <script src="./resources/jquery-1.11.3.min.js"></script>
        
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        
        <!--Material Design-->
        <script src="./resources/mdl/material.min.js"></script>
        <link rel="stylesheet" href="./resources/mdl/material.light_blue-indigo.min.css">
        <!--Materialize-->
        <script src="./resources/materialize/materialize.min.js"></script>
        <link rel="stylesheet" href="./resources/materialize/materialize.min.css">
        
        <title>Form02 : Lecturer Selection</title>
    </head>
    <body>
        <%@include file="navbar_session.jsp" %>
        <% String[] str;
           String[] str2;%>
        <%@include file="LecturerSelectionDB.jsp" %>
        <div class="container" align="center">
            <form role="form" class="form-group" method="post" action = "LecturerSelectionDB.jsp" name="Lecturer_Selection" autocomplete="on">
                <input name="Subject_ID" ID="tags" type="text" class="form-horizontal" placeholder="Subject ID" />
                <table class="table table-borderline">
                    <tr>
                        <td><label>Penyelaras : </label></td>
                        <td><input name="Penyelaras_Name" type="text" class="col-sm-10 form-horizontal" placeholder="Enter Lect. Name Here"></td>
                    </tr>
                    <tr>
                        <td><label>Lecturer: </label></td>
                        <td><table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th><div align="center">Name</div></th>
                                        <th><div align="center">ID</div></th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td><div align="center" class="col-sm-10"><input type="text" class="col-sm-10" name="lecturer_name"></div></td>
                                    <td><div align="center" class="col-sm-10"><input type="text" class="col-sm-10" name="lecturer_id"></div></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <label>Total Lecturer : </label>
                <br>
                <label>Total Section : </label>
                <br>
                <button type="button" value="Submit" id="btnSubmit" onClick="submitForm()" class="btn btn-submit">Submit</button>
            </form>
        </div>
        <script>
            
            function submitForm() {
            // Get the first form with the name
            // Hopefully there is only one, but there are more, select the correct index
            var frm = document.getElementsByName('Lecturer_Selection')[0];
            frm.submit(); // Submit
            frm.reset();  // Reset
            return false; // Prevent page refresh
            }
            
            
                $(function() {
                    var availableTags = [<% 
                    int arrayLength = str.length;            
                    for (int curr=0; curr<arrayLength-1; curr++){
                        out.println('"' + str[curr]+ "  -  " + str2[curr] +'"' + ",");
                    }
                    out.println('"' + str[arrayLength-1] + "-" +str2[arrayLength-1] +'"');
                   %>]
                    $( "#tags" ).autocomplete({
                      source: availableTags
                    });
                  });
        </script>
    </body>
</html>
