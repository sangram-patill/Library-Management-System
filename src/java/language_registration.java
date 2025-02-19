/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *
 * @author
 * sangr
 */
public class language_registration extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        Connection cn = null;
        Statement st = null;
        
        PrintWriter out = resp.getWriter();
        
        String language_id = req.getParameter("language_id");
        String language_name = req.getParameter("language_name");
        String event = req.getParameter("submit");
        
        out.println(language_id);
        out.println(language_name);
        
        Database db = new Database();
        String result = db.Connectdb();
        out.println(result);
        
        if(event.equals("Add Language"))
        {
            if(language_id.equals("")||language_name.equals(""))
            {
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\">  alert('Some field are empty..!'); location='language_registration.jsp'; </script>");
            }
            else
            {
                try
                {
                         Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                         String sql = "select * from language where language_name='"+language_name+"'"; ResultSet rs = st.executeQuery(sql);
                         if(rs.next())
                         {
                              resp.setContentType("text/html");
                              out.println("<script type=\"text/javascript\"> alert('Language Already Present..!'); location='language_registration.jsp'; </script>");
                         }
                         else
                         {
                            sql = "insert into language(language_id, language_name) values('"+language_id+"', '"+language_name+"')";
                            String insert = db.Insert(sql);
                            out.println(insert);
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\">  alert('Language Added Successfully..!'); location='language_registration.jsp'; </script>");
                         }
                }
                catch(Exception ex)
                {
                    out.println();
                }
            }
        }
        
        if(event.equals("Update Language"))
        {
            try
            {
              String sql = "update language set language_name = '"+language_name+"' where language_id = '"+language_id+"'";  
              String update = db.update(sql);
              out.println(update);
              resp.setContentType("text/html");
              out.println("<script type=\"text/javascript\">  alert('Language Updated Successfully..!'); location='language_registration.jsp'; </script>");
            }
            catch(Exception ex)
            {
                out.println(ex.toString());
            }
        }
     
        if(event.equals("Delete Language"))   
        {
            try
            {
               String sql = "delete from language  where language_id = '"+language_id+"'"; 
               String delete = db.delete(sql);
               out.println(delete);
               resp.setContentType("text/html");
               out.println("<script type=\"text/javascript\">  alert('Language Deleted Successfully..!'); location='language_registration.jsp'; </script>");

            }
            catch(Exception ex)
            {
               out.println(ex.toString()); 
            }
        }
    
    }
    
}
