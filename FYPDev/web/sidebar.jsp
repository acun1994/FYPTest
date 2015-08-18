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
          <%            case 3:%>
          <%-- For listing all the semYear that the lecturer involved --%>
                <%
                    PreparedStatement sidebar_getLectInfo = connection.prepareStatement("select * from lectlist where lecturerID=?");
                       sidebar_getLectInfo.setString(1, sidebar_id);
                    ResultSet sidebar_LectInfo = sidebar_getLectInfo.executeQuery();
                    out.println("watakoyo");
                    PreparedStatement sidebar_getSemYearLecturer = connection.prepareStatement("select * from courseentry where courseentryid=?");
                        while(sidebar_LectInfo.next())
                        {
                        sidebar_getSemYearLecturer.setString(1, sidebar_LectInfo.getString("courseentryid"));
                        ResultSet sidebar_semYearLecturer = sidebar_getSemYearLecturer.executeQuery();
                    %>
                    <form action="dashboard.jsp" method="get">
                    <%
                            while(sidebar_semYearLecturer.next())
                            {
                    %>
                                <li>
                                    <button id="btnnavbar" class="mdl-button mdl-js-button" type="submit" name="year" value="<%= sidebar_semYearLecturer.getString("semYear") %>">
                                    <%= sidebar_semYearLecturer.getString("semYear") %>
                                    </button>
                                </li>
                    <%
                            }//End While
                        }//End While
                    %>
                    </form>
                
          <%            default:%>
                <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="logout.jsp">Log Out</a></button></li>
          <%
                      }//End Switch
                  }//End If
          %>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->
