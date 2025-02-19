<%-- 
    Document   : student_book_stock
    Created on : 30 Apr, 2023, 12:22:10 PM
    Author     : Aditya
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
        <title>YCM Principal - Staff Fine Master</title> 
        <style><%@include file="css/jspdashboard.css"%></style>
        <link rel="icon" type="image/x-icon" href="image/fevicon.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Lexend+Mega:wght@300&display=swap" rel="stylesheet">
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
    
    <body>        
        <style><%@include file="principal/../principal_dashboard.jsp"%></style>       
 
        <!--Start Editing from Below Code-->
        
        <div class="container">
            <div class="content">                   
                  <div class="cards">
                        <div class="card">
                            <div class="box">
                                <br>
                                <div class="row">
                                    <div class="col-sm-6">
                                         <h4 style="margin: 0% 0% 0% 2%">Staff Fine Master</h4>
                                    </div>
                                </div>
                                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                               <div class="row">
                                    <input id="search" type="text" placeholder="Search..." style="margin-left: 2.5%;">
                               </div>
                                <br>
                                
             <table style="margin-bottom: 3%; margin-right: 2%;">
               <thead>
			<tr>
                            <th class="textcenter">Transaction ID</th>
                            <th class="textcenter">Staff ID</th>
                            <th class="textcenter">Book Acc no</th>
                            <th class="textcenter">Issue date</th>
                            <th class="textcenter">Expected Return Date</th>
                            <th class="textcenter">Actual Return Date</th>
                            <th class="textcenter">Late Days</th>
                            <th class="textcenter">Fine</th>
			</tr>
		</thead>
		<tbody>
   
        <% 
            try {
                 Connection cn = null; Statement st=null;
                 Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                 String sql = "select * from staff_fine"; ResultSet rs = st.executeQuery(sql);

                while (rs.next()) 
                {
                    %>
                        <tr>
                            <td><%=rs.getString("t_id")%></td>
                            <td><%=rs.getString("staff_id")%></td>
                            <td><%=rs.getString("book_accessing_no")%></td>
                            <td><%=rs.getString("issue_date")%></td>
                            <td><%=rs.getString("expected_return_date")%></td>
                            <td><%=rs.getString("return_date")%></td>
                            <td style="color: red;"><%=rs.getString("total_days")%></td>
                            <td style="color: #22A39F;"><%=rs.getString("fine")%></td>
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
                        </div>
                  </div>
            </div>
        </div>    
    </body>
</html>
