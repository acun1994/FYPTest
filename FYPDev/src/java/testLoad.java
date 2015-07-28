/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/testLoad"})
public class testLoad extends HttpServlet{
 
  private static final int BYTES_DOWNLOAD = 1024;
  
  @Override
  public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
        int filenamePos = request.getParameter("filePath").lastIndexOf("/");
        String filename = request.getParameter("filePath").substring(filenamePos+1);
        
	response.setContentType("text/plain");
	response.setHeader("Content-Disposition",
                     "attachment;filename="+filename+";");
	ServletContext ctx = getServletContext();
        
	InputStream is = ctx.getResourceAsStream("/"+request.getParameter("filePath"));
 
	int read;
	byte[] bytes = new byte[BYTES_DOWNLOAD];
        try (OutputStream os = response.getOutputStream()) {
          while((read = is.read(bytes))!= -1){
              os.write(bytes, 0, read);
          }
          os.flush();
          os.close();
      }	
        catch(Exception ex){
         PrintWriter out = response.getWriter();
         out.println(ex);
        }
   }
}
