<%-- 
    Document   : getDate
    Created on : 12-Aug-2015, 15:29:38
    Author     : pheni
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//Setting the semYear
            if(year == null)//If the semYear is not selected
           {
                Calendar now = Calendar.getInstance();
                int yearNow = now.get(Calendar.YEAR);
                int monthComp = now.get(Calendar.MONTH);
                
            
                String setYear = Integer.toString(yearNow).substring(2,4);

                if(monthComp < now.get(Calendar.JANUARY))
                {
                    setYear =  Integer.toString(yearNow - 1).substring(2, 4) +  "/"  + setYear;

                    if(monthComp > now.get(Calendar.JUNE))
                    {
                        semYear = "3-" + setYear;
                        
                        getCourseEntryID.setString(1,semYear);
                        getCoordinating.setString(2,semYear);
                    }
                    else
                    {
                        semYear = "2-" + setYear;
                    
                        getCourseEntryID.setString(1,semYear);
                        getCoordinating.setString(2,semYear);
                    }
                }
                else
                {
                    setYear = setYear + "/" +  Integer.toString(yearNow + 1).substring(2, 4);
                    semYear = "1-" + setYear;
                    
                    getCourseEntryID.setString(1,semYear);
                    getCoordinating.setString(2,semYear);
                }
                
           }
           else//If the semYear is selected
           {
                getCourseEntryID.setString(1,year);
                getCoordinating.setString(2, year);
           }    
%>
