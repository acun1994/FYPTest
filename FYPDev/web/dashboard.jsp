<%-- 
    Document   : dashboard
    Created on : 11-Aug-2015, 11:56:25
    Author     : pheni
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <%@include file="checkLogin.jsp" %>
        <% Connection connection = null; %>
        <%@ include file="dbCon.jsp"%>
        <%@include file="navbar_session.jsp" %>
    
    </head>

    <body>
        <div id="wrapper">
    <%
            //Getting attributes from sessions
            String name = session.getAttribute("name").toString();
            String userid = session.getAttribute("userid").toString();
            int usertype = Integer.parseInt(session.getAttribute("usertype").toString());
    %>
            
        <%@include file="sidebar.jsp" %>
        
        <div class="mdl-card-actions" align="center" id="page-content-wrapper">
            
            <h1>Welcome <%= name %> </h1>
            <%
                if(usertype == 2){ %>
                <%@include file="Dashboard/KJ_View.jsp" %>
            <%    
                }
                if(usertype == 3){
            %>
                 <%@include file="Dashboard/Coord_View.jsp" %>
            <%
                }    
            %>     
                 
            </div><%-- End page content wrapper --%>
        </div><%-- End wrapper --%>
    </body>
</html>
