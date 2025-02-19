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
public class magazine extends HttpServlet {

    Connection cn = null;
    Statement st = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        String magzine_date_of_entry = req.getParameter("magzine_date_of_entry");
        String magzine_dept = req.getParameter("magzine_dept");
        String magzine_category = req.getParameter("magzine_category");
        String magzine_acc_no1 = req.getParameter("magzine_acc_no1");
        String magzine_language = req.getParameter("magzine_language");
        String magzine_title = req.getParameter("magzine_title");
        String magzine_sub_title = req.getParameter("magzine_sub_title");
        String magzine_subject = req.getParameter("magzine_subject");
        String magzine_pages = req.getParameter("magzine_pages");
        String magzine_no_of_copies = req.getParameter("magzine_no_of_copies");
        String status = req.getParameter("status");
        String event = req.getParameter("submit");
        
        out.println(magzine_date_of_entry);
        out.println(magzine_dept);
        out.println(magzine_category);
        out.println(magzine_acc_no1);        
        out.println(magzine_language);
        out.println(magzine_title);
        out.println(magzine_sub_title);
        out.println(magzine_subject);
        out.println(magzine_pages);
        out.println(magzine_no_of_copies);
        out.println(status);
        out.println(event);
        
        Database db = new Database();
        String result = db.Connectdb();
        out.println(result);
        String newbookid = "";
        
        if(event.equals("Add Maganize"))
        {
            if(magzine_date_of_entry.equals("")||magzine_dept.equals("")||magzine_category.equals("")||magzine_language.equals("")||magzine_title.equals("")||magzine_sub_title.equals("")||magzine_subject.equals("")||magzine_pages.equals("")||magzine_no_of_copies.equals(""))
            {
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\"> alert('Some field are empty..!'); location='magazine.jsp'; </script>");
            }
            else
            {
                try
                {
                            long count = 1; 
                            String m_department;
                            Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            String sql = "select * from magzine where m_department = '"+magzine_dept+"'"; ResultSet rs = st.executeQuery(sql);
                            while(rs.next()){count++;}
                            
                          for(int i= 1; i<= Integer.parseInt(magzine_no_of_copies); i++)
                            {
                                newbookid = magzine_dept+String.valueOf(count);
                                count++;
                                sql = "insert into magzine (m_date_of_entry, m_department, m_acc_no, m_category, m_language, m_title, m_subtitle, m_subject, m_pages, m_copies,status) values('"+magzine_date_of_entry+"','"+magzine_dept+"','"+newbookid+"','"+magzine_category+"','"+magzine_language+"','"+magzine_title+"','"+magzine_sub_title+"','"+magzine_subject+"','"+magzine_pages+"','"+magzine_no_of_copies+"','"+status+"')";
                                magzine_acc_no1 = magzine_dept + String.valueOf(i);
                                String Insert=db.Insert(sql);
                                out.println(Insert);
                            }
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Magazine Added Successfully..!'); location='magazine.jsp'; </script>");
                
                }
                catch(Exception ex)
                {
                    out.println(ex.toString());
                }
        }
        
        if(event.equals("Update Maganize"))
        {
            try
            {
                String sql = "update magzine set m_date_of_entry = '"+magzine_date_of_entry+"', m_department = '"+magzine_dept+"', m_acc_no = '"+magzine_acc_no1+"', m_category = '"+magzine_category+"', m_language = '"+magzine_language+"', m_title = '"+magzine_title+"', m_subtitle = '"+magzine_sub_title+"', m_subject = '"+magzine_subject+"', m_pages = '"+magzine_pages+"', m_copies = '"+magzine_no_of_copies+"' where m_acc_no = '"+magzine_acc_no1+"'";
                String update = db.update(sql);
                out.println(update);
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\"> alert('Magazine Updated Successfully..!'); location='magazine.jsp'; </script>");
            }
            catch(Exception ex)
            {
                out.println(ex.toString());
            }
        }
        
        if(event.equals("Delete Maganize"))
        {
            try
            {
                
                String sql = "delete from magzine where m_acc_no = '"+magzine_acc_no1+"'";
                String delete = db.delete(sql);
                out.println(delete);
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\"> alert('Magazine Deleted Successfully..!'); location='magazine.jsp'; </script>");
            }
            catch(Exception ex)
            {
                out.println(ex.toString());
            }
        }
        
    }
    
    }

    
}
