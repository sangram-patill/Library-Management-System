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
        <title>YCM Admin - Book Stock</title> 
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
                                         <h4 style="margin: 0% 0% 0% 2%">Book Stock</h4>
                                    </div>
                                    <div class="col-sm-6">
                                         <a href="add_book.jsp"><button class="stock">Book Entry</button></a>
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
                            <th class="textcenter">Author</th>
                            <th class="textcenter">Publisher</th>
                            <th class="textcenter">Language</th>
                            <th class="textcenter">Action</th>
			</tr>
		</thead>
		<tbody>
   
        <% 
            try {
                 Connection cn = null; Statement st=null;
                 Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                 String sql = "select * from add_book where b_status = 'Returned' OR b_status = 'Issued'"; ResultSet rs = st.executeQuery(sql);

                while (rs.next()) 
                {
                    %>
                    <form action="add_book.jsp" method="post">
                        <tr>
                            <td><%=rs.getString("b_department")%></td>
                <input type="hidden" name="b_department" value="<%=rs.getString("b_department")%>">
                            <td><%=rs.getString("b_category")%></td>
                <input type="hidden" name="b_category" value="<%=rs.getString("b_category")%>">
                            <td><%=rs.getString("b_acc_no")%></td>
                <input type="hidden" name="b_acc_no" value="<%=rs.getString("b_acc_no")%>">
                            <td><%=rs.getString("b_classificationcode")%></td>
                <input type="hidden" name="b_classificationcode" value="<%=rs.getString("b_classificationcode")%>">
                            <td><%=rs.getString("b_title")%></td>
                <input type="hidden" name="b_title" value="<%=rs.getString("b_title")%>">
                            <td><%=rs.getString("b_subtitle")%></td>
                <input type="hidden" name="b_subtitle" value="<%=rs.getString("b_subtitle")%>">
                            <td><%=rs.getString("author_1")%></td>
                <input type="hidden" name="author_1" value="<%=rs.getString("author_1")%>">
                            <td><%=rs.getString("b_publishername")%></td>
                <input type="hidden" name="b_publishername" value="<%=rs.getString("b_publishername")%>">
                            <td><%=rs.getString("b_language")%></td>
                <input type="hidden" name="b_language" value="<%=rs.getString("b_language")%>">
                            <td><input type="submit" value="Action" class="stock"></td>
                <input type="hidden" name="b_date_of_entry" value="<%=rs.getString("b_date_of_entry")%>">
                <input type="hidden" name="b_copies" value="<%=rs.getString("b_copies")%>">
                <input type="hidden" name="b_subject" value="<%=rs.getString("b_subject")%>">
                <input type="hidden" name="author_2" value="<%=rs.getString("author_2")%>">
                <input type="hidden" name="author_3" value="<%=rs.getString("author_3")%>">
                <input type="hidden" name="author_4" value="<%=rs.getString("author_4")%>">
                <input type="hidden" name="b_edition" value="<%=rs.getString("b_edition")%>">
                <input type="hidden" name="b_publishingyear" value="<%=rs.getString("b_publishingyear")%>">
                <input type="hidden" name="b_vendorname" value="<%=rs.getString("b_vendorname")%>">
                <input type="hidden" name="b_pages" value="<%=rs.getString("b_pages")%>">
                <input type="hidden" name="b_price" value="<%=rs.getString("b_price")%>">
                <input type="hidden" name="b_rackno" value="<%=rs.getString("b_rackno")%>">
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
