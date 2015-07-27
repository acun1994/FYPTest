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
        <link rel="stylesheet" href="..css/bootstrap.min.css">
        <script src="..jquery.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <style>
            td {
                border: 1px solid black;
            }</style>   
        <title>Page 01 : Insert Subject</title>
    </head>
    <body>
        <div class="container">
            <form role="form" class="form-horizontal" name="form" method="post">
                <div class="form-group">
                    <label class="col-sm-2">Year : </label>
                    <input type="integer" name="CourseYear" placeholder="Enter year">
                    <div>
                        <label class="col-sm-2">Semester</label>
                        <ul>
                            <li><input type="radio" name="semester">1</li>
                            <li><input type="radio" name="semester">2</li>
                        </ul>
                    </div>
                    <table>
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
                <button type="submit" class="btn btn-submit">Submit</button>
            </form>
        </div>
    </body>
</html>
