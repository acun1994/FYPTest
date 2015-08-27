<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>App Dev Test</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include file="resources.jsp" %>
        <script>
          $(".menu-toggle").click(function(e) {
              e.preventDefault();
              $("#wrapper").toggleClass("toggled");
          });
        </script>
        <style>
            #container{
                margin-top:30px;
                width:1305px;
                align:center;
            }
            #contain{
                float:left;
                width: 900px;
                height: 555px;
                border: 3px solid #00ffcc;
            } 
            #login{
                float:right;
                width: 400px;
                height: 300px;
                border: 3px solid #00ffcc;
            } 
            #center{
                position:relative;
                top: 50%;
                left: 50%;
                width:30em;
                height:15em;
                margin-top: -9em; /*set to a negative number 1/2 of your height*/
                margin-left: -15em; /*set to a negative number 1/2 of your width*/
                border: 1px solid #ccc;
                background-color: #f3f3f3;
            }
            #log-in-button{
                align:right;
                position:absolute;
            }
        </style>
   </head>
    <body class="mdl-card-actions" align="center">
        <%@include file="resources/image/slider.jsp"%>
        <%@include file="navbar_session.jsp" %>
        <div id="container">
            <div id="contain">
                <div class="well" align="center">Contains</div>
            </div>
            <div id="login">
                <div class="well" align="center">Log In</div>
                <form align="center" class="form-group" method="post" autocomplete="off" name="Login_Info" action="loginAuth.jsp">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" id="login_username" name="login_username">
                        <label class="mdl-textfield__label" for="login_username">Username</label>
                        <div class="mdl-tooltip mdl-tooltip--large" for="login_username">Insert user name</div>
                    </div>    
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="password" id="login_password" name="login_password">
                        <label class="mdl-textfield__label" for="login_password">Password</label>
                        <div class="mdl-tooltip mdl-tooltip--large" for="login_password">Insert user password</div>
                    </div>
                    <br>
                    <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">log In</button>
                </form>
            </div>
        </div>
    </body>
</html>
