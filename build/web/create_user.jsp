<%-- 
    Document   : create_user
    Created on : 30 Mar, 2023, 3:23:44 PM
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
        <meta name="viewport" content="width=device-width,intial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Admin - User Creation</title>
        <style><%@include file="css/jspdashboard.css"%></style>
        <link rel="icon" type="image/x-icon" href="image/fevicon.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Lexend+Mega:wght@300&display=swap" rel="stylesheet">
        <style>
            .container .content .cards .card
            {
                width: 1200px;
                height: 100%;     /*Change Div height here*/
                background: white;
                margin: 20px 20px;
                display: flex;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
/*            form{
                margin-left: 180px;
                margin-top: 50px;
            }
                form label {
                  display: inline-block;
                  width: 100px;
                  text-align: right;
                }

                form input,
                form select {
                  margin-bottom: 10px;
                  width: 200px;
                  padding: 5px;
                  border-radius: 5px;
                  border: 1px solid #ccc;
                      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.1);

                }
                 button[type="submit"] 
                 {
                    background-color: #68A7AD;
                    color: white;
                    padding: 12px 20px;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                    margin-left: 355px;
                    margin-top: 30px;
                }

                button[type="submit"]:hover {
                        background-color: #99C4C8;
                        color: black;
                }*/
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
                            <h4 style="margin: 0% 0% 0% 2%">Create New User</h4>
                            <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%;">
                            <form action="create_user" name="create_user" method="post" enctype="multipart/form-data">

                                     <div class="row">
                                         <div class="col-sm-3"><label for="username" class="x">Username:</label></div>
                                         <div class="col-sm-3"><label for="password" class="x">Password:</label></div>
                                         <div class="col-sm-3"><label for="role" class="x">Role:</label></div>
                                         <div class="col-sm-3"><label for="photo" class="x">Upload Photo:</label></div>
                                      </div>
                                      <div class="row">
                                          <div class="col-sm-3">
                                              <%
                                                    if(request.getParameter("username")!=null)
                                                    {
                                                    %>
                                                            <input type="text" name="username" class="y" style="width: 180px;" value="<%=request.getParameter("username")%>">
                                                    <%
                                                    }
                                                    else
                                                    {
                                                    %>
                                                            <input type="text" name="username" style="width: 180px;" class="y" required>
                                                    <%
                                                    }
                                             %>
                                          </div>
                                          <div class="col-sm-3"><input type="password"  name="password" class="y" style="width: 180px;"></div>
                                          <div class="col-sm-3">
                                              <select name="role" style="width: 180px;" class="y">
                                                <%
                                                        if(request.getParameter("role")!=null)
                                                        {
                                                        %>
                                                        <option value="<%=request.getParameter("role")%>"><%=request.getParameter("role")%></option>
                                                        <%
                                                        }
                                                        else
                                                               {
                                                        %>
                                                        <option>Select Role</option>

                                                        <%
                                                        }
                                                %>
                                                <option value="student">Student</option>
                                                     <option value="staff">Staff</option>
                                                     <option value="assistant">Assistant</option>
                                                     <option value="admin">Admin</option>
                                                     <option value="principal">Principal</option>
                                                     <option value="secretary">Secretary</option>
                                                
                                        </select>
                                          </div>
                                          <div class="col-sm-3"><input type="file" name="image" id="fileToUpload" class="y" style="width: 200px;"></div>
                                      </div><br><br>
                                      <div class="row">
                                          <div class="col-sm-3">
                                             <input type="submit" name="submit" value="Create User" class="addbook" style="margin-bottom: 7%; margin-left: 150%;" >
                                          </div>
                                          <div class="col-sm-3">
                                            <input type="submit" name="submit" value="Delete User" class="addbook" style="margin-bottom: 3%; margin-left: 100%;" >
                                          </div>
                                      </div>
                               </form>
                            
                            <!--Searching data-->
                
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                <h4 style="margin: 0% 0% 0% 2%;">All Users</h4>
                <br><br>
                
                <div class="row">
                     <input id="search" type="text" placeholder="Search User..." style="margin-left: 2.5%;">
                </div>
                <br>
                
                <table style="margin-bottom: 3%;">
		<thead>
			<tr>
                            <th class="textcenter">Username</th>
                            <th class="textcenter">Role</th>
                            <th class="textcenter">Photo</th>
                            <th class="textcenter">Action</th>
			</tr>
		</thead>
		<tbody>
		<% 
            try {
                Connection cn = null; Statement st = null;
                 Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                 String sql = "select * from create_user"; ResultSet rs = st.executeQuery(sql);

                while (rs.next()) {
                    %>
                <form action="create_user.jsp" method="post">
                        <tr>
                            <td><%=rs.getString("username")%></td>
                    <input type="hidden" name="username" value="<%=rs.getString("username")%>">
                            <td><%=rs.getString("role")%></td>
                    <input type="hidden" name="role" value="<%=rs.getString("role")%>">
                            <td><img class="image1" src="image/Create User/<%=rs.getString("image")%>"></td>
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
    </body>
</html>

