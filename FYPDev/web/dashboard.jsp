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
        <% Connection connection = null; %>
        <%@ include file="dbCon.jsp"%>
        <%@page import="java.util.Date"%>
        
    </head>
    <body>
        <%
            String year = request.getParameter("year");
        %>
        
        <h1>Welcome (todo Change to Name) </h1>
        <%
           Calendar now = Calendar.getInstance();
           int yearNow = now.get(Calendar.YEAR);
           int monthComp = now.get(Calendar.MONTH);
           
           String setYear = Integer.toString(yearNow).substring(2,4);
           String semYear = null;
           
           if(monthComp > now.get(Calendar.JANUARY))
           {
               setYear =  Integer.toString(yearNow - 1).substring(2, 4) +  "/"  + setYear;
               
               if(monthComp > now.get(Calendar.JUNE))
                   semYear = "2-" + setYear;
               else
                   semYear = "3-" + setYear;
           }
           else
           {
               setYear = setYear + "/" +  Integer.toString(yearNow + 1).substring(2, 4);
               semYear = "1-" + setYear;
           }           
        %>
        
        
    </body>
</html>
