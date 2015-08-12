<%-- 
    Document   : Form02
    Created on : Jul 27, 2015, 9:54:25 AM
    Author     : Amirul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<html>
    <head>
            <%@include file="reqHeader.jsp" %>
            <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
            <script src="//code.jquery.com/jquery-1.10.2.js"></script>
            <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
            <title>Form02 : Lecturer Selection</title>
    </head>
    <body>
        <% Connection connection = null; %> <!-- This variable must be declared above dbCon.jsp -->
        <%@include file="dbCon.jsp"%>
        <%@include file = "checkLogin.jsp" %>
        <%@include file="navbar_session.jsp" %>
        <% 
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM subject");
            int r = 0;
            List li = new ArrayList();
            List li2 = new ArrayList();
            String[] str1; String[] str2;
            
            Iterator it;
            Iterator it2;
            String subIDCol,subNameCol;
            
        %>
        <%@include file="autoCompleteTB.jsp" %>
        
        <div class="container" align="center">
            <% if (request.getParameter("insert")!=null){
            if (request.getParameter("insert").equals("false"))
                {%><div class="text-center alert-danger alert">Error in saving data.</div><%}
            else if (request.getParameter("insert").equals("true"))
                {%><div class="text-center alert-success success">Data has been successfully saved.</div><%}
            else if (request.getParameter("insert").equals("duplicate"))
                {%><div class="text-center alert-warning warning">There exist duplicates for subjectID and section.</div><%}
            }
        %>
            <form role="form" class="form-group" method="post" action = "LecturerSelectionDB.jsp" name="Lecturer_Selection">
                <div class="mdl-textfield mdl-js-textfield">
                    <input class="mdl-textfield__input" name="Subject_ID" type="text" id="tags" autocomplete="on">
                    <label for="sub_id" class="mdl-textfield__label">Subject ID</label>
                </div>
                <div class="input-field col s12" >
                    <select name="semesterYear">
                      <%
                            try{
                                rs = st.executeQuery("SELECT semYear FROM courseentry");
                                while(rs.next()){
                      %> <option value="<%=rs.getString(1)%>"><% out.print(rs.getString(1)); %></option>
                                <%}
                            }catch(Exception e) {
                                out.println(e.toString());
                            }

                      %>
                    </select>
                </div>
                <table>
                    <tr>
                        <td><label>Penyelaras : </label></td>

                        <td>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                            <input  class="mdl-textfield__input" id="name_penyelaras" name="Penyelaras_Name" type="text" >
                            <div class="mdl-tooltip mdl-tooltip--large">Enter Coordinator name here</div>
                            </div>
                        </td>

                    </tr>
                    <tr>
                            <td><label>Lecturer Details : </label></td>
                            <td id="kids">
                                <%-- See java script for detail --%>
                                <input autocomplete="off" type="text" id="newtags" name="lecturerID" placeholder="Enter lecturer ID" >
                                <input autocomplete="off" type="text" name="lecturerSection" placeholder="Enter distinct section" >
                                <button type="button" onclick="addKid(this)"><span class="glyphicon glyphicon-plus"></span></button><br><br>
                            </td>
                        </tr>
                </table>
                            
                <label>Total Lecturer : </label>
                <br>
                <label>Total Section : </label>
                <br>
                <input type="button" value="Submit" id="btnSubmit" onClick="submitForm()" class="mdl-button md-js-button mdl-button--raised mdl-button--colored">
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
        var i = 0;
        function addKid()
        {
		i++;	
        	var div = document.createElement('div');
		
                                   //Details for subject information
                                   //Input from admin to be inserted into the database
        	div.innerHTML = '<input autocomplete="off" type="text" name="lecturerID" placeholder="Enter lecturer ID" >\n\
                                 <input autocomplete="off" type="text" name="lecturerSection" placeholder="Enter distinct section" >\n\
                                 <button type="button" onclick="addKid(this)"><span class="glyphicon glyphicon-plus"></span></button>\n\
                                 <button type="button" onclick="removeKid(this)"><span class="glyphicon glyphicon-minus"></span></button>\n\
                                 <br><br>';
        
                    document.getElementById('kids').appendChild(div);
                
         }

        function removeKid(div)
        {	
            document.getElementById('kids').removeChild( div.parentNode );
            i--;
        }
        </script>
    </body>
</html>
