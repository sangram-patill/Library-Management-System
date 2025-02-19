/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
public class newspaper extends HttpServlet {

    Connection cn = null;
    Statement st = null;
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        PrintWriter out = resp.getWriter();
        
        String news_no = req.getParameter("news_no");
        String news_name = req.getParameter("news_name");
        String news_no_of_copies = req.getParameter("news_no_of_copies");
        String news_language = req.getParameter("news_language");
        String news_frequency = req.getParameter("news_frequency");
        String news_vendor = req.getParameter("news_vendor");
        String news_price = req.getParameter("news_price");
        String news_price1 = req.getParameter("news_price1");
        String news_price2 = req.getParameter("news_price2");
        String news_price3 = req.getParameter("news_price3");
        String news_price4 = req.getParameter("news_price4");
        String news_price5 = req.getParameter("news_price5");
        String news_price6 = req.getParameter("news_price6");
        String news_price7 = req.getParameter("news_price7");
        String event = req.getParameter("submit");
        
        
        out.println(news_no);
        out.println(news_name);
        out.println(news_no_of_copies);
        out.println(news_language);
        out.println(news_frequency);
        out.println(news_vendor);
        out.println(news_price);
        out.println(news_price1);
        out.println(news_price2);
        out.println(news_price3);
        out.println(news_price4);
        out.println(news_price5);
        out.println(news_price6);
        out.println(news_price7);
        
        
    Database db = new Database();
    String result = db.Connectdb();
    out.println(result);

    if(event.equals("Add Newspaper"))
    {
        if(news_no.equals("")||news_name.equals("")||news_no_of_copies.equals("")||news_language.equals("")||news_frequency.equals("")||news_vendor.equals(""))
        {
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\"> alert('Some field are empty..!'); location='newspaper.jsp'; </script>");
        }
        else
        {
            try
            {
                
                Connection cn = null; Statement st=null;
                Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                String sql = "select * from newspaper where news_name='"+news_name+"'"; ResultSet rs = st.executeQuery(sql);
                if(rs.next()) 
                { 
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\"> alert('Newspaper Already Present..!'); location='newspaper.jsp'; </script>");
                }
                else
                {
                    String sql1 = "insert into newspaper (news_id, news_name, no_of_copies, news_language, news_frequency, news_vendor, news_price, monday, tuesday, wednesday, thursday, friday, saturday, sunday) values('"+news_no+"','"+news_name+"','"+news_no_of_copies+"','"+news_language+"','"+news_frequency+"','"+news_vendor+"','"+news_price+"','"+news_price1+"','"+news_price2+"','"+news_price3+"','"+news_price4+"','"+news_price5+"','"+news_price6+"','"+news_price7+"')";
                    String insert = db.Insert(sql1);
                    out.println(insert);
                    resp.setContentType("text/html");
                    out.println("<script type=\"text/javascript\"> alert('Newspaper Added Successfully..!'); location='newspaper.jsp'; </script>");
                }
            }
            catch(Exception ex)
            {
                out.println();
            }
        }
    }
    
    if(event.equals("Update Newspaper"))
    {
       try
       {
           String sql = "update newspaper set news_id = '"+news_no+"', news_name = '"+news_name+"', no_of_copies = '"+news_no_of_copies+"', news_language = '"+news_language+"', news_frequency = '"+news_frequency+"', news_vendor = '"+news_vendor+"', news_price = '"+news_price+"' where news_id = '"+news_no+"'";
           String update = db.update(sql);
           out.println(update);
           resp.setContentType("text/html");
           out.println("<script type=\"text/javascript\"> alert('Newspaper Updated Successfully..!'); location='newspaper.jsp'; </script>");
       }
       catch(Exception ex)
       {
           out.println(ex.toString());
       }
    }
    
    if(event.equals("Delete Newspaper"))
    {
        try
        {
            Connection cn = null; Statement st=null;
            Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
            String selectSQL = "select news_id from newspaper where news_name = 'Loksatta'"; ResultSet rs = st.executeQuery(selectSQL);
           if(rs.next()) 
           {
               int news_id = rs.getInt("news_id");
           }
            
            String sql = "delete from newspaper where news_id = '"+news_no+"'";
            String delete = db.delete(sql);
            out.println(delete);
            resp.setContentType("text/html");
            out.println("<script type=\"text/javascript\"> alert('Newspaper Deleted Successfully..!'); location='newspaper.jsp'; </script>");
        
            
           String update = "UPDATE newspaper SET news_id = news_id - 1 WHERE news_id > 0";
           update = db.update(sql);
           out.println(update);
           resp.setContentType("text/html");
           out.println("<script type=\"text/javascript\"> alert('Newspaper Updated Successfully..!'); location='newspaper.jsp'; </script>");
       
            
        }
        catch(Exception ex)
        {
            out.println(ex.toString());
        }
    }
    
}
}

