<%-- 
    Document   : sidebar
    Created on : 16-Aug-2015, 10:59:41
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@include file="resources.jsp" %>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link href="resources/sidebar sources/simple-sidebar.css" rel="stylesheet" type="text/css"/>
<script src="Sidebar/toogleSidebar.js" type="text/javascript"></script>
<!-- Sidebar -->
<div id="sidebar-wrapper">
    <ul class="sidebar-nav nav-pills nav-stacked" id="menu">
        <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="dashboard.jsp">Dashboard</a></button></li>
        <%
                //Getting usertype from session

                session = request.getSession(false);
                if (session != null) {
                    session = request.getSession();
                    int type = 0;
                    String sidebar_id = session.getAttribute("userid").toString();
                    if (session.getAttribute("usertype") != null) {
                        type = Integer.parseInt(session.getAttribute("usertype").toString());
                    }
                    switch (type) {
                        case 1:
        %>
        <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="registerView.jsp">Register New User</a></button></li>
        <li class="dropdown"><button id="btnnavbar" class="mdl-button mdl-js-button mdl-color-text--white dropdown-toggle" data-toggle="dropdown"><a>Course<span class="caret"></span></a></button>
            <ul class="dropdown-menu">
                <li><button class="mdl-button mdl-js-button"><a href="CourseCreation.jsp">Create Course</a></button></li>
                <li><button class="mdl-button mdl-js-button"><a href="presetCourseView.jsp">Introduce New Course</a></button></li>
            </ul>
        </li>
        <%            case 2:%>
        <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="courseview.jsp">Course View</a></button></li>
                <% if(type > 1){%>
                <%@include file="Sidebar/pentadbir_controller.jsp" %> <%-- For listing all the semYear that the KJ of the Jabatan involved --%>
                <%}   
                      case 3:
                   if (type > 2) {%>
                <%@include  file="Sidebar/lecturer_controller.jsp" %> <%-- For listing all the semYear that the lecturer involved --%>
                <%}%>
                <%    default:%>
        <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="logout.jsp">Log Out</a></button></li>
        <%
                    }//End Switch
                }//End If
        %>
    </ul>
</div>
<!-- /#sidebar-wrapper -->
