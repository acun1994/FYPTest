<%-- 
    Document   : dashboard
    Created on : 11-Aug-2015, 11:56:25
    Author     : pheni
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <%@include file="checkLogin.jsp" %>
        <% Connection connection = null; %>
        <%@ include file="dbCon.jsp"%>
        <%@page import="java.util.Date"%>
        
    </head>
    <body>
        <%
            //Getting attributes from sessions
            String name = session.getAttribute("name").toString();
            String userid = session.getAttribute("userid").toString();
            
            PreparedStatement getCourseEntryID = connection.prepareStatement("select * from courseentry where semYear=?");
            PreparedStatement getCoordinating = connection.prepareStatement("select * from coordinatorlist where coordinatorID=? and semYear=?");
            PreparedStatement getTeaching = connection.prepareStatement("select * from lectlist where lecturerid=? and courseEntryID=?");
            PreparedStatement getSubjectName = connection.prepareStatement("select * from subject where subjectid=?");
            
            getCoordinating.setString(1, userid);
            getTeaching.setString(1, userid);
            
            String year = request.getParameter("year");
        %>
        <%@include file="getDate.jsp" %>
        <h1>Welcome <%= name %> </h1>
       
        <%//Listing all coordinating subject for the semYear
            ResultSet Coordinating = getCoordinating.executeQuery();
            if(Coordinating != null)
            {
        %>
        <label>Subjects You Coordinate</label>
        <table>
            <tr>
                <th>Subject ID</th>
                <th>Subject Name</th>
                <th>Status</th>
                <th>View</th>
            </tr>
        <%
                while(Coordinating.next())
                {
                    getSubjectName.setString(1,Coordinating.getString("subjectid"));
                    ResultSet subjectName = getSubjectName.executeQuery();
        %>
                <tr>
                    <td><%= Coordinating.getString("subjectid") %></td>
                    <td><% if(subjectName.next()){out.println(subjectName.getString("subjectName"));}%></td>
                    <td><%= Coordinating.getString("status") %></td>
                    <td> <span class="glyphicon glyphicon-search"></span> </td>
                </tr>
        <%
                }
        %>
        </table>
        <%
            }//Done listing all coordinating subject   
        %>
        
        <%//Listing all teaching subject for the semYear
            ResultSet courseEntryID = getCourseEntryID.executeQuery();
            if(courseEntryID.next())    
               getTeaching.setString(2, courseEntryID.getString("courseEntryID"));
            
            ResultSet teaching = getTeaching.executeQuery();
            if(teaching != null)
            {
        %>
        <label>Subjects You Teach</label>
        <table>
            <tr>
                <th>Subject ID</th>
                <th>Subject Name</th>
                <th>Section No</th>
                <th>Status</th>
                <th>View</th>
            </tr>
        <%
            while(teaching.next())
                {
                    getSubjectName.setString(1,teaching.getString("subjectid"));
                    ResultSet subjectName = getSubjectName.executeQuery();   
        %>
                <tr>
                    <td><%= teaching.getString("subjectid") %></td>
                    <td><% if(subjectName.next()){out.println(subjectName.getString("subjectName"));}%></td>
                    <td><%= teaching.getString("sectionNo") %></td>
                    <td><%= teaching.getString("status") %></td>
                    <td> <span class="glyphicon glyphicon-search"></span> </td>
                </tr>
        <%
                }
        %>
        </table>
        <%
            }
        %>
        
    </body>
</html>
