<%-- 
    Document   : integrated_download
    Created on : 7-Sept-2015, 00:34:35
    Author     : alvinsoock
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% Connection connection = null; %>
        <%@ include file="resources.jsp"%>
        <%@ include file="dbCon.jsp"%>
        <%@ include file="checkLogin.jsp"%>
        <%@ include file="navbar_session.jsp"%>
    </head>
    <body>
        <%
        PreparedStatement getFilePath = connection.prepareStatement("SELECT fileLocation FROM subjectfile WHERE fileID = ?");
            getFilePath.setString(1, request.getParameter("fileID"));
            ResultSet getFilePathRS = getFilePath.executeQuery();
            getFilePathRS.next();
            
            String fileSubPath = getFilePathRS.getString("fileLocation");
        
        String filename = fileSubPath.substring(fileSubPath.lastIndexOf('\\'));   
        String filepath = "C:/Users/user/Documents/NetBeansProjects/FYPTest/FYPTest/FYPDev/build/web/downloadFiles/" + fileSubPath;   
        response.setContentType("APPLICATION/OCTET-STREAM");   
        response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   

        File file = new File(filepath);
        FileInputStream fileIn = new FileInputStream(file);
        ServletOutputStream outFile = response.getOutputStream();

        byte[] outputByte = new byte[4096];
        //copy binary contect to output stream
        while(fileIn.read(outputByte, 0, 4096) != -1)
        {
                outFile.write(outputByte, 0, 4096);
        }
        fileIn.close();
        outFile.flush();
        outFile.close();   
%> 
        
    </body>
</html>