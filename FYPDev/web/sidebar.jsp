<%-- 
    Document   : sidebar
    Created on : 16-Aug-2015, 10:59:41
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="resources/sidebar sources/simple-sidebar.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
            <li class="dropdown"><button id="btnnavbar" class="mdl-button mdl-js-button mdl-color-text--white dropdown-toggle" data-toggle="dropdown"><a>Course<span class="caret"></span></a></button>
                    <ul class="dropdown-menu">
                        <li><a href="CourseCreation.jsp">Create Course</a></li>
                        <li><a href="#"<!--New Course address here-->>New Course</a></li>
                    </ul></li>
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
