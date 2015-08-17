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
        %>
            <form role="form" class="form-group" method="post" action = "LecturerSelectionDB.jsp" name="Lecturer_Selection">
                <div class="mdl-card-actions" align="center">
                <div align="center" class="mdl-textfield mdl-js-textfield">
                    <input class="mdl-textfield__input" name="Subject_ID" type="text" id="tags" autocomplete="off" list="subjectData">
                    <label for="sub_id" class="mdl-textfield__label">Subject ID</label>
                </div>
                <div class="input-field col s12" >
                    <select name="semesteYear">
                      <%
                            try{
                                Statement state = connection.createStatement();
                                ResultSet result = state.executeQuery("SELECT DISTINCT semYear FROM courseentry");
                                while(result.next()){
                      %> <option value="<%=result.getString(1)%>"><% out.print(result.getString(1)); %></option>
                                <%}
                            }catch(Exception e) {
                                out.println(e.toString());
                            }

                      %>
                    </select>
                </div>
                </div>
                <table align="center">
                    <tr>
                        <td><label>Coordinator : </label></td>

                        <td>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                                <input autocomplete="off" class="mdl-textfield__input" id="name_penyelaras" name="Penyelaras_Name" type="text" list="userInfoData">
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td><label>Lecturer Details : </label></td>
                        <td id="kids">
                            <div>
                                <%-- See java script for detail --%>
                                <input autocomplete="off" type="text" name="lecturerID" placeholder="Enter lecturer ID" list="userInfoData">
                                <input autocomplete="off" type="text" name="lecturerSection" placeholder="Enter distinct section" >
                                <button type="button" onclick="addKid(this)"><span class="glyphicon glyphicon-plus"></span></button><br><br>
                            </div>
                        </td>
                    </tr>
                </table>
                <div align="center">           
                    <label>Total Lecturer : </label>
                    <br>
                    <label>Total Section : </label>
                    <br>
                    <input type="button" value="Submit" id="btnSubmit" onClick="submitForm()" class="mdl-button md-js-button mdl-button--raised mdl-button--colored">
                </div>
                </form>
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
        <script>
        //ADD A ROW EVERYTIME USER CLICKS THE "+" SYMBOL
        var i = 0;
        function addKid()
        {
		i++;	
        	var div = document.createElement('div');
		
                                   //Details for subject information
                                   //Input from admin to be inserted into the database
        	div.innerHTML = '<input autocomplete="off" type="text" name="lecturerID" placeholder="Enter lecturer ID" list="userInfoData" >\n\
                                 <input autocomplete="off" type="text" name="lecturerSection" placeholder="Enter distinct section" >\n\
                                 <button type="button" onclick="addKid(this)"><span class="glyphicon glyphicon-plus"></span></button>\n\
                                 <button type="button" onclick="removeKid(this)"><span class="glyphicon glyphicon-minus"></span></button>\n\
                                 <br><br>';
        
                    document.getElementById('kids').appendChild(div);
                
         }
        
        //REMOVE A ROW EVERYTIME USER CLICKS THE "-" SYMBOL
        function removeKid(div){	
            document.getElementById('kids').removeChild( div.parentNode );
            i--;
        }
        </script>
        <!-- Remove GET variable when refresh -->
        <script>    
        if(typeof window.history.pushState === 'function') {
            window.history.pushState({}, "Hide", "http://localhost:8080/FYPDev/Lecturer Selection.jsp");
        }
        </script>
        
        <!-- DROPDOWN DATA FOR SUBJECT TEXTBOX -->
        <%
            ResultSet subID = st.executeQuery("SELECT cl.subjectID, subjectName FROM coordinatorlist as cl, subject as sub WHERE cl.subjectID = sub.subjectID");
        %>
        <datalist id="subjectData">
        <%
            while(subID.next()){
        %>  <option value="<%=subID.getString("subjectID") + "  -  " + subID.getString("subjectName") %>"><%}%>
        </datalist>
            
            
            
        <!-- DROP DOWN DATA FOR coordinator AND LECTURER -->    
        <%
            ResultSet penyelarasRS = st.executeQuery("SELECT userID,name FROM userinfo");
        %>
            <datalist id="userInfoData">
        <%
            while(penyelarasRS.next()){
        %>  <option value="<%=penyelarasRS.getString(1) + "  -  " + penyelarasRS.getString(2)%>"><%}%>
            </datalist>
        </div>
    </body>
    
    
</html>
