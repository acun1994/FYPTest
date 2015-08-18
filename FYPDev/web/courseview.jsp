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
        <%@include file="checkLogin.jsp" %>        
        <% Connection connection = null; %>
        <%@ include file="dbCon.jsp"%>
        <%@page import="java.util.ArrayList" %>
        <%@include file="resources.jsp" %>
        <script src="./resources/js/gen_validatorv4.js"></script>
        <%@include file="navbar_session.jsp" %>    
        <script src="CourseView_controllers/showCourseYear.js" type="text/javascript"></script>
    <body>
        <div id="wrapper">
            <div id="sidebar-wrapper">
                <%@include file="sidebar.jsp" %>
            </div>
            <div id="page-content-wrapper">
                <%@include file="CourseView_controllers/controller.jsp" %>
            </div>
        </div>
    </body>
</html>
