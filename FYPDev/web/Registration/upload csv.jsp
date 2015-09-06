<%-- 
    Document   : upload csv
    Created on : 02-Sep-2015, 20:50:49
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="csvUpload" action="csvController.jsp" method="post">
            Select File to be uploaded <input type="file" name="csvFile">
            <input type="submit" value="submit">
        </form>
    </body>
</html>
