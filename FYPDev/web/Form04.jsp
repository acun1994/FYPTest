<%-- 
    Document   : Form04
    Created on : Jul 27, 2015, 3:43:26 PM
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
        <title>Form04:Pensyarah View</title>
    </head>
    <style>
        #container{
            align:center;
            border:1px solid black;
        }
        #div {
            position:absolute;
            top: 50%;
            left: 50%;
            width:30em;
            height:7em;
            margin-top: -9em; /*set to a negative number 1/2 of your height*/
            margin-left: -15em; /*set to a negative number 1/2 of your width*/
            border: 1px solid #ccc;
            background-color: #f3f3f3;
        }
    </style>
    <body>
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
        <h2 align="center">Course File Uploads</h2>
        <div id="div" class="container" height="100" weidth="50"> 
            <form class="form-horizontal" type="form" name="subject_Upload">
                <label>Subject ID files(0/15) : </label>
                <button type="submit" class="btn btn-submit" href="#">Upload</button>
                <br>
                <label> Total Subject : </label>
                <br>
                <label>Total Completed Course File : </label>
            </form>
        </div>
    </body>
</html>
