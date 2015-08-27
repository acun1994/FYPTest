<%-- 
    Document   : dash_coordView
    Created on : 16-Aug-2015, 10:56:12
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
                    PreparedStatement getCourseEntryID = connection.prepareStatement("select * from courseentry where semYear=?");
                    PreparedStatement getCoordinating = connection.prepareStatement("select * from coordinatorlist where coordinatorID=? and semYear=?");
                    PreparedStatement getTeaching = connection.prepareStatement("select * from lectlist where lecturerid=? and courseEntryID=?");
                    PreparedStatement getSubjectName = connection.prepareStatement("select * from subject where subjectid=?");

                    getCoordinating.setString(1, userid);
                    getTeaching.setString(1, userid);

                    String year = request.getParameter("year");
%>
            
<%@include file="..\getDate.jsp" %>

<%//Listing all coordinating subject for the semYear
                    try{
                        ResultSet courseEntryID = getCourseEntryID.executeQuery();
                        ResultSet Coordinating = getCoordinating.executeQuery();

                    if(Coordinating.isBeforeFirst()){
            %>
                <label>Subjects You Coordinate</label>
                <table>
                    <tr>
                        <th>Subject ID</th>
                        <th>Subject Name</th>
                        <th>Status</th>
                        <th>View</th>
                    </tr>
                <%
                        while(Coordinating.next()){
                            getSubjectName.setString(1,Coordinating.getString("subjectid"));
                            ResultSet subjectName = getSubjectName.executeQuery();
                %>
                        <tr>
                            <td><%= Coordinating.getString("subjectid") %></td>
                            <td><% if(subjectName.next()){out.println(subjectName.getString("subjectName"));}%></td>
                            <td><%= Coordinating.getString("status") %></td>
                            <td>
                                <form action="subjectview.jsp" method="post">
                                   <input type="hidden" name="courseid"      value="<%if(courseEntryID.next()){out.println(courseEntryID.getString("courseentryid"));}   %>" >
                                   <input type="hidden" name="coordinatorid" value="<% out.println(userid); %>" >
                                   <input type="hidden" name="subjectid"     value="<% out.println(Coordinating.getString("subjectID"));     %>" >
                                   <button class="glyphicon glyphicon-search btn btn-submit"  type="submit" >
                                   </button>
                               </form>
                            </td>
                        </tr>
                <%
                        }//End While
                %>
                </table>
                <%
                    }//End If   
                    }//End Try
                    catch(Exception e){
                        out.println("Failed");
                        out.println("Exception occured! "+e.getMessage()+" "+e.getStackTrace());
                    }
                %>

                <%//Listing all teaching subject for the semYear
                     ResultSet courseEntryID = getCourseEntryID.executeQuery();

                    if(courseEntryID.next())
                    {
                       getTeaching.setString(2, courseEntryID.getString("courseEntryID"));

                        ResultSet teaching = getTeaching.executeQuery();
                        if(teaching.isBeforeFirst())
                        {
                %>
                    <label>Subjects You Teach</label>
                    <table>
                        <tr>
                            <th>Subject ID</th>
                            <th>Subject Name</th>
                            <th>Section No</th>
                            <th>Status</th>
                            <th>View</th>
                        </tr>
                <%

                        while(teaching.next())
                            {
                                getSubjectName.setString(1,teaching.getString("subjectid"));
                                ResultSet subjectName = getSubjectName.executeQuery();   
                %>
                            <tr>
                                <td><%= teaching.getString("subjectid") %></td>
                                <td><% if(subjectName.next()){out.println(subjectName.getString("subjectName"));}%></td>
                                <td><%= teaching.getString("sectionNo") %></td>
                                <td><%= teaching.getString("status") %></td>
                                <td>
                                    <span class="glyphicon glyphicon-search"></span> 
                                </td>
                            </tr>
                <%
                            }//End While
                %>
                    </table>
                <%
                        }//End If
                    }//End If

                %>
