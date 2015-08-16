<%-- 
    Document   : sidebar
    Created on : 16-Aug-2015, 10:59:41
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="resources/sidebar sources/simple-sidebar.css" rel="stylesheet" type="text/css"/>
<!-- Menu Toggle Script -->
    <script>

    $("#menu-toggle-2").click(function(e) {
       e.preventDefault();
       $("#wrapper").toggleClass("toggled");
       $('#menu ul').hide();
    });
    
    $("#menu-toggle-2").click(function(e) {
       e.preventDefault();
       $("#wrapper").toggleClass("toggled-2");
       $('#menu ul').hide();
    });

    $(document).ready(function() {initMenu();});
    </script>

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav nav-pills nav-stacked" id="menu">
               <%
              //Getting usertype from session
 
                session = request.getSession(false);
                 if(session != null)
                {
                   session = request.getSession();
                   int type = 0; 
                   if(session.getAttribute("usertype") != null )
                    {  
                     type = Integer.parseInt(session.getAttribute("usertype").toString());
                    }
                   switch(type)
                     {
                        case 0:
            %>
              
            <%
                        break;
                        case 1:
            %>
                <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="CourseCreation.jsp">Create Course</a></button></li>
          <%          case 2:%>
                <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="courseview.jsp">Course View</a></button></li>
          <%          case 3:%>
                <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="subjectview.jsp">Subject View</a></button></li>
          <%          default:%>
                <li><button id="btnnavbar" class="mdl-button mdl-js-button"><a href="logout.jsp">Log Out</a></button></li><%;
                      }
                  }
            %>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->