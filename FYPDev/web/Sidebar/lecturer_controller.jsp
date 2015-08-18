<%-- 
    Document   : lecturer_controller
    Created on : 17-Aug-2015, 13:24:07
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PreparedStatement sidebar_getLectInfo = connection.prepareStatement("select * from lectlist where lecturerID=?");
        sidebar_getLectInfo.setString(1, sidebar_id);
    ResultSet sidebar_LectInfo = sidebar_getLectInfo.executeQuery();
    
    PreparedStatement sidebar_getSemYearLecturer = connection.prepareStatement("select * from courseentry where courseentryid=?");
    if(sidebar_LectInfo.next())
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
    }//End If
%>
</form>