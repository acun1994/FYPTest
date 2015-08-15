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
        <%@include file="navbar_session.jsp" %>
        <%@ include file="dbCon.jsp"%>
        <%@page import="java.util.Date"%>
        <style>
        #center{
            position:relative;
            top: 50%;
            left: 50%;
            width:30em;
            height:15em;
            margin-top: 100px; /*set to a negative number 1/2 of your height*/
            margin-left: -15em; /*set to a negative number 1/2 of your width*/
            border: 1px solid #ccc;
            background-color: #f3f3f3;
        }
        td{
            align:center;
            border:1px solid;
        }
        
        </style>
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
        <div id="center">
            <!--subject coordinate-->
            <table align="center">
                <thead>
                    <tr>
                        <div align="center">Subject You Coordinate</div>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <div id="a">
                                <table>
                                    <thead>
                                        <tr>
                                            <td>10000000000</td>
                                            <td>10000000000</td>
                                            <td>10000000000</td>
                                            <td>10000000000</td>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <br><br><br>
            <!--Subject teach-->
            <table align="center">
                <thead>
                    <tr>
                        <div align="center">Subject You teach</div>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <div id="a">
                                <table>
                                    <thead>
                                        <tr>
                                            <td>10000000000</td>
                                            <td>10000000000</td>
                                            <td>10000000000</td>
                                            <td>10000000000</td>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        
    </body>
</html>
