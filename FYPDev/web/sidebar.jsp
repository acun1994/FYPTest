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
                 if(session != null)
                {
                   session = request.getSession();
                   int type = 0; 
                   String sidebar_id = session.getAttribute("userid").toString();
                   if(session.getAttribute("usertype") != null )
                    {  
                     type = Integer.parseInt(session.getAttribute("usertype").toString());
                    }
                   switch(type)
                     {
                        case 1:
          %>
            <li class="dropdown"><button id="btnnavbar" class="mdl-button mdl-js-button mdl-color-text--white dropdown-toggle" data-toggle="dropdown"><a>Course<span class="caret"></span></a></button>
                    <ul class="dropdown-menu">
                        <li><a href="CourseCreation.jsp">Create Course</a></li>
                        <li><a href="presetCourseView.jsp">Introduce New Course</a></li>
                    </ul>
                </li>
          <%            case 2:%>
                <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="courseview.jsp">Course View</a></button></li>
          <%            case 3:%>
          <%--For listing all the semYear that the lecturer involved --%>
                <%@include file="Sidebar/lecturer_controller.jsp" %>
          <%            default:%>
                <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="logout.jsp">Log Out</a></button></li>
          <%
                      }
                  }
          %>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->
