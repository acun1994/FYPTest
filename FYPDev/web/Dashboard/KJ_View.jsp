<%-- 
    Document   : KJ_View
    Created on : 18-Aug-2015, 15:00:19
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    try {
        ResultSet userInfo = getUserInfo.executeQuery();
        
         getCourseEntryID = connection.prepareStatement("select * from courseentry where semYear=? and courseID like ?");
%>
<%@include file="..\getDate.jsp" %> 
<%
        if(userInfo.next())
        {getCourseEntryID.setString(2, "%" + userInfo.getString("jabatan"));}
        
        ResultSet courseEntryID = getCourseEntryID.executeQuery();
%>
<label>Subjects Of </label></br>
<label>Semester <% if (year == null) {
        out.println(semYear);
    } else {
        out.println(year);
    }
    %>
</label>

<table>
    <tr>
        <th>Subject ID</th>
        <th>Subject Name</th>
        <th>Status</th>
        <th>View</th>
    </tr>
    <tr>
        
    </tr>
</table>
<%
    }//End Try 
    catch (Exception e) {
        out.println("Failed");
        out.println("Exception occured! " + e.getMessage() + " " + e.getStackTrace());
    }
%>
