<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%Connection connection = null;%>
<%@ include file="dbCon.jsp"%>


<%
    //Prep statement defaults
        PreparedStatement addtoList = connection.prepareStatement("INSERT INTO file_list(fileType, fileName, section, "
                       + "semYear, subjectID) VALUES(?,?,?,?,?)");
                
        addtoList.setInt(3, 0);
        addtoList.setString(4, "testYr");
        addtoList.setString(5, "SCCC202");
        
        PreparedStatement getID = connection.prepareStatement("SELECT fileID FROM file_list WHERE fileType=? AND fileName = ? AND "
                       + "section = ? AND semYear = ? AND subjectID = ?");
        
        getID.setInt(3, 0);
        getID.setString(4, "testYr");
        getID.setString(5, "SCCC202");
        
        
        PreparedStatement addtoLog = connection.prepareStatement("INSERT INTO file_changelog(fileID, userID, action, timestamp) VALUES(?, ?, ?, ?)");
        
        addtoLog.setString(2, "userID");
        addtoLog.setString(3, "ADD");
        addtoLog.setTimestamp(4, new Timestamp(new java.util.Date().getTime()));
%>

<%
   File file ;
   
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   
   String filePath = request.getSession().getServletContext().getRealPath(request.getServletPath());

   filePath=filePath.substring(0, filePath.lastIndexOf("\\")+1);
   
    String dir = "";
    String folderPathName ="";
    String fileType = "";

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

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters

                String fileName;
                int version = 1;
                String curFilePath;
                
                do{
                    fileName = fi.getName();
         
                // Write the file
                if( fileName.lastIndexOf("\\") >= 0 ){
                    curFilePath= dir + 
                    fileName.substring( fileName.lastIndexOf("\\")) ;
                }else{
                    curFilePath= dir + 
                    fileName.substring(fileName.lastIndexOf("\\")+1) ;
                }
                
                if (version>1){
                    curFilePath = curFilePath.substring(0, curFilePath.lastIndexOf(".")) 
                            + " v" + version 
                            + curFilePath.substring(curFilePath.lastIndexOf("."));
                }
                file = new File(curFilePath);
                version++;
                }while (file.exists());
                
                fi.write( file ) ;
                out.println("Uploaded Filename: " + curFilePath.substring(curFilePath.lastIndexOf("\\")+1) + "<br>");
                
                //Update file changelog
                
                try{
                    addtoList.setString(1, fileType);
                    addtoList.setString(2, fileName);
                    addtoList.execute();
                    
                    getID.setString(1, fileType);
                    getID.setString(2, fileName);
                    
                    ResultSet rs = getID.executeQuery();
                    rs.next();
                    
                    int fileID = rs.getInt("fileID");
                    
                    addtoLog.setInt(1, fileID);
                    addtoLog.execute();
                }
                catch (Exception ex){
                    out.println("File failed to upload");
                    out.println(ex);
                }
            }
            else {
            String fieldName = fi.getFieldName();
            if (fieldName.equals("folder")){
                folderPathName = fi.getString();
            }
            else if (fieldName.equals("filetype")){
                fileType = fi.getString();
                
                //Create folder if it doesn't exist
                dir=filePath+"downloadFiles\\"+folderPathName+"\\"+fileType+"\\";

                File folder = new File(dir);
                if (!folder.exists()){
                    folder.mkdirs();
                }
            }
            
            }
         }
         out.println("</body>");
         out.println("</html>");
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
%>
