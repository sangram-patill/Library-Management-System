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
public class category1 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        Connection cn = null;
        Statement st = null;
        
        PrintWriter out = resp.getWriter();
        
        String category_id = req.getParameter("category_id");
        String category_type = req.getParameter("category_type");
        String category_name = req.getParameter("category_name");
        String event = req.getParameter("submit");
        
        out.println(category_id);
        out.println(category_type);
        out.println(category_name);
        
        Database db = new Database();
        String result = db.Connectdb();
        out.println(result);
        
        if(event.equals("Add Category"))
        {
            if(category_id.equals("")||category_type.equals("")||category_name.equals(""))
            {
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\">  alert('Some field are empty..!'); location='category.jsp'; </script>");
            }
            else
            {
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                    String sql = "select * from category where category_id = '"+category_id+"' || category_name='"+category_name+"'"; ResultSet rs = st.executeQuery(sql);
                    if(rs.next())
                    {
                        if(category_id.equals(rs.getString("category_id")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Category ID Should Unique..!'); location='category.jsp'; </script>");
                        }
                        else if(category_name.equals(rs.getString("category_name")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Category Already Present..!'); location='category.jsp'; </script>");
                        }
                    }
                    else
                    {
                    sql = "insert into category(category_id, category_type, category_name) values('"+category_id+"', '"+category_type+"', '"+category_name+"')";
                    String insert = db.Insert(sql);
                    out.println(insert);
                    resp.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">  alert('Category Added Successfully..!'); location='category.jsp'; </script>");
                    }
                }
                catch(Exception ex)
                {
                    out.println();
                }
            }
        }
        
        if(event.equals("Update Category"))
        {
            try
            {
              String sql = "update category set category_id = '"+category_id+"', category_type = '"+category_type+"', category_name = '"+category_name+"' where category_id = '"+category_id+"'";  
              String update = db.update(sql);
              out.println(update);
              resp.setContentType("text/html");
              out.println("<script type=\"text/javascript\">  alert('Category Updated Successfully..!'); location='category.jsp'; </script>");
            }
            catch(Exception ex)
            {
                out.println(ex.toString());
            }
        }
     
        if(event.equals("Delete Category"))   
        {
            try
            {
               String sql = "delete from category  where category_id = '"+category_id+"'"; 
               String delete = db.delete(sql);
               out.println(delete);
               resp.setContentType("text/html");
               out.println("<script type=\"text/javascript\">  alert('Category Deleted Successfully..!'); location='category.jsp'; </script>");

            }
            catch(Exception ex)
            {
               out.println(ex.toString()); 
            }
        }
        
    }

   
}
