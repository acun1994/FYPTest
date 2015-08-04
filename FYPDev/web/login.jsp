<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>User Log In</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="resources/css/bootstrap.css" type="text/css"/>
        <script src="resources/js/jquery.js" type="text/javascript"></script>
        <script src="resources/js/bootstrap.js" type="text/javascript"></script>
        <style>
        #center {
            position:absolute;
            top: 50%;
            left: 50%;
            width:30em;
            height:12em;
            margin-top: -9em; /*set to a negative number 1/2 of your height*/
            margin-left: -15em; /*set to a negative number 1/2 of your width*/
            border: 1px solid #ccc;
            background-color: #f3f3f3;
        }
    </style>
    </head>
    <body>
        <%@include file="navbar_session.jsp"%>
        
        <% if (session.getAttribute("username")!=null && session.getAttribute("username")!=""){
            response.sendRedirect("index.jsp");
        }%>
        
        <% if (request.getParameter("login")!=null){
            if (request.getParameter("login").equals("false"))
                {%><div class="text-center alert-danger alert">You are not logged in.</div><%}
            else if (request.getParameter("login").equals("failed"))
                {%><div class="text-center alert-danger alert">Incorrect login information.</div><%}
            }
        %>
        <div id="center" align="center">
            
            <form class="form-group" method="post" autocomplete="off" name="Login_Info" action="loginAuth.jsp">
                <label>User Log in</label>
                <table>
                    <tr>
                        <td><label>User name : </label></td>
                        <td><input class="form-horizontal" type="text" name="login_username"></td>
                    </tr>
                    <tr>
                        <td><label>Password : </label></td>
                        <td><input class="form-horizontal" type="password" name="login_password">
                    </tr>
                </table>
                <button type="submit" class="btn btn-submit">Log In</button>
            </form>
        </div>
        <%--    
        <script>
           
            function submitForm() {
            // Get the first form with the name
            // Hopefully there is only one, but there are more, select the correct index
            var frm = document.getElementsByName('Login_Info')[0];
            frm.submit(); // Submit
            frm.reset();  // Reset
            return false; // Prevent page refresh
        }
        </script>
        --%>
</body>
</html>
