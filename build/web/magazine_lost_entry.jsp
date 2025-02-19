
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
        <title>YCM Admin - Lost/Disposal Magazine </title> 
        <style><%@include file="css/jspdashboard.css"%></style>
        <link rel="icon" type="image/x-icon" href="image/fevicon.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Lexend+Mega:wght@300&display=swap" rel="stylesheet">
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
       
                <!--Container And Search Bar Starts Here-->
        <div class="container">
         <!---Start Editing from Below Code--->
            <div class="content">                   
                  <div class="cards">
                        <div class="card">
                            <div class="box">  
                                <br>
                                 <div class="row">
                                    <div class="col-sm-6">
                                         <h4 style="margin: 0% 0% 0% 2%">Lost/Disposal Magazine Entry</h4>
                                    </div>  
                                     <div class="col-sm-6">
                                        <form action="magazine_lost_entry.jsp" method="post">
                                                 <input type="text" class="y" placeholder="Enter Accessing No." name="txt_sid">
                                                 <input type="submit" name="btn"  class="btn" value="Search">
                                        </form>
                                    </div>
                                
                                <%
                                    
                                    Connection cn=null;
                                    Statement st=null;
                                    String acc_no="";
                                    String title="";
                                    String category="";
                            try
                            {
                            Class.forName("com.mysql.jdbc.Driver"); 
                            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            String sql = "select * from magzine where m_acc_no = '"+request.getParameter("txt_sid")+"' "; 
                            ResultSet rs = st.executeQuery(sql);
                            while(rs.next())
                            {
                                acc_no=rs.getString("m_acc_no");
                                title=rs.getString("m_title");
                                category=rs.getString("m_category");
                            }
                            }
                            catch(Exception ex)
                            {
                                out.println(ex.toString());
                            }
    

                        %>
                                 </div>
                    <form name="magazine_lost_entry" action="lost_entry" method="Post">

                
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%;">
                
                <!--First and Second Row-->
                <div class="row">
                    <div class="col-sm-4"><label class="x" for="magazine-title">Accessing No.</label></div>                  
                    <div class="col-sm-4"><label class="x" for="magazine-title">Magazine Title</label></div>
                    <div class="col-sm-4"><label class="x" for="borrower-name">Category</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4"><input class="y" type="text1" id="accessing-no" name="accessing_no" value="<%=acc_no%>" required></div>                 
                    <div class="col-sm-4"><input class="y" type="text1" id="magazine-title" name="magazine_title" value="<%=title%>" required></div>
                    <div class="col-sm-4"><input class="y" type="text1" id="category" name="category" value="<%=category%>" required></div>
                </div><br><br>
                    <!--Third and Fourth Row-->
                <div class="row">
                   <div class="col-sm-4"><label class="x" for="issue-date"> Date</label></div>  
                   <div class="col-sm-4"><label class="x" for="issue-date"> Lost_Disposal</label>></div>                 
                   <div class="col-sm-4"><label class="x" for="issue-date">Reasons for Lost/Disposal</label></div>                                    
                </div>                   
                <div class="row">
                  <div class="col-sm-4"><input class="y" type="date" id="dateid" name="date" required></div>
                   <div class="col-sm-4">
                    <select class="y" name="lost_disposal">
                        <option value="Lost">Lost</option>
                        <option value="Disposal">Disposal</option>
                        <option value="Missing">Missing</option>
                        <option value="Out Of Syllabus">Out Of Syllabus</option>
                    </select>
                    </div>
                   <div class="col-sm-4"><input class="y" type="text1" id="lost" name="reason" required></div>                  
                   <input type="hidden" value="lost" name="status">
                </div><br><br>

                                  
                <div class="row">
                  <input type="submit" value="Submit Magazine" name="submit" class="addbook" style="margin-bottom: 3%;width: 180px;">
                </div>
                    <!--Seven and Eight Row-->                              
                            </form>
                 
                   
               
            <!--Searching Method-->
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                <h4 style="margin: 0% 0% 0% 2%">Lost/Disposal Magazine List</h4>
                <br><br>
                <div class="row">
                      <input id="search" type="text" placeholder="Search Lost Magazine..." style="margin-left: 2.5%;">
                </div>
                <br>
                <table class="tableclass">                                            
                                            <thead>
                                              <tr>
                                                <th class="textcenter">Accessing No.</th>
                                                <th class="textcenter">Magazine Title</th>
                                                <th class="textcenter">Category</th>
                                                <th class="textcenter">Date</th>
                                                <th class="textcenter">Lost/Disposal</th>
                                                <th class="textcenter">Reason</th>
                                                <th class="textcenter">Action</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                <% 
                    try {
                         cn = null;  st=null;
                         Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                        String sql = "select * from lost_magazine"; ResultSet rs = st.executeQuery(sql);

                            while (rs.next()) {
                                %>
                                <form action="magazine_lost_entry.jsp" method="post">
                                    <tr>
                                        <td><%=rs.getString("accessing_no")%></td>
                                        <td><%=rs.getString("magazine_title")%></td>
                                        <td><%=rs.getString("category")%></td>
                                        <td><%=rs.getString("date")%></td>
                                        <td><%=rs.getString("lost_disposal")%></td>
                                        <td><%=rs.getString("reason")%></td>
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
                            };    
                
	</script>
    </body>
</html>
