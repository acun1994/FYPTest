<%-- 
    Document   : loginAuth
    Created on : Jul 29, 2015, 9:58:03 PM
    Author     : Kensiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%Connection connection = null;%>
        <%@ include file="dbCon.jsp"%>
        <%
            try{
                String username = request.getParameter("login_username");
                String password = request.getParameter("login_password");
//              String userType = request.getParameter("usertype");
                
                PreparedStatement theStatement = null;
                theStatement = connection.prepareStatement("SELECT * from user_login where userName=? AND password=?");
                theStatement.setString(1,username);
                theStatement.setString(2,password);
                ResultSet theResult = theStatement.executeQuery();
                
                if(theResult.next())
                    out.println("Success");
                else
                    out.println("Failed");
                    }catch(Exception e){
                        out.println("Exception occured! "+e.getMessage()+" "+e.getStackTrace());
                    }  

        %>
    </body>
</html>
 