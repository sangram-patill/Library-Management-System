<%-- 
    Document   : total_student
    Created on : 9 Apr, 2023, 12:15:58 PM
    Author     : sangr
--%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Admin - Total Students</title> 
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
                            <div class="box"><br>
                                <div class="row">
                                    <div class="col-sm-6">
                                         <h4 style="margin: 0% 0% 0% 2%">Total Students</h4>
                                    </div>
                                    <div class="col-sm-6">
                                         <a href="student.jsp"><button class="stock">New Student</button></a>
                                    </div>
                                 </div>
                                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                               
                               <div class="row">
                                    <input id="search" type="text" placeholder="Search..." style="margin-left: 2.5%;">
                               </div>
                                <br>
                                
                                <table style="margin-bottom: 3%; margin-right: 3%;">
		<thead>
			<tr>
                                <th class="textcenter">Reg No.</th>
				<th class="textcenter">Dept</th>
				<th class="textcenter">Year/Stream</th>
                                <th class="textcenter">Name</th>
                                <th class="textcenter">DOB</th>
				<th class="textcenter">Mobile</th>
				<th class="textcenter">Email</th>
                                <th class="textcenter">City</th>
                                <th class="textcenter">Photo</th>
                                <th class="textcenter">Sign</th>
                                <th class="textcenter">Action</th>
			</tr>
		</thead>
		<tbody>
			<% 
            try {
                 Connection cn = null; Statement st=null;
                 Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                 String sql = "select * from student"; ResultSet rs = st.executeQuery(sql);

                while (rs.next()) {
                    %>
                     <form action="student.jsp" method="post">
                        <tr>
                            <td><%=rs.getString("registration_no")%></td>
                <input type="hidden" name="registration_no" value="<%=rs.getString("registration_no")%>">
                            <td><%=rs.getString("stud_department")%></td>
                <input type="hidden" name="stud_department" value="<%=rs.getString("stud_department")%>">
                            <td><%=rs.getString("stud_year")%></td>
                <input type="hidden" name="stud_year" value="<%=rs.getString("stud_year")%>">
                            <td><%=rs.getString("stud_name")%></td>
                <input type="hidden" name="stud_name" value="<%=rs.getString("stud_name")%>">
                            <td><%=rs.getString("stud_dob")%></td>
                <input type="hidden" name="stud_dob" value="<%=rs.getString("stud_dob")%>">
                            <td><%=rs.getString("stud_mobno")%></td>
                <input type="hidden" name="stud_mobno" value="<%=rs.getString("stud_mobno")%>">
                            <td><%=rs.getString("stud_email")%></td>
                <input type="hidden" name="stud_email" value="<%=rs.getString("stud_email")%>">
                <input type="hidden" name="stud_address" value="<%=rs.getString("stud_address")%>">
                            <td><%=rs.getString("stud_city")%></td>
                <input type="hidden" name="stud_city" value="<%=rs.getString("stud_city")%>">
                <input type="hidden" name="stud_pincode" value="<%=rs.getString("stud_pincode")%>">
                <input type="hidden" name="stud_state" value="<%=rs.getString("stud_state")%>">
                <input type="hidden" name="stud_district" value="<%=rs.getString("stud_district")%>">
                <input type="hidden" name="stud_taluka" value="<%=rs.getString("stud_taluka")%>">
                <input type="hidden" name="stud_gender" value="<%=rs.getString("stud_gender")%>">          
                            <td><img class="image1" src="image/Student/<%=rs.getString("stud_photo")%>"></td>
                            <td><img class="image1" src="image/Student/<%=rs.getString("stud_sign")%>"></td>
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

