<%-- 
    Document   : integrated_process
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
        <% //Prepared SQL Statements 
            String approveSQL = "UPDATE subjectfile SET status='Approved' WHERE fileID = ?";
            String rejectSQL = "UPDATE subjectfile SET status='Rejected' WHERE fileID = ?";
            String deleteSQL = "DELETE FROM subjectfile WHERE fileID = ?";
        
            PreparedStatement execStatement = null;
        %>
        <% if (request.getParameter("task")==null || request.getParameter("task").equals("")){%>
            <div class="alert-danger">No request received. Please return to previous page</div>
        <%  }else{
            String task = request.getParameter("task");
            int fileID = Integer.parseInt(request.getParameter("fileID"));
            if (task.equals("approve")){
                execStatement = connection.prepareStatement(approveSQL);
            }
            else if (task.equals("reject")){
                execStatement = connection.prepareStatement(rejectSQL);
            }
            else if (task.equals("delete")){
                execStatement = connection.prepareStatement(approveSQL);
                
            }
            execStatement.setInt(1, fileID);       
            execStatement.execute();
            }
        %>
            
            
    </body>
</html>