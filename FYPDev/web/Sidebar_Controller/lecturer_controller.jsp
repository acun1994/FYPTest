<%-- 
    Document   : lecturer_controller
    Created on : 17-Aug-2015, 13:24:07
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
PreparedStatement sidebar_getCourseEntryID = connection.prepareStatement("select * from lectlist where lecturerID=?");
    sidebar_getCourseEntryID.setString(1, sidebar_id);
ResultSet sidebar_CourseEntryID = sidebar_getCourseEntryID.executeQuery();
PreparedStatement sidebar_getSemYear = connection.prepareStatement("select * from courseentry where courseentryid=?");
    if(sidebar_CourseEntryID.next())
    {
    sidebar_getSemYear.setString(1, sidebar_CourseEntryID.getString("courseentryid"));
    ResultSet sidebar_semYear = sidebar_getSemYear.executeQuery();
%>
<form action="dashboard.jsp" method="get">
<%
        while(sidebar_semYear.next())
        {
%>
            <li>
                <button id="btnnavbar" class="mdl-button mdl-js-button" type="submit" name="year" value="<%= sidebar_semYear.getString("semYear") %>">
                <%= sidebar_semYear.getString("semYear") %>
                </button>
            </li>
<%
        }//End While
    }//End If
%>
</form>