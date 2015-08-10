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
                            <td>
                                <input type="text" name="CourseYear" placeholder="Example 13/14">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Semester</label>
                            </td>
                            <td>
                                <%-- Value not added yet --%>
                                <label><input type="radio" name="semester" value="1">1 </label>
                                <label><input type="radio" name="semester" value="2">2 </label>
                                <label><input type="radio" name="semester" value="3">3 </label>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Course</label></td>
                            <td>
                                <div class="form-horizontal" >
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
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div>
        <% if (request.getParameter("insert")!=null){
            if (request.getParameter("insert").equals("false"))
                {%><div class="text-center alert-danger alert">Error in saving data.</div><%}
            else if (request.getParameter("insert").equals("true"))
                {%><div class="text-center alert-success success">Data has been successfully saved.</div><%}
            }
        %>
         
    </body>
</html>
