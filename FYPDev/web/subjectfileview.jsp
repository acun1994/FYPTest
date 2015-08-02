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
        <% out.println(session.getAttribute("userType").toString()); %>
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
                    
                    <%--
                    This field will be available after a file has been uploaded
                    <th>Uploaded at</th>
                    --%>
                    
                    <th>Status</th>
                    <th>View</th>
                </tr>
                <tr>
                    <%-- 
                    File list is taken from database 
                    If file list is empty, 
                    print a message stating that no file has been uploaded
                    --%>
                    
                    <td>1.</td>
                    <td>L1(example)</td>
                    
                    <%-- 
                    Filename field should be defaulted to upload if pensyarah is viewing
                    If a file has been uploaded,
                        Pensyarah view should include an edit button next to the filename
                        Penyelaras & Pentadbir should be only allowed to view the filename
                    --%>
                    <td>ExampleFilename.pdf</td>
                    
                    <%--
                    Example of timestamp
                    <td>27-07-2015<td>
                    --%>
                    
                    <%-- 
                    Default value of the approval status should InReview. 
                    Penyelaras & Pentadbir both can change the approval status.
                    Changes to approval status are to be done in the online view.
                    Approval status should be clickable to go to file review window
                    --%>
                    <td>(InReview/Approved/Denied)</td>
                    
                    <%--
                    The magnifying glass icon should be clickable to go to online view of the file
                    --%>
                    <td>Magnifiying glass icon</td>
                </tr>
            </table>
        </div>
        
        <div
    </body>
</html>
