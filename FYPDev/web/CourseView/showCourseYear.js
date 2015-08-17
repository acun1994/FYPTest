/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function showCourse(year) 
        {
            $("#yearValue").val(year);
            if (year == "#") 
            {
                document.getElementById("course").innerHTML = "<option value='#'>Please Select A Year First</option>";
                return;
            } 
            else 
            { 
                if (window.XMLHttpRequest) 
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                 xmlhttp = new XMLHttpRequest();
                } 
                else 
                {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }

            xmlhttp.onreadystatechange = function() 
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
                {document.getElementById("course").innerHTML = xmlhttp.responseText;}
            }
            xmlhttp.open("GET","getcourse.jsp?year="+year,true);
            xmlhttp.send();
            }
             
        }
        
        function showSem(course,year) 
        {
                     
             $("#courseValue").val(course);
             
            if (course == "#" || year == "#") 
            {
                document.getElementById("sem").innerHTML = "<option value='#'>Please Select A Course First</option>";
                return;
            } 
            else 
            { 
                if (window.XMLHttpRequest) 
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                 xmlhttp = new XMLHttpRequest();
                } 
                else 
                {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }

            xmlhttp.onreadystatechange = function() 
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
                {document.getElementById("sem").innerHTML = xmlhttp.responseText;}
            }
            xmlhttp.open("GET","getsem.jsp?course="+course+"&year="+year,true);
            xmlhttp.send();
            }

        }
