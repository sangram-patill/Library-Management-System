/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/*
 *
 * @author
 * sangr
 */

@MultipartConfig(fileSizeThreshold=1024*1024*2, 
maxFileSize=1024*1024*10, 
maxRequestSize=1024*1024*50)

public class create_user extends HttpServlet {

        Connection cn = null;
        Statement st = null;
        
        private String getFileName(final Part part) 
       {
           final String partHeader = part.getHeader("content-disposition");
           for (String content : part.getHeader("content-disposition").split(";")) 
           {
                   if (content.trim().startsWith("filename")) 
                   {
                       return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
                   }
           }
       return null;
       }
     
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        PrintWriter out = resp.getWriter();
        
        Part filePart = req.getPart("image");
        
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        String event = req.getParameter("submit");
        
        out.println(username);
        out.println(password);
        out.println(role);
        out.println(event);
        
        Database db = new Database();
        String result = db.Connectdb();
        out.println(result);
        
        String photo="";
        String path="Create User";
        String path1 = "D:/Web Applications/library_management_system/web/image/Create User";
        
        File file=new File(path);
        file.mkdir();

        String fileName = getFileName(filePart);
        
         OutputStream out1 = null;
         InputStream filecontent = null;
         
          try 
          {
              
            out1 = new FileOutputStream(new File(path1 + File.separator + fileName));
            filecontent = filePart.getInputStream();
            int read = 0;
            final byte[] bytes = new byte[1024];
            while ((read = filecontent.read(bytes)) != -1) 
            { 
                out1.write(bytes, 0, read);
                photo=path+"/"+fileName;
                
            }
            
        
        if(event.equals("Create User"))
        {
            if(username.equals("") || password.equals("") || role.equals(""))
            {
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\">  alert('Some field are empty..!'); location='create_user.jsp'; </script>");
            }
            else
            {
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                    String sql = "select * from create_user where username = '"+username+"' || role = '"+role+"'"; ResultSet rs = st.executeQuery(sql);
                    if(rs.next())
                    {
                        if(username.equals(rs.getString("username")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Username Already Taken..!'); location='create_user.jsp'; </script>");
                        }
                        else if(role.equals(rs.getString("role")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Role Already Taken..!'); location='create_user.jsp'; </script>");
                        }
                    }
                    else
                    {
                        sql = "insert into create_user(username, password, role, image) values('"+username+"', '"+password+"', '"+role+"','"+fileName+"')";
                        String insert = db.Insert(sql);
                        out.println(insert);
                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\">  alert('User created Successfully..!'); location='create_user.jsp'; </script>");
                    }
                }
                catch(Exception ex)
                {
                    out.println();
                } 
            }
        }
//        ------
        }
          catch(Exception ex)
          {
              out.println(ex.toString());
          }
          
          if(event.equals("Delete User"))
            {
                try
                {
                    String sql = "delete from create_user where username = '"+username+"'";
                    String delete = db.delete(sql);
                    out.println(delete);
                    resp.setContentType("text/html");
                    out.println("<script type=\"text/javascript\"> alert('User Deleted Successfully..!'); location='create_user.jsp'; </script>");
                }
                catch(Exception ex)
                {
                    out.println(ex.toString());
                }
            }
          
          
    }
  
}
