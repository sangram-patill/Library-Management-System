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
public class journal extends HttpServlet {
    Connection cn=null;
    Statement st=null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        String journal_date_of_entry = req.getParameter("journal_date_of_entry");
        String journal_department = req.getParameter("journal_department");
        String journal_category = req.getParameter("journal_category");
        String journal_acc_no = req.getParameter("journal_acc_no");
        String journal_language = req.getParameter("journal_language");
        String no_of_copies = req.getParameter("no_of_copies");
        String journal_title = req.getParameter("journal_title");
        String journal_sub_title = req.getParameter("journal_sub_title");
        String journal_subject = req.getParameter("journal_subject");
        String journal_pages = req.getParameter("journal_pages");
        String status = req.getParameter("status");
        String event = req.getParameter("submit");
        
        out.println(journal_date_of_entry);
        out.println(journal_department);
        out.println(journal_category);
        out.println(journal_acc_no);
        out.println(journal_language);
        out.println(no_of_copies);
        out.println(journal_title);
        out.println(journal_sub_title);
        out.println(journal_subject);
        out.println(journal_pages);
        out.println(status);
        out.println(event);
        
        Database db = new Database();
        String result = db.Connectdb();
        out.println(result);
        String newbookid = "";

    if(event.equals("Add Journal"))
    {
        if(journal_date_of_entry.equals("")||journal_department.equals("")||journal_category.equals("")||journal_language.equals("")||journal_title.equals("")||journal_sub_title.equals("")||journal_subject.equals("")||journal_pages.equals("")||no_of_copies.equals(""))
        {
            resp.setContentType("text/html");
            out.println("<script type=\"text/javascript\"> alert('Some field are empty..!'); location='journal.jsp'; </script>");
        }
        else
        {
            try
            {
                    long count = 1; 
                    String b_department;
                    Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                    String sql = "select * from journal where j_department = '"+journal_department+"'"; ResultSet rs = st.executeQuery(sql);
                    while(rs.next()){count++;}

                  for(int i= 1; i<= Integer.parseInt(no_of_copies); i++)
                    {
                     newbookid = journal_department+String.valueOf(count);
                     count++;
                     sql = "insert into journal (j_date_of_entry, j_department, j_acc_no, j_category, j_language, j_title, j_subtitle, j_subject, j_pages, j_copies,status) values('"+journal_date_of_entry+"','"+journal_department+"','"+newbookid+"','"+journal_category+"','"+journal_language+"','"+journal_title+"','"+journal_sub_title+"','"+journal_subject+"','"+journal_pages+"','"+no_of_copies+"','"+status+"')";
                     journal_acc_no = journal_department + String.valueOf(i);
                     String Insert=db.Insert(sql);
                     out.println(Insert);
                    }
                    resp.setContentType("text/html");
                    out.println("<script type=\"text/javascript\"> alert('Journal Added Successfully..!'); location='journal.jsp'; </script>");
            }
            catch(Exception ex)
            {
                out.println();
            }
        }
    }
   
     if(event.equals("Update Journal"))
     {
       try
       {
           String sql = "update journal set j_date_of_entry = '"+journal_date_of_entry+"', j_department = '"+journal_department+"',j_acc_no = '"+journal_acc_no+"', j_category = '"+journal_category+"', j_language = '"+journal_language+"', j_title = '"+journal_title+"', j_subtitle = '"+journal_sub_title+"', j_subject = '"+journal_subject+"', j_pages = '"+journal_pages+"', j_copies = '"+no_of_copies+"' where j_acc_no = '"+journal_acc_no+"' ";
           String update = db.update(sql);
           out.println(update);
           resp.setContentType("text/html");
           out.println("<script type=\"text/javascript\"> alert('Journal Updated Successfully..!'); location='journal.jsp'; </script>");
       }
       catch(Exception ex)
       {
           out.println(ex.toString());
       }
     }
     
     if(event.equals("Delete Journal"))
     {
         try
         {
             String sql = "delete from journal where j_acc_no = '"+journal_acc_no+"'";
             String delete = db.delete(sql);
             out.println(delete);
             resp.setContentType("text/html");
             out.println("<script type=\"text/javascript\"> alert('Journal Deleted Successfully..!'); location='journal.jsp'; </script>");
         }
         catch(Exception ex)
         {
             out.println(ex.toString());
         }
     }
     
    }
}
