<%-- 
    Document   : Form01
    Created on : Jul 26, 2015, 11:48:23 AM
    Author     : Amirul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Course creation</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="resources.jsp"%>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script language="javascript">
        var i = 0;
        function addKid()
        {
		i++;	
        	var div = document.createElement('div');
		
                                   //Details for subject information
                                   //Input from admin to be inserted into the database
        	div.innerHTML = '<input autocomplete="off" type="text" name="subjectname" placeholder="Enter subject name">\n\
                                 <input autocomplete="off" type="text" name="subjectID" placeholder="Enter subject ID">\n\
                                 <input autocomplete="off" type="text" name="section" placeholder="Enter number of section">\n\
                                 <input type="button" value="-" onclick="removeKid(this)">\n\
                                 <br>';
                document.getElementById('kids').appendChild(div);
         }

        function removeKid(div)
        {	
         document.getElementById('kids').removeChild( div.parentNode );
	i--;
        }
        </script>
        <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
        <script src="./resources/js/jquery.min.js"></script>
        <script src="./resources/js/bootstrap.min.js"></script>
        <!--mdl-->
        <script src="resources/mdl/material.min.js" type="text/javascript"></script>
        <link href="resources/mdl/material.light_blue-indigo.min.css" rel="stylesheet" type="text/css"/>
        <!--Materialize-->
        <script src="./resources/js/materialize.min.js"></script>
        <link rel="stylesheet" href="./resources/css/materialize.min/css">
    </head>
    
    <body>
       <% Connection connection = null; %> <!-- This variable must be declared above dbCon.jsp -->
        <%@include file="dbCon.jsp"%>
        <% Statement st = connection.createStatement(); %>
        <%@include file = "checkLogin.jsp" %>
        <%@include file="navbar_session.jsp" %>
        <div class="container">
            <%-- Form for course creation --%>
            <form role="form" name="form" method="post" action="CourseCreationDB.jsp">
                <div class="form-group">
                    <table>
                        <tr>
                            <td class="col-md-2">
                                <label>Year : </label>
                            </td>
                            <td class="mdl-textfield mdl-js-textfield textfield-demo">
                                <input class="mdl-textfield__input" type="text" name="CourseYear" id="courseyear" autocomplete="off">
                                <label class="mdl-textfield__label" for="courseyear">Example 13/14</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Semester :</label>
                            </td>
                            <td>
                                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="sem1">
                                    <input class="mdl-radio__button" type="radio" name="semester" value="1" id="sem1">1
                                </label>
                                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="sem2">
                                    <input class="mdl-radio__button" type="radio" name="semester" value="2" id="sem2">2 
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Course</label></td>
                            <td>
                                <div class="input-field col s12" >
                                    <select name="COURSEID">
                                      <%-- 
                                      Course list should be taken from database 
                                      Value not yet added to the option
                                      --%>
                                      <%
                                            try{
                                                ResultSet rs = st.executeQuery("SELECT courseID FROM courseentry");
                                                while(rs.next()){
                                      %> <option value="<%=rs.getString(1)%>"><% out.print(rs.getString(1)); %></option>
                                                <%}
                                            }catch(Exception e) {
                                                out.println(e.toString());
                                            }
                                      
                                      %>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Subject : </label></td>
                            <td id="kids">
                                <%-- See java script for detail --%>
                                <input autocomplete="on" type="text" name="subjectname" placeholder="Enter subject name">
                                <input autocomplete="off" type="text" name="subjectID" placeholder="Enter subject ID">
                                <input autocomplete="off" type="text" name="section" placeholder="Enter number of section">
                                <input type="button" value="+" onclick="addKid(this)">
                            </td>
                        </tr>
                    </table>
                </div>
                <button type="submit" class="btn waves-effect waves-light" name="action">Submit
                    <i class="material-icons"></i></button>
            </form>
        </div>
        <script language="javascript">
        var i = 0;
        function addKid()
        {
		i++;	
        	var div = document.createElement('div');
		
                                   //Details for subject information
                                   //Input from admin to be inserted into the database
        	div.innerHTML = '<input autocomplete="off" type="text" name="subjectname" placeholder="Enter subject name">\n\
                                 <input autocomplete="off" type="text" name="subjectID" placeholder="Enter subject ID">\n\
                                 <input autocomplete="off" type="text" name="section" placeholder="Enter number of section">\n\
                                 <input type="button" value="+" onclick="addKid(this)">\n\
                                 <input type="button" value="-" onclick="removeKid(this)">\n\
                                 <br>';
        
                    document.getElementById('kids').appendChild(div);
                
         }

        function removeKid(div)
        {	
         document.getElementById('kids').removeChild( div.parentNode );
	i--;
        }
        </script>
        <!-- Remove GET variable when refresh -->
        <script>    
        if(typeof window.history.pushState === 'function') {
            window.history.pushState({}, "Hide", "http://localhost:8080/FYPDev/CourseCreation.jsp");
        }
        </script>
    </body>
</html>
