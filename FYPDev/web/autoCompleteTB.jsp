<%-- 
    Document   : autoCompleteTB
    Created on : Aug 11, 2015, 7:39:25 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="dbCon.jsp"%>
        <% 
                //Add data to the arraylist 
                while(rs.next()){
                    li.add(rs.getString(1));
                    li2.add(rs.getString(2));
                }
                it = li.iterator();
                it2 = li2.iterator();
                
                str1 = new String[li.size()];
                str2 = new String[li2.size()];
                
                //Assign value from arrayList to local array for use of jQuery 
                while(it.hasNext()){
                    subIDCol = (String)it.next();
                    str1[r] = subIDCol;
                    subNameCol = (String)it2.next();
                    str2[r] = subNameCol;
                    r++;
                }
        %>
        
        <script>
            $(function() {
                var availableTags = [<% 
                int arrayLength = str1.length;            
                for (int curr=0; curr<arrayLength-1; curr++){
                    out.println('"' + str1[curr]+ "  -  " + str2[curr] +'"' + ",");
                }
                out.println('"' + str1[arrayLength-1] + "  -  " +str2[arrayLength-1] +'"');
               %>]
                $( "#tags" ).autocomplete({
                  source: availableTags
                });
                
            });
               
               
            
            
        </script>
    </body>
</html>
