/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
public class publisher1 extends HttpServlet {

    Connection cn = null;
    Statement st = null;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        PrintWriter out = resp.getWriter();
        
        String publisher_id = req.getParameter("publisher_id");
        String publisher_name = req.getParameter("publisher_name");
        String publisher_address = req.getParameter("publisher_address");
        String publisher_state = req.getParameter("publisher_state");
        String publisher_district = req.getParameter("publisher_district");
        String publisher_taluka = req.getParameter("publisher_taluka");
        String event = req.getParameter("submit");
        
        out.println(publisher_id);
        out.println(publisher_name);
        out.println(publisher_address);
        out.println(publisher_state);
        out.println(publisher_district);
        out.println(publisher_taluka);
        
        
        Database db = new Database();
        String result = db.Connectdb();
        out.println(result);
        
         
         if(event.equals("Add Publisher"))
         {
             if(publisher_id.equals("")||publisher_name.equals("")||publisher_address.equals("")||publisher_state.equals("")||publisher_district.equals("")||publisher_taluka.equals(""))
             {
                 resp.setContentType("text/html");
                 out.println("<script type=\"text/javascript\">  alert('Some field are empty..!'); location='publisher.jsp'; </script> "); 
             }
             else
             {
                 try
                 {
                     String sql = "insert into publisher(publisher_id, publisher_name, publisher_address, publisher_state, publisher_district, publisher_taluka) values('"+publisher_id+"','"+publisher_name+"','"+publisher_address+"','"+publisher_state+"', '"+publisher_district+"', '"+publisher_taluka+"')";
                     String insert = db.Insert(sql);
                     out.println(insert);
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">  alert('Publisher Added Successfully..!'); location='publisher.jsp'; </script> "); 
                 }
                 catch(Exception ex)
                 {
                     out.println();
                 }
             }
         }
         
         if(event.equals("Update Publisher"))
         {
             try
             {
                String sql = "update publisher set publisher_id = '"+publisher_id+"', publisher_name = '"+publisher_name+"', publisher_address = '"+publisher_address+"', publisher_state = '"+publisher_state+"', publisher_district = '"+publisher_district+"', publisher_taluka = '"+publisher_taluka+"' where publisher_id = '"+publisher_id+"'"; 
                String update = db.update(sql);
                out.println(update);
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\">  alert('Publlisher Updated Successfully..!'); location='publisher.jsp'; </script> "); 
             }
             catch(Exception ex)
             {
                 out.println(ex.toString());
             }
         }
         
         if(event.equals("Delete Publisher"))
         {
             try
             {
                 String sql = "delete from publisher where publisher_id = '"+publisher_id+"'";
                 String delete = db.delete(sql);
                 out.println(delete);
                 resp.setContentType("text/html");
                 out.println("<script type=\"text/javascript\">  alert('Publisher Deleted Successfully..!'); location='publisher.jsp'; </script> "); 
             }
             catch(Exception ex)
             {
                 out.println(ex.toString());
             }
         }
         
    }

    
}
