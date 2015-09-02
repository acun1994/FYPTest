<%-- 
    Document   : register
    Created on : 29-Aug-2015, 18:37:27
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../resources.jsp" %>
        <script src="../resources/js/gen_validatorv4.js" type="text/javascript"></script>
    </head>
    <body>
       
        <form id="reg_form" action="Registration/registerDB.jsp" method="post">
            <table>
                <tr>
                    <td>User ID :</td>
                    <td><input id="reg_userID" name="reg_userID" type="text"> </td>
                </tr>
                <tr>
                    <td>Username :</td>
                    <td><input id="reg_username" name="reg_username" type="text"> </td>
                </tr>
                <tr>
                    <td>Password :</td>
                    <td><input id="reg_password1" name="reg_password1" type="password"> </td>
                </tr>
                <tr>
                    <td>Re-enter Password :</td>
                    <td><input id="reg_password2" name="reg_password2" type="password"> </td>
                </tr>
                <tr>
                    <td>User Type :</td>
                    <td>
                        <select name="reg_usertype">
                            <option value="1">Admin</option>
                            <option value="2">Pentadbir/Ketua Jabatan</option>
                            <option value="3">Pensyarah</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Department :</td>
                    <td><input type="text" id="reg_jabatan" name="reg_jabatan"></td>
                </tr>
                <tr>
                    <td>Name :</td>
                    <td><input type="text" id="reg_name" name="reg_name"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><button type="submit">Register</button></td>
                </tr>
            </table>
        </form>
        <script type="text/javascript">
            var validator = new Validator("reg_form");
            
            validator.addValidation("reg_username","req","Username is required");
            validator.addValidation("reg_username","alphanumeric","Username should contain alphanumeric(A-Z,0-9) characters only");
            
            validator.addValidation("reg_password1","req","Passsword is required");
            validator.addValidation("reg_password1","maxlen = 18","Password should be within 6 to 18 character");
            validator.addValidation("reg_password1","minlen = 6","Password should be within 6 to 18 character");
            validator.addValidation("reg_password1","alphanumeric","Password should contain alphanumeric(A-Z,0-9) characters only");

            validator.addValidation("reg_password2","eqelmnt=reg_password1","The entered password does not match");
    
            validator.addValidation("reg_jabatan","req","Department is required");
            validator.addValidation("reg_jabatan","alphabetic","Department should contain alphbetical(A-Z) characters only");
            
            validator.addValidation("reg_name","req","Name is required");
            validator.addValidation("reg_name","alphabetic","Name should contain alphbetical(A-Z) characters only");
            
        </script>
        
    </body>
</html>
