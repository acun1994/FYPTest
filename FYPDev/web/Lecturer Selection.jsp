<%-- 
    Document   : Form02
    Created on : Jul 27, 2015, 9:54:25 AM
    Author     : Amirul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="resources.jsp" %>
        <title>Form02 : Lecturer Selection</title>
    </head>
    <body>

        <%@include file="navbar_session.jsp" %>
        <% String[] str;
           String[] str2;%>
        <%@include file="LecturerSelectionDB.jsp" %>

        <div class="container" align="center">

            <form role="form" class="form-group" method="post" action = "LecturerSelectionDB.jsp" name="Lecturer_Selection" autocomplete="on">
                <div class="mdl-textfield mdl-js-textfield">
                    <input class="mdl-textfield__input" name="Subject_ID" type="text" id="tags">
                    <label for="sub_id" class="mdl-textfield__label">Subject ID</label>
                </div>
                <div class="mdl-textfield mdl-js-textfield">
                    <input class="mdl-textfield__input" name="Subject_Name" type="text" id="sub_name">
                    <label for="sub_name" class="mdl-textfield__label">Subject Name</label>
                </div>
                <table>

                    <tr>
                        <td><label>Penyelaras : </label></td>

                        <td>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                            <input  class="mdl-textfield__input" id="name_penyelaras" name="Penyelaras_Name" type="text">
                            <div class="mdl-tooltip mdl-tooltip--large">Enter Coordinator name here</div>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td><label>Lecturer: </label></td>
                        <td><table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                                <thead>
                                    <tr>
                                        <th class="mdl-data-table__cell--non-numeric"><div align="center">Name</div></th>
                                        <th><div align="center">ID</div></th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td class="mdl-data-table__cell--non-numeric"><div align="center" class="col-sm-10"><input type="text" class="col-sm-10" name="lecturer_name"></div></td>
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
                <button type="button" value="Submit" id="btnSubmit" onClick="submitForm()" class="mdl-button md-js-button mdl-button--raised mdl-button--colored">Submit</button>
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
