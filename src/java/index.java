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
public class index extends HttpServlet {

    Connection cn = null;
    Statement st = null;

   @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       HttpSession session = req.getSession();
       PrintWriter out = resp.getWriter();
       
       
       String username = req.getParameter("username");
       String password = req.getParameter("password");
       String role = req.getParameter("role");
       String image = req.getParameter("image");
       String event = req.getParameter("submit");
       
       out.println(username);
       out.println(password);
       out.println(role);
       out.println(image);
       out.println(event);
       
       Database db = new Database();
       String result = db.Connectdb();
       out.println(result);
       
       if(event.equals("Login"))
       {
           if(username.equals(""))
           {
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\"> alert('Some fields Are empty..!'); location='index.jsp'; </script>");
           }
           if(password.equals(""))
           {
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\"> alert('Please Enter Password..!'); location='index.jsp'; </script>");
           }
           else
           {
               try
               {
                    Connection cn = null; Statement st = null;
                    Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                    String sql = "select * from create_user where username = '"+username+"' &&  password = '"+password+"' && role = '"+role+"'"; ResultSet rs = st.executeQuery(sql);
                    
                    if(rs.next())
                    {
                        session.setAttribute("username", rs.getString("username"));
                        session.setAttribute("password", rs.getString("password"));
                        session.setAttribute("role", rs.getString("role"));
                        
                        if(rs.getString("role").equals("principal"))
                        {
                            session.setAttribute("username", rs.getString("username"));
                            session.setAttribute("image", rs.getString("image"));
                            resp.sendRedirect("principal/principal_home.jsp");
                        }
                        if(rs.getString("role").equals("assistant"))
                        {
                            session.setAttribute("username", rs.getString("username"));
                            session.setAttribute("image", rs.getString("image"));
                            resp.sendRedirect("library_assistant/library_assistant_home.jsp");
                        }
                        if(rs.getString("role").equals("student"))
                        {
                            session.setAttribute("username", rs.getString("username"));
                            session.setAttribute("image", rs.getString("image"));
                            resp.sendRedirect("student/student_home.jsp");
                        }
                        if(rs.getString("role").equals("staff"))
                        {
                            session.setAttribute("username", rs.getString("username"));
                            session.setAttribute("image", rs.getString("image"));
                            resp.sendRedirect("staff/staff_home.jsp");
                        }
                        if(rs.getString("role").equals("admin"))
                        {
                            session.setAttribute("username", rs.getString("username"));
                            session.setAttribute("image", rs.getString("image"));
                            resp.sendRedirect("homepage.jsp");
                        }
                        if(rs.getString("role").equals("secretary"))
                        {
                            session.setAttribute("username", rs.getString("username"));
                            session.setAttribute("image", rs.getString("image"));
                            resp.sendRedirect("secretary/secretary_home.jsp");
                        }
                    }
                    else
                    {
                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\"> alert('Login Failed..!'); location='index.jsp'; </script>");
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