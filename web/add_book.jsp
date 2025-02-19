    <%-- 
    Document   : index
    Created on : 27 Feb, 2023, 3:36:15 PM
    Author     : sangr
--%>
 
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Admin - Book</title> 
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
            .p{
                margin-left: 50px;
                width: 250px;
                height: 28px;
                border-radius: 5px;
                border: 1px solid #ccc;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.1);
            }
            .add{
                color: black;
                background: #4FBDBA;
                width: 30px;
                height: 30px;
                color: white;
                border-radius: 5px;
                border: 1px solid #ccc;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
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
                                         <h4 style="margin: 0% 0% 0% 2%">Book Entry</h4>
                                    </div>
                                    <div class="col-sm-6">
                                         <a href="book_stock.jsp"><button class="stock">Stock</button></a>
                                    </div>
                                 </div>
                                <form action="add_book" name="add_book" method="post">
                                
                               <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%;">

                                
                                     <!--First and Second Row-->
               
                <div class="row">
                    <div class="col-sm-4"><label class="x">Date of Entry</label></div>
                    <div class="col-sm-4"><label class="x">Department</label></div>
                    <div class="col-sm-4"><label class="x">Category</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <%
                            if(request.getParameter("b_date_of_entry")!=null)
                            {
                            %>
                                    <input type="date" name="date" class="y" value="<%=request.getParameter("b_date_of_entry")%>">
                            <%
                            }
                            else
                            {
                            %>
                                    <input type="date" name="date" id="dateid" class="y">
                            <%
                            }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <select name="department" class="y">
                        <%
                                if(request.getParameter("b_department")!=null)
                                {
                                %>
                                <option value="<%=request.getParameter("b_department")%>"><%=request.getParameter("b_department")%></option>
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
                                String d_name;
                                Connection cn = null;  Statement st=null;
                                Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                                String sql = "select * from department"; ResultSet rs = st.executeQuery(sql);
                                while(rs.next()) {d_name = rs.getString("d_name").toString();                                     
                        %>
                         <option value="<%=d_name%>"><%=d_name%></option>
                        <%
                               }
                        %>
                        </select>
                    </div>
                        <div class="col-sm-4">
                            <select name="category" class="y">
                            <%
                            if(request.getParameter("b_category")!=null)
                            {
                            %>
                            <option value="<%=request.getParameter("b_category")%>"><%=request.getParameter("b_category")%></option>
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
                               String category_name;
                               Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                               sql = "select * from category where category_type = 'Book' "; rs = st.executeQuery(sql);
                               while(rs.next()) {category_name = rs.getString("category_name").toString();
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
                   <div class="col-sm-4"><label class="x">No.Of Copies</label></div>
                   <div class="col-sm-4"><label class="x">Classification No.</label></div>
                    <div class="col-sm-4"><label class="x">Title</label></div>
                </div>
                <div class="row">
                    <!--Hidden field for accessing number-->
                    <%
                                if(request.getParameter("b_acc_no")!=null)
                                {
                                %>
                                    <input type="hidden" name="acc_no" class="y" value="<%=request.getParameter("b_acc_no")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="hidden" name="acc_no" value="<%=request.getParameter("b_acc_no")%>" class="y">
                                <%
                                }
                     %>
                    
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("b_copies")!=null)
                                {
                                %>
                                    <input type="text" name="copies" maxlength="3" class="y" onkeypress="return isNumber(event)" value="<%=request.getParameter("b_copies")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="copies" maxlength="3" onkeypress="return isNumber(event)" class="y">
                                <%
                                }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("b_classificationcode")!=null)
                                {
                                %>
                                    <input type="text" name="classification_no" onkeypress="return isAlphanumric(event)" class="y" value="<%=request.getParameter("b_classificationcode")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="classification_no" onkeypress="return isAlphanumric(event)" class="y">
                                <%
                                }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("b_title")!=null)
                                {
                                %>
                                    <input type="text" name="title" class="y" value="<%=request.getParameter("b_title")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="title" class="y">
                                <%
                                }
                        %>
                    </div>
                </div><br><br>
                
                    <!--fifth and Six Row-->
                 <div class="row">
                  
                   <div class="col-sm-4"><label class="x">Sub-title</label></div>
                   <div class="col-sm-4"><label class="x">Subject</label></div>
                   <div class="col-sm-4"><label class="x">Author 1</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("b_subtitle")!=null)
                                {
                                %>
                                    <input type="text" name="sub_title" class="y" value="<%=request.getParameter("b_subtitle")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="sub_title" class="y">
                                <%
                                }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("b_subject")!=null)
                                {
                                %>
                                    <input type="text" name="subject" class="y" value="<%=request.getParameter("b_subject")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="subject" class="y">
                                <%
                                }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("author_1")!=null)
                                {
                                %>
                                    <input type="text" name="author_1" onkeypress="return isString(event)" class="y" value="<%=request.getParameter("author_1")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="author_1" onkeypress="return isString(event)" class="y">
                                <%
                                }
                        %>
                    </div>
                </div><br><br>
                
                    <!--Seven and Eight Row-->
                
                <div class="row">
                    <div class="col-sm-4"><label class="x">Author 2</label></div>
                    <div class="col-sm-4"><label class="x">Author 3</label></div>
                    <div class="col-sm-4"><label class="x">Author 4</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("author_2")!=null)
                                {
                                %>
                                    <input type="text" name="author_2" onkeypress="return isString(event)" class="y" value="<%=request.getParameter("author_2")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="author_2" onkeypress="return isString(event)" value="-" style="text-align: center;" class="y">
                                <%
                                }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("author_3")!=null)
                                {
                                %>
                                    <input type="text" name="author_3" class="y" onkeypress="return isString(event)" value="<%=request.getParameter("author_3")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="author_3" value="-" onkeypress="return isString(event)" style="text-align: center;" class="y">
                                <%
                                }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("author_4")!=null)
                                {
                                %>
                                    <input type="text" name="author_4" class="y" onkeypress="return isString(event)" value="<%=request.getParameter("author_4")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="author_4" value="-" onkeypress="return isString(event)" style="text-align: center;" class="y">
                                <%
                                }
                        %>
                    </div>
                </div><br><br>
                    
                <!--Nine and Ten Row-->
                
                    <div class="row">
                        <div class="col-sm-4"><label class="x">Edition</label></div>
                        <div class="col-sm-4"><label class="x">Publishing Year</label></div>    
                        <div class="col-sm-4"><label class="x">Publisher Name</label></div>
                    </div>  
                    <div class="row">
                        <div class="col-sm-4">
                        <%
                                if(request.getParameter("b_edition")!=null)
                                {
                                %>
                                    <input type="text" name="edition" class="y" value="<%=request.getParameter("b_edition")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="edition" class="y">
                                <%
                                }
                        %>
                        </div>
                            <div class="col-sm-4">
                            <%
                                if(request.getParameter("b_publishingyear")!=null)
                                {
                                %>
                                    <input type="text" name="publishing_year" maxlength="4" onkeypress="return isNumber(event)" class="y" value="<%=request.getParameter("b_publishingyear")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="publishing_year" maxlength="4" onkeypress="return isNumber(event)" class="y">
                                <%
                                }
                         %>
                        </div>
                        <div class="col-sm-4">
                            <select class="y" name="publisher_name">
                        <%
                            if(request.getParameter("b_publishername")!=null)
                            {
                            %>
                            <option value="<%=request.getParameter("b_publishername")%>"><%=request.getParameter("b_publishername")%></option>

                            <%
                            }
                            else
                            {
                            %>
                            <option>Select Publisher</option>

                            <%
                            }
                        %>
                         
                        <%
                            String publisher_name;
                            Class.forName("com.mysql.jdbc.Driver"); cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            sql = "select * from publisher"; rs = st.executeQuery(sql);
                            while(rs.next()){publisher_name = rs.getString("publisher_name").toString();
                        %> 
                         <option  value="<%=publisher_name%>"><%=publisher_name%></option>
                         <%
                                }
                         %>
                       </select>
                    </div>
                    </div><br><br>
                    
                    <!--Eleven and Twelve Row-->
                    
                <div class="row">
                    <div class="col-sm-4"><label class="x">Vendor Name</label></div>
                    <div class="col-sm-4"><label class="x">Language</label></div>
                    <div class="col-sm-4"><label class="x">Book Pages</label></div>
                </div>  
                <div class="row">
                   
                    <div class="col-sm-4">
                      <select name="vendor_name" class="y">
                        <%
                            if(request.getParameter("b_vendorname")!=null)
                            {
                            %>
                            <option value="<%=request.getParameter("b_vendorname")%>"><%=request.getParameter("b_vendorname")%></option>

                            <%
                            }
                            else
                            {
                            %>
                            <option>Select Vendor</option>

                            <%
                            }
                        %>
                         
                        <%
                            String v_company;
                            Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            sql = "select * from vendor"; rs = st.executeQuery(sql);
                            while(rs.next()){v_company = rs.getString("v_company").toString();
                        %>
                         <option name="vendor_name" value="<%=v_company%>"><%=v_company%></option>
                         <%
                                }
                         %>
                       </select>  
                    </div>
                     <div class="col-sm-4">
                         <select name="language" class="y">
                        <%
                            if(request.getParameter("b_language")!=null)
                            {
                            %>
                            <option value="<%=request.getParameter("b_language")%>"><%=request.getParameter("b_language")%></option>

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
                                if(request.getParameter("b_pages")!=null)
                                {
                                %>
                                    <input type="text" name="book_pages" maxlength="4" onkeypress="return isNumber(event)" class="y" value="<%=request.getParameter("b_pages")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="book_pages" maxlength="4" onkeypress="return isNumber(event)" class="y">
                                <%
                                }
                        %>
                   </div>
                </div><br><br>
                
                <!--15 and 16 row-->
                
                <div class="row">
                    <div class="col-sm-4"><label class="x">Actual Book Price</label></div>
                    <div class="col-sm-4"><label class="x">Discount</label></div>
                    <div class="col-sm-4"><label class="x">Book Price</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("b_price")!=null)
                                {
                                %>
                                    <input type="text" name="price" maxlength="5" onkeypress="return isFloat(event)" class="y" value="<%=request.getParameter("b_price")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="price" maxlength="5" onkeypress="return isFloat(event)" class="y">
                                <%
                                }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("b_price")!=null)
                                {
                                %>
                                    <input type="text" name="price" maxlength="5" onkeypress="return isFloat(event)" class="y" value="<%=request.getParameter("b_price")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="price" maxlength="5" onkeypress="return isFloat(event)" class="y">
                                <%
                                }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("b_price")!=null)
                                {
                                %>
                                    <input type="text" name="price" maxlength="5" onkeypress="return isFloat(event)" class="y" value="<%=request.getParameter("b_price")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="price" maxlength="5" onkeypress="return isFloat(event)" class="y">
                                <%
                                }
                        %>
                    </div>
                    <input type="hidden" value="Returned" name="b_status">
                </div><br><br>
                <div class="row">
                    <div class="col-sm-4"><label class="x">Rack No.</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                         <%
                                if(request.getParameter("b_rackno")!=null)
                                {
                                %>
                                    <input type="text" name="rack_no" class="y" value="<%=request.getParameter("b_rackno")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" name="rack_no" class="y">
                                <%
                                }
                        %>
                    </div>
                </div>
                <br><br><br>
                
                 <!--Buttons-->
               <div class="row">
                   <div class="col-sm-3"><input type="submit" name="submit" value="Add Book" class="addbook" style="margin-left: 50px; margin-bottom: 9%;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Update Book" class="addbook" style="margin-left: 50px;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Delete Book" class="addbook" style="margin-left: 50px;"></div>
                   <div class="col-sm-3"><input type="reset" value="Reset Form" class="addbook" style="margin-left: 50px;"></div>
               </div><br>
                
                                    </form>
                            </div>                           
                        </div>                     
                  </div>
            </div>
                  
         </div>

                        
                        <script type="text/javascript">
//                            
//                            /*Generating Accessing Number*/
//                            
//                            function generateaccesingno()
//                            {
//                                var department1 = document.getElementById("department").value;
//                                var category1 = document.getElementById("category").value;
//                                
//                                document.getElementById("accessing_no").value = department1+category1;
//                                document.getElementById("accessing_no1").value = department1+category1;
//                                
//                            }
                            
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
