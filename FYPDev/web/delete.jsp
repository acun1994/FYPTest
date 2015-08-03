
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
    //SQL Statements
    PreparedStatement getID = connection.prepareStatement("SELECT fileID FROM file_list WHERE fileType=? AND fileName = ? AND "
                       + "section = ? AND semYear = ? AND subjectID = ? AND status <> 'Deleted'");
        
    getID.setInt(3, 0);
    getID.setString(4, "testYr");
    getID.setString(5, "SCCC202");
    
    PreparedStatement addtoLog = connection.prepareStatement("INSERT INTO file_changelog(fileID, userID, action, timestamp) VALUES(?, ?, ?, ?)");
        
        addtoLog.setString(2, "userID");
        addtoLog.setString(3, "DELETE");
        addtoLog.setTimestamp(4, new Timestamp(new java.util.Date().getTime()));
    
    PreparedStatement updateFile = connection.prepareStatement("UPDATE file_list SET status='Deleted' WHERE fileID = ?")    ;
        
%>

<%
        try{
        String split[] = request.getParameter("filePath").split("[\\\\/]");
        String fileType = split[3].toString();
        String fileName = split[4].toString();
        
        getID.setString(1, fileType);
        getID.setString(2, fileName);
        
        ResultSet rs = getID.executeQuery();
        rs.next();
        
        int fileID = rs.getInt("fileID");
        
        addtoLog.setInt(1, fileID);
        
        addtoLog.execute();
        
        updateFile.setInt(1, fileID);
        
        updateFile.executeUpdate();
        
        String filePath = request.getSession().getServletContext().getRealPath("/");
        
        filePath += request.getParameter("filePath");
        
         //Delete file code HERE
        File fileDeleted = new File(filePath);
        
        if (!fileDeleted.exists()){
            out.println("File " + fileName + " does not exist");
            out.println(filePath);}
        else if (fileDeleted.delete())        
            out.println("Deleted " + fileName);        
        else
            out.println("Failed to delete "+ fileName);
        
        }
        catch(Exception ex){
            out.println(ex + "<br/>");
            out.println("File could not be deleted. Please try again.");
        }
        
        
        
%>
</html>