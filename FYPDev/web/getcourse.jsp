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
    String year =request.getParameter("year");

    PreparedStatement getCourse = connection.prepareStatement("select * from courseEntry where semYear like ?");
        getCourse.setString(1, "%" +year);
        
    ResultSet course = getCourse.executeQuery();
%>
    <option value="#">Course </option>
<%
    while(course.next())
    {
%>
    <option value="<%= course.getString("courseID") %>"> <%= course.getString("courseID") %> </option>
<%  } %>