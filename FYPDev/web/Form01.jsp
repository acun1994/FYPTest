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
        <title>Form 01 : Year Course Creation</title>
    </head>
    <body>
        <div>
            <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="home02.html">WebSiteName</a>
                </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="home02.html">Home</a></li>
                    <li><a href="Form01.jsp">Course Creation</a></li>
                    <li><a href="Form02.jsp">Lecturer Selection</a></li>
                    <li><a href="Form03.jsp">Review</a></li>
                    <li><a href="Form04.jsp">Course File Uploads</a></li>
                </ul>
            </div>
            </div>
        </nav>
        </div>
        <div class="container">
            <form role="form" class="form-horizontal" name="form" method="post">
                <div class="form-group">
                    <label class="col-sm-2">Year : </label>
                    <input type="integer" name="CourseYear" placeholder="Enter year">
                    <div>
                        <label class="col-sm-2">Semester</label>
                        <input type="radio" name="semester"> 01   
                        <input type="radio" name="semester"> 02
                    </div>
                    <table class="table table-bordered">
                        <tr>
                            <th><label>Course & Year: </label></th>
                            <th>
                                <div class="form-horizontal" >
                                    <input type="text" name="course" placeholder="Eg:SCSJ">
                                    <input type="text" name="courstyear" placeholder="Eg:20142015">
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <td><label>Subject : </label></td>
                            <td>
                                <select name="subject">
                                    <option>Subject Name & ID</option>
                                    <option></option>
                                </select>
                            </td>
                            <td>
                                <select>
                                    <option>Section</option>
                                    <option>01</option>
                                    <option>02</option>
                                    <option>03</option>
                                    <option>04</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <button type="submit" class="btn btn-submit" align="center">Submit</button>
            </form>
        </div>
    </body>
</html>
