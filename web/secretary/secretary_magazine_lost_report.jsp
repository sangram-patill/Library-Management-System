<%-- 
    Document   : magazine_lost_disposal_report
    Created on : 16 May, 2023, 6:30:15 PM
    Author     : Aditya
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Secretary - Magazine Report </title> 
        <style><%@include file="css/jspdashboard.css"%></style>
        <link rel="icon" type="image/x-icon" href="image/fevicon.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script type="text/javascript" src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Lexend+Mega:wght@300&display=swap" rel="stylesheet">
   
        <style>
            .container .content .cards .card
            {
                width: 1200px;
                height: 100%;    
                background: white;
                margin: 20px 20px;
                padding-top: 10px;
                display: flex;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            .in{
                color: black;
                background: #4FBDBA;
                width: auto;
                height: 30px;
                margin-left: 50px;
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
        <style><%@include file="secretary_dashboard.jsp"%></style>

          <!---Start Editing from Below Code--->
        <div class="container">
            <div class="content">                   
                <div class="cards">
                    <div class="card">
                        <br>
                        <form name="secretary_magazine_lost_report" action="../view_report.jsp" method="post">
                            
                                 <div class="row">
                                    <div class="col-sm-6">
                                         <h4 style="margin: 0% 0% 0% 2%">Lost/disposal Magazine Reports</h4>
                                    </div>             
                                     <div class="col-sm-6">
                                         <input class="stock" type="submit" name="submit" value="Total Lost/Disposal Magazines">
                                    </div>
                                 </div>
                
                
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%;">
                
                                              
                            <div class="row">
                                    <div class="col-sm-4"><label for="issue-date" class="x">Enter Lost/Disposal Magazine No.</label></div>
                            </div><br>                
                    <div class="row">
                        <div class="col-sm-4"><input id="search" type="text" name="id" class="y"></div>
                       <div class="col-sm-4"><input class="in" type="submit" name="submit" value="View Lost/Disposal Magazine"></div>
                       
                    </div> <br>   
                  <hr style="background-color: grey;width: 1120px;height:1px;border-width:0;margin-left: 1%;">
               
                  
                  <div class="row">
                       <div class="col-sm-4"><label for="issue-date" class="x">From ID No.</label></div>
                       <div class="col-sm-4"><label for="issue-date" class="x">To ID No.</label></div>
                </div>             
                             <br>    
                <div class="row">
                   <div class="col-sm-4"><input type="text" name="order1" class="y"></div>
                   <div class="col-sm-4"><input type="text" name="order2" class="y"></div>
                   <input class="in" type="submit" name="submit" value="View Lost/Disposal Magazine By ID">
                </div><br>
                  <hr style="background-color: grey;width: 1120px;height:1px;border-width:0;margin-left: 1%;">

                <div class="row">
                       <div class="col-sm-4"><label for="issue-date" class="x">From Date</label></div>
                       <div class="col-sm-4"><label for="issue-date" class="x">To Date</label></div>
                </div>             
                             <br>    
                <div class="row">
                   <div class="col-sm-4"><input type="text" name="date1" class="y"></div>
                   <div class="col-sm-4"><input type="text" name="date2" class="y"></div>
                   <input class="in" style="margin-left:30px" type="submit" name="submit" value="View Lost/Disposal Magazine By Date">
                </div><br>
                 <hr style="background-color: grey;width: 1120px;height:1px;border-width:0;margin-left: 1%;">
                        
                 <h4 style="margin: 0% 0% 0% 2%">All Lost/Disposal Magazine</h4><br>
                        <table style="margin-bottom: 3%;">
		<thead>
                                              <tr>
                                                <th class="textcenter">Accessing No.</th>
                                                <th class="textcenter">Magazine Title</th>
                                                <th class="textcenter">Category</th>
                                                <th class="textcenter">Date</th>
                                                <th class="textcenter">Lost/Disposal</th>
                                                <th class="textcenter">Reason</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                            <% 
                                    try {
                                         Connection cn = null;  Statement st=null;
                                         Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                                         String sql = "select * from lost_magazine"; ResultSet rs = st.executeQuery(sql);

                            while (rs.next()) {
                                %>
                                    <tr>
                                        <td><%=rs.getString("accessing_no")%></td>
                                        <td><%=rs.getString("magazine_title")%></td>
                                        <td><%=rs.getString("category")%></td>
                                        <td><%=rs.getString("date")%></td>
                                        <td><%=rs.getString("lost_disposal")%></td>
                                        <td><%=rs.getString("reason")%></td>
                                    </tr>
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
                        
                          <div id="message" style="display: none; text-align: center; margin-bottom: 2%; font-size: 16px;">No match found &#128546;</div>                      
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
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
        </script>    
    </body>
</html>
