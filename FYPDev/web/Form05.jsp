<%-- 
    Document   : Form05
    Created on : Jul 29, 2015, 12:00:16 PM
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
        <title>Form05 : Assign Lecturer to sections</title>
    </head>
    <body>
        <%@include file="home02.html"%>
        <div class="container">
            <h3 align="center">Assign Lecturer</h3>
            <form class="form-group">
                <table class="table" id="div">
                    <tbody>
                        <tr>
                            <td><label>Lecturer name : </label></td>
                            <td><input type="text" class="form-horizontal" placeholder="Enter lecturer name" name="Assign_Lect" autocomplete="on"></td>
                        </tr>
                        <tr>
                            <td><label>Section : </label></td>
                            <td><input type="text" class="form-horizontal" placeholder="Enter section to be assign" name="Assign_Sections"></td>
                        </tr>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-submit" align="center">Confirm</button>
            </form>
        </div>
        
    </body>
</html>
