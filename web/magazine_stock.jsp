<%-- 
    Document   : magazine_stock
    Created on : 8 Apr, 2023, 8:22:57 PM
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
        <title>YCM Admin - Magazine Stock</title> 
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
                                         <h4 style="margin: 0% 0% 0% 2%">Magazine Stock</h4>
                                    </div>
                                    <div class="col-sm-6">
                                         <a href="magazine.jsp"><button class="stock">Magazine Entry</button></a>
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
                                <th class="textcenter">Date of Entry</th>
				<th class="textcenter">Dept</th>
				<th class="textcenter">Category</th>
				<th class="textcenter">Accessing No.</th>
                                <th class="textcenter">Language</th>
				<th class="textcenter">Title</th>
				<th class="textcenter">Sub-title</th>
                                <th class="textcenter">Subject</th>
                                <th class="textcenter">Pages</th>
			        <th class="textcenter">Action</th>
			</tr>
		</thead>
		<tbody>
				<% 
            try {
                 Connection cn = null; Statement st=null;
                 Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                 String sql = "select * from magzine"; ResultSet rs = st.executeQuery(sql);

                while (rs.next()) {
                    %>
                <form action="magazine.jsp" method="post">
                        <tr>
                            <td><%=rs.getString("m_date_of_entry")%></td>
                    <input type="hidden" name="m_date_of_entry" value="<%=rs.getString("m_date_of_entry")%>">
                            <td><%=rs.getString("m_department")%></td>
                    <input type="hidden" name="m_department" value="<%=rs.getString("m_department")%>">
                            <td><%=rs.getString("m_category")%></td>
                    <input type="hidden" name="m_category" value="<%=rs.getString("m_category")%>">
                            <td><%=rs.getString("m_acc_no")%></td>
                    <input type="hidden" name="m_acc_no" value="<%=rs.getString("m_acc_no")%>">
                            <td><%=rs.getString("m_language")%></td>
                    <input type="hidden" name="m_language" value="<%=rs.getString("m_language")%>">
                            <td><%=rs.getString("m_title")%></td>
                    <input type="hidden" name="m_title" value="<%=rs.getString("m_title")%>">
                            <td><%=rs.getString("m_subtitle")%></td>
                    <input type="hidden" name="m_subtitle" value="<%=rs.getString("m_subtitle")%>">
                            <td><%=rs.getString("m_subject")%></td>
                    <input type="hidden" name="m_subject" value="<%=rs.getString("m_subject")%>">
                            <td><%=rs.getString("m_pages")%></td>
                    <input type="hidden" name="m_pages" value="<%=rs.getString("m_pages")%>">
                    <input type="hidden" name="m_copies" value="<%=rs.getString("m_copies")%>">
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


