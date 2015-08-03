
<!DOCTYPE html>
<html>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<% Connection connection = null;%>
<%@ include file="dbCon.jsp"%>

<%
        int filenamePos = request.getParameter("filePath").lastIndexOf("/");
        String filename = request.getParameter("filePath").substring(filenamePos+1);
        
        String filePath = request.getSession().getServletContext().getRealPath("/");
        
        filePath += request.getParameter("filePath");
        
        File fileDeleted = new File(filePath);
        
        if (!fileDeleted.exists()){
            out.println("File " + filename + " does not exist");
            out.println(filePath);}
        else if (fileDeleted.delete())        
            out.println("Deleted " + filename);        
        else
            out.println("Failed to delete "+ filename);
%>
</html>