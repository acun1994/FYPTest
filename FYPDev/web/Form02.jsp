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
        <title>Form02 : Lecturer Selection</title>
        <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
        <script src="../resources/jquery.min.js"></script>
        <script src="../resources/js/bootstrap.min.js"></script>
    </head>
    <style>
            td {
                border: 1px solid black;
            }</style>   
        
    <body>
        <div class="container" align="center">
            <form role="form" class="form-group" type="post" name="Lecturer_Selection">
                <input name="Subject_ID" type="text" class="col-sm-5 form-horizontal" placeholder="Subject ID">
                <input name="Subject_Name" type="text" class="col-sm-10 form-horizontal" placeholder="Subject Name">
                <table>
                    <tr>
                        <td>Penyelaras : </td>
                        <td><div class="container" align="left"><input name="Penyelaras_Name" type="text" class="col-sm-10 form-horizontal" placeholder="Enter Lect. Name Here"></div></td>
                    </tr>
                    <tr>
                        <td>Lecturer : </td>
                        <td><table>
                                <tr>
                                    <td><div align="center" class="col-sm-10">Name</div></td>
                                    <td><div align="center" class="col-sm-10">ID</div></td>
                                </tr>
                                <tr>
                                    <td><div align="center" class="col-sm-10"></div></td>
                                    <td><div align="center" class="col-sm-10"></div></td>
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
