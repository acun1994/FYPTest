<%-- 
    Document   : subjectview
    Created on : Jul 27, 2015, 10:11:22 AM
    Author     : Kensiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="navbar_session.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overall Course View</title>
        
        <link rel="stylesheet" type="text/css" href="./resources/css/bootstrap.css"/>
        <script src="./resources/js/jquery.min.js"></script>
        <script src="./resources/js/bootstrap.min.js"></script>
        <script src="./resources/js/gen_validatorv4.js"></script>
        
    </head>
        <body>
        <% Connection connection = null; %>
        <%@ include file="dbCon.jsp"%>
        <%@page import="java.util.ArrayList" %>
        
        <%
            //Setting up the options for the form 
            ResultSet list = null;
            PreparedStatement list_query = connection.prepareStatement("select * from courseentry");
            list = list_query.executeQuery();
            
            ArrayList<String> year = new ArrayList();
            ArrayList<String> sem = new ArrayList();
            ArrayList<String> course = new ArrayList();
            
            while(list.next())
            {
                if(year.contains(list.getString("semYear").substring(2)) == false)
                    year.add(list.getString("semYear").substring(2));
                if(sem.contains(list.getString("semYear").substring(0,1)) == false)
                    {sem.add(list.getString("semYear").substring(0,1));}
                if(course.contains(list.getString("courseID")) == false)
                    course.add(list.getString("courseID"));
            }
        %>
        
        <h1 class="text-center">Overall Course View</h1>
        
        <div align="center"> 
            <form action="courseview.jsp" method="get">
                <%-- Select for Year selection --%>
                <select name="year"><%-- options are from database --%>
                    <option value="#">Year</option>
                    <% 
                    for(int i=0;i<year.size();i++)
                        {
                         out.println("<option value="+year.get(i)+">"+year.get(i)+"</option>");
                        }
                    %>
                </select>
         
                <%-- Select for Course selection --%>
                <select name="course"><%-- options are from database --%>
                    <option value="#">Course</option>
                    <% 
                    for(int i=0;i<course.size();i++)
                        {
                         out.println("<option value="+course.get(i)+">"+course.get(i)+"</option>");
                        }
                    %>
                </select>
        
                <%-- Dropdown for Semester selection --%>
                <select name="sem"><%-- options are from database --%>
                    <option value="#">Semester</option>
                    <% 
                    for(int i=0;i<course.size();i++)
                        {
                         out.println("<option value="+sem.get(i)+">"+sem.get(i)+"</option>");
                        }
                    %>
                </select>
            <button type="submit" class="btn btn-submit">Search</button>
            </form>
            </div>
        <br/><br/>
        
        <div> <%-- List of all subject for particular course at that semester & year --%>
            <%-- 
            The list will be generated from the database. 
            Based the format below.    
            --%>
            <table class="table-bordered table-responsive" align="center">
                
                <% 
                    String formcourse = request.getParameter("course");
                    String formyear = request.getParameter("year");
                    String formsem = request.getParameter("sem");
                    
                    String getSemYear = formsem + "-" + formyear;
                    
                    //Getting courseEntryID from selected course, year and semester
                    PreparedStatement getCourseEntry = connection.prepareStatement("select courseentryid from courseentry where courseID=? and semyear=?");
                        getCourseEntry.setString(1, formcourse);
                        getCourseEntry.setString(2, getSemYear);
                    ResultSet entryid = getCourseEntry.executeQuery();
                    
                    //Getting all subjectID that have the same courseEntryID
                    PreparedStatement getSubjectID = connection.prepareStatement("select * from coordinatorlist where courseentryID=?");
                    
                    PreparedStatement getSubjectName = connection.prepareStatement("select subjectname from subject where subjectid=?");
                    
                    if(entryid.next())
                    {
                %>
                        <tr>
                        <th class="text-center">No.</th>
                        <th class="text-center">Subject</th>
                        <th class="text-center">Subject ID</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">View</th>
                        </tr>
                        <tr>   
                <%
                        getSubjectID.setString(1, entryid.getString("courseentryid"));
                    
                        ResultSet subjectID = getSubjectID.executeQuery();
                        
                        int i = 1;
                        
                         while(subjectID.next())
                         { 
                             //Getting subjectname from the subject table using subjectid
                             getSubjectName.setString(1, subjectID.getString("subjectID"));
                             
                             ResultSet subjectName = getSubjectName.executeQuery();
                %>
                           <td class="text-center" style="padding:10px"> <%= i %> </td>
                           <td class="text-center" style="padding:10px"> <% if(subjectName.next()){out.println(subjectName.getString("subjectName"));} %> </td>
                           <td class="text-center" style="padding:10px"> <%= subjectID.getString("subjectID") %> </td>
                           <td class="text-center" style="padding:10px"> <%= subjectID.getString("status")%> </td>
                           <td class="text-center" style="padding:10px">
                                        <form action="subjectview.jsp" method="get">
                                            <button name="subjectID" class="glyphicon glyphicon-search btn btn-submit"  type="submit" value="<% out.println(subjectID.getString("subjectID")); %>">
                                            </button>
                                        </form></td>         
                <%
                         i++;
                         }//endWhile 
                    }//endIf
                %>
                  
                </tr>
            </table>
        </div>    
            
        <div align="center">
        </div>
    </body>
</html>
