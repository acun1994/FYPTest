<%-- 
    Document   : registerView
    Created on : 31-Aug-2015, 17:54:09
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="checkLogin.jsp" %>
        <% Connection connection = null;%>
        <%@ include file="dbCon.jsp"%>
        <%@include file="navbar_session.jsp" %>
        <%@include  file="resources.jsp"%>
        <title>Register New User</title>
    
    </head>
    <body>
        <div id="wrapper">
                        <%@include file="sidebar.jsp" %>

            <div align="center" id="page-content-wrapper">
                <%
                if(request.getParameter("registration") != null){
                    if(request.getParameter("registration").equals("success")){
                        %><div class="text-center alert-success alert">Registration success</div><%
                    }
                    else if(request.getParameter("registration").equals("failed")){
                        %><div class="text-center alert-danger alert">Registration failed</div><%
                    }
                }
                %>
                <%@include file="Registration/register_controller.jsp" %>
            </div><%-- End of Page content wrapper --%>
        </div>
    </body>
</html>
