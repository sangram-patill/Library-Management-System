/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/*
 *
 * @author
 * sangr
 */

@MultipartConfig(fileSizeThreshold=1024*1024*2, 
maxFileSize=1024*1024*10, 
maxRequestSize=1024*1024*50)

public class staff extends HttpServlet {
                                                                                                    
    Connection cn = null;
    Statement st = null;

    private String getFileName(final Part part) 
    {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) 
        {
                if (content.trim().startsWith("filename")) 
                {
                    return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
                }
        }
    return null;
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
         PrintWriter out = resp.getWriter();
         HttpSession session = req.getSession();
    
         Part filePart = req.getPart("image");
         Part filePart1 = req.getPart("sign");
         
         String registration_no = req.getParameter("registration_no");
         String department = req.getParameter("department");
         String fullname = req.getParameter("fullname");
         String dob = req.getParameter("dob");
         String mobileno = req.getParameter("mobileno");
         String email = req.getParameter("email");
         String address = req.getParameter("address");
         String city = req.getParameter("city");
         String state = req.getParameter("state");
         String district = req.getParameter("district");
         String taluka = req.getParameter("taluka");
         String gender = req.getParameter("gender");
         String password = req.getParameter("password1");
         String role = req.getParameter("role");
         String event = req.getParameter("submit");
         
         
         out.println(registration_no);
         out.println(department);
         out.println(fullname);
         out.println(dob);
         out.println(mobileno);
         out.println(email);
         out.println(address);
         out.println(city);
         out.println(state);
         out.println(district);
         out.println(taluka);
         out.println(gender);
         out.println(password);
         out.println(role);
         
         
        Database db = new Database();
        String result = db.Connectdb();
        out.println(result);
         
          String photo="";
          String sign1="";
          String path="Staff";
          String path1 = "D:/Web Applications/library_management_system/web/image/Staff";
          
          File file=new File(path);
          file.mkdir();
          
          File file1=new File(path);
          file1.mkdir();
          
          String fileName = getFileName(filePart);
          String fileName1 = getFileName(filePart1);
          
          OutputStream out1 = null;
          OutputStream out2 = null;
          
          InputStream filecontent = null;
          InputStream filecontent1 = null;
          
            
          try 
          {
              
            out1 = new FileOutputStream(new File(path1 + File.separator + fileName));
            filecontent = filePart.getInputStream();
            int read = 0;
            final byte[] bytes = new byte[1024];
            while ((read = filecontent.read(bytes)) != -1) 
            { 
                out1.write(bytes, 0, read);
                photo=path+"/"+fileName;
            }
            
            out2 = new FileOutputStream(new File(path1 + File.separator + fileName1));
            filecontent1 = filePart1.getInputStream();
            int read1 = 0;
            final byte[] bytes1 = new byte[1024];
            while ((read1 = filecontent1.read(bytes1)) != -1) 
            { 
                out2.write(bytes1, 0, read1);
                sign1=path+"/"+fileName1;
            }
          
         if(event.equals("Register"))
         {
             if(registration_no.equals("")||department.equals("")||fullname.equals("")||dob.equals("")||mobileno.equals("")||email.equals("")||address.equals("")||city.equals("")||state.equals("")||district.equals("")||taluka.equals("")||gender.equals("")||fileName.equals("")||password.equals("")||fileName1.equals(""))
             {
                    resp.setContentType("text/html");
                    out.println("<script type=\"text/javascript\"> alert('Some field are empty..!'); location='staff.jsp'; </script>");
             }
             else
             {
                 try
                 {
                    Connection cn = null; Statement st = null;
                    Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                    String sql = "select * from staff where registration_no = '"+registration_no+"' || mobile = '"+mobileno+"' || email = '"+email+"' || password = '"+password+"'"; ResultSet rs = st.executeQuery(sql);
                    if(rs.next())
                    {
                        if(registration_no.equals(rs.getString("registration_no")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Registration No. Should Be Unique..!'); location='staff.jsp'; </script>");
                        }
                        else if(mobileno.equals(rs.getString("mobile")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Mobile No. Already Present..!'); location='staff.jsp'; </script>");
                        }
                        else if(email.equals(rs.getString("email")))
                        {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\"> alert('Email Address Already Present..!'); location='staff.jsp'; </script>");
                        }  
                        
                    }
                    else
                    {  
                        sql = "insert into staff (registration_no, department, staff_name, dob, mobile, email, address, city, state, district, taluka, gender, staff_photo,sign,password,role)values('"+registration_no+"','"+department+"','"+fullname+"','"+dob+"','"+mobileno+"','"+email+"','"+address+"','"+city+"','"+state+"','"+district+"','"+taluka+"','"+gender+"','"+fileName+"','"+fileName1+"','"+password+"','"+role+"')";
                        String Insert = db.Insert(sql);
                        out.println(Insert);
                        
                        String  sql1= "insert into create_user(username, password, role,image)values('"+registration_no+"','"+password+"','"+role+"','"+fileName+"')"; 
                        String insert1 = db.Insert(sql1);
                        out.println(insert1);
                        
                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\"> alert('Registered Successfully..!'); location='staff.jsp'; </script>");
                    }
                 }
                 catch(Exception ex)
                 {
                     out.println(ex.toString());
                 }
             }
         }
     }
          catch(Exception ex)
          {
              out.println(ex.toString());
          }
          
         if(event.equals("Update"))
         {
            try
            {
                String sql = "update staff set registration_no = '"+registration_no+"', department = '"+department+"', staff_name = '"+fullname+"', dob = '"+dob+"', mobile = '"+mobileno+"', email = '"+email+"', address = '"+address+"', city = '"+city+"', state = '"+state+"', district = '"+district+"', taluka = '"+taluka+"', gender = '"+gender+"', staff_photo = '"+fileName+"',sign = '"+fileName1+"' where registration_no = '"+registration_no+"'";
                String update = db.update(sql);
                out.println(update);
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\"> alert('Updated Successfully..!'); location='staff.jsp'; </script>");
            }
            catch(Exception ex)
            {
                out.println(ex.toString());
            }
         }
         
         if(event.equals("Remove"))
         {
             try
             {
                 String sql = "delete from staff where registration_no = '"+registration_no+"'";
                 String delete = db.delete(sql);
                 out.println(delete);
                 resp.setContentType("text/html");
                 out.println("<script type=\"text/javascript\"> alert('Removed Successfully..!'); location='staff.jsp'; </script>");
             }
             catch(Exception ex)
             {
                 out.println(ex.toString());
             }
         }

         if(event.equals("Print ID"))
       {
                try
                {
                    Connection cn = null; Statement st = null; ResultSet rs = null;
                    Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                    String sql = "select * from staff where registration_no= '"+registration_no+"' ||  mobile = '"+mobileno+"' || email = '"+email+"'";  rs = st.executeQuery(sql);
                    
                    if(rs.next())
                    {
                        session.setAttribute("registration_no",registration_no);
                        resp.sendRedirect("staff_id_card.jsp");
                    }
                }
                catch(Exception ex)
                {
                    out.println(ex.toString());
                }
       }
         
    }

}
