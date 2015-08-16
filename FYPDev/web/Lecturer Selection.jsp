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
        <%@include file="resources.jsp" %>
       <title>Form02 : Lecturer Selection</title>
    </head>
    <body>
        <% Connection connection = null; %> <!-- This variable must be declared above dbCon.jsp -->
        <%@include file="dbCon.jsp"%>
        <% Statement st = connection.createStatement(); %>
        <%@include file = "checkLogin.jsp" %>
        <%@include file="navbar_session.jsp" %>
        <% String[] str1; String[] str2;%>
        <%@include file="LecturerSelectionDB.jsp" %>
        <% 
                ResultSet rs = st.executeQuery("SELECT * FROM subject");
                int i = 0;
                List li = new ArrayList();
                List li2 = new ArrayList();
                //Add data to the arraylist 
                while(rs.next()){
                    li.add(rs.getString(1));
                    li2.add(rs.getString(2));
                }
                
                str1 = new String[li.size()];
                str2 = new String[li2.size()];
                
                Iterator it = li.iterator();
                Iterator it2 = li2.iterator();
                
                String subIDCol,subNameCol;
                //Assign value from arrayList to local array for use of jQuery 
                while(it.hasNext()){
                    subIDCol = (String)it.next();
                    str1[i] = subIDCol;
                    subNameCol = (String)it2.next();
                    str2[i] = subNameCol;
                    i++;
                }
        %>
        
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
                <table>
                    <tr>
                        <td><label>Coordinator : </label></td>

                        <td>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                                <input autocomplete="off" class="mdl-textfield__input" id="name_penyelaras" name="Penyelaras_Name" type="text" list="userInfoData">
                            <span class="mdl-tooltip mdl-tooltip--large">Enter Coordinator name here</span>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td><label>Lecturer Details : </label></td>
                        <td id="kids">
                            <%-- See java script for detail --%>
                            <input autocomplete="off" type="text" name="lecturerID" placeholder="Enter lecturer ID" list="userInfoData">
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
            
            
            $(function() {
                var availableTags = [<% 
                int arrayLength = str1.length;            
                for (int curr=0; curr<arrayLength-1; curr++){
                    out.println('"' + str1[curr]+ "  -  " + str2[curr] +'"' + ",");
                }
                out.println('"' + str1[arrayLength-1] + "  -  " +str2[arrayLength-1] +'"');
               %>];
                $( "#tags" ).autocomplete({
                  source: availableTags
                });
               });
               
        </script>
        <script language="javascript">
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
        
        <!-- DROP DOWN DATA FOR SUBJECT -->
        <%
            ResultSet subjectRS = st.executeQuery("SELECT subjectID,subjectName FROM subject");
        %>
            <datalist id="subjectData">
        <%
            while(subjectRS.next()){
        %>  <option value="<%=subjectRS.getString(1)+"  -  "+subjectRS.getString(2)%>"><%}%>
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
    </body>
    
    
</html>
