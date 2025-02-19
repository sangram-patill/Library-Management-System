<%-- 
    Document   : newspaper
    Created on : 6 Mar, 2023, 12:25:17 PM
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
        <title>YCM Admin - Newspaper</title> 
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
                                         <h4 style="margin: 0% 0% 0% 2%">Newspaper Entry</h4>
                                    </div>
                                    <div class="col-sm-6">
                                         <a href="total_newspaper.jsp"><button class="stock">Total Newspaper</button></a>
                                    </div>
                                 </div>
                               <form name="newspaper" action="newspaper" method="post">
                                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                                <!--First and Second Row-->
                <div class="row">
                   <div class="col-sm-4"><label class="x">Newspaper No.</label></div>
                   <div class="col-sm-4"><label class="x">Newspaper Name</label></div>
                   <div class="col-sm-4"><label class="x">No.of Copies</label></div>
                </div>
                                
                <div class="row">
                    <%
                            int news_id = 1;
                            Connection cn = null; Statement st = null;
                            Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            String sql = "select * from newspaper"; ResultSet rs = st.executeQuery(sql);
                            while(rs.next()){news_id = Integer.parseInt(rs.getString("news_id").toString()) + 1;}
                    %>
                   <div class="col-sm-4">
                        <%
                                if(request.getParameter("news_id")!=null)
                                {
                                %>
                                    <input type="text" name="news_no" class="y" onkeypress="return isNumber(event)" value="<%=request.getParameter("news_id")%>">
                                <%
                                }
                                else
                                {
                                %>
                                <input type="text" name="news_no" class="y" onkeypress="return isNumber(event)" value="<%=news_id%>">
                                <%
                                }
                        %>
                   </div>
                   <div class="col-sm-4">
                       <%
                                if(request.getParameter("news_name")!=null)
                                {
                                %>
                                    <input type="text" name="news_name" class="y" onkeypress="return isString(event)" value="<%=request.getParameter("news_name")%>">
                                <%
                                }
                                else
                                {
                                %>
                                <input type="text" name="news_name" onkeypress="return isString(event)" class="y">
                                <%
                                }
                        %>
                   </div>
                   <div class="col-sm-4">
                       <%
                                if(request.getParameter("no_of_copies")!=null)
                                {
                                %>
                                <input type="text" name="news_no_of_copies" maxlength="2" onkeypress="return isNumber(event)" class="y" value="<%=request.getParameter("no_of_copies")%>">
                                <%
                                }
                                else
                                {
                                %>
                                <input type="text" name="news_no_of_copies" maxlength="2" onkeypress="return isNumber(event)" class="y">
                                <%
                                }
                        %>
                   </div>
                  </div><br><br>
                    <!--Third and Fourth Row-->
                <div class="row">
                   <div class="col-sm-4"><label class="x">Language</label></div>
                   <div class="col-sm-4"><label class="x">Frequency</label></div>
                   <div class="col-sm-4"><label class="x">Vendor Name</label></div>
                </div>
                <div class="row">
                   <div class="col-sm-4">
                       <select name="news_language" class="y">
                        <%
                                if(request.getParameter("news_language")!=null)
                                {
                                %>
                                <option value="<%=request.getParameter("news_language")%>"><%=request.getParameter("news_language")%></option>
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
                       <select name="news_frequency" class="y" id="mySelect">
                         <option>Select Frequency</option>
                         <option name="news_frequency" value="Daily">Daily</option>
                         <option name="news_frequency" value="Weekly">Weekly</option>
                       </select>  
                   </div>                 
                    <div class="col-sm-4">
                        <select name="news_vendor" class="y">
                        <%
                                if(request.getParameter("news_vendor")!=null)
                                {
                                %>
                                <option value="<%=request.getParameter("news_vendor")%>"><%=request.getParameter("news_vendor")%></option>
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
                            String v_id; String v_company;
                            Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            sql = "select * from vendor"; rs = st.executeQuery(sql);
                            while(rs.next()){v_id = rs.getString("v_id").toString(); v_company = rs.getString("v_company").toString();
                        %>
                          <option name="news_vendor" value="<%=v_company%>"><%=v_company%></option>
                        <%
                               }
                        %>
                        </select>
                    </div><br><br><br>
                </div>  
            <div id="div1" style="display: none; color: red; text-align: center;">Please Select Frequency</div>
            <div id="div2" style="display: none;">
                <div><label class="x">Day wise fill the price of newspaper</label></div><br>
            <div class="row">
                <div class="col-sm-4"><label class="x">Monday</label></div>
                <div class="col-sm-4"><label class="x">Tuesday</label></div>
                <div class="col-sm-4"><label class="x">Wednesday</label></div>
            </div>
            <div class="row">
                <div class="col-sm-4"><input type="text" name="news_price1" maxlength="2" onkeypress="return isNumber(event)" class="y"></div>
                <div class="col-sm-4"><input type="text" name="news_price2" maxlength="2" onkeypress="return isNumber(event)" class="y"></div>
                <div class="col-sm-4"><input type="text" name="news_price3" maxlength="2" onkeypress="return isNumber(event)" class="y"></div>
            </div><br>
            <div class="row">
                <div class="col-sm-4"><label class="x">Thursday</label></div>
                <div class="col-sm-4"><label class="x">Friday</label></div>
                <div class="col-sm-4"><label class="x">Saturday</label></div>
            </div>
            <div class="row">
                <div class="col-sm-4"><input type="text" name="news_price4" maxlength="2" onkeypress="return isNumber(event)" class="y"></div>
                <div class="col-sm-4"><input type="text" name="news_price5" maxlength="2" onkeypress="return isNumber(event)" class="y"></div>
                <div class="col-sm-4"><input type="text" name="news_price6" maxlength="2" onkeypress="return isNumber(event)" class="y"></div>
            </div><br>
            <div class="row">
                <div class="col-sm-4"><label class="x">Sunday</label></div>
            </div>
            <div class="row">
                <div class="col-sm-4"><input type="text" name="news_price7" maxlength="2" onkeypress="return isNumber(event)" class="y"></div>
            </div>
            </div>
            <div id="div3" style="display: none;">
            <div class="row">
                   <div class="col-sm-4"><label class="x">Price</label></div>
            </div>
            <div class="row">
                   <div class="col-sm-4"><input type="text" name="news_price" maxlength="2" onkeypress="return isNumber(event)" class="y"></div>                 
            </div>
            </div><br><br>
                    <!--Seven and Eight Row-->
                    
                <!--Buttons-->
               <div class="row">
                   <div class="col-sm-3"><input type="submit" name="submit" value="Add Newspaper" class="addbook" style="margin-left: 50px; width: 200px;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Update Newspaper" class="addbook" style="margin-left: 50px; width: 200px;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Delete Newspaper" class="addbook" style="margin-left: 50px; width: 200px;"></div>
                   <div class="col-sm-3"><input type="reset" value="Reset Form" class="addbook" style="margin-left: 50px; width: 200px;"></div>
                </div><br><br><br>
                        </form>

                         </div>                           
                        </div>                     
                  </div>
            </div>
        </div>
                        
                        <script type="text/javascript">
                            
                    document.getElementById("mySelect").onchange = function() {
                    var selectedOption = this.selectedIndex;
                    if (selectedOption === 0) {
                      document.getElementById("div1").style.display = "block";
                      document.getElementById("div2").style.display = "none";
                      document.getElementById("div3").style.display = "none";
                    } else if (selectedOption === 1) {
                      document.getElementById("div1").style.display = "none";
                      document.getElementById("div2").style.display = "block";
                      document.getElementById("div3").style.display = "none";
                    } else if (selectedOption === 2) {
                      document.getElementById("div1").style.display = "none";
                      document.getElementById("div2").style.display = "none";
                      document.getElementById("div3").style.display = "block";
                    }
                  };
                        
                        </script>
                        
    </body>
</html>

