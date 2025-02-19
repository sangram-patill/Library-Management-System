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
public class lost_entry extends HttpServlet {

     Connection cn=null;
     Statement st=null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
        PrintWriter out = resp.getWriter();
        
        String accessing_no = req.getParameter("accessing_no");
        String book_title = req.getParameter("book_title");
        String department = req.getParameter("department");
        String category = req.getParameter("category"); 
        String date = req.getParameter("date");
        String lost_disposal = req.getParameter("lost_disposal");
        String reason = req.getParameter("reason");
        String magazine_title = req.getParameter("magazine_title");
        String journal_title = req.getParameter("journal_title");
        String status = req.getParameter("status");
        String event = req.getParameter("submit");
        
        out.println(accessing_no);
        out.println(book_title);
        out.println(department);
        out.println(category);
        out.println(date);
        out.println(lost_disposal);
        out.println(reason);
        out.println(magazine_title);
        out.println(journal_title);
        out.println(status);
        out.println(event);
        
        Database db = new Database();
        String result = db.Connectdb();
        out.println(result);
        
        if(event.equals("Submit Book"))
        {
            if(accessing_no.equals("")||book_title.equals("")||department.equals("")||category.equals("")||date.equals("")||lost_disposal.equals("")||reason.equals(""))
            {
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\">  alert('Some field are empty..!'); location='book_lost_entry.jsp'; </script>");
            }
            else
            {
                try
                 {
                    Connection cn = null; Statement st = null;
                    Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                    String sql = "select * from lost_book where accessing_no = '"+accessing_no+"'"; ResultSet rs = st.executeQuery(sql);
                    if(rs.next())
                    {
                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\"> alert('This book is already disposal..!'); location='book_lost_entry.jsp'; </script>");

                    }
                    else
                    {  
                        String sql1 = "insert into lost_book (accessing_no, book_title, department, category, date, lost_disposal, reason)values('"+accessing_no+"','"+book_title+"','"+department+"','"+category+"','"+date+"','"+lost_disposal+"','"+reason+"')";
                        String Insert = db.Insert(sql1);
                        out.println(Insert);
                        
                        String sql2 = "update add_book set b_status = '"+status+"' where b_acc_no = '"+accessing_no+"'";
                        String update = db.update(sql2);
                        out.println(update);
                        
                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\"> alert('Book Add Successfully..!'); location='book_lost_entry.jsp'; </script>");
                    }
                 }
                 catch(Exception ex)
                 {
                     out.println(ex.toString());
                 }
             }
           }
        
        if(event.equals("Update Book"))
        {
                try
                 {
                    
                        String sql3 = "update lost_book set  date = '"+date+"', lost_disposal = '"+lost_disposal+"', reason = '"+reason+"' where accessing_no = '"+accessing_no+"'"; 
                        String update = db.update(sql3);
                        out.println(update);
                                                
                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\"> alert('Book Update Successfully..!'); location='book_lost_entry.jsp'; </script>");
                }
                 catch(Exception ex)
                 {
                     out.println(ex.toString());
                 }
           }
        
        if(event.equals("Submit Journal"))
        {
            if(accessing_no.equals("")||journal_title.equals("")||department.equals("")||category.equals("")||date.equals("")||lost_disposal.equals("")||reason.equals(""))
            {
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\">  alert('Some field are empty..!'); location='journal_lost_entry.jsp'; </script>");
            }
            else
            {
                try
                 {
                    cn = null; st = null;
                    Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                    String sql4 = "select * from lost_journal where accessing_no = '"+accessing_no+"'"; ResultSet rs = st.executeQuery(sql4);
                    if(rs.next())
                    {
                        if(accessing_no.equals(rs.getString("accessing_no")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('This Journal already Disposal..!'); location='journal_lost_entry.jsp'; </script>");
                        }
                    }
                    else
                    {  
                        String sql5 = "insert into lost_journal (accessing_no, journal_title, department, category, date, lost_disposal, reason)values('"+accessing_no+"','"+journal_title+"','"+department+"','"+category+"','"+date+"','"+lost_disposal+"','"+reason+"')";
                        String Insert = db.Insert(sql5);
                        out.println(Insert);
                        
                        String sql6 = "update journal set status = '"+status+"' where j_acc_no = '"+accessing_no+"'";
                        String update = db.update(sql6);
                        out.println(update);
                                                
                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\"> alert('Journal Add Successfully..!'); location='journal_lost_entry.jsp'; </script>");
                    }
                 }
                 catch(Exception ex)
                 {
                     out.println(ex.toString());
                 }
             }
            }
        
        if(event.equals("Submit Magazine"))
        {
            if(accessing_no.equals("")||magazine_title.equals("")||category.equals("")||date.equals("")||lost_disposal.equals("")||reason.equals(""))
            {
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\">  alert('Some field are empty..!'); location='magazine_lost_entry.jsp'; </script>");
            }
            else
            {
                try
                 {
                    cn = null; st = null;
                    Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                    String sql7 = "select * from lost_magazine where accessing_no = '"+accessing_no+"'"; ResultSet rs = st.executeQuery(sql7);
                    if(rs.next())
                    {
                        if(accessing_no.equals(rs.getString("accessing_no")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Accesssing No. Already Present..!'); location='magazine_lost_entry.jsp'; </script>");
                        }
                    }
                    else
                    {  
                        String sql8 = "insert into lost_magazine (accessing_no, magazine_title, category, date, lost_disposal, reason)values('"+accessing_no+"','"+magazine_title+"','"+category+"','"+date+"','"+lost_disposal+"','"+reason+"')";
                        String Insert = db.Insert(sql8);
                        out.println(Insert);
                        
                        String sql9 = "update magzine set status = '"+status+"' where m_acc_no = '"+accessing_no+"'";
                        String update = db.update(sql9);
                        out.println(update);
                        
                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\"> alert('Magazine Add Successfully..!'); location='magazine_lost_entry.jsp'; </script>");
                    }
                 }
                 catch(Exception ex)
                 {
                     out.println(ex.toString());
                 }
             }
        }
        
      }
        
    }
     
     


