<%-- 
    Document   : Form03
    Created on : Jul 27, 2015, 12:03:51 PM
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
        <title>Form03 : Review</title>
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
            <div class="container" align="center">
                <select>
                    <option href="">Subject</option>
                    <option href="">Subject01</option>
                    <option href="">Subject02</option>
                    <option href="">Subject03</option>
                    <option href="">Subject04</option>
                </select>
            </div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>bil.</th>
                        <th>Section</th>
                        <th>Lect. Name</th>
                        <th>ID</th>
                        <th>State</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><a href="" ><img src="magnifying-glass-icon.png" alt="Smiley face" height="40" width="40"></a></td>
                    </tr>
                </tbody>
            </table>
            <label>Total Lect. : </label><br>
            <label>Completed Course file : </label><br>
        </div>
    </body>
</html>
