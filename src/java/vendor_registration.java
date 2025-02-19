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
public class vendor_registration extends HttpServlet {

    Connection cn = null;
    Statement st = null;
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        String vendor_id = req.getParameter("vendor_id");
        String vendor_name = req.getParameter("vendor_name");
        String vendor_company_name = req.getParameter("vendor_company_name");
        String vendor_phone = req.getParameter("vendor_phone");
        String vendor_email = req.getParameter("vendor_email");
        String vendor_address = req.getParameter("vendor_address");
        String vendor_taluka = req.getParameter("vendor_taluka");
        String vendor_district = req.getParameter("vendor_district");
        String vendor_state = req.getParameter("vendor_state");
        
        out.println(vendor_id);
        out.println(vendor_name);
        out.println(vendor_company_name);
        out.println(vendor_phone);
        out.println(vendor_email);
        out.println(vendor_address);
        out.println(vendor_taluka);
        out.println(vendor_district);
        out.println(vendor_state);
        
        
    Database db = new Database();
    String result = db.Connectdb();
    out.println(result);

    String event = req.getParameter("submit");
    if(event.equals("Add Vendor"))
    {
        if(vendor_id.equals("")||vendor_name.equals("")||vendor_company_name.equals("")||vendor_phone.equals("")||vendor_email.equals("")||vendor_address.equals("")||vendor_taluka.equals("")||vendor_district.equals("")||vendor_state.equals(""))
        {
        resp.setContentType("text/html");
        out.println("<script type=\"text/javascript\">  alert('Some field are empty..!'); location='vendor_registration.jsp'; </script> "); 
        }
        else
        {
            try
            {
                Connection cn = null; Statement st = null;
                Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                String sql = "select * from vendor where v_id = '"+vendor_id+"' || v_phone='"+vendor_phone+"' || v_email = '"+vendor_email+"'"; ResultSet rs = st.executeQuery(sql);
                if(rs.next())
                {
                     if(vendor_id.equals(rs.getString("v_id")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Vendor ID Should Unique..!'); location='vendor_registration.jsp'; </script>");
                    
                        }
                        else if(vendor_phone.equals(rs.getString("v_phone")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Mobile No. Already Present..!'); location='vendor_registration.jsp'; </script>");
                        }
                        else if(vendor_email.equals(rs.getString("v_email")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Email Address Already Present..!'); location='vendor_registration.jsp'; </script>");
                        }
                }
                else
                {
                sql = "insert into vendor (v_id, v_name, v_company, v_phone, v_email, v_address, v_taluka, v_district, v_state) values('"+vendor_id+"','"+vendor_name+"','"+vendor_company_name+"','"+vendor_phone+"','"+vendor_email+"','"+vendor_address+"','"+vendor_taluka+"','"+vendor_district+"','"+vendor_state+"')";
                String insert=db.Insert(sql);
                out.println(insert);
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\">  alert('Vendor Added Successfully..!'); location='vendor_registration.jsp'; </script> "); 
                }
            }
            catch(Exception ex)
            {
                out.println();
            }
        }
    }
    
    if(event.equals("Update Vendor"))
    {
        try
        {
            String sql = "update vendor set v_id = '"+vendor_id+"', v_name = '"+vendor_name+"', v_company = '"+vendor_company_name+"', v_phone = '"+vendor_phone+"', v_email = '"+vendor_email+"', v_address = '"+vendor_address+"', v_taluka = '"+vendor_taluka+"', v_district = '"+vendor_district+"', v_state = '"+vendor_state+"' where  v_id = '"+vendor_id+"'";
            String update = db.update(sql);
            out.println(update);
            resp.setContentType("text/html");
            out.println("<script type=\"text/javascript\">  alert('Vendor Updated Successfully..!'); location='vendor_registration.jsp'; </script> "); 
        }
        catch(Exception ex)
        {
            out.println(ex.toString());
        }
    }
    
    if(event.equals("Delete Vendor"))   
    {
       try
       {
           String sql = "delete from vendor where  v_id = '"+vendor_id+"'";
           String delete = db.delete(sql);
           out.println(delete);
           resp.setContentType("text/html");
           out.println("<script type=\"text/javascript\">  alert('Vendor Deleted Successfully..!'); location='vendor_registration.jsp'; </script> "); 
       }
       catch(Exception ex)
       {
           out.println(ex.toString());
       }
    }
        
    }
    
    }