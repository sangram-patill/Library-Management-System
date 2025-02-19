<%-- 
    Document   : invoice
    Created on : 4 May, 2023, 7:34:19 PM
    Author     : sangr
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Admin - Staff Issue Book </title> 
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
            video{
              height: 200px;
              width: 250px;
              margin-left: 50px;
              border-right: 5px;
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
        <% 
             // Get the current date
             Calendar calendar = Calendar.getInstance();
             java.util.Date issueDate = calendar.getTime();

             // Add 15 days to the current date
             calendar.add(Calendar.DAY_OF_MONTH, 15);
             java.util.Date returnDate = calendar.getTime();

             // Convert java.util.Date to java.sql.Date
             Date issueSqlDate = new Date(issueDate.getTime());
             Date returnSqlDate = new Date(returnDate.getTime());
         %>
        
        
         <!---Start Editing from Below Code--->
        <div class="container">
            <div class="content">                   
                  <div class="cards">
                        <div class="card">
                            <div class="box">  
                                
                                <br>
                                 <div class="row">
                                    <div class="col-sm-6">
                                         <h4 style="margin: 0% 0% 0% 2%">Staff Issue Book</h4>
                                    </div>                                                                        
                                 </div>
                
                <form name="staff_issue" action="staff_issue" method="post">
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%;">
                
                <!--First and Second Row-->
                <div class="row">
                     <div class="col-sm-4"><label for="book-title" class="x">Book Accessing No.</label></div>                  
                   <div class="col-sm-4"><label for="book-title" class="x">Issue Date</label></div>
                   <div class="col-sm-4"><label for="author" class="x">Expected Return Date</label></div>                   
                </div>
                <div class="row">
                    <div class="col-sm-4"><input class="y" type="text" id="accessing-no" name="book_accessing_no" required></div>                 
                    <div class="col-sm-4"><input class="y" type="date" value="<%=issueSqlDate%>" name="issue_date" required></div>
                    <div class="col-sm-4"><input class="y" type="date" value="<%=returnSqlDate%>" name="return_date" required></div>
                </div>
                    <video id="preview"></video><br>
                    <!--Third and Fourth Row-->
                <div class="row">
                   <div class="col-sm-4"><label for="borrower-name" class="x">Staff ID</label></div>
                </div>                   
                <div class="row">
                   <div class="col-sm-4"><input class="y" type="text" onkeypress="return isNumber(event)" id="borrower-name" name="staff_id" required></div>
                </div>
                    <video id="preview1"></video><br>
                    <!--Seven and Eight Row-->                              
                 
                 <!--Buttons-->
               <div class="row">
                   <input type="submit" value="Issue Book" name="submit" class="addbook" style="margin-left: 500px;margin-bottom: 3%;">
                </div>   
                                </form>
            <!--Searching Method-->
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                <h4 style="margin: 0% 0% 0% 2%">Staff Issue Book List</h4>
                <br>
                <div class="row">
                      <input id="search" type="text" placeholder="Search..." style="margin-left: 450px">
                </div>
                <br>
                <table class="tableclass">
                        <thead>
                             <tr>
                                    <th class="textcenter">Transaction ID</th>
                                    <th class="textcenter">Accessing No.</th>
                                    <th class="textcenter">Staff ID</th>
                                    <th class="textcenter">Issue Date</th>
                                    <th class="textcenter">Expected Return Date</th>
                            </tr>
                        </thead>
                        <tbody>
                          <% 
            try {
                 Connection cn = null; Statement st=null;
                 Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                 String sql = "select * from staff_issue"; ResultSet rs = st.executeQuery(sql);

                while (rs.next()) {
                    %>
                        <tr>
                            <td><%=rs.getString("rid")%></td>
                            <td><%=rs.getString("book_accessing_no")%></td>
                            <td><%=rs.getString("staff_id")%></td>
                            <td><%=rs.getString("issue_date")%></td>
                            <td><%=rs.getString("return_date")%></td>
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
                <!--Data not found-->
                <div id="message" style="display: none; text-align: center; margin-bottom: 2%; font-size: 16px;">No match found &#128546;</div>
                
               </div>
                            </div>                           
                        </div>                     
                  </div>
            </div>
             <script type="text/javascript">
    let scanner1 = null;
    let scanner2 = null;

    function startScan1() {
        if (scanner2) {
            scanner2.stop();
        }
        scanner1 = new Instascan.Scanner({ video: document.getElementById('preview') });
        scanner1.addListener('scan', function (content) {
            document.getElementById('accessing-no').value = content;
            scanner1.stop();
            startScan2();
        });
        Instascan.Camera.getCameras().then(function (cameras) {
            if (cameras.length > 0) {
                scanner1.start(cameras[0]);
            } else {
                console.error('No cameras found.');
            }
        }).Catch(function (e) {
            console.error(e);
        });
    }

    function startScan2() {
        if (scanner1) {
            scanner1.stop();
        }
        scanner2 = new Instascan.Scanner({ video: document.getElementById('preview1') });
        scanner2.addListener('scan', function (content) {
            document.getElementById('borrower-name').value = content;
            scanner2.stop();
            startScan1();
        });
        Instascan.Camera.getCameras().then(function (cameras) {
            if (cameras.length > 0) {
                scanner2.start(cameras[0]);
            } else {
                console.error('No cameras found.');
            }
        }).Catch(function (e) {
            console.error(e);
        });
    }

    startScan1();
</script>
            
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
