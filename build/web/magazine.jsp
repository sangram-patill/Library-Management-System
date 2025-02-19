<%-- 
    Document   : magazine
    Created on : 9 Mar, 2023, 12:25:03 PM
    Author     : sangr
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Admin - Maganize</title> 
        <style><%@include file="css/jspdashboard.css"%></style>
        <link rel="icon" type="image/x-icon" href="image/fevicon.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Lexend+Mega:wght@300&display=swap" rel="stylesheet">
        <script type="text/javascript" src="css/validation.js"></script>
    <style>
        .container .content .cards .card{
    width: 1200px;
    height: 100%;     /*Change Div height here*/
    background: white;
    margin: 20px 20px;
    display: flex;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
    </style>
    </head>
    <body>
        <%
        if(session.getAttribute("username")==null)
        {
            response.sendRedirect("index.jsp");
        }
        %>
         <style><%@include file="dashboard.jsp"%></style> 
        
         <!---Start Editing from Below Code--->
         
         <div class="container">
            <div class="content">                   
                  <div class="cards">
                        <div class="card">
                            <div class="box">                                
                                              <br>
                                <div class="row">
                                    <div class="col-sm-6">
                                         <h4 style="margin: 0% 0% 0% 2%">Magazine Entry</h4>
                                    </div>
                                    <div class="col-sm-6">
                                         <a href="magazine_stock.jsp"><button class="stock">Stock</button></a>
                                    </div>
                                 </div>
                                <form name="magazine" action="magazine" method="post">
                                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                                <br>
                                          <!--First and Second Row-->
                <div class="row">
                   <div class="col-sm-4"><label class="x">Date of Entry</label></div>
                   <div class="col-sm-4"><label class="x">Department</label></div>
                   <div class="col-sm-4"><label class="x">Category</label></div>
                </div>
                <div class="row">
                     <!--Hidden field for journal accessing number-->
            <%
                if(request.getParameter("m_acc_no")!=null)
                {
                %>
                        <input type="hidden" name="magzine_acc_no1" class="y" value="<%=request.getParameter("m_acc_no")%>">
                <%
                }
                else
                       {
                %>
                        <input type="hidden" name="magzine_acc_no1" value="<%=request.getParameter("m_acc_no")%>" class="y">
                <%
                }
            %>
                    <div class="col-sm-4">
                        <%
                            if(request.getParameter("m_date_of_entry")!=null)
                            {
                            %>
                                    <input type="date" name="magzine_date_of_entry" class="y" value="<%=request.getParameter("m_date_of_entry")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="date" name="magzine_date_of_entry" id="dateid" class="y">

                            <%
                            }
                        %>
                    </div>
                   <div class="col-sm-4">
                       <select name="magzine_dept" class="y">
                        <%
                                if(request.getParameter("m_department")!=null)
                                {
                                %>
                                <option value="<%=request.getParameter("m_department")%>"><%=request.getParameter("m_department")%></option>
                                <%
                                }
                                else
                                {
                                %>
                                <option>Select Department</option>

                                <%
                                }
                        %>
                        <%
                            String d_name; String d_id;
                            Connection cn = null; Statement st= null;
                            Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            String sql = "select * from department"; ResultSet rs = st.executeQuery(sql);
                            while(rs.next()){d_name = rs.getString("d_name").toString(); d_id = rs.getString("d_id").toString();
                        %>
                         <option value="<%=d_name%>"><%=d_name%></option>
                        <%
                               }
                        %>
                        </select>
                    </div> 
                    <div class="col-sm-4">
                        <select name="magzine_category" class="y">
                        <%
                            if(request.getParameter("m_category")!=null)
                            {
                            %>
                            <option value="<%=request.getParameter("m_category")%>"><%=request.getParameter("m_category")%></option>

                            <%
                            }
                            else
                            {
                            %>
                            <option>Select Category</option>

                            <%
                            }
                        %>
                         
                         <%
                            String category_name; String category_id;
                            Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            sql = "select * from category where category_type = 'Magazine' ";  rs = st.executeQuery(sql);
                            while(rs.next()){ category_name = rs.getString("category_name"); category_id = rs.getString("category_id").toString();
                         %>
                         <option value="<%=category_name%>"><%=category_name%></option>
                         <%
                                }
                         %>
                       </select> 
                    </div>
                </div><br><br>
                    <!--Third and Fourth Row-->
                <div class="row">
                    <div class="col-sm-4"><label class="x">Language</label></div>
                    <div class="col-sm-4"><label class="x">Title</label></div>
                    <div class="col-sm-4"><label class="x">Sub-title</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <select name="magzine_language" class="y">
                        <%
                        if(request.getParameter("m_language")!=null)
                        {
                        %>
                        <option value="<%=request.getParameter("m_language")%>"><%=request.getParameter("m_language")%></option>

                        <%
                        }
                        else
                               {
                        %>
                        <option>Select Language</option>
                        <%
                        }
                        %>
                         
                        <%
                            String language_name;
                            Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            sql = "select * from language"; rs = st.executeQuery(sql);
                            while(rs.next()){language_name = rs.getString("language_name").toString();
                        %>
                        <option value="<%=language_name%>"><%=language_name%></option>
                        <%
                              }
                        %>
                        </select>
                    
                    </div>
                   <div class="col-sm-4">
                    <%
                            if(request.getParameter("m_title")!=null)
                            {
                            %>
                                <input type="text" name="magzine_title" class="y" value="<%=request.getParameter("m_title")%>">
                            <%
                            }
                            else
                            {
                            %>
                                <input type="text" name="magzine_title" class="y">
                            <%
                            }
                    %>
                </div>
                <div class="col-sm-4">
                    <%
                            if(request.getParameter("m_subtitle")!=null)
                            {
                            %>
                                <input type="text" name="magzine_sub_title" class="y" value="<%=request.getParameter("m_subtitle")%>">
                            <%
                            }
                            else
                            {
                            %>
                                <input type="text" name="magzine_sub_title" class="y">
                            <%
                            }
                    %>
                </div>
                </div>
                    <br><br>
                    <!--fifth and Six Row-->
                <div class="row">
                     <div class="col-sm-4"><label class="x">Subject</label></div>
                     <div class="col-sm-4"><label class="x">No. of Pages</label></div>
                     <div class="col-sm-4"><label class="x">No. Of Copies</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <%
                            if(request.getParameter("m_subject")!=null)
                            {
                            %>
                                    <input type="text" name="magzine_subject" class="y" value="<%=request.getParameter("m_subject")%>">
                            <%
                            }
                            else
                            {
                            %>
                                    <input type="text" name="magzine_subject" id="dateid" class="y">
                            <%
                            }
                        %>
                     </div>
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("m_pages")!=null)
                                {
                                %>
                                <input type="text" name="magzine_pages" maxlength="4" onkeypress="return isNumber(event)" class="y" value="<%=request.getParameter("m_pages")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="magzine_pages" maxlength="4" onkeypress="return isNumber(event)" class="y">
                                <%
                                }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("m_copies")!=null)
                                {
                                %>
                                    <input type="text" name="magzine_no_of_copies" maxlength="3" class="y" onkeypress="return isNumber(event)" value="<%=request.getParameter("m_copies")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="magzine_no_of_copies" maxlength="3" onkeypress="return isNumber(event)" class="y">
                                <%
                                }
                        %>
                    </div>
                    <input type="hidden" name="status" value="Returned">
                </div>
                <br><br><br>
                 
                 <!--Buttons-->
               <div class="row">
                   <div class="col-sm-3"><input type="submit" name="submit" value="Add Maganize" class="addbook" style="margin-left: 50px; width: 180px; margin-bottom: 9%;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Update Maganize" class="addbook" style="margin-left: 50px; width: 180px;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Delete Maganize" class="addbook" style="margin-left: 50px; width: 180px;" ></div>
                   <div class="col-sm-3"><input type="reset" value="Reset Form" class="addbook" style="margin-left: 50px; width: 180px;"></div>
               </div>    
                 </form>
                         </div> 
                        </div>                     
                  </div>
            </div>
        </div> 
                       
                       <script type="text/javascript">
                           
                            /*System Date*/
                            
                              window.onload = function() {
                                    var currentDate = new Date();
                                    var day = currentDate.getDate();
                                    var month = currentDate.getMonth() + 1;
                                    var year = currentDate.getFullYear();

                                    var dateString = year + "-" + month.toString().padStart(2, '0') + "-" + day.toString().padStart(2, '0');
                                    document.getElementById("dateid").value = dateString;
                            };
                            
                         </script>
    </body>
</html>
