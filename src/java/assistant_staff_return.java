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
public class assistant_staff_return extends HttpServlet {
    
     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        Connection cn = null;
        Statement st = null;
        
        PrintWriter out = resp.getWriter();
        
        String t_id = req.getParameter("t_id");
        String book_accessing_no = req.getParameter("book_accessing_no");
        String staff_id = req.getParameter("staff_id");
        String issue_date = req.getParameter("issue_date");
        String return_date = req.getParameter("return_date");
        String expected_return_date = req.getParameter("expected_return_date");
        String total_days = req.getParameter("total_days");
        String fine = req.getParameter("fine");
        String event = req.getParameter("submit");

        out.println(t_id);
        out.println(book_accessing_no);
        out.println(staff_id);
        out.println(issue_date);
        out.println(return_date);
        out.println(expected_return_date);
        out.println(total_days);
        out.println(fine);
        out.println(event);
        
        Database db = new Database();
        String result = db.Connectdb();
        out.println(result);
        
        if(event.equals("Return Book"))
        {
                try
                {
                   Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                   String sql = "select * from staff_return where rid='"+t_id+"'"; ResultSet rs = st.executeQuery(sql);
                   if(rs.next()) 
                   { 
                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\"> alert('Use Another Tranaction ID..!'); location='library_assistant/library_assistant_staff_return.jsp'; </script>");
                   }
                    else
                    {   
                        sql = "insert into staff_return(rid, book_accessing_no, staff_id, return_date) values('"+t_id+"','"+book_accessing_no+"', '"+staff_id+"', '"+return_date+"')";
                        String insert = db.Insert(sql);
                        out.println(insert);
                        
                        String  sql1= "insert into staff_fine(t_id, book_accessing_no, staff_id, issue_date, expected_return_date, return_date, total_days, fine)values('"+t_id+"','"+book_accessing_no+"','"+staff_id+"','"+issue_date+"','"+expected_return_date+"','"+return_date+"','"+total_days+"','"+fine+"')"; 
                        String insert1 = db.Insert(sql1);
                        out.println(insert1);
                        
                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\">  alert('Book Returned Successfully..!'); location='library_assistant/library_assistant_staff_return.jsp'; </script>");
                    }
                }
                catch(Exception ex)
                {
                    out.println();
                }
        }
    }

    
}
