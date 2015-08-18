<%-- 
    Document   : subjectview
    Created on : Jul 27, 2015, 10:11:22 AM
    Author     : Kensiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overall Course View</title>
        <%@include file="resources.jsp" %>
        <script src="./resources/js/gen_validatorv4.js"></script>
        <%@include file="checkLogin.jsp" %>
        <%@include file="navbar_session.jsp" %>
        <% Connection connection = null; %>
        <%@ include file="dbCon.jsp"%>
        <%@page import="java.util.ArrayList" %>
        
    </head>
    <body>
        <div id="wrapper">
            <div id="sidebar-wrapper">
                <%@include file="sidebar.jsp" %>
            </div>
            <div id="page-content-wrapper">
                <%@include file="SubjectView_controllers/controller.jsp" %>
            </div>
        </div>
    </body>
</html>
