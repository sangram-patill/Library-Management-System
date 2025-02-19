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
public class dept_master1 extends HttpServlet {

    Connection cn = null;
    Statement st = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    PrintWriter out = resp.getWriter();

    String dept_id = req.getParameter("dept_id");
    String dept_name = req.getParameter("dept_name");
    String dept_course_duration = req.getParameter("dept_course_duration");


    out.println(dept_id);
    out.println(dept_name);
    out.println(dept_course_duration);
        
        
    Database db = new Database();
    String result = db.Connectdb();
    out.println(result);

    String event = req.getParameter("submit");
    if(event.equals("Add Department"))
    {
        if(dept_id.equals("")||dept_name.equals("")||dept_course_duration.equals(""))
        {
            resp.setContentType("text/html");
            out.println("<script type=\"text/javascript\">  alert('Some field are empty..!'); location='dept_master.jsp'; </script> "); 
        }
        else
        {
            try
            {
                Connection cn = null; Statement st=null;
                Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                String sql = "select * from department where d_id = '"+dept_id+"' || d_name = '"+dept_name+"'"; ResultSet rs = st.executeQuery(sql);
                if(rs.next())
                    {
                        if(dept_id.equals(rs.getString("d_id")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Dept ID Should Be Unique..!'); location='student.jsp'; </script>");
                    
                        }
                        else if(dept_name.equals(rs.getString("d_name")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Department Already Present..!'); location='student.jsp'; </script>");
                        }
                else
                    {
                        sql = "insert into department (d_id, d_name, course_name) values('"+dept_id+"','"+dept_name+"','"+dept_course_duration+"')";
                        String insert=db.Insert(sql);
                        out.println(insert);
                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\">  alert('Department Added Successfully..!'); location='dept_master.jsp'; </script> ");
                    }
                }
            }
            catch(Exception ex)
            {
                out.println();
            }
        }
    }
    
    if(event.equals("Update Department"))
    {
        try
        {
            String sql = "update department set d_id = '"+dept_id+"', d_name = '"+dept_name+"', course_name = '"+dept_course_duration+"' where d_id = '"+dept_id+"'";
            String update = db.update(sql);
            out.println(update);
            resp.setContentType("text/html");
            out.println("<script type=\"text/javascript\">  alert('Department Updated Successfully..!'); location='dept_master.jsp'; </script> "); 
        }
        catch(Exception ex)
        {
            out.println(ex.toString());
        }
    }
    
    if(event.equals("Delete Department"))
    {
        try
        {
           String sql = "delete from department where d_id = '"+dept_id+"'"; 
           String delete = db.delete(sql);
           out.println(delete);
           resp.setContentType("text/html");
           out.println("<script type=\"text/javascript\">  alert('Department Deleted Successfully..!'); location='dept_master.jsp'; </script> "); 
        }
        catch(Exception ex)
        {
            out.println(ex.toString());
        }
    }
    
    }
    }
    
    


