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
import javax.servlet.http.HttpSession;

/*
 *
 * @author
 * sangr
 */
public class add_book extends HttpServlet {
   Connection cn = null;
    Statement st = null;
   

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
      
        String acc_no = req.getParameter("acc_no");
        String date = req.getParameter("date");
        String department = req.getParameter("department");
        String category = req.getParameter("category");
        String classification_no = req.getParameter("classification_no");
        String title = req.getParameter("title");
        String sub_title = req.getParameter("sub_title");
        String subject = req.getParameter("subject");
        String edition = req.getParameter("edition");
        String copies = req.getParameter("copies");
        String author_1 = req.getParameter("author_1");
        String author_2 = req.getParameter("author_2");
        String author_3 = req.getParameter("author_3");
        String author_4 = req.getParameter("author_4");
        String publisher_name = req.getParameter("publisher_name");
        String publishing_year = req.getParameter("publishing_year");
        String vendor_name = req.getParameter("vendor_name");
        String book_pages = req.getParameter("book_pages");
        String price = req.getParameter("price");
        String rack_no = req.getParameter("rack_no");
        String language = req.getParameter("language");
        String b_status = req.getParameter("b_status");
        String event = req.getParameter("submit");

        
        out.println(date);
        out.println(department);
        out.println(acc_no);
        out.println(category);
        out.println(classification_no);
        out.println(title);
        out.println(sub_title);
        out.println(subject);
        out.println(edition);
        out.println(copies);
        out.println(author_1);
        out.println(author_2);
        out.println(author_3);
        out.println(author_4);
        out.println(publisher_name);
        out.println(publishing_year);
        out.println(vendor_name);
        out.println(book_pages);
        out.println(price);
        out.println(rack_no);
        out.println(language);
        out.println(b_status);
        
        Database db = new Database();
        String result = db.Connectdb();
        out.println(result);
        
        String newbookid = "";
        
                if(event.equals("Add Book"))
                  {
                     if(date.equals("")||department.equals("")||category.equals("")||classification_no.equals("")||title.equals("")||edition.equals("")||copies.equals("")||author_1.equals("")||author_2.equals("")||author_3.equals("")||author_4.equals("")||publisher_name.equals("")||publishing_year.equals("")||vendor_name.equals("")||book_pages.equals("")||price.equals("")||rack_no.equals("")||language.equals(""))
                     {
                       resp.setContentType("text/html");
                       out.println("<script type=\"text/javascript\"> alert('Some field are empty..!'); location='add_book.jsp'; </script>");
                     }
                     else
                    {
                      try
                      {
                            long count = 1; 
                            String b_department;
                            Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            String sql = "select * from add_book where b_department = '"+department+"'"; ResultSet rs = st.executeQuery(sql);
                            while(rs.next()){count++;}
                            
                          for(int i= 1; i<= Integer.parseInt(copies); i++)
                        {
                             newbookid = department+String.valueOf(count);
                             count++;
                             sql="insert into add_book (b_date_of_entry, b_department, b_acc_no, b_category, b_classificationcode, b_title, b_subtitle, b_subject, b_edition, b_copies, author_1, author_2, author_3, author_4, b_publishername, b_publishingyear, b_vendorname, b_pages, b_price, b_rackno, b_language,b_status)values('"+date+"','"+department+"','"+newbookid+"','"+category+"','"+classification_no+"','"+title+"','"+sub_title+"','"+subject+"','"+edition+"','"+copies+"','"+author_1+"','"+author_2+"','"+author_3+"','"+author_4+"','"+publisher_name+"','"+publishing_year+"','"+vendor_name+"','"+book_pages+"','"+price+"','"+rack_no+"','"+language+"','"+b_status+"')";
                             acc_no = department + String.valueOf(i);
                             String Insert=db.Insert(sql);
                             out.println(Insert);
                        }
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Book Added Successfully..!'); location='add_book.jsp'; </script>");
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
                     String sql = "update add_book set b_date_of_entry = '"+date+"', b_department = '"+department+"', b_acc_no = '"+acc_no+"',b_category = '"+category+"', b_classificationcode = '"+classification_no+"', b_title = '"+title+"', b_subtitle = '"+sub_title+"', b_subject = '"+subject+"', b_edition = '"+edition+"', b_copies = '"+copies+"', author_1 = '"+author_1+"',author_2 = '"+author_2+"',author_3 = '"+author_3+"',author_4 = '"+author_4+"', b_publishername = '"+publisher_name+"', b_publishingyear = '"+publishing_year+"', b_vendorname = '"+vendor_name+"', b_page = '"+book_pages+"', b_price = '"+price+"',b_rackno = '"+rack_no+"', b_language = '"+language+"', b_status = '"+b_status+"' where b_acc_no = '"+acc_no+"'";
                     String update = db.update(sql);
                     out.println(update);
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\"> alert('Book Updated Successfully..!'); location='add_book.jsp'; </script>");
                 }
                 catch(Exception ex)
                 {
                     out.println(ex.toString());
                 }
            }
            
            
            if(event.equals("Delete Book"))
            {
                try
                {
                    String sql = "delete from add_book where b_acc_no = '"+acc_no+"'";
                    String delete = db.delete(sql);
                    out.println(delete);
                    resp.setContentType("text/html");
                    out.println("<script type=\"text/javascript\"> alert('Book Deleted Successfully..!'); location='add_book.jsp'; </script>");
                }
                catch(Exception ex)
                {
                    out.println(ex.toString());
                }
            }
            
        }

     
}
