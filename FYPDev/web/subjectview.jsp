<%-- 
    Document   : subjectview
    Created on : Jul 27, 2015, 10:11:22 AM
    Author     : Kensiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="navbar_session.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overall Course View</title>
        
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css"/>
        <script src="./resources/js/jquery.min.js"></script>
        <script src="./resources/js/bootstrap.min.js"></script>
        <script src="./resources/js/validator/gen_validatorv4.js"></script>
        
    </head>
        <body>
        <%Connection connection = null;%>
        <%@ include file="dbCon.jsp"%>
        <h1 class="text-center">Overall Course View</h1>
        <% ResultSet rs = null; 

           String query = "select * from subject_list";
           try {
               Statement statement = connection.createStatement();
               rs = statement.executeQuery(query);
           }catch(Exception e){
               e.printStackTrace();
           }
           int i = 0;
        %>

        <div align="center"> 
            <%-- Select for Year selection --%>
            <select><%-- options are from database --%>
                <option value="#">Year</option>
                <option>13/14</option>
                <option>14/15</option>
                <option>15/16</option>
            </select>
         
            <%-- Select for Course selection --%>
            <select><%-- options are from database --%>
                <option value="#">Course</option>
                <option>1 SCSJ</option>
                <option>2 SCSJ</option>
                <option>3 SCSJ</option>
            </select>
        
            <%-- Dropdown for Semester selection --%>
            <select><%-- options are from database --%>
                <option value="#">Semester</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
            </select>
        </div>
        <br/><br/>
        <div> <%-- List of all subject for particular course at that semester & year --%>
            <%-- 
            The list will be generated from the database. 
            Based the format below.    
            --%>
            <table class="table-bordered table-responsive" align="center">
                <tr>
                    <th class="text-center">No.</th>
                    <th class="text-center">Subject</th>
                    <th class="text-center">Subject ID</th>
                    <th class="text-center">Status</th>
                    <th class="text-center">View</th>
                </tr>
                    <% while(rs.next()) { %>
                    <tr>
                    <td class="text-center" style="padding:10px"><%= ++i %></td>
                    <td class="text-center" style="padding:10px"><%= rs.getString("subjectName") %></td>
                    <td class="text-center" style="padding:10px"><%= rs.getString("subjectID") %></td>
                    <td class="text-center" style="padding:10px">(Approved/Unapproved)</td>
                    <td class="text-center" style="padding:10px"><span class="glyphicon glyphicon-search"></span></i></td>
                </tr>
                <% } %>
            </table>
        </div>    
            
        <div align="left">
            <%-- total subject count from database --%>
            Total Subject: <%= i %>
        </div>
    </body>
</html>
