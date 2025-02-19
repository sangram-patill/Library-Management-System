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
public class invoice extends HttpServlet {
    
    Connection cn = null;
    Statement st = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            PrintWriter out = resp.getWriter();
        
        String invoice_no = req.getParameter("invoice_no");
        String order_no = req.getParameter("order_no");
        String vendor_name = req.getParameter("vendor_name");
        String invoice_date = req.getParameter("invoice_date");
        String order_date = req.getParameter("order_date");
        String amount = req.getParameter("amount");
        String discount = req.getParameter("discount");
        String payment_mode = req.getParameter("payment_mode");
        String payment_date = req.getParameter("payment_date");
        String event = req.getParameter("submit");

        
        out.println(invoice_no);
        out.println(order_no);
        out.println(vendor_name);
        out.println(invoice_date);
        out.println(order_date);
        out.println(amount);
        out.println(discount);
        out.println(payment_mode);
        out.println(payment_date);
        
        
    Database db = new Database();
    String result = db.Connectdb();
    out.println(result);
   

    if(event.equals("Add Invoice"))
    {
        if(invoice_no.equals("")||order_no.equals("")||vendor_name.equals("")||invoice_date.equals("")||order_date.equals("")||amount.equals("")||discount.equals("")||payment_mode.equals("")||payment_date.equals(""))
        {
        resp.setContentType("text/html");
        out.println("<script type=\"text/javascript\"> alert('Some field are empty..!'); location='invoice.jsp'; </script>");
        }
        else
        {
            try
            {
                Connection cn = null; Statement st = null;  ResultSet rs=null;
                Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                String sql = "select * from invoice where order_no = '"+order_no+"'";
                rs = st.executeQuery(sql);
                if(rs.next())
                {
                     if(order_no.equals(rs.getString("order_no")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Order No Should Unique..!'); location='invoice.jsp'; </script>");
                    
                        }
                        
                }
                else
                {

                sql = "insert into invoice (invoice_no, order_no, vendor_name, invoice_date, order_date, amount, discount, payment_mode, payment_date) values('"+invoice_no+"','"+order_no+"','"+vendor_name+"','"+invoice_date+"','"+order_date+"','"+amount+"','"+discount+"','"+payment_mode+"','"+payment_date+"')";
                String Insert=db.Insert(sql);
                out.println(Insert);
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\"> alert('Invoice Added Successfully..!'); location='invoice.jsp'; </script>");
                }
            }
            catch(Exception ex)
            {
                out.println();
            }
        }
    }
    
    if(event.equals("Update Invoice"))
    {
        try
        {
            String sql = "update  set invoice_no = '"+invoice_no+"', order_no = '"+order_no+"', vendor_name = '"+vendor_name+"', invoice_date = '"+invoice_date+"', order_date = '"+order_date+"', amount = '"+amount+"', discount = '"+discount+"', payment_mode = '"+payment_mode+"', payment_date = '"+payment_date+"' where  order_no = '"+order_no+"'";
            String update = db.update(sql);
            out.println(update);
            resp.setContentType("text/html");
            out.println("<script type=\"text/javascript\"> alert('Invoice Updated Successfully..!'); location='invoice.jsp'; </script>");
        }
        catch(Exception ex)
        {
            out.println(ex.toString());
        }
        
    }
    
    if(event.equals("Delete Invoice"))
    {
        try
        {
           String sql = "delete from invoice where order_no = '"+order_no+"'"; 
           String delete = db.delete(sql);
           out.println(delete);
           resp.setContentType("text/html");
           out.println("<script type=\"text/javascript\"> alert('Invoice Deleted Successfully...!'); location='invoice.jsp'; </script>");
        }
        catch(Exception ex)
        {
            out.println(ex.toString());
        }
    }
    
    }
       
}
       
    

