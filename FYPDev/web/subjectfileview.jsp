<%-- 
    Document   : courseview
    Created on : Jul 27, 2015, 12:08:37 PM
    Author     : Kensiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Section View</title>
    </head>
    <body>
        <h1>Section View for</h1>
        
        <%-- diplay year sem course and subject name chosen from subjectview.jsp --%>
        <div align="center" name="Prev Info">
            Subject Name/ID:(from form03.jsp)
            Sectiond :(from form03.jsp)
            Lecturer Name/ID:(from form03.jsp)
        </div>
       
        <div name="File List">
            <table class="the-table table-striped" align="center">
                <tr>
                    <th>No.</th>
                    <th>Filetype</th>
                    <th>Filename</th>
                    <th>Status</th>
                    <th>View</th>
                </tr>
                <tr>
                    <%-- File list is taken from database --%>
                    <td>1.</td>
                    <td>L1(example)</td>
                    <td>ExampleFilename.pdf</td>
                    <%-- 
                    Default value of the approval status should InReview. 
                    Penyelaras & Pentadbir both can change the approval status.
                    Changes are to be done in the online view.
                    --%>
                    <td>(InReview/Approved/Denied)</td>
                    <td>Magnifiying glass icon</td>
                </tr>
            </table>
        </div>
        
        <div
    </body>
</html>
