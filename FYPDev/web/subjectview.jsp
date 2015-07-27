<%-- 
    Document   : subjectview
    Created on : Jul 27, 2015, 10:11:22 AM
    Author     : Kensiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="javax.sql.*" %> 



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overall Course View</title>
        
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css"/>
        <!-- Custom css -->
        <link href="resources/sidebar sources/css/simple-sidebar.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="resources/js/validator/gen_validatorv4.js"></script>
        
    </head>
        <%Connection connection = null; %>
        <%@ include file="dbCon.jsp"%>
        <h1>Overall Course View</h1>
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
                <option>3 SCJS</option>
            </select>
        
            <%-- Dropdown for Semester selection --%>
            <select><%-- options are from database --%>
                <option value="#">Semester</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
            </select>
        </div>
        
        <div> <%-- List of all subject for particular course at that semester & year --%>
            <%-- 
            The list will be generated from the database. 
            Based the format below.    
            --%>
            <table class="the-table table-striped" align="center">
                <tr>
                    <th class="text-center">No.</th>
                    <th class="text-center">Subject</th>
                    <th class="text-center">Subject ID</th>
                    <th class="text-center">Status</th>
                    <th class="text-center">View</th>
                </tr>
                    <% while(rs.next()) { %>
                    <tr>
                    <td><%= ++i %></td>
                    <td><%= rs.getString("subjectName") %></td>
                    <td><%= rs.getString("subjectID") %></td>
                    <td>(Approved/Unapproved)</td>
                    <td>Magnifying glass icon</td>
                </tr>
                <% } %>
            </table>
        </div>    
            
        <div align="left">
            <%-- total subject count from database --%>
            Total Subject: 
        </div>
    
</html>
