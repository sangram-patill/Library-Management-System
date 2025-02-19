
<%-- 
    Document   : invoice
    Created on : 4 May, 2023, 7:34:19 PM
    Author     : sangr
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Admin - Invoice Master</title> 
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
            .container .content .cards .card
            {
                width: 1200px;
                height: 100%;    
                background: white;
                margin: 20px 20px;
                display: flex;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            .tableclass {
                    border-collapse: collapse;              
                    width: 1080px;
                    margin-left: 40px;
                    background-color: white;
                    margin-bottom: 3%;
                  }

                  th, td {
                    border-style: groove;
                    text-align:  center;
                  }

                  th {
                    background-color: #555;
                    color: #fff;
                    text-align: center;
                  }

                  tr:nth-child(even) {
                    background-color: #f2f2f2;
                  }

                  tr:hover {
                    background-color: #ddd;
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
                                <form name="invoice" action="invoice" method="Post">
                                <br>
                                 <div class="row">
                                    <div class="col-sm-6">
                                         <h4 style="margin: 0% 0% 0% 2%">Invoice Details</h4>
                                    </div>                                                                        
                                 </div>
                
                
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%;">
                
                <!--First and Second Row-->
                <div class="row">
                   <div class="col-sm-4"><label class="x">Order No</label></div>                  
                   <div class="col-sm-4"><label class="x">Invoice No</label></div>
                   <div class="col-sm-4"><label class="x">Vendor Company Name</label></div>                   
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <%
                            int order_no = 1;
                            Connection cn = null; Statement st = null;
                            Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            String sql = "select * from invoice"; ResultSet rs = st.executeQuery(sql);
                            while(rs.next()){order_no = Integer.parseInt(rs.getString("order_no").toString()) + 1;}
                        %>
                         <%
                            if(request.getParameter("order_no")!=null)
                            {
                            %>
                                    <input type="text" name="order_no" class="y" onkeypress="return isNumber(event)" value="<%=request.getParameter("order_no")%>">
                            <%
                            }
                            else
                            {
                            %>
                            <input type="text" name="order_no" value="<%=order_no%>" onkeypress="return isNumber(event)" class="y">
                            <%
                            }
                        %>
                    </div>                 
                    <div class="col-sm-4">
                        <%
                            if(request.getParameter("invoice_no")!=null)
                            {
                            %>
                                    <input type="text" name="invoice_no" class="y" value="<%=request.getParameter("invoice_no")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="text" name="invoice_no" class="y">
                            <%
                            }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <select name="vendor_name" class="y">
                        <%
                            if(request.getParameter("vendor_name")!=null)
                            {
                            %>
                            <option value="<%=request.getParameter("vendor_name")%>"><%=request.getParameter("vendor_name")%></option>

                            <%
                            }
                            else
                            {
                            %>
                            <option>Select Company</option>

                            <%
                            }
                        %>
                         
                         <%
                            cn = null;  st = null;
                            String v_company;
                            Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            sql = "select * from vendor";  rs = st.executeQuery(sql);
                            while(rs.next()){v_company = rs.getString("v_company").toString();
                        %>
                         <option value="<%=v_company%>"><%=v_company%></option>
                         <%
                                }
                         %>
                       </select> 
                    </div>
                </div><br><br>
                    <!--Third and Fourth Row-->
                <div class="row">
                   <div class="col-sm-4"><label class="x">Invoice Date</label></div>
                   <div class="col-sm-4"><label class="x">Order Date</label></div>
                   <div class="col-sm-4"><label class="x">Amount</label></div>
                </div>                   
                <div class="row">
                   <div class="col-sm-4">
                       <%
                            if(request.getParameter("invoice_date")!=null)
                            {
                            %>
                                    <input type="date" name="invoice_date" class="y" value="<%=request.getParameter("invoice_date")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="date" name="invoice_date" class="y" id="dateid">
                            <%
                            }
                        %>
                   </div>
                   <div class="col-sm-4">
                       <%
                            if(request.getParameter("order_date")!=null)
                            {
                            %>
                                    <input type="date" name="order_date" class="y" value="<%=request.getParameter("order_date")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="date" name="order_date" class="y" id="dateid">
                            <%
                            }
                        %>
                   </div> 
                   <div class="col-sm-4">
                       <%
                            if(request.getParameter("amount")!=null)
                            {
                            %>
                                    <input type="text" name="amount" onkeypress="return isFloat(event)" class="y" value="<%=request.getParameter("amount")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="text" name="amount" onkeypress="return isFloat(event)" class="y">
                            <%
                            }
                        %>
                   </div>
                </div><br><br>
                    <!--Seven and Eight Row-->
                <div class="row">
                    <div class="col-sm-4"><label class="x">Discount %</label></div> 
                    <div class="col-sm-4"><label class="x">Mode Of Payment</label></div>
                    <div class="col-sm-4"><label class="x">Date Of Payment</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <%
                            if(request.getParameter("discount")!=null)
                            {
                            %>
                                    <input type="text" name="discount" class="y" value="<%=request.getParameter("discount")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="text" name="discount" class="y">
                            <%
                            }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <select name="payment_mode" class="y">
                        <%
                            if(request.getParameter("payment_mode")!=null)
                            {
                            %>
                            <option value="<%=request.getParameter("payment_mode")%>"><%=request.getParameter("payment_mode")%></option>
                            <%
                            }
                            else
                            {
                            %>
                            <option>Select Mode</option>
                            <option value="Cash">Cash</option>
                            <option value="Net Banking">Net Banking</option>
                            <option value="NEFT">NEFT</option>
                            <option value="RTGS">RTGS</option>
                            <%
                            }
                        %>
                         
                       </select>                         
                    </div>                    
                   <div class="col-sm-4">
                       <%
                            if(request.getParameter("payment_date")!=null)
                            {
                            %>
                                    <input type="date" name="payment_date" class="y" value="<%=request.getParameter("payment_date")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="date" name="payment_date" class="y" id="dateid2">
                            <%
                            }
                        %>
                   </div> 
                </div><br><br>                 
                 
                 <!--Buttons-->
               <div class="row">
                   <div class="col-sm-3"><input type="submit" name="submit" value="Add Invoice" class="addbook" style="margin-left: 50px; width: 180px;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Update Invoice" class="addbook" style="margin-left: 50px; width: 180px;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Delete Invoice" class="addbook" style="margin-left: 50px; width: 180px;"></div>
                   <div class="col-sm-3"><input type="reset" value="Reset Form" class="addbook" style="margin-left: 50px; width: 180px;"></div>
               </div><br><br>    
                                </form>
            <!--Searching Method-->
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                <h4 style="margin: 0% 0% 0% 2%">All Invoices</h4>
                <br><br>
                <div class="row">
                      <input id="search" type="text" placeholder="Search Invoice..." style="margin-left: 2.5%;">
                </div>
                <br>
                <table class="tableclass">
                        <thead>
			<tr>
                                <th class="textcenter">Order No.</th>
                                <th class="textcenter">Invoice No.</th>
                                <th class="textcenter">Vendor Name</th>
                                <th class="textcenter">Invoice Date</th>
                                <th class="textcenter">Order Date</th>
                                <th class="textcenter">Amount</th>
                                <th class="textcenter">Discount %</th> 
                                <th class="textcenter">Mode Of Payment</th>
                                <th class="textcenter">Date Of Payment</th>
                                <th class="textcenter">Action</th>
			</tr>
		</thead>
		<tbody>
		<% 
            try {
                 Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                  sql = "select * from invoice";  rs = st.executeQuery(sql);

                while (rs.next()) {
                    %>
                    <form action="invoice.jsp" method="post">
                        <tr>
                            <td><%=rs.getInt("order_no")%></td>
                <input type="hidden" name="order_no" value="<%=rs.getInt("order_no")%>">
                            <td><%=rs.getString("invoice_no")%></td>
                <input type="hidden" name="invoice_no" value="<%=rs.getString("invoice_no")%>">
                            <td><%=rs.getString("vendor_name")%></td>
                <input type="hidden" name="vendor_name" value="<%=rs.getString("vendor_name")%>">
                            <td><%=rs.getString("invoice_date")%></td>
                <input type="hidden" name="invoice_date" value="<%=rs.getString("invoice_date")%>">
                            <td><%=rs.getString("order_date")%></td>
                <input type="hidden" name="order_date" value="<%=rs.getString("order_date")%>">
                            <td><%=rs.getString("amount")%></td>
                <input type="hidden" name="amount" value="<%=rs.getString("amount")%>">
                            <td><%=rs.getString("discount")%></td>
                <input type="hidden" name="discount" value="<%=rs.getString("discount")%>">
                            <td><%=rs.getString("payment_mode")%></td>
                <input type="hidden" name="payment_mode" value="<%=rs.getString("payment_mode")%>">
                            <td><%=rs.getString("payment_date")%></td>
                <input type="hidden" name="payment_date" value="<%=rs.getString("payment_date")%>">
                            <td><input type="submit" value="Action" class="stock"></td>
                        </tr>
                        </form>
                    <%
                }
            } 
            catch (Exception ex) 
            {
                out.println(ex.toString());
            } 
        %>
		</tbody>
            </table>
                <!--Data not found-->
                <div id="message" style="display: none; text-align: center; margin-bottom: 2%; font-size: 16px;">No match found &#128546;</div>
                
               </div>
                            </div>                           
                        </div>                     
                  </div>
            </div>
                <script type="text/javascript">
                    
                /*Seraching Data*/
                    
		var searchInput = document.getElementById("search");
		var tableRows = document.getElementsByTagName("tr");
                var messageDiv = document.getElementById("message");

		searchInput.addEventListener("keyup", function() {
			var searchString = this.value.toLowerCase();
                        var matchFound = false;
			for (var i = 1; i < tableRows.length; i++) {
				var rowData = tableRows[i].textContent.toLowerCase();
				if (rowData.includes(searchString)) {
					tableRows[i].style.display = "";
                                        matchFound = true;
				} else {
					tableRows[i].style.display = "none";
                                        tableRows[i].style.backgroundColor = "";
				}
			}
                        if (matchFound) {
				messageDiv.style.display = "none";
			} else {
				messageDiv.style.display = "";
			}
		});
                
                /*System Date*/
                            
                            window.onload = function() {
                                var currentDate = new Date();
                                var day = currentDate.getDate();
                                var month = currentDate.getMonth() + 1;
                                var year = currentDate.getFullYear();

                                var dateString = year + "-" + month.toString().padStart(2, '0') + "-" + day.toString().padStart(2, '0');
                                document.getElementById("dateid").value = dateString;
                                document.getElementById("dateid1").value = dateString;
                                document.getElementById("dateid2").value = dateString;
                            };    
                
	</script>
    </body>
</html>
