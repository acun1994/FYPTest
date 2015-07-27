<%-- 
    Document   : dbCon
    Created on : Jul 27, 2015, 12:17:18 PM
    Author     : User
--%>

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html> 
<head> 
<title>Connection with mysql database</title>
</head> 
<body>
<h1>Connection status</h1>

<% 
try {
    String connectionURL = "jdbc:mysql://localhost/cfms_db";

    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "");
    if(!connection.isClosed())
         out.println("Successfully connected to " + "MySQL server using TCP/IP...");

}catch(Exception ex){
    out.println("Unable to connect to database.");
}
%>
</font>
</body> 
</html>
