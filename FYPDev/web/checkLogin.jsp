<%-- 
    Document   : checkLogin
    Created on : 04-Aug-2015, 10:36:10
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if (session.getAttribute("username")==null || session.getAttribute("username")==""){
    
    response.sendRedirect("login.jsp?login=false");
}
%>

<%!
public boolean checkAccess(HttpSession session, int level){
    if (session.getAttribute("usertype")!=null){
        if (Integer.parseInt(session.getAttribute("usertype").toString())==(level)) return true;
    }
    return false;
}

public String quote(String text){
    return ("'" + text + "'");
}
%>