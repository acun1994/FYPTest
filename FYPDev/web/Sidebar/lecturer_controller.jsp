<%-- 
    Document   : lecturer_controller
    Created on : 17-Aug-2015, 13:24:07
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>

<%
    PreparedStatement sidebar_getLectInfo = connection.prepareStatement("select * from lectlist where lecturerID=?");
         sidebar_getLectInfo.setString(1, sidebar_id);
    ResultSet sidebar_LectInfo = sidebar_getLectInfo.executeQuery();
    if(sidebar_LectInfo.next())
    { 
        PreparedStatement sidebar_getSemYearLecturer = connection.prepareStatement("select * from courseentry where courseentryid=?");
            sidebar_getSemYearLecturer.setString(1, sidebar_LectInfo.getString("courseentryid"));
        ResultSet sidebar_semYearLecturer = sidebar_getSemYearLecturer.executeQuery();
        
        ArrayList<String> Lectyear = new ArrayList();
                      
            while(sidebar_semYearLecturer.next())
                {//Making sure all listed result are unique
                    if(Lectyear.contains(sidebar_semYearLecturer.getString("semYear")) == false)
                        Lectyear.add(sidebar_semYearLecturer.getString("semYear"));
                }//End While
        
%>
<li class="dropdown"><button id="btnnavbar" class="mdl-button mdl-js-button mdl-color-text--white dropdown-toggle" data-toggle="dropdown"><a>Sem Year<span class="caret"></span></a></button>
<ul class="dropdown-menu">
<form action="dashboard.jsp" method="get">
<%    
                      for(int i = 0; i< Lectyear.size(); i++)
                      {
%>
                       <li>
                       <button id="btnnavbar" class="mdl-button mdl-js-button" type="submit" name="year" value="<%= Lectyear.get(i) %>">
                       <%= Lectyear.get(i) %>
                       </button>
                       </li>
<%                    }//End For%>
</form>
</ul>
<%  }//End If%>