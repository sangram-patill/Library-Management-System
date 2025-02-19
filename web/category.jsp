<%-- 
    Document   : category
    Created on : 30 Mar, 2023, 7:32:24 PM
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
        <title>YCM Admin - Category Master</title> 
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
                                <h4 style="margin: 0% 0% 0% 2%">Category Master</h4>
                                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                               <br>
                            <form name="category" action="category1" method="post">
                                <!--First and Second Row-->
                <div class="row">
                    <div class="col-sm-4"><label class="x">Category ID</label></div> 
                    <div class="col-sm-4"><label class="x">Category Type</label></div>
                    <div class="col-sm-4"><label class="x">Category Name</label></div>
                </div>
                <div class="row">
                    <%
                    int category_id = 10;
                    Connection cn = null; Statement st = null;
                    Class.forName("com.mysql.jdbc.Driver"); cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                    String sql = "select * from category"; ResultSet rs = st.executeQuery(sql);
                    while(rs.next()){ category_id = Integer.parseInt (rs.getString("category_id").toString()) + 1;}
                     %>
                    <div class="col-sm-4">
                         <%
                            if(request.getParameter("category_id")!=null)
                            {
                            %>
                            <input type="text" name="category_id" class="y" onkeypress="return isNumber(event)" value="<%=request.getParameter("category_id")%>">
                            <%
                            }
                            else
                            {
                            %>
                            <input type="text" name="category_id" onkeypress="return isNumber(event)" value="<%=category_id%>" class="y">
                            <%
                            }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <select name="category_type" class="y">
                        <%
                            if(request.getParameter("category_type")!=null)
                            {
                            %>
                            <option name="category_type" value="<%=request.getParameter("category_type")%>"><%=request.getParameter("category_type")%></option>
                            <%
                            }
                            else
                            {
                            %>
                                <option>Select Category</option>
                                <option name="category_type" value="Book">Book</option>
                                <option name="category_type" value="Journal">Journal</option>
                                <option name="category_type" value="Magazine">Magazine</option>
                            <%
                            }
                        %>
                        </select>
                        <!--original-->
                        
                            
                    </div>
                    <div class="col-sm-4">
                        <%
                            if(request.getParameter("category_name")!=null)
                            {
                            %>
                            <input type="text" name="category_name" class="y" onkeypress="return isString(event)" value="<%=request.getParameter("category_name")%>">
                            <%
                            }
                            else
                            {
                            %>
                            <input type="text" name="category_name" onkeypress="return isString(event)" class="y">
                            <%
                            }
                        %>
                    </div>
                </div><br>
                <br><br>
                
                <!--Buttons-->  
               <div class="row">
                   <div class="col-sm-3"><input type="submit" name="submit" value="Add Category" class="addbook" style="margin-left: 50px; width: 190px;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Update Category" class="addbook" style="margin-left: 50px; width: 190px;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Delete Category" class="addbook" style="margin-left: 50px; width: 190px;"></div>
                   <div class="col-sm-3"><input type="reset" value="Reset Form" class="addbook" style="margin-left: 50px; width: 190px;"></div>
                </div><br>
                            </form>
                <!--Searching Method-->
                
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                <h4 style="margin: 0% 0% 0% 2%">All Category</h4>
                <br><br>
                <div class="row">
                       <input id="search" type="text" placeholder="Search Category..." style="margin-left: 2.5%;">
                </div>
                <br>
                <table style="margin-bottom: 3%;">
		<thead>
			<tr>
                                <th class="textcenter">Category ID</th>
				<th class="textcenter">Category Type</th>
				<th class="textcenter">Name</th>
			        <th class="textcenter">Action</th>
			</tr>
		</thead>
		<tbody>
		<% 
            try {
                 Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                 sql = "select * from category"; rs = st.executeQuery(sql);

                while (rs.next()) {
                    %>
                <form action="category.jsp" method="post">
                        <tr>
                            <td><%=rs.getInt("category_id")%></td>
                        <input type="hidden" name="category_id" value="<%=rs.getString("category_id")%>">
                            <td><%=rs.getString("category_type")%></td>
                        <input type="hidden" name="category_type" value="<%=rs.getString("category_type")%>">
                            <td><%=rs.getString("category_name")%></td>
                        <input type="hidden" name="category_name" value="<%=rs.getString("category_name")%>">
                            <td><input type="submit" value="Action" class="stock1"></td>
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

         </form>
    </body>
</html>