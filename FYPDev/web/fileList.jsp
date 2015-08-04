<%-- 
    Document   : fileList
    Created on : 28-Jul-2015, 09:40:10
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %> 
<%@page import="java.util.*" %> 
<%@ include file="checkLogin.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Listing</title>
        <link rel="stylesheet" href="resources/css/bootstrap.css" type="text/css"/>
        <script src="resources/js/jquery.js" type="text/javascript"></script>
        <script src="resources/js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <form action="#" method="post">
            <label>User:&nbsp;</label><input type="text" name="userName" >
            <input class="btn btn-default" type="submit">
        </form>
        
        <% if ((request.getParameter("userName")!=null) && (!request.getParameter("userName").equals(""))){ 
            String filePath = request.getSession().getServletContext().getRealPath(request.getServletPath());
            
            int filePos = filePath.lastIndexOf("\\");
            
            filePath=filePath.substring(0,filePos);
            
        %> Current folder : <%=request.getParameter("userName")%><%
            
            String folder = "/downloadFiles/"+request.getParameter("userName");
   
            File dir = new File(filePath+folder);
            
            if (!dir.exists()){
                %> Error. Folder '<%= folder %>' not found.  <%
            }
            else{
                File[] list = dir.listFiles();
                
                if (list.length==0){
                    %> <br/>No files found in <%= request.getParameter("userName") %><%}
                else{    
                
                %>
                <table class="text-center table-bordered"><thead><th>File Type</th><th>Filename</th><th colspan="3">Action</th></thead>
                
                <%
                int fileCount = 0;
                for(File curFile:list){ 
                    
                    if (curFile.isFile()){
                %>
                <tr>
                    <td> None </td>
                    <td><%= curFile.getName() %> </td>
                    <td><form action="./testLoad" method="post">
                        <input hidden name="filePath" value="<%=folder+"/"+curFile.getName()%>">
                        <input class="btn btn-default" type="submit" value="Download">
                    </form></td>
                    <td><form action="./delete.jsp" method="post">
                        <input hidden name="filePath" value="<%=folder+"/"+curFile.getName()%>">
                        <input class="btn btn-default" type="submit" value="Delete">
                    </form></td>
                </tr>
                <% }
                    else if(curFile.isDirectory()){
                        File nestedFolder=new File(filePath+folder+"/"+curFile.getName());
                        
                        File[] nestedList = nestedFolder.listFiles();
                        
                        for(File curNestFile:nestedList){ 
                    if (curNestFile.isFile()){ fileCount++;
                %>
                <tr>
                    <td><%= curFile.getName() %></td>
                    <td><%= curNestFile.getName() %> </td>
                    <td><form action="./testLoad" method="post">
                        <input hidden name="filePath" value="<%=folder+"/"+curFile.getName()+"/"+curNestFile.getName()%>">
                        <input class="btn btn-default" type="submit" value="Download">
                    </form></td>
                    <td><form action="./delete.jsp" method="post">
                        <input hidden name="filePath" value="<%=folder+"/"+curFile.getName()+"/"+curNestFile.getName()%>">
                        <input class="btn btn-default" type="submit" value="Delete">
                    </form></td>
                </tr>
                <% }}
                        
    }} if (fileCount == 0){
                            %><tr><td colspan="3"> No Files Found</td></tr><%
                        }%>
                </table>

            <% }} }
           %>
    </body>
</html>
