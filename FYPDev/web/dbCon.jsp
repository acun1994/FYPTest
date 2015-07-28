<%-- 
    Document   : dbCon
    Created on : Jul 27, 2015, 12:17:18 PM
    Author     : User
--%>

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 



<% 
try {
    String connectionURL = "jdbc:mysql://localhost/cfms_db";
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "");

}catch(Exception ex){
    out.println("Unable to connect to database.");
}
%>
</font>
</body> 
</html>
