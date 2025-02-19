<%-- 
    Document   : update_newspaper
    Created on : 13 Apr, 2023, 11:21:05 AM
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
        <title>YCM Admin - Update Newspaper</title> 
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
        
         <!--Start Editing from Below Code-->
         
         <div class="container">
            <div class="content">                   
                  <div class="cards">
                        <div class="card">
                            <div class="box">                                
                                   <br>
                                <div class="row">
                                    <div class="col-sm-6">
                                         <h4 style="margin: 0% 0% 0% 2%">Update Newspaper</h4>
                                    </div>
                                    <div class="col-sm-6">
                                         <a href="newspaper.jsp"><button class="stock">Newspaper Entry</button></a>
                                    </div>
                                 </div>
                              <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                                <br>
                                <form name="update_newspaper" action="update_newspaper" method="post"> 
                                
                                
                <label style="margin-left: 2%;">Date</label>
                <input type="date" id="dateid" name="date" style="margin-left: 1%;"><br>
                <br>
                    <input type="checkbox"  style="margin-left: 2%;" id="selectAll" onclick="selectAllCheckboxes()">
                    <label for="selectAll" style="margin-left: 1%;">Select All</label>
                                
                               <table style="margin-bottom: 3%;">
		<thead>
			    <tr>
                                <th style="text-align: center;">Checkbox</th>
                                <th style="text-align: center;">Newspaper No.</th>
                                <th style="text-align: center;">Paper Name</th>
                                
 				</tr>
		</thead>
		<tbody>
                    
                    <% 
            try {
                 Connection cn = null; Statement st=null;
                 Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                 String sql = "select * from newspaper"; ResultSet rs = st.executeQuery(sql);

                while (rs.next()) {
                    %>
                        <tr>
                            <td><input name="news_name[]" value="<%=rs.getString("news_name")%>" type="checkbox"></td>
                            <td><%=rs.getString("news_id")%></td>
                            <td><%=rs.getString("news_name")%></td>
                             
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
                
             
                <input type="submit" value="Add" name="submit" class="addbook" style="margin-left: 5%; margin-bottom: 3%;">
                                </form>
                </div>                     
                  </div>
            </div>
        </div>
     </div>
        
         <script type="text/javascript">
             
              function selectAllCheckboxes() {
                var selectAll = document.getElementById("selectAll");
                var checkboxes = document.querySelectorAll('input[type="checkbox"]:not(#selectAll)');
  
                for (var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = selectAll.checked;
                }
        }
        
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
