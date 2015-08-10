<%-- 
    Document   : Form01
    Created on : Jul 26, 2015, 11:48:23 AM
    Author     : Amirul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Course creation</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
        <script src="./resources/js/jquery.min.js"></script>
        <script src="./resources/js/bootstrap.min.js"></script>
        <!--mdl-->
        <script src="resources/mdl/material.min.js" type="text/javascript"></script>
        <link href="resources/mdl/material.light_blue-indigo.min.css" rel="stylesheet" type="text/css"/>
        <!--Materialize-->
        <script src="./resources/js/materialize.min.js"></script>
        <link rel="stylesheet" href="./resources/css/materialize.min/css">
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
        
    </head>
    
    <body>
        <%@include file="navbar_session.jsp" %>
        <%Connection connection = null;%>
        <%@ include file="dbCon.jsp"%>
        <div class="container">
            <%-- Form for course creation --%>
            <form role="form" name="form" method="post" action="CourseCreationDB.jsp">
                <div class="form-group">
                    <table style="float:center">
                        <tr>
                            <td class="col-md-2">
                                <label>Year : </label>
                            </td>
                            <td class="mdl-textfield mdl-js-textfield textfield-demo">
                                <input class="mdl-textfield__input" type="text" name="CourseYear" id="courseyear">
                                <label class="mdl-textfield__label" for="courseyear">Example 2013/2014</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Semester :</label>
                            </td>
                            <td>
                                <%-- Value not added yet --%>
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
                                        <option value="Not Selected">Course</option>
                                        <option value="1SCSJ">1SCSJ</option>
                                        <option value="2SCSJ">2SCSJ</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Subject : </label></td>
                            <td id="kids">
                                <%-- See java script for detail --%>
                                <input autocomplete="off" type="text" name="subjectname" placeholder="Enter subject name">
                                <input autocomplete="off" type="text" name="subjectID" placeholder="Enter subject ID">
                                <input autocomplete="off" type="text" name="section" placeholder="Enter number of section">
                                <input type="button" value="-" onclick="removeKid(this)">
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        <td><input type="button" onClick="addKid()" value="Add Subject" /></td>
                        </tr>
                    </table>
                </div>
                <button type="submit" class="btn waves-effect waves-light" name="action">Submit
                    <i class="material-icons"></i></button>
            </form>
        </div>
         
    </body>
</html>
