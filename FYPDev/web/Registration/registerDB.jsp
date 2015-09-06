<%-- 
    Document   : registerDB
    Created on : 31-Aug-2015, 17:48:00
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../passwordEncryption.jsp" %>
        <%Connection connection = null;%>
        <%@ include file="../dbCon.jsp"%>
    </head>
    <body>
        <% 
            String userid = request.getParameter("regUserID");
            String username = request.getParameter("regUsername");
            String password = request.getParameter("regPassword2");
            int usertype = Integer.parseInt(request.getParameter("regUsertype"));
            String jabatan = request.getParameter("regJabatan");
            String name = request.getParameter("regName");
                    
            String hashedPassword = hashPassword(password);
           
            String redirect = null;
            
            try{
            PreparedStatement insertQuery = connection.prepareStatement("insert into userinfo(userID,userName,password,userType,jabatan,name) values (?,?,?,?,?,?) ");
                insertQuery.setString(1, userid);
                insertQuery.setString(2, username);
                insertQuery.setString(3, hashedPassword);
                insertQuery.setInt(4, usertype);
                insertQuery.setString(5, jabatan);
                insertQuery.setString(6, name);
            insertQuery.executeUpdate();
            
            redirect = "../registerView.jsp?registration=success";
            response.sendRedirect(redirect);
            }catch(Exception e)
            {
             redirect = "../registerView.jsp?registration=failed";
             response.sendRedirect(redirect);
             out.println("Unsuccessful insertion" + "<br/>" + e.toString());
            }
        %>
    </body>
</html>
