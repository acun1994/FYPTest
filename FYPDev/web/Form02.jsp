<%-- 
    Document   : Form02
    Created on : Jul 27, 2015, 9:54:25 AM
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
        <title>Form02 : Lecturer Selection</title>
    </head>
    <body>
        <%@include file="home02.html" %>
        <div class="container" align="center">
            <form role="form" class="form-group" type="post" method="get" name="Lecturer_Selection" autocomplete="on">
                <input name="Subject_ID" type="text" class="form-horizontal" placeholder="Subject ID">
                <input name="Subject_Name" type="text" class="form-horizontal" placeholder="Subject Name">
                <table class="table table-borderline">
                    <tr>
                        <td><label>Penyelaras : </label></td>
                        <td><input name="Penyelaras_Name" type="text" class="col-sm-10 form-horizontal" placeholder="Enter Lect. Name Here"></div></td>
                    </tr>
                    <tr>
                        <td><label>Lecturer: </label></td>
                        <td><table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th><div align="center">Name</div></th>
                                        <th><div align="center">ID</div></th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td><div align="center" class="col-sm-10"><input type="text" class="col-sm-10" name="lecturer_name"></div></td>
                                    <td><div align="center" class="col-sm-10"><input type="text" class="col-sm-10" name="lecturer_id"></div></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <label>Total Lecturer : </label>
                <br>
                <label>Total Section : </label>
                <br>
                <button type="submit" class="btn btn-submit">Submit</button>
            </form>
        </div>
    </body>
</html>
