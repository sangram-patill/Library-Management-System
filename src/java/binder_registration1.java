
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
 * @author
 * sangr
 */     
public class binder_registration1 extends HttpServlet {

    Connection cn = null;
    Statement st = null;
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        String binder_id = req.getParameter("binder_id");
        String binder_name = req.getParameter("binder_name");
        String binder_company_name = req.getParameter("binder_company_name");
        String binder_phone = req.getParameter("binder_phone");
        String binder_email = req.getParameter("binder_email");
        String binder_address = req.getParameter("binder_address");
        String binder_taluka = req.getParameter("binder_taluka");
        String binder_district = req.getParameter("binder_district");
        String binder_state = req.getParameter("binder_state");
        
        out.println(binder_id);
        out.println(binder_name);
        out.println(binder_company_name);
        out.println(binder_phone);
        out.println(binder_email);
        out.println(binder_address);
        out.println(binder_taluka);
        out.println(binder_district);
        out.println(binder_state);
        
        
    Database db = new Database();
    String result = db.Connectdb();
    out.println(result);

    String event = req.getParameter("submit");
    if(event.equals("Add Binder"))
    {
        if(binder_id.equals("")||binder_name.equals("")||binder_company_name.equals("")||binder_phone.equals("")||binder_email.equals("")||binder_address.equals("")||binder_taluka.equals("")||binder_district.equals("")||binder_state.equals(""))
        {
        resp.setContentType("text/html");
        out.println("<script type=\"text/javascript\"> alert('Some field are empty..!'); location='binder_registration.jsp'; </script>");
        }
        else
        {
            try
            {
                Connection cn = null; Statement st = null;
                Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                String sql = "select * from binder where bi_id = '"+binder_id+"' || bi_phone = '"+binder_phone+"' || bi_email = '"+binder_email+"'"; ResultSet rs = st.executeQuery(sql);
                if(rs.next())
                {
                     if(binder_id.equals(rs.getString("bi_id")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Binder ID Should Unique..!'); location='student.jsp'; </script>");
                        }
                        else if(binder_phone.equals(rs.getString("bi_phone")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Mobile No. Already Present..!'); location='student.jsp'; </script>");
                        }
                        else if(binder_email.equals(rs.getString("bi_email")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Email Address Already Present..!'); location='student.jsp'; </script>");
                        }
                }
                else
                {

                sql = "insert into binder (bi_id, bi_name, bi_company, bi_phone, bi_email, bi_address, bi_taluka, bi_district, bi_state) values('"+binder_id+"','"+binder_name+"','"+binder_company_name+"','"+binder_phone+"','"+binder_email+"','"+binder_address+"','"+binder_taluka+"','"+binder_district+"','"+binder_state+"')";
                String Insert=db.Insert(sql);
                out.println(Insert);
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\"> alert('Binder Added Successfully..!'); location='binder_registration.jsp'; </script>");
                }
            }
            catch(Exception ex)
            {
                out.println();
            }
        }
    }
    
    if(event.equals("Update Binder"))
    {
        try
        {
            String sql = "update binder set bi_id = '"+binder_id+"', bi_name = '"+binder_name+"', bi_company = '"+binder_company_name+"', bi_phone = '"+binder_phone+"', bi_email = '"+binder_email+"', bi_address = '"+binder_address+"', bi_taluka = '"+binder_taluka+"', bi_district = '"+binder_district+"', bi_state = '"+binder_state+"' where  bi_id = '"+binder_id+"'";
            String update = db.update(sql);
            out.println(update);
            resp.setContentType("text/html");
            out.println("<script type=\"text/javascript\"> alert('Binder Updated Successfully..!'); location='binder_registration.jsp'; </script>");
        }
        catch(Exception ex)
        {
            out.println(ex.toString());
        }
        
    }
    
    if(event.equals("Delete Binder"))
    {
        try
        {
           String sql = "delete from binder where bi_id = '"+binder_id+"'"; 
           String delete = db.delete(sql);
           out.println(delete);
           resp.setContentType("text/html");
           out.println("<script type=\"text/javascript\"> alert('Binder Deleted Successfully...!'); location='binder_registration.jsp'; </script>");
        }
        catch(Exception ex)
        {
            out.println(ex.toString());
        }
    }
    
    }
}   