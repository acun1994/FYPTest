<%-- 
    Document   : getcourse
    Created on : 10-Aug-2015, 14:51:42
    Author     : pheni
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="java.util.*,java.sql.*,java.io.*" %>

<% Connection connection = null; %>
<%@ include file="dbCon.jsp"%>

<% 
    //String course =request.getParameter("course");
    //String year =request.getParameter("year");

    String year = "14/15";
    String course = "1SCSJ";

    PreparedStatement getCourse = connection.prepareStatement("select * from courseEntry where courseID like ? and semYear like ?");
        getCourse.setString(1, course);
        getCourse.setString(2, "%" + year);
        
        
    ResultSet sem = getCourse.executeQuery();
    
%>
    <option value ="#">Semester</option>
<%
    while(sem.next())
    {
       String semester = sem.getString("semYear").substring(0, 1);
%>
    <option><%= semester %></option>
<%
    } 
%>