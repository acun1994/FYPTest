<%-- 
    Document   : Form01
    Created on : Jul 26, 2015, 11:48:23 AM
    Author     : Amirul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <style>
            td {
                border: 1px solid black;
            }
        </style> 
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
        <title>Form 01 : Year Course Creation</title>
    </head>
    <body>
        <%@include file="home02.html" %>
        <div class="container">
            <form role="form" class="form-horizontal" name="form" method="post"
                  action="CourseCreationDB.jsp">
                <div class="form-group">
                    <label class="col-sm-2">Year : </label>
                    <input type="text" name="CourseYear" size="100" placeholder="This value will not be added to database yet,wait Alvin create year column somewhere">
                    <div>
                        <label class="col-sm-2">Semester</label>
                        <ul>
                            <li><input type="radio" name="semester" value="1">1</li>
                            <li><input type="radio" name="semester" value="2">2</li>
                        </ul>
                    </div>
                    <table class="table table-bordered">
                        <tr>
                            <th><label>Course & Year: </label></th>
                            <th>
                                <div class="form-horizontal" >
                                    <input type="text" name="course" placeholder="Eg:SCSJ">
                                    <input type="text" name="courseyear" placeholder="Eg:14/15">
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th><label>Subject : </label></th>
                            <td id="kids">
                                    <input type="text" name="subjectname" placeholder="Enter subject name">
                                    <input type="text" name="subjectID" placeholder="Enter subject ID">
                                    <input type="text" name="section" placeholder="Enter number of section">
                                    <input type="button" value="-" onclick="removeKid(this)">
                                    <br>
                                <%-- See java script for detail --%>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        <td><input type="button" onClick="addKid()" value="Add Subject" /></td>
            
                    </table>
                </div>
                <span style="align:center"><button type="submit" class="btn btn-submit">Submit</button></span>
            </form>
        </div>
    </body>
</html>
