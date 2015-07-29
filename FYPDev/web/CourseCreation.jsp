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
        
        <SCRIPT language="javascript">
        var i = 0;
        
        function addKid()
        {
		i++;	
        	var div = document.createElement('div');
		div.setAttribute('class', 'myclass');
                                   //Details for subject information
                                   //Input from admin to be inserted into the database
        	div.innerHTML = '<input type="text" name="subjectname" placeholder="Enter subject name">\n\
                                 <input type="text" name="subjectID" placeholder="Enter subject ID">\n\
                                 <input type="text" name="section" placeholder="Enter number of section">\n\
                                 <input type="button" value="-" onclick="removeKid(this)">\n\
                                 <br>';
                document.getElementById('kids').appendChild(div);
         }

        function removeKid(div)
        {	
         document.getElementById('kids').removeChild( div.parentNode );
	i--;
        }
        </SCRIPT>
        
    </head>
    
    <body>
        <h1> Course Creation </h1>
        
        <div class="container">
            
            <%-- Form for course creation --%>
            <form role="form" class="form-horizontal" name="form" method="post" action="CourseCreationDB.jsp">
                
                <div class="form-group">
                    
                    <div>
                    <label class="col-sm-2">Year : </label>
                    <input type="text" name="CourseYear" placeholder="Example 13/14">
                    </div>
                   
                        <%-- Value not added yet --%>
                        <label class="col-sm-2">Semester</label>
                        <input type="radio" name="semester" value="1">1
                        <input type="radio" name="semester" value="2">2
                        <input type="radio" name="semester" value="3">3
                   
                
                    <table>
                        <tr>
                            <th><label>Course</label></th>
                            <th>
                                <div class="form-horizontal" >
                                    
                                    <select name="COURSEID">
                                      <%-- 
                                      Course list should be taken from database 
                                      Value not yet added to the option
                                      --%>
                                        <option value="Not Selected">Course</option>
                                        <option value="SCSJ1">SCSJ1</option>
                                        <option value="SCSJ2">SCSJ2</option>
                                    </select>
                                   
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th><label>Subject : </label></th>
                            <td id="kids">
                                <%-- See java script for detail --%>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        <td><input type="button" onClick="addKid()" value="Add Subject" /></td>
                        
                        </tr>
                    </table>
                </div>
                <button type="submit" class="btn btn-submit">Submit</button>
            </form>
        </div>
    </body>
</html>
