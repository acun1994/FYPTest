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
         getCoordinating = connection.prepareStatement("select * from coodinatorlist where semYear=? and courseEntryID=?");
%>
<%@include file="..\getDate.jsp" %> 
<%
        if(userInfo.next())
        {getCourseEntryID.setString(2, "%" + userInfo.getString("jabatan"));}

        ResultSet courseEntryID = getCourseEntryID.executeQuery();
%>
<label>Subjects Of <%= userInfo.getString("jabatan") %></label></br>
<label>Semester <% if (year == null) {
        getCoordinating.setString(1,semYear);
        out.println(semYear);
    } else {
        getCoordinating.setString(1,year);
        out.println(year);
    }
    %>
</label>
<br><br>
<% while (courseEntryID.next())
        {
%>
        <label> <%= courseEntryID.getString("courseID")%></label>
        <% 
            getCoordinating.setString(2,courseEntryID.getString("courseEntryID")); 
            
        %>
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
<%      }

    }//End Try 
    catch (Exception e) {
        out.println("Failed");
        out.println("Exception occured! " + e.getMessage() + " " + e.getStackTrace());
    }
%>
