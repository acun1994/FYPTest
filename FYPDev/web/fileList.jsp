<%-- 
    Document   : fileList
    Created on : 28-Jul-2015, 09:40:10
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %> 
<%@page import="java.util.*" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Listing</title>
    </head>
    <body>
        <form action="#" method="post">
            <label>User: </label><input type="text" name="userName">
            <input class="btn btn-default" type="submit">
        </form>
        
        <% if ((request.getParameter("userName")!=null) && (!request.getParameter("userName").equals(""))){ 
            String filePath = request.getSession().getServletContext().getRealPath(request.getServletPath());
            String folder = "downloadFiles\\"+request.getParameter("userName");
            
            int position=filePath.lastIndexOf("build");
            filePath = filePath.substring(0, position);
   
            File dir = new File(filePath+folder);
            
            if (!dir.exists()){
                %> Error. Folder '<%= folder %>' not found.  <%
            }
            else{
                File[] list = dir.listFiles();
                int fileCount=0;
                
                %>
                
                <table class="text-center"><thead><th>Num</th><th>Filename</th><th>Action</th></thead>
                
                <%
                
                for(File curFile:list){ 
                    fileCount++;
                %>
                <tr>
                    <td><%= fileCount %></td>
                    <td><%= curFile.getName() %> </td>
                    <td><form action="./testLoad" method="post">
                        <input name="filePath" value="<%= folder+"\\"+curFile.getName()%>">
                        <input class="btn btn-default" type="submit" value="Download">
                    </form></td>
                </tr>
                <% } %>
                </table>

            <% }} 
           %>
    </body>
</html>
