<%-- 
    Document   : total_newspaper
    Created on : 9 Apr, 2023, 8:52:49 PM
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
        <title>YCM Admin - Total Newspaper</title> 
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
                                         <h4 style="margin: 0% 0% 0% 2%">Total Newspaper</h4>
                                    </div>
                                    <div class="col-sm-6">
                                         <a href="newspaper.jsp"><button class="stock">Newspaper Entry</button></a>
                                    </div>
                                 </div>
                                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                               
                               <div class="row">
                                    <input id="search" type="text" placeholder="Search..." style="margin-left: 2.5%;">
                               </div>
                                <br>
            <table style="margin-bottom: 3%;">
		<thead>
			<tr>
                                <th class="textcenter">Newspaper No.</th>
				<th class="textcenter">Newspaper Name</th>
				<th class="textcenter">No.of Copies</th>
				<th class="textcenter">Language</th>
                                <th class="textcenter">Frequency</th>
				<th class="textcenter">Vendor Name</th>
				<th class="textcenter">W.Price</th>
                                <th class="textcenter">Mon</th>
                                <th class="textcenter">Tue</th>
                                <th class="textcenter">Wed</th>
                                <th class="textcenter">Thu</th>
                                <th class="textcenter">Fri</th>
                                <th class="textcenter">Sat</th>
                                <th class="textcenter">Sun</th>
                                <th class="textcenter">Action</th>
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
                    <form action="newspaper.jsp" method="post">
                        <tr>
                            <td><%=rs.getString("news_id")%></td>
                    <input type="hidden" name="news_id" value="<%=rs.getString("news_id")%>">
                            <td><%=rs.getString("news_name")%></td>
                    <input type="hidden" name="news_name" value="<%=rs.getString("news_name")%>">
                            <td><%=rs.getString("no_of_copies")%></td>
                    <input type="hidden" name="no_of_copies" value="<%=rs.getString("no_of_copies")%>">
                            <td><%=rs.getString("news_language")%></td>
                    <input type="hidden" name="news_language" value="<%=rs.getString("news_language")%>">
                            <td><%=rs.getString("news_frequency")%></td>
                    <input type="hidden" name="news_frequency" value="<%=rs.getString("news_frequency")%>">
                            <td><%=rs.getString("news_vendor")%></td>
                    <input type="hidden" name="news_vendor" value="<%=rs.getString("news_vendor")%>">
                            <td><%=rs.getString("news_price")%></td>
                    <input type="hidden" name="news_price" value="<%=rs.getString("news_price")%>">
                            <td><%=rs.getString("monday")%></td>
                            <td><%=rs.getString("tuesday")%></td>
                            <td><%=rs.getString("wednesday")%></td>
                            <td><%=rs.getString("thursday")%></td>
                            <td><%=rs.getString("friday")%></td>
                            <td><%=rs.getString("saturday")%></td>
                            <td><%=rs.getString("sunday")%></td>
                            <td><input type="submit" value="Action" class="stock"></td>
                    <input type="hidden" name="monday" value="<%=rs.getString("monday")%>">
                    <input type="hidden" name="tuesday" value="<%=rs.getString("tuesday")%>">
                    <input type="hidden" name="wednesday" value="<%=rs.getString("wednesday")%>">
                    <input type="hidden" name="thursday" value="<%=rs.getString("thursday")%>">
                    <input type="hidden" name="friday" value="<%=rs.getString("friday")%>">
                    <input type="hidden" name="saturday" value="<%=rs.getString("saturday")%>">
                    <input type="hidden" name="sunday" value="<%=rs.getString("sunday")%>">
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



