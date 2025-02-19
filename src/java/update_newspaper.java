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
public class update_newspaper extends HttpServlet {

    Connection cn = null;
    Statement st = null;
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
       
        String[] news_name = req.getParameterValues("news_name[]");
        String date = req.getParameter("date");
        String event = req.getParameter("submit");
        
        Database db = new Database();
        String result = db.Connectdb();
        out.println(result);

    if(event.equals("Add"))
    {
       
            try
            {
                for (String value : news_name) {
                    String sql = "insert into update_newspaper (date, news_name) values('"+date+"','"+value+"')";
                    String insert=db.Insert(sql);
                }                       
                       resp.setContentType("text/html");
                       out.println("<script type=\"text/javascript\"> alert('Newspaper Added Successfully..!'); location='update_newspaper.jsp'; </script>");
            }
            catch(Exception ex)
            {
                out.println(ex.toString());
            }
            
    }
   
    }

}
