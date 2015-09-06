<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%Connection connection = null;%>
<%@ include file="dbCon.jsp"%>
<%@ include file="checkLogin.jsp"%>

<%
   File file ;
   
   int maxFileSize = 20000 * 1024;
   int maxMemSize = 20000 * 1024;
   
   String filePath = request.getSession().getServletContext().getRealPath(request.getServletPath());

   filePath=filePath.substring(0, filePath.lastIndexOf("\\")+1);
   
    String dir = "";
    String fileType = "";
    String subject = "";
    String semYear="";
    String section = "";
    String lecturerID = "";
    String oriSubject = "";
    String oriSemYear = "";
    String oriSection = "";
    String fileName = "";
    int subSectionID = 0;
    int fileUploadSuccess = 0;
    
    //Prep statement defaults
    String getListIDSQL 
            = "SELECT listID FROM lectlist "
            + "JOIN courseentry ON "
            + "lectlist.courseEntryID = courseentry.courseEntryID WHERE "
            + "lecturerID = ? AND subjectID = ? AND sectionNo = ? AND semYear = ? ";
        PreparedStatement getListID = connection.prepareStatement(getListIDSQL);
        
    String insertFileListSQL
            = "INSERT INTO subjectfile (sub_sectionID, fileType, fileName, fileLocation) "
            + "VALUES (?, ?, ?, ?)";
        PreparedStatement insertFileList = connection.prepareStatement(insertFileListSQL);

    // Verify the content type
    String contentType = request.getContentType();
    if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( fi.isFormField () )	//Getting file particulars
            {
                String fieldName = fi.getFieldName();
                if(fieldName.equals("lectID")){
                    lecturerID = fi.getString();
                    getListID.setString(1, lecturerID);
                }
                else if (fieldName.equals("subject")){
                    oriSubject = subject = fi.getString();
                    getListID.setString(2, oriSubject);
                }
                else if (fieldName.equals("section")){
                    oriSection = fi.getString();
                    getListID.setString(3, oriSection);
                    section = "Section ";
                    if (Integer.parseInt(fi.getString())<10)
                        section+= "0";
                    section += fi.getString();
                }
                else if (fieldName.equals("semYear")){
                    oriSemYear = fi.getString();
                    getListID.setString(4, oriSemYear);
                    ResultSet tempRS = getListID.executeQuery();
                    tempRS.next();
                    subSectionID = tempRS.getInt(1);
                    
                    String[] semYearArr = fi.getString().split("-");
                    String[] semYearArr2 = semYearArr[1].split("/");
                    
                    semYear = "Sem " + semYearArr[0] + " Year 20" + semYearArr2[0] + "-20" + semYearArr2[1];
                }
                else if (fieldName.equals("filetype")){
                    fileType = fi.getString();

                    //Create folder if it doesn't exist
                    dir=filePath+"downloadFiles\\"+semYear+"\\"+subject+"\\"+section+"\\"+fileType+"\\";

                    File folder = new File(dir);
                    if (!folder.exists()){
                        folder.mkdirs();
                    }
                }
            
            }
            else {//Process file

                String curFilePath;
                fileName = fi.getName();
                
                // Write the file
                if( fileName.lastIndexOf("\\") >= 0 ){
                    curFilePath= dir + 
                    fileName.substring( fileName.lastIndexOf("\\")) ;
                }else{
                    curFilePath= dir + 
                    fileName.substring(fileName.lastIndexOf("\\")+1) ;
                }
                
                insertFileList.setInt(1, subSectionID);
                insertFileList.setString(2, fileType);
                insertFileList.setString(3, fileName);
                insertFileList.setString(4, curFilePath.split("downloadFiles")[1].substring(1));
                
                file = new File(curFilePath);
                
                fi.write(file) ;
                fileUploadSuccess++;
                
                insertFileList.execute();

            }
         }
         out.println("</body>");
         out.println("</html>");
         
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
      System.out.println("Error");
      // Failed to upload file
   }
   
    response.sendRedirect("./integrated_subjectFile.jsp?semYear="+oriSemYear+"&class="+oriSubject + "-"+ oriSection+"&success="+ fileUploadSuccess);
   
%>
