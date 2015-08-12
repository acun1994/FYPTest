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
                width:800px;
                align:center;
            }
            #contain{
                float:left;
                width: 400px;
                height: 500px;
                border: 3px solid #00ffcc;
            } 
            #login{
                float:right;
                width: 400px;
                height: 500px;
                border: 3px solid #00ffcc;
            } 
        </style>
   </head>
    <body>
        <%@include file="resources/image/slider.jsp"%>
        <%@include file="navbar_session.jsp" %>
        <%@include file="checkLogin.jsp"%>
        <div id="container">
            <div id="contain">
                <div class="well" align="center">Contains</div>
            </div>
            <div id="login">
                <div class="well" align="center">Log In</div>
            </div>
        </div>
        
    </body>
</html>
