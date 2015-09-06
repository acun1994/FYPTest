<%-- 
    Document   : csvController
    Created on : 02-Sep-2015, 20:55:08
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.io.FileInputStream,java.io.FileNotFoundException,java.io.FileOutputStream,java.io.IOException" %>
        <%@page import="javax.servlet.ServletConfig,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse" %>
        
        <%
            String filepath = request.getSession().getServletContext().getRealPath(request.getServletPath());
            filepath=filepath.substring(0, filepath.lastIndexOf("\\")+1);
            out.println(filepath);
        %>
        
        
        
        <%--
public class SaveFile extends HttpServlet {
    public void init(ServletConfig config)throws ServletException{
        super.init(config);
        System.out.println("The SaveFile iniated.^^^^^^^^^^^^^^^^^^^################");
    }
    
    public void service(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
        try{
            String pathheader=request.getParameter("filehdr");
            System.out.println("The pathheader is : "+pathheader);
            String pathdetail=request.getParameter("filedtl");
            System.out.println("The pathdetail is : "+pathdetail);
            
            String folderpath=request.getParameter("filefolder");    
            
            String filenamehdr=folderpath+pathheader.substring(pathheader.lastIndexOf('\\'));
            System.out.println("The file output path is : "+filenamehdr);            
            String filenamedtl=folderpath+pathdetail.substring(pathdetail.lastIndexOf('\\'));
            System.out.println("The file output path is : "+filenamedtl);
            
            FileInputStream fis=new FileInputStream(pathheader);
            FileOutputStream fos=new FileOutputStream(filenamehdr);
            
            byte buf[]=new byte[11024];
            fis.read(buf);
            fos.write(buf,0,buf.length);
            
            fis=new FileInputStream(pathdetail);
            fos=new FileOutputStream(filenamedtl);
            fis.read(buf);
            fos.write(buf,0,buf.length);
            
            if(fis!=null)
                fis.close();
            if(fos!=null)
                fos.close();
            
            System.out.println("------------------ Files are Saved in Folder-------------------");
            request.getRequestDispatcher("/uploaddata").forward(request, response);

        }catch(FileNotFoundException e){
            System.out.println(e.getMessage());
        }catch(IOException e){
            System.out.println(e.getMessage());
        }
    }


}
        --%>
    </body>
</html>
