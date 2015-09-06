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
        
    </head>
    <body>
       
        <form id="regForm" action="Registration/registerDB.jsp" method="post">
            <table>
                <tr>
                    <td>User ID :</td>
                    <td><input id="regUserID" name="regUserID" type="text"> </td>
                    <td><div id="regForm_regUserID_errorloc"></div></td>
                </tr>
                <tr>
                    <td>Username :</td>
                    <td><input id="regUsername" name="regUsername" type="text"> </td>
                    <td><div id="regForm_regUsername_errorloc"></div></td>
                </tr>
                <tr>
                    <td>Password :</td>
                    <td><input id="regPassword1" name="regPassword1" type="password"> </td>
                    <td><div id="regForm_regPassword1_errorloc"></div></td>
                </tr>
                <tr>
                    <td>Re-enter Password :</td>
                    <td><input id="regPassword2" name="regPassword2" type="password"> </td>
                    <td><div id="regForm_regPassword2_errorloc"></div></td>
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
                    <td><input type="text" id="regJabatan" name="regJabatan"></td>
                    <td><div id="regForm_regJabatan_errorloc"></div></td>
                </tr>
                <tr>
                    <td>Name :</td>
                    <td><input type="text" id="regName" name="regName"></td>
                    <td><div id="regForm_regName_errorloc"></div></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><button type="submit">Register</button></td>
                </tr>
            </table>
        </form>
        <script type="text/javascript">
            var validator = new Validator("regForm");
            
            validator.addValidation("regUserID","req","User ID is required");
            validator.addValidation("regUserID","alphanumeric","User ID should contain alphanumeric(A-Z,0-9) characters only");
            
            validator.addValidation("regUsername","req","Username is required");
            validator.addValidation("regUsername","alphanumeric","Username should contain alphanumeric(A-Z,0-9) characters only");
            
            validator.addValidation("regPassword1","req","Passsword is required");
            validator.addValidation("regPassword1","maxlen = 18","Password should be within 6 to 18 character");
            validator.addValidation("regPassword1","minlen = 6","Password should be within 6 to 18 character");
            validator.addValidation("regPassword1","alphanumeric","Password should contain alphanumeric(A-Z,0-9) characters only");

            validator.addValidation("regPassword2","eqelmnt=reg_password1","The entered password does not match");
    
            validator.addValidation("regJabatan","req","Department is required");
            validator.addValidation("regJabatan","alphabetic","Department should contain alphbetical(A-Z) characters only");
            
            validator.addValidation("regName","req","Name is required");
            validator.addValidation("regName","alphabetic","Name should contain alphbetical(A-Z) characters only");
            
            validator.EnableOnPageErrorDisplay();
        </script>
    </body>
</html>
