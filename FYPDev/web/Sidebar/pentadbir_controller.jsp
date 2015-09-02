<%-- 
    Document   : pentadbir_controller
    Created on : 17-Aug-2015, 15:28:26
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>

<%
    try{
    PreparedStatement sidebar_getKJInfo = connection.prepareStatement("select * from userinfo where userID=?");
    sidebar_getKJInfo.setString(1, sidebar_id);
   
    ResultSet sidebar_KJInfo = sidebar_getKJInfo.executeQuery();    
    if(sidebar_KJInfo.next()){
        PreparedStatement sidebar_getKJSemYear = connection.prepareStatement("select * from courseentry where courseid like ?");
        sidebar_getKJSemYear.setString(1, "%" + sidebar_KJInfo.getString("jabatan"));
        ResultSet sidebar_KJSemYear = sidebar_getKJSemYear.executeQuery();

        ArrayList<String> KJyear = new ArrayList();

        while (sidebar_KJSemYear.next()) {//Making sure all listed result are unique
            if (KJyear.contains(sidebar_KJSemYear.getString("semYear")) == false) {
                KJyear.add(sidebar_KJSemYear.getString("semYear"));
            }
        }//End While
%>
<li class="dropdown"><button id="btnnavbar" class="mdl-button mdl-js-button mdl-color-text--white dropdown-toggle" data-toggle="dropdown"><a>Sem Year<span class="caret"></span></a></button>
<ul class="dropdown-menu">
<form action="dashboard.jsp" method="get">
    <%for (int i = 0; i < KJyear.size(); i++) {%>
    <li>
        <button id="btnnavbar" class="mdl-button mdl-js-button" type="submit" name="year" value="<%= KJyear.get(i)%>">
            <%= KJyear.get(i)%>
        </button>
    </li>
    <%}//End For%>
</form>
</ul>
<%
    }//End If
    }catch(Exception e)
    {
        out.println("Failed");
        out.println("Exception occured! " + e.getMessage() + " " + e.getStackTrace());
    }
%>