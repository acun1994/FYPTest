<%-- 
    Document   : logout.jsp
    Created on : Aug 2, 2015, 2:30:51 PM
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>