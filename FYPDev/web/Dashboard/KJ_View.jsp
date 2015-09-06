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
         getCoordinating = connection.prepareStatement("select * from coordinatorlist where semYear=? and courseEntryID=?");
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
        getCoordinating.setString(2,courseEntryID.getString("courseEntryID"));
        ResultSet Coordinating = getCoordinating.executeQuery();
%>
        <label> <%= courseEntryID.getString("courseID")%></label>
        
        <table>
            <tr>
                <th>Subject ID</th>
                <th>Subject Name</th>
                <th>Status</th>
                <th>View</th>
            </tr>
        <%
            while(Coordinating.next())
            {
                getSubjectName.setString(1,Coordinating.getString("subjectID"));
                ResultSet subjectName = getSubjectName.executeQuery();
        %>
            <tr>
                <td><%= Coordinating.getString("subjectID") %></td>
                <td>
                    <% if(subjectName.next()){
                        out.println(subjectName.getString("subjectName"));}
                    %>
                </td>
                <td><%= Coordinating.getString("status")%></td>
                <td>
                    
                </td>
            </tr>
        <%  }
        %>
        </table>
<%      }

    }//End Try 
    catch (Exception e) {
        out.println("Failed");
        out.println("Exception occured! " + e.getMessage() + " " + e.getStackTrace());
    }
%>
