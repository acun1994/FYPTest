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
            height:12em;
            margin-top: -9em; /*set to a negative number 1/2 of your height*/
            margin-left: -15em; /*set to a negative number 1/2 of your width*/
            border: 1px solid #ccc;
            background-color: #f3f3f3;
        }
    </style>
    <body>
        <%@include file="home02.html" %>
        <div id="div" class="container" height="100" weidth="50"> 
            <form class="form-horizontal" type="form" name="subject_Upload">
                <h2 align="center">Course File Uploads</h2>
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
