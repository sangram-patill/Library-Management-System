<%-- 
    Document   : view_report
    Created on : 12 May, 2023, 5:59:06 PM
    Author     : Aditya
--%>

<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Admin - View Report</title>
        <link rel="icon" type="image/x-icon" href="image/fevicon.png">
    </head>
    <body>
       <%
       
       String event=request.getParameter("submit");
       if(event!=null)
       {
           // Normal Report
           //total books
            if(event.equals("Total Books"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\bookr.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            //total journal
            if(event.equals("Total Journal"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\journal.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            
            //total Magazine
            if(event.equals("Total Magazine"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\magazine.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            
            
            //total newspaper
            if(event.equals("Total Newspaper"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\newspaper.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }           
            
                        
            
           //Total Update Newspaper
             if(event.equals("Total Update Newspaper"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\update_newspaper.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            
            //total Students
            if(event.equals("Total Students"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\student.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            //total Staff
            if(event.equals("Total Staff"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\staff.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            
            //total Student Issue
            if(event.equals("Total Student Issue"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\student_issue.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            
            //total Student Return
            if(event.equals("Total Student Return"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\student_return.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            
            //total Staff Issue
            if(event.equals("Total Staff Issue"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\staff_issue.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            
            //total Staff Return
            if(event.equals("Total Staff Return"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\staff_return.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            
            
            //Total invoice report
            if(event.equals("Total Invoice"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\invoice.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            
            // Total Lost/Disposal Books
            if(event.equals("Total Lost/Disposal Books"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\lost_book.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            
            // Total Lost/Disposal Journal
            if(event.equals("Total Lost/Disposal Journals"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\lost_journal.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            
            
           // Total Lost/Disposal Magazine
            if(event.equals("Total Lost/Disposal Magazines"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\lost_magazine.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            
            // Total Departments
            if(event.equals("Total Departments"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\department.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            
            // Total Binders
            if(event.equals("Total Binders"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\binder.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
            // Total Vendors
            if(event.equals("Total Vendors"))
            {
                Connection cn = null;
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("Reports\\vendor.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }

           

                                              
           else                                   
           {
           // Particular Id Wise Reports
            

           if(event.equals("View Book"))
           {
              String date1=request.getParameter("id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_book.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("b_acc_no", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Journal"))
           {
              String date1=request.getParameter("j_id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_journal.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("j_acc_no", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           if(event.equals("View Magazine"))
           {
              String date1=request.getParameter("m_id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_magazine.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("m_acc_no", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           if(event.equals("View Newspaper"))
           {
              String date1=request.getParameter("n_id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_newspaper.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("n_id", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           if(event.equals("View Update Newspaper"))
           {
              String date1=request.getParameter("id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_update_newspaper.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("u_p_id", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
               

           if(event.equals("View Student"))
           {
              String date1=request.getParameter("id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_student.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("stud_id", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Staff"))
           {
              String date1=request.getParameter("staff_id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_staff.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("staff_id", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           
           if(event.equals("View Issued Student"))
           {
              String date1=request.getParameter("student_issue_id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_student_issue.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("issue_id", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           if(event.equals("View Student Return"))
           {
              String date1=request.getParameter("id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_student_return.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("return_id", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           if(event.equals("View Staff Issue"))
           {
              String date1=request.getParameter("staff_issue_id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_staff_issue.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("issue_id", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
            if(event.equals("View Staff return"))
           {
              String date1=request.getParameter("staff_return_id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_staff_return.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("staff_return_id", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }           
                     
           if(event.equals("View Invoice"))
           {
              String date1=request.getParameter("id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_wise_invoice.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("id", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
            if(event.equals("View Lost/Disposal Book"))
           {
              String date1=request.getParameter("id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_lost_book.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("book_ld_id", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Lost/Disposal Journal"))
           {
              String date1=request.getParameter("id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_lost_journal.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("j_acc_no", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           if(event.equals("View Lost/Disposal Magazine"))
           {
              String date1=request.getParameter("id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_lost_magazine.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("m_acc_no", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Department"))
           {
              String date1=request.getParameter("id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_department.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("dept_id", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Binder"))
           {
              String date1=request.getParameter("id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_binder.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("binder_id", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           if(event.equals("View Vendor"))
           {
              String date1=request.getParameter("id");
              out.println(date1); 
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }              
                File reportFile = new File(application.getRealPath("Reports\\id_wise\\id_vendor.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("vendor_id", date1);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }       
           
           
            // From Id To Id  Reports
           
           if(event.equals("View Book By ID"))
           {
              String date1=request.getParameter("b_acc1");
              out.println(date1); 
              
              String date2=request.getParameter("b_acc2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_bookr.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("b_acc1", date1);
                parameters.put("b_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Journal By ID"))
           {
              String date1=request.getParameter("j_acc1");
              out.println(date1); 
              
              String date2=request.getParameter("j_acc2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_journal.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("j_acc1", date1);
                parameters.put("j_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Magazine By ID"))
           {
              String date1=request.getParameter("m_acc1");
              out.println(date1); 
              
              String date2=request.getParameter("m_acc2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_magazine.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("m_acc1", date1);
                parameters.put("m_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           
           if(event.equals("View Newspaper By ID"))
           {
              String date1=request.getParameter("n_acc1");
              out.println(date1); 
              
              String date2=request.getParameter("n_acc2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_newspaper.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("n_acc1", date1);
                parameters.put("n_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Update newspaper By ID"))
           {
              String date1=request.getParameter("u_p_acc1");
              out.println(date1); 
              
              String date2=request.getParameter("u_p_acc2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_u_newspaper.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("u_p_acc1", date1);
                parameters.put("u_p_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Student By ID"))
           {
              String date1=request.getParameter("order1");
              out.println(date1); 
              
              String date2=request.getParameter("order2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_student.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("stud_acc1", date1);
                parameters.put("stud_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Staff By ID"))
           {
              String date1=request.getParameter("staff_a_1");
              out.println(date1); 
              
              String date2=request.getParameter("staff_a_2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_staff.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("staff_acc1", date1);
                parameters.put("staff_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Issued Student By ID"))
           {
              String date1=request.getParameter("i_student_acc1");
              out.println(date1); 
              
              String date2=request.getParameter("i_student_acc2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_student_issue.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("issue_acc1", date1);
                parameters.put("issue_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Student Return By ID"))
           {
              String date1=request.getParameter("order1");
              out.println(date1); 
              
              String date2=request.getParameter("order2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_student_return.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("return_acc1", date1);
                parameters.put("return_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Staff Issue By ID"))
           {
              String date1=request.getParameter("staff_acc_1");
              out.println(date1); 
              
              String date2=request.getParameter("staff_acc_2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_staff_issue.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("issue_acc1", date1);
                parameters.put("issue_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Staff Return By ID"))
           {
              String date1=request.getParameter("r_staff_acc1");
              out.println(date1); 
              
              String date2=request.getParameter("r_staff_acc2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_staff_return.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("staff_return_acc1", date1);
                parameters.put("staff_return_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Invoice By ID"))
           {
              String date1=request.getParameter("order1");
              out.println(date1); 
              
              String date2=request.getParameter("order2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_invoice.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("order1", date1);
                parameters.put("order2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Lost/Disposal Book By ID"))
           {
              String date1=request.getParameter("order1");
              out.println(date1); 
              
              String date2=request.getParameter("order2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_lost_book.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("ld_b_acc1", date1);
                parameters.put("ld_b_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Lost/Disposal Journal By ID"))
           {
              String date1=request.getParameter("order1");
              out.println(date1); 
              
              String date2=request.getParameter("order2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_lost_journal.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("j_acc1", date1);
                parameters.put("j_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           if(event.equals("View Lost/Disposal Magazine By ID"))
           {
              String date1=request.getParameter("order1");
              out.println(date1); 
              
              String date2=request.getParameter("order2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_lost_magazine.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("m_acc1", date1);
                parameters.put("m_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           if(event.equals("View Department By ID"))
           {
              String date1=request.getParameter("order1");
              out.println(date1); 
              
              String date2=request.getParameter("order2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_department.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("dept_acc1", date1);
                parameters.put("dept_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Binder By ID"))
           {
              String date1=request.getParameter("order1");
              out.println(date1); 
              
              String date2=request.getParameter("order2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_binder.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("binder_acc1", date1);
                parameters.put("binder_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Vendor By ID"))
           {
              String date1=request.getParameter("order1");
              out.println(date1); 
              
              String date2=request.getParameter("order2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\id_to_id\\id_to_id_vendor.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("vendor_acc1", date1);
                parameters.put("vendor_acc2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           // From Date To Date  Reports
           
           if(event.equals("View Book By Date"))
           {
              String date1=request.getParameter("b_date1");
              out.println(date1); 
              
              String date2=request.getParameter("b_date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date__bookr.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("b_date1", date1);
                parameters.put("b_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }           
           
           
           if(event.equals("View Journal By Date"))
           {
              String date1=request.getParameter("j_date1");
              out.println(date1); 
              
              String date2=request.getParameter("j_date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_journal.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("j_date1", date1);
                parameters.put("j_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Magazine By Date"))
           {
              String date1=request.getParameter("m_date1");
              out.println(date1); 
              
              String date2=request.getParameter("m_date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_magazine.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("m_date1", date1);
                parameters.put("m_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           
           if(event.equals("View Invoice By Date"))
           {
              String date1=request.getParameter("i_date1");
              out.println(date1); 
              
              String date2=request.getParameter("i_date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_invoice.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("invoice_date1", date1);
                parameters.put("invoice_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Update Newspaper By Date"))
           {
              String date1=request.getParameter("date1");
              out.println(date1); 
              
              String date2=request.getParameter("date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_update_newspaper.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("u_p_date1", date1);
                parameters.put("u_p_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Student By Date"))
           {
              String date1=request.getParameter("stud_date1");
              out.println(date1); 
              
              String date2=request.getParameter("stud_date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_student.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("stud_date1", date1);
                parameters.put("stud_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Staff By Date"))
           {
              String date1=request.getParameter("staff_date1");
              out.println(date1); 
              
              String date2=request.getParameter("staff_date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_staff.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("staff_date1", date1);
                parameters.put("staff_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           if(event.equals("View Issued Student By Date"))
           {
              String date1=request.getParameter("date1");
              out.println(date1); 
              
              String date2=request.getParameter("date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_student_issue.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("issue_date1", date1);
                parameters.put("issue_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
            if(event.equals("View Student Return By Date"))
           {
              String date1=request.getParameter("date1");
              out.println(date1); 
              
              String date2=request.getParameter("date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_student_return.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("return_date1", date1);
                parameters.put("return_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
             
            if(event.equals("View Staff Issue By Date"))
           {
              String date1=request.getParameter("staff_i_date1");
              out.println(date1); 
              
              String date2=request.getParameter("staff_i_date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_staff_issue.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("issue_date1", date1);
                parameters.put("issue_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }  
                            
            if(event.equals("View Staff Return By ID"))
           {
              String date1=request.getParameter("r_staff_acc1");
              out.println(date1); 
              
              String date2=request.getParameter("r_staff_acc2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_staff_return.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("return_date1", date1);
                parameters.put("return_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }           
           
           if(event.equals("View Invoice By Date"))
           {
              String date1=request.getParameter("n_date1");
              out.println(date1); 
              
              String date2=request.getParameter("n_date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_invoice.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("invoice_date1", date1);
                parameters.put("invoice_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
            if(event.equals("View Lost/Disposal Book By Date"))
           {
              String date1=request.getParameter("date1");
              out.println(date1); 
              
              String date2=request.getParameter("date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_lost_book.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("b_date1", date1);
                parameters.put("b_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Lost/Disposal Journal By Date"))
           {
              String date1=request.getParameter("date1");
              out.println(date1); 
              
              String date2=request.getParameter("date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_lost_journal.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("j_date1", date1);
                parameters.put("j_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Lost/Disposal Magazine By Date"))
           {
              String date1=request.getParameter("date1");
              out.println(date1); 
              
              String date2=request.getParameter("date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_lost_magazine.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("m_date1", date1);
                parameters.put("m_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Department By Date"))
           {
              String date1=request.getParameter("dept_date1");
              out.println(date1); 
              
              String date2=request.getParameter("dept_date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_department.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("dept_date1", date1);
                parameters.put("dept_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
           if(event.equals("View Binder By Date"))
           {
              String date1=request.getParameter("binder_date1");
              out.println(date1); 
              
              String date2=request.getParameter("binder_date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_binder.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("binder_date1", date1);
                parameters.put("binder_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           if(event.equals("View Vendor By Date"))
           {
              String date1=request.getParameter("vendor_date1");
              out.println(date1); 
              
              String date2=request.getParameter("vendor_date2");
              out.println(date2);
         
              Connection cn = null;
              try 
              {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
          
              } 
              catch (Exception ex) 
              {
                ex.printStackTrace();
              }
              
                File reportFile = new File(application.getRealPath("Reports\\date_wise\\date_to_date_vendor.jasper"));//your report_name.jasper file
                HashMap parameters = new HashMap();
                parameters.put("vendor_date1", date1);
                parameters.put("vendor_date2", date2);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close(); 
           }
           
           
        }
    }     
        %>
    </body>
</html>

