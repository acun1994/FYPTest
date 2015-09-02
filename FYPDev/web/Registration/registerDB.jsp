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
            String userid = request.getParameter("reg_userID");
            String username = request.getParameter("reg_username");
            String password = request.getParameter("reg_password2");
            int usertype = Integer.parseInt(request.getParameter("reg_usertype"));
            String jabatan = request.getParameter("reg_jabatan");
            String name = request.getParameter("reg_name");
                    
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
