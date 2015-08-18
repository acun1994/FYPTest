<%-- 
    Document   : controller
    Created on : 17-Aug-2015, 12:56:55
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            //Setting up the options for the form 
            ResultSet list = null;
            PreparedStatement list_query = connection.prepareStatement("select * from courseentry");
            list = list_query.executeQuery();
            
            //Initializing list for the form
            ArrayList<String> year = new ArrayList();
            
            while(list.next())
            { //Making sure all listed result are unique
                if(year.contains(list.getString("semYear").substring(2)) == false)
                    year.add(list.getString("semYear").substring(2));
            }
%>    
        <h1 class="text-center">Overall Course View</h1>
        
        <%-- Search form --%>
        <table align="center"> 
            <tr>
                <td>
                <form>
                    <%-- Select for Year selection --%>
                    <select id="year" onchange="showCourse(this.value)"><%-- options are from database --%>
                        <option value="#">Select A Year</option>
                        <% //Outputting Year option
                        for(int i=0;i<year.size();i++)
                            {
                             out.println("<option value="+year.get(i)+">"+year.get(i)+"</option>");
                            }
                        %>
                    </select>
                </form>
                </td>
            
                <td>
                <form>
                    <%-- Select for Course selection --%>
                    <select id="course" onchange="showSem(this.value,document.getElementById('yearValue').valueOf())"><%-- options are from database --%>
                        <option value="#">Please Select Year First</option>
                    </select>
                </form>
                </td>
            
                <td>
                <form action="courseview.jsp" method="get">
                    <%-- Dropdown for Semester selection --%>
                    <select id="sem" name="sem"><%-- options are from database --%>
                        <option value="#">Please Select A Course First</option>
                    </select>

                    <%-- Field for storing selected year and course value --%>  
                    <input type="hidden" id="yearValue" name="year">
                    <input type="hidden" id="courseValue" name="course">

                    <button type="submit" class="btn btn-submit">Search</button>
                </form>
                </td>
              </tr>
            </table>
                </br>
        
        <div> <%-- List of all subject for particular course at that semester & year --%>
            <%-- 
            The list will be generated from the database. 
            Based the format below.    
            --%>
                <% 
                    //Getting data from search form
                    String formcourse = request.getParameter("course");
                    String formyear   = request.getParameter("year");
                    String formsem    = request.getParameter("sem");
                    
                    if(formcourse != null && formyear != null && formsem != null)
                    {
                %>
                <div align="center">
                    Year     : <%= formyear     %>
                    Course   : <%= formcourse   %>
                    Semester : <%= formsem      %>
                </div>
                </br>
                <% }//end IF %>
            <table class="table-bordered table-responsive" align="center">
                
                <% 
                    //Setting up SemYear from seacrh data result
                    String getSemYear = formsem + "-" + formyear;
                    
                    //Getting courseEntryID from selected course, year and semester
                    PreparedStatement getCourseEntry = connection.prepareStatement("select * from courseentry where courseID=? and semyear=?");
                        getCourseEntry.setString(1, formcourse);
                        getCourseEntry.setString(2, getSemYear);
                    ResultSet semYear = getCourseEntry.executeQuery();
                    
                    if(semYear.next())
                    {
                    //Getting all subjectID that have the same semYear
                    PreparedStatement getSubjectID = connection.prepareStatement("select * from coordinatorlist where semYear=?");
                    
                    //Getting subject id
                    getSubjectID.setString(1, semYear.getString("semYear"));
                        
                    //Result storing for subject id
                    ResultSet subjectID = getSubjectID.executeQuery();
                        
                    //Table Row Counter
                    int i = 1;
                %>
                        <tr>
                        <th class="text-center">No.</th>
                        <th class="text-center">Subject</th>
                        <th class="text-center">Subject ID</th>
                        <th class="text-center">Coordinator</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">View</th>
                        </tr>
                        <tr>   
                <%
                         while(subjectID.next())
                         { 
                             //Prepared statement for subject name & coordinator name
                             PreparedStatement getSubjectName = connection.prepareStatement("select subjectname from subject where subjectid=?");
                             PreparedStatement getCoordinatorName = connection.prepareStatement("select * from userinfo where userid=?");
                    
                             //Getting subject name & coordinator name
                             getSubjectName.setString(1, subjectID.getString("subjectID"));
                             getCoordinatorName.setString(1, subjectID.getString("coordinatorID"));
                             
                             //Result storing for subject name & coordinator name
                             ResultSet subjectName = getSubjectName.executeQuery();
                             ResultSet coordinatorName = getCoordinatorName.executeQuery();
                %>
                           <%-- Row Number Table Column --%>
                           <td class="text-center" style="padding:10px"> <%= i %> </td>
                           
                           <%-- Subject Name Table Column --%>
                           <td class="text-center" style="padding:10px"> 
                               <% //Outputting subject name
                                    if(subjectName.next())
                                        {out.println(subjectName.getString("subjectName"));} 
                               %> 
                           </td>
                           
                           <%-- Subject ID Table Column --%>
                           <td class="text-center" style="padding:10px"> <%= subjectID.getString("subjectID") %> </td>
                           
                           <%-- Coordinator Name Table Column --%>
                           <td class="text-center" style="padding:10px"> 
                               <% //Outputting corrdinator name
                               if(coordinatorName.next())
                                    {out.println(coordinatorName.getString("userName"));} 
                               %> 
                           </td>
                           
                           <%-- Course Status Table Column --%>
                           <td class="text-center" style="padding:10px"> <%= subjectID.getString("status")%> </td>
                           
                           <%-- View Subject from Course Column --%>
                           <td class="text-center" style="padding:10px">
                               <%-- Form for viewing specific subject --%>
                               <form action="subjectview.jsp" method="post">
                                   <input type="hidden" name="courseid"      value="<% out.println(semYear.getString("courseentryid"));   %>" >
                                   <input type="hidden" name="coordinatorid" value="<% out.println(subjectID.getString("coordinatorID")); %>" >
                                   <input type="hidden" name="subjectid"     value="<% out.println(subjectID.getString("subjectID"));     %>" >
                                   <button class="glyphicon glyphicon-search btn btn-submit"  type="submit" >
                                            </button>
                               </form>
                           </td>         
                <%
                         i++;
                         }//endWhile 
                    }//endIf
                %>
                  

                </tr>
            </table>
        </div>