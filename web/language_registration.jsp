<%-- 
    Document   : language_registration
    Created on : 15 Apr, 2023, 9:43:13 AM
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
        <title>YCM Admin - Language Master</title> 
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
                                <h4 style="margin: 0% 0% 0% 2%">Language Master</h4>
                                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                               <br>
                        <form name="language_registration" action="language_registration" method="post">
                                <!--First and Second Row-->
                <div class="row">
                    <div class="col-sm-6"><label class="x">Language ID</label></div> 
                    <div class="col-sm-6"><label class="x">Language Name</label></div>
                </div>
                <div class="row">
                    <%
                    int language_id = 1;
                    Connection cn = null; Statement st = null;
                    Class.forName("com.mysql.jdbc.Driver"); cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                    String sql = "select * from language"; ResultSet rs = st.executeQuery(sql);
                    while(rs.next()){ language_id = Integer.parseInt (rs.getString("language_id").toString()) + 1;}
                     %>
                    
                    <div class="col-sm-6">
                        <%
                            if(request.getParameter("language_id")!=null)
                            {
                            %>
                            <input type="text" name="language_id" class="y" onkeypress="return isNumber(event)" value="<%=request.getParameter("language_id")%>">
                            <%
                            }
                            else
                            {
                            %>
                            <input type="text" name="language_id" onkeypress="return isNumber(event)" value="<%=language_id%>" class="y">
                            <%
                            }
                        %>
                    </div>
                    <div class="col-sm-6">
                        <%
                            if(request.getParameter("language_name")!=null)
                            {
                            %>
                            <input type="text" name="language_name" class="y" onkeypress="return isString(event)" value="<%=request.getParameter("language_name")%>">
                            <%
                            }
                            else
                            {
                            %>
                            <input type="text" name="language_name" onkeypress="return isString(event)" class="y">
                            <%
                            }
                        %>
                    </div>
                </div><br>
                <br><br>
                
                <!--Buttons-->  
               <div class="row">
                   <div class="col-sm-3"><input type="submit" name="submit" value="Add Language" class="addbook" style="margin-left: 50px; width: 190px;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Update Language" class="addbook" style="margin-left: 50px; width: 190px;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Delete Language" class="addbook" style="margin-left: 50px; width: 190px;"></div>
                   <div class="col-sm-3"><input type="reset" value="Reset Form" class="addbook" style="margin-left: 50px; width: 190px;"></div>
                </div><br>
                        </form>
                <!--Searching Method-->
                
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                <h4 style="margin: 0% 0% 0% 2%">All Language</h4>
                <br><br>
                <div class="row">
                      <input id="search" type="text" placeholder="Search Language..." style="margin-left: 2.5%;">
                </div>
                <br>
                <table style="margin-bottom: 3%;">
		<thead>
			<tr>
                                <th class="textcenter">Language ID</th>
				<th class="textcenter">Language Name</th>
			        <th class="textcenter">Action</th>
			</tr>
		</thead>
		<tbody>
		<% 
            try {
                 Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                 sql = "select * from language"; rs = st.executeQuery(sql);

                while (rs.next()) {
                    %>
                <form action="language_registration.jsp" method="post">
                        <tr>
                            <td><%=rs.getInt("language_id")%></td>
                        <input type="hidden" name="language_id" value="<%=rs.getString("language_id")%>">
                            <td><%=rs.getString("language_name")%></td>
                        <input type="hidden" name="language_name" value="<%=rs.getString("language_name")%>">
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
         </form>
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
