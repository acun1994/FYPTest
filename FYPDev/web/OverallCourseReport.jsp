<%-- 
    Document   : OverallCourseReport
    Created on : Aug 3, 2015, 10:22:14 AM
    Author     : Amirul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
        <script src="./resources/js/jquery.min.js"></script>
        <script src="./resources/js/bootstrap.min.js"></script>
        <!--Material Design-->
        <script src="./resources/mdl/material.min.js"></script>
        <link rel="stylesheet" href="./resources/mdl/material.indigo-pink.min.css">
        <link rel="stylesheet" href="./resources/mdl/material.light_blue-indigo.min.css">
        <style>
            td{
                align:center;
            }
        </style>
            
        <title>Overall Course Report</title>
    </head>
    <body>
        <%@include file="navbar_session.jsp" %>
        <div class="container">
            <form type="form-group">
                <h3 align="center">Overall Course Report</h3>
                <label>Course : </label>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <td><label>Subject</label></td>
                            <td><label>Number of Sections</label></td>
                            <td><label>Coordinator</label></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>
