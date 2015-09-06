/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */

@WebServlet(urlPatterns = {"/integrated_downloadServlet"})
public class integrated_downloadServlet extends HttpServlet {
	
  private static final int BYTES_DOWNLOAD = 1024;
	
  @Override
  public void doPost(HttpServletRequest request, 
   HttpServletResponse response) throws IOException{
        PrintWriter out = response.getWriter();
        String filePath = request.getParameter("fileLocation");
        
	response.setContentType("text/plain");
	response.setHeader("Content-Disposition","attachment;filename="+filePath.substring(filePath.lastIndexOf('\\')+1)+";");
	ServletContext ctx = getServletContext();
	InputStream is = ctx.getResourceAsStream("./build/web/downloadFiles\\"+filePath);
		
	/*int read=0;
	byte[] bytes = new byte[BYTES_DOWNLOAD];
	OutputStream os = response.getOutputStream();
		
	while((read = is.read(bytes))!= -1){
		os.write(bytes, 0, read);
	}
	os.flush();
	os.close();	*/
   }
}