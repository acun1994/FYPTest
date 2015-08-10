<%-- 
    Document   : Form02_DB
    Created on : Aug 1, 2015, 5:51:09 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <title>JSP Page</title>
    </head>  
    <body>
        <%Connection connection = null;%>
        <%@ include file="dbCon.jsp"%>
        <% 
                String sN =  null;
                String sID = null;
                String penyelaras = null;
                String query = null;

                sN = request.getParameter("Subject_Name");
                sID = request.getParameter("subject_ID");
                penyelaras = request.getParameter("Penyelaras_Name");
                
                int i = 0;
  
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM subject");
                
                List li = new ArrayList();
                List li2 = new ArrayList();
                while(rs.next()){
                    li.add(rs.getString(1));
                    li2.add(rs.getString(2));
                }
                str = new String[li.size()];
                Iterator it = li.iterator();
                
                while(it.hasNext()){
                    String p = (String)it.next();
                    str[i] = p;
                    //out.print(p + " ");
                    i++;
                }
                
                i = 0;
                str2 = new String[li2.size()];
                Iterator it2 = li2.iterator();
                while(it2.hasNext()){
                    String p = (String)it2.next();
                    str2[i] = p;
                    //out.print(p + " ");
                    i++;
                }
                //st.executeUpdate(UPDATE subject_list SET penyelarasID = '"+penyelaras+"' WHERE subjectID = 'ANA1234');  
              
        %>
           
           
    </body>
</html>
