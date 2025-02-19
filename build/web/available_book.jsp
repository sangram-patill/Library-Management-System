<%-- 
    Document   : stock
    Created on : 2 Apr, 2023, 7:05:26 PM
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
        <title>YCM Admin - Available Books</title> 
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
        .container .content .cards .card {
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
        
        <!--Start Editing from Below Code-->
        
         <div class="container"> 
            <div class="content">                   
                  <div class="cards">
                        <div class="card">
                            <div class="box">                                
                                          <br>
                                          
                                <div class="row">
                                    <div class="col-sm-6">
                                         <h4 style="margin: 0% 0% 0% 2%">Available Books</h4>
                                    </div>
                                 </div>
                                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                               
                               <div class="row">
                                    <input id="search" type="text" placeholder="Search Book..." style="margin-left: 2.5%;">
                               </div>
                                <br>
                                
             <table style="margin-bottom: 3%; margin-right: 2%;">
               <thead>
			<tr>
                            <th class="textcenter">Dept</th>
                            <th class="textcenter">Category</th>
                            <th class="textcenter">Accessing No.</th>
                            <th class="textcenter">Class. No.</th>
                            <th class="textcenter">Title</th>
                            <th class="textcenter">Sub-title</th>
                            <th class="textcenter">Author 1</th>
                            <th class="textcenter">Publisher</th>
                            <th class="textcenter">Edition</th>
                            <th class="textcenter">Language</th>
                            <th class="textcenter">Rack No</th>
			</tr>
		</thead>
		<tbody>
        <% 
            try {
                 Connection cn = null; Statement st=null;
                 Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                 String sql = "select * from add_book where b_status = 'Returned'"; ResultSet rs = st.executeQuery(sql);

                while (rs.next()) 
                {
                    %>
                        <tr>
                            <td><%=rs.getString("b_department")%></td>
                            <td><%=rs.getString("b_category")%></td>
                            <td><%=rs.getString("b_acc_no")%></td>
                            <td><%=rs.getString("b_classificationcode")%></td>
                            <td><%=rs.getString("b_title")%></td>
                            <td><%=rs.getString("b_subtitle")%></td>
                            <td><%=rs.getString("author_1")%></td>
                            <td><%=rs.getString("b_publishername")%></td>
                            <td><%=rs.getString("b_edition")%></td>
                            <td><%=rs.getString("b_language")%></td>
                            <td><%=rs.getString("b_rackno")%></td>
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
    </body>
</html>
