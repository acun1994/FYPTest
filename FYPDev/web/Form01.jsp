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
        <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
        <script src="../resources/jquery.min.js"></script>
        <script src="../resources/js/bootstrap.min.js"></script>
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
                            <li><input type="radio" name="semester" value="1">1</li>
                            <li><input type="radio" name="semester" value="2">2</li>
                        </ul>
                    </div>
                    <table>
                        <tr>
                            <th><label>Course & Year: </label></th>
                            <th>
                                <div class="form-horizontal" >
                                    <input type="text" name="course" placeholder="Eg:SCSJ">
                                    <input type="text" name="courseyear" placeholder="Eg:20142015">
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
                                    <option value="1">01</option>
                                    <option value="2">02</option>
                                    <option value="3">03</option>
                                    <option value="4">04</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <button type="submit" class="btn btn-submit">Submit</button>
            </form>
        </div>
        <%Connection connection = null; %>
        <%@ include file="dbCon.jsp"%>   
        <% ResultSet rs = null; 

           String query = "select * from subject_list";
           try {
               Statement statement = connection.createStatement();
               rs = statement.executeQuery(query);
           }catch(Exception e){
               e.printStackTrace();
           }
        %>
    </body>
</html>
