<%-- 
    Document   : uploadForm
    Created on : 04-Aug-2015, 11:05:08
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<% Connection connection = null; %>
<%@ include file="dbCon.jsp"%>
<%@ include file="checkLogin.jsp"%>
<html>
<head>
<title>File Uploading Form</title>
 <link rel="stylesheet" href="resources/css/bootstrap.css" type="text/css"/>
        <script src="resources/js/jquery.js" type="text/javascript"></script>
        <script src="resources/js/bootstrap.js" type="text/javascript"></script>
</head>
<body>
    <SCRIPT language="javascript">
        var i = 0;
        
        function addKid()
        {
		i++;	
        	var div = document.createElement('div');

        	div.innerHTML = '<table class="text-center table-bordered"><tr><td style="padding:10px"><select name="filetype">\n\
                                 <option value ="Appointment Letter"> Appointment Letter </option>\n\
                                 <option value ="Course Outline"> Course Outline </option>\n\
                                 <option value ="Student List"> Student List </option>\n\
                                 <option value ="Notes"> Notes/Slides </option>\n\
                                 <option value ="Std Work"> Assignment/Tutorial/Lab </option>\n\
                                 <option value ="Quiz MidTerm"> Quiz/Mid Term </option>\n\
                                 <option value ="Final Exam"> Final Exam </option>\n\
                                 <option value ="Course Work Grade"> Course Work Grades </option>\n\
                                 <option value ="Grade Sheet"> Grade Sheet & Report </option>\n\
                                 <option value ="Attendance"> Attendance List </option>\n\
                                 <option value ="E-Learning"> E-Learning Snapshot </option>\n\
                                 <option value ="Survey"> Course Survey </option>\n\
                                 <option value ="Other Material"> Other Teaching Materials </option>\n\
                                 <option value ="Coordinator Report"> Course Coordinator Report </option>\n\
                                 <option value ="Review Report"> Course Review Report </option>\n\
                                 </select></td>\n\
                                 <td style="padding:10px"><input type="file" name="file"/></td>\n\
                                 </tr></table>';
                document.getElementById('kids').appendChild(div);
         }

        </SCRIPT>
    
<h3>File Upload:</h3>
Select a file to upload: <br />
<form action="upload.jsp" method="post"
                        enctype="multipart/form-data">
    <label> Folder Name : &nbsp;</label><input type="text" name="folder"/>&nbsp;<input type="button" onClick="addKid()" value="Add File" /><br/>
    <table class="table-bordered text-center">
    <tr>
        <td id="kids"></td>
    </tr>
    </table>
    
    <input type="submit" value="Upload File(s)" />
</form>
</body>
</html> 