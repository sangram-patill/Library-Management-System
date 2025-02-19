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
public class student_issue extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        Connection cn = null;
        Statement st = null;
        
        PrintWriter out = resp.getWriter();
        
        String book_accessing_no = req.getParameter("book_accessing_no");
        String student_id = req.getParameter("student_id");
        String issue_date = req.getParameter("issue_date");
        String b_status = req.getParameter("b_status");
        String return_date = req.getParameter("return_date");
        String event = req.getParameter("submit");

        
        out.println(book_accessing_no);
        out.println(student_id);
        out.println(issue_date);
        out.println(b_status);
        out.println(return_date);
        out.println(event);
        
        Database db = new Database();
        String result = db.Connectdb();
        out.println(result);
        
        if(event.equals("Issue Book"))
        {
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                    String sql = "select * from student where registration_no = '"+student_id+"'"; ResultSet rs = st.executeQuery(sql);
//                    String sql3 = "select * from add_book where b_acc_no = '"+book_accessing_no+"'"; ResultSet rs1 = st.executeQuery(sql3);
                    if(rs.next()) 
                    { 
                        sql = "insert into student_issue(book_accessing_no, student_id, issue_date,return_date) values('"+book_accessing_no+"', '"+student_id+"', '"+issue_date+"','"+return_date+"')";
                        String insert = db.Insert(sql);
                        out.println(insert);

                        String sql1 = "update add_book set b_status = 'Issued' where b_acc_no = '"+book_accessing_no+"' ";
                        String update = db.update(sql1);
                        out.println(update);

                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\">  alert('Book Isuued Successfully'); location='student_issue.jsp'; </script>");
                        

//                        if(book_accessing_no.equals(rs.getString("b_acc_no")))
//                        {
//                            resp.setContentType("text/html");
//                            out.println("<script type=\"text/javascript\"> alert('Invalid Book Accessing Number..!'); location='student_issue.jsp'; </script>");
//                        }
//                        else if(student_id.equals(rs.getString("registration_no")))
//                        {
//                            resp.setContentType("text/html");
//                            out.println("<script type=\"text/javascript\"> alert('Invalid Student ID..!'); location='student_issue.jsp'; </script>");
//                        }
                    }
                    else
                    {
//                         if(student_id.equals(rs.getString("registration_no")))
//                        {
//                            resp.setContentType("text/html");
//                            out.println("<script type=\"text/javascript\"> alert('Invalid Student ID..!'); location='student_issue.jsp'; </script>");
//                        }
//                        else if(book_accessing_no.equals(rs.getString("b_acc_no")))
//                        {
//                            resp.setContentType("text/html");
//                            out.println("<script type=\"text/javascript\"> alert('Invalid Book Accessing No. ..!'); location='student_issue.jsp'; </script>");
//                        }
                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\"> alert('Invalid Student ID..!'); location='student_issue.jsp'; </script>");
                    }
                }
                catch(Exception ex)
                {
                    out.println(ex.toString());
                }
        }
        }
        
    }
    
    
