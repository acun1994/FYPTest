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
       $("#wrapper").toggleClass("toggled-2");
       $('#menu ul').hide();
    });

    $(document).ready(function() {initMenu();});
    </script>

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav nav-pills nav-stacked" id="menu">
               
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->