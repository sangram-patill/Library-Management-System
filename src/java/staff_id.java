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
public class staff_id extends HttpServlet {

    Connection cn = null;
    Statement st = null;
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        String registration_no = req.getParameter("registration_no");
        String event = req.getParameter("submit");
        
        out.println(registration_no);
        out.println(event);
        
        Database db = new Database();
        String result = db.Connectdb();
        out.println(result); 
        
       if(event.equals("Download ID"))
       {
                try
                {
                    ResultSet rs;
                    
                    Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                    String sql = "select * from staff where registration_no= '"+session.getAttribute("username") +"'";  rs = st.executeQuery(sql);
                    
                    if(rs.next())
                    {
                        session.setAttribute("registration_no",session.getAttribute("username"));
                        resp.sendRedirect("staff/staff_id_card.jsp");
                    }
                }
                catch(Exception ex)
                {
                    out.println(ex.toString());
                }
       }
    
    }
   
    
}
