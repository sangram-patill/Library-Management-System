
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
        <title>YCM Assistant - Student Return Book </title> 
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
    <script type="text/javascript">
            function datediff()
            {
                var date1 = new Date(document.getElementById("rdate").value);
                var date2 = new Date(document.getElementById("edate").value);
                var diffDays = parseInt((date1 - date2) / (1000 * 60 * 60 * 24), 10); 


                if(date2<=date1)
                {
                    document.getElementById("days").value=diffDays; 
                    if(document.getElementById("days").value)
                    document.getElementById("amount").value=diffDays*2;

                }
                else
                { 
                    document.getElementById("days").value=0;
                }
            }
   </script>
    </head>
    <body>
       <%
        if(session.getAttribute("username")==null)
        {
            response.sendRedirect("index.jsp");
        }
        %>
         <style><%@include file="library_assistant/../library_assistant_dashboard.jsp"%></style>
       
         <!---Start Editing from Below Code--->
        <div class="container">
            <div class="content">                   
                  <div class="cards">
                        <div class="card">
                            <div class="box"> 
                                <br>
                                 <div class="row">
                                    <div class="col-sm-6">
                                         <h4 style="margin: 0% 0% 0% 2%">Student Return Book</h4>
                                    </div>  
                                    <div class="col-sm-6">
                                        <form action="library_assistant_student_return.jsp" method="post">
                                                 <input type="text" class="y" onkeypress="return isNumber(event)" placeholder="Enter Transaction Id" name="txt_sid">
                                                 <input type="submit" name="btn"  class="btn" value="Search">
                                        </form>
                                    </div>
                                 </div>
                                
                                <%
                                    
                                    Connection cn=null;
                                    Statement st=null;
                                    String sid="";
                                    String bid="";
                                    String idate="";
                                    String rdate="";
                                    String t_id ="";
                            try
                            {
                            Class.forName("com.mysql.jdbc.Driver"); 
                            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            String sql = "select * from student_issue where rid ='"+request.getParameter("txt_sid")+"' "; 
                            ResultSet rs = st.executeQuery(sql);
                            while(rs.next())
                            {
                                t_id = rs.getString("rid");
                                bid=rs.getString("book_accessing_no");
                                sid=rs.getString("student_id");
                                idate=rs.getString("issue_date");
                                rdate=rs.getString("return_date");
                            }
                            }
                            catch(Exception ex)
                            {
                                out.println(ex.toString());
                            }
    

                        %>
                
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%;">
                <form name="library_assistant_student_return" action="../assistant_student_return" method="post">
                <!--First and Second Row-->
                 <div class="row">
                   <div class="col-sm-4"><label for="return-date" class="x">Transaction ID</label></div> 
                </div>
                <div class="row">
                        <div class="col-sm-4" >
                            <input class="y" type="text" onkeypress="return isNumber(event)" name="t_id" value="<%=t_id%>">
                        </div>
                        <!--input field for issue date-->
                        <input class="y" type="hidden" name="issue_date" value="<%=idate%>">
                </div><br>
                <div class="row">
                   <div class="col-sm-4"><label for="book-title" class="x">Book Accessing No.</label></div>                  
                   <div class="col-sm-4"><label for="borrower-name"  class="x">Student ID</label></div>
                   <div class="col-sm-4"><label for="return-date"  class="x">Book Expected Return Date</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4"><input class="y" type="text1" value="<%=bid%>" id="accessing-no" name="book_accessing_no" required></div>                 
                    <div class="col-sm-4"><input class="y" value="<%=sid%>" type="text1" onkeypress="return isNumber(event)" id="borrower-name" name="student_id" required></div>
                    <div class="col-sm-4"><input class="y" value="<%=rdate%>"  type="date" id="edate" onmousemove="datediff()" name="expected_return_date" required></div> 
                </div><br>
<!--                    <video id="preview"></video><br>-->
                    <!--Third and Fourth Row-->
                <div class="row">
                   <div class="col-sm-4"><label for="return-date"  class="x">Return Date</label></div> 
                   <div class="col-sm-4"><label class="x">Total Days</label></div>
                   <div class="col-sm-4"><label class="x">Amount</label></div>
                </div>                   
                <div class="row">
                   <div class="col-sm-4"><input class="y" type="date" id="rdate" onmousemove="datediff()" name="return_date" required ></div> 
                   <div class="col-sm-4" ><input class="y" type="text" onkeypress="return isNumber(event)" name="total_days" id="days"></div>                  
                   <div class="col-sm-4"><input class="y" type="text" onkeypress="return isNumber(event)" name="fine" value="0" id="amount"></div>
                </div>
                
                <br><br>
<!--                    <video id="preview1"></video><br>-->
                    <!--Seven and Eight Row-->                              
                 
                 <!--Buttons-->
               <div class="row">
                    <input type="submit" value="Return Book" name="submit" class="addbook" style="margin-left: 500px;margin-bottom: 3%;">              
               </div>   
                        </form>
            <!--Searching Method-->
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                <h4 style="margin: 0% 0% 0% 2%">Student Return Book List</h4>
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
                            <th class="textcenter">Student ID</th>
                            <th class="textcenter">Return Date</th>
                          </tr>
                        </thead>
                        <tbody>
                          <% 
            try {
                 Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                 String sql = "select * from student_return"; ResultSet rs = st.executeQuery(sql);

                while (rs.next()) {
                    %>
                        <tr>
                            <td><%=rs.getString("rid")%></td>
                            <td><%=rs.getString("book_accessing_no")%></td>
                            <td><%=rs.getString("student_id")%></td>
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
<!--             <script type="text/javascript">
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
    
       
              
    
</script>-->
 
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
                
                    $(document).ready(function() {
                        // Retrieve the value from the hidden field
                        var hiddenValue = $('.y').val();

                        // Set the hidden field value in the second form
                        $('#hidden_field_value').val(hiddenValue);
                    });
                
        </script>

    </body>
</html>
