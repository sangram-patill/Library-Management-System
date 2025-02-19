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
public class staff_issue extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        Connection cn = null;
        Statement st = null;
        
        PrintWriter out = resp.getWriter();
        
        String book_accessing_no = req.getParameter("book_accessing_no");
        String staff_id = req.getParameter("staff_id");
        String issue_date = req.getParameter("issue_date");
        String return_date = req.getParameter("return_date");
        String event = req.getParameter("submit");

        
        out.println(book_accessing_no);
        out.println(staff_id);
        out.println(issue_date);
        out.println(event);
        
        Database db = new Database();
        String result = db.Connectdb();
        out.println(result);
        
        if(event.equals("Issue Book"))
        {
            try
                {
                    Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                    String sql = "select * from staff where registration_no = '"+staff_id+"' "; ResultSet rs = st.executeQuery(sql);
                    if(rs.next()) 
                    { 
                        sql = "insert into staff_issue(book_accessing_no, staff_id, issue_date, return_date) values('"+book_accessing_no+"', '"+staff_id+"', '"+issue_date+"','"+return_date+"')";
                        String insert = db.Insert(sql);
                        out.println(insert);

                        String sql1 = "update add_book set b_status = 'Issued' where b_acc_no = '"+book_accessing_no+"' ";
                        String update = db.update(sql1);
                        out.println(update);

                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\">  alert('Book Issued Successfully'); location='staff_issue.jsp'; </script>");

                    }
                    else
                    {
                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\"> alert('Invalid Staff ID..!'); location='staff_issue.jsp'; </script>");
                    }
                }
                catch(Exception ex)
                {
                    out.println();
                }
        }
        }
}

