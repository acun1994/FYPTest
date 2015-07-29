/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import org.apache.commons.io.FileUtils.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/testDelete"})
public class testDelete extends HttpServlet {


    @Override
  public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
        int filenamePos = request.getParameter("filePath").lastIndexOf("/");
        String filename = request.getParameter("filePath").substring(filenamePos+1);

        PrintWriter out = response.getWriter();
        
        String filePath = request.getSession().getServletContext().getRealPath("/");
        
        filePath += request.getParameter("filePath");
        
        File fileDeleted = new File(filePath);
        
        if (!fileDeleted.exists()){
            out.println("File " + filename + " does not exist");
            out.println(filePath);}
        else if (fileDeleted.delete())        
            out.println("Deleted " + filename);
        else
            out.println("Failed to delete "+ filename);
  }
}
