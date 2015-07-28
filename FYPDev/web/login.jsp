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
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
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
    <body>
        <%@include file="home01.html"%>
        <div id="center" align="center">
            <form class="form-group" type="post">
                <label align="center"><h3>User Log in</h3></label>
                <table>
                    <tr>
                        <td><label>User name : </label></td>
                        <td><input class="form-horizontal" type="text" name="login_username"></td>
                    </tr>
                    <tr>
                        <td><label>User password : </label></td>
                        <td><input class="form-horizontal" type="text" name="login_password">
                    </tr>
                </table>
                <button type="submit" class="btn btn-submit">Log In</button>
            </form>
        </div>
    </body>
</html>
