<%-- 
    Document   : sidebar
    Created on : 16-Aug-2015, 10:59:41
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>

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
                <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="CourseCreation.jsp">Create Course</a></button></li>
          <%            case 2:%>
                <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="courseview.jsp">Course View</a></button></li>
          <%-- For listing all the semYear that the KJ of the Jabatan involved --%>
                        <%@include file="Sidebar/pentadbir_controller.jsp" %>
          <%            case 3:%>
          <%-- For listing all the semYear that the lecturer involved --%>
                        <%@include  file="Sidebar/lecturer_controller.jsp" %>
          <%            default:%>
                <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="logout.jsp">Log Out</a></button></li>
          <%
                      }//End Switch
                  }//End If
          %>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->
