<%-- 
    Document   : loginAuth
    Created on : Jul 29, 2015, 9:58:03 PM
    Author     : Kensiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%Connection connection = null;%>
        <%@ include file="dbCon.jsp"%>
        <%
            String redirect = null;
        
            try{
                String username = request.getParameter("login_username");
                String password = request.getParameter("login_password");
                
                
                PreparedStatement theStatement = null;
                theStatement = connection.prepareStatement("SELECT * from userinfo where userName=? AND password=?");
                theStatement.setString(1,username);
                theStatement.setString(2,password);
                
                ResultSet theResult = theStatement.executeQuery();
                
                if(theResult.next())
                {
                    redirect = "./index.jsp";
                    out.println("Redirecting </br>");
                    session.setAttribute("userid",theResult.getString("userID"));
                    session.setAttribute("username",theResult.getString("userName"));
                    session.setAttribute("usertype",theResult.getString("userType"));
                    response.sendRedirect(redirect);
                }   
                else
                {
                    redirect = "./login.jsp?login=failed";
                    response.sendRedirect(redirect);
                }
               }
            catch(Exception e)
            {
                    
                
                    out.println("Failed");
                    out.println("Exception occured! "+e.getMessage()+" "+e.getStackTrace());
                    
             }
        %>
    </body>
</html>
 