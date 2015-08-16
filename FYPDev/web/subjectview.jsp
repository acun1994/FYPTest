<%-- 
    Document   : subjectview
    Created on : Jul 27, 2015, 10:11:22 AM
    Author     : Kensiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overall Course View</title>
        <%@include file="resources.jsp" %>
        <script src="./resources/js/gen_validatorv4.js"></script>
        
        
    </head>
        <body>
        <%@include file="checkLogin.jsp" %>
        <%@include file="navbar_session.jsp" %>
        <% Connection connection = null; %>
        <%@ include file="dbCon.jsp"%>
        <%@page import="java.util.ArrayList" %>
        
        <h1 class="text-center">Overall Subject View</h1>
        
        <%//Getting data from (courseview.jsp)
        String courseid = request.getParameter("courseid");   
        String coordinatorid = request.getParameter("coordinatorid");
        String subid = request.getParameter("subjectid");    
        
        PreparedStatement getUserName = connection.prepareStatement("select * from userinfo where userid=? ");
        PreparedStatement getSubjectName = connection.prepareStatement("select * from subject where subjectid=?");

        //Getting coordinator name
        getUserName.setString(1, courseid);
        ResultSet coordiName = getUserName.executeQuery();
        
        //Getting subject name
        getSubjectName.setString(1,subid);
        ResultSet subjectName = getSubjectName.executeQuery();
        
        %>
        
        <div align="center">
            Coordinator Name : <% if(coordiName.next()){out.println(coordiName.getString("name"));}%>
            Coordinator Id   : <%= coordinatorid %>
            Course Entry Id  : <%= courseid      %>
        </div>
        
        <div align="center">
            Subject Name : <% if(subjectName.next()){out.println(subjectName.getString("subjectName"));}%>
            Subject Id   : <%= subid %>
        </div>
        
        <br/><br/>
        
        <div> <%-- List of all section for particular subject at that semester & year --%>
            <%-- 
            The list will be generated from the database. 
            Based the format below.    
            --%>
            <% 
               //Checking if the subject has selected sections
                PreparedStatement checkSectionExist = connection.prepareStatement("select * from lectlist where courseEntryID=?");
                checkSectionExist.setString(1, courseid);
                ResultSet sectionResult = checkSectionExist.executeQuery();

                if(sectionResult.next())
                { 
                   //Getting section info from lectlist
                   PreparedStatement getSectionInfo = connection.prepareStatement("select * from lectlist where subjectID=?");
                    getSectionInfo.setString(1,subid);
                    ResultSet sectionInfo = getSectionInfo.executeQuery();            
            %>
            <table class="table-bordered table-responsive" align="center">
                <tr>
                        <th class="text-center">Section No.</th>
                        <th class="text-center">Lecturer Name</th>
                        <th class="text-center">Lecturer ID</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">View</th>
                </tr>
                <tr>
            <%        while(sectionInfo.next())
                    {
            %>
                        <%-- Section No Table Column --%>
                        <td class="text-center" style="padding:10px"> <%= sectionInfo.getString("sectionNo") %> </td>
                        
                        <%-- Lecturer Name Table Column --%>
                        <td class="text-center" style="padding:10px"> 
            <%
                                //Getting Lecturer Name from userInfo
                                getUserName.setString(1, sectionInfo.getString("lecturerID"));
                                ResultSet lectName = getUserName.executeQuery();
                                                                        
                                //Outputting Lecturer Name
                                if(lectName.next())
                                    {out.println(lectName.getString("userName"));}
            %> 
                        </td>
                        
                        <%-- Lecturer ID Table Column --%>
                        <td class="text-center" style="padding:10px"> <%= sectionInfo.getString("lecturerID") %> </td>
                        
                        <%-- Status Table Column --%>
                        <td class="text-center" style="padding:10px"> <%= sectionInfo.getString("Status") %> </td>
                        
                        <%-- View Table Column --%>
                        <td class="text-center" style="padding:10px"> <span class="glyphicon glyphicon-search"></span> </td>         
            <% 
                    }//end WHILE
                }//end IF 
                else
                {
                    out.println("There is no lecturer selected for this subject yet");
                }
            %>
                </tr>
            </table>
        </div>    
            
        <div align="center">
        </div>
    </body>
</html>
