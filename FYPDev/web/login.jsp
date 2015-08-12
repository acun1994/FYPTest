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
        <link rel="stylesheet" href="./resources/css/bootstrap.css" type="text/css"/>
        <script src="./resources/js/jquery.js" type="text/javascript"></script>
        <script src="./resources/js/bootstrap.js" type="text/javascript"></script>
        <!--Material Design-->
        <script src="./resources/mdl/material.min.js"></script>
        <link rel="stylesheet" href="./resources/mdl/material.light_blue-indigo.min.css">
        <style>
        #center {
            position:absolute;
            top: 50%;
            left: 50%;
            width:30em;
            height:15em;
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
            else if (request.getParameter("login").equals("logout"))
                {%><div class="text-center alert-warning alert">You have successfully logged out.</div><%}
            else if (request.getParameter("login").equals("timeout"))
                {%><div class="text-center alert-warning alert">Session timeout. Please login again</div><%}
            }
        %>
        <div id="center" align="center">
            
            <form class="form-group" method="post" autocomplete="off" name="Login_Info" action="loginAuth.jsp">
                <label>User Log in</label>
                <table>
                    <tr>
                        <td>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                                <input class="mdl-textfield__input" type="text" id="login_username" name="login_username">
                                <label class="mdl-textfield__label" for="login_username">Username</label>
                                <div class="mdl-tooltip mdl-tooltip--large" for="login_username">Insert user name</div>
                            </div>    
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                            <input class="mdl-textfield__input" type="password" id="login_password" name="login_password">
                            <label class="mdl-textfield__label" for="login_password">Password</label>
                            <div class="mdl-tooltip mdl-tooltip--large" for="login_password">Insert user password</div>
                            </div>
                        </td>
                    </tr>
                </table>
                <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">log In</button>
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
