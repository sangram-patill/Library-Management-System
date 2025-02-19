
<%-- 
    Document   : invoice
    Created on : 4 May, 2023, 7:34:19 PM
    Author     : sangr
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Admin - Lost/Disposal Book </title> 
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
            .container .content .cards .card
            {
                width: 1200px;
                height: 100%;    
                background: white;
                margin: 20px 20px;
                display: flex;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            .tableclass {
                    border-collapse: collapse;              
                    width: 1080px;
                    margin-left: 40px;
                    background-color: white;
                    margin-bottom: 3%;
                  }

                  th, td {
                    border-style: groove;
                    text-align:  center;
                  }

                  th {
                    background-color: #555;
                    color: #fff;
                    text-align: center;
                  }

                  tr:nth-child(even) {
                    background-color: #f2f2f2;
                  }

                  tr:hover {
                    background-color: #ddd;
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
                                 <div class="row">
                                    <div class="col-sm-6">
                                         <h4 style="margin: 0% 0% 0% 2%">Lost/Disposal Book Entry</h4>
                                    </div> 
                                     <div class="col-sm-6">
                                        <form action="book_lost_entry.jsp" method="post">
                                                 <input type="text" class="y" placeholder="Enter Accessing No." name="txt_sid">
                                                 <input type="submit" name="btn"  class="btn" value="Search">
                                        </form>
                                    </div>
                                 </div>
                                
                        <%
                                    
                                    Connection cn=null;
                                    Statement st=null;
                                    String acc_no="";
                                    String title="";
                                    String dept="";
                                    String category="";
                            try
                            {
                            Class.forName("com.mysql.jdbc.Driver"); 
                            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            String sql = "select * from add_book where b_acc_no ='"+request.getParameter("txt_sid")+"' "; 
                            ResultSet rs = st.executeQuery(sql);
                            while(rs.next())
                            {
                                acc_no=rs.getString("b_acc_no");
                                title=rs.getString("b_title");
                                dept=rs.getString("b_department");
                                category=rs.getString("b_category");
                            }
                            }
                            catch(Exception ex)
                            {
                                out.println(ex.toString());
                            }
    

                        %>

                    <form name="book_lost_entry" action="lost_entry" method="Post">

                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%;">
                
                <!--First and Second Row-->
                <div class="row">
                    <div class="col-sm-4"><label class="x" for="book-title">Accessing No.</label></div>                  
                    <div class="col-sm-4"><label class="x" for="book-title">Book Title</label></div>
                    <div class="col-sm-4"><label class="x" for="author">Department</label></div>                   
                </div>
                <div class="row">
                    <!--Hidden field for status-->
                    <input type="hidden" name="status" value="lost">
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("accessing_no")!=null)
                                {
                                %>
                                    <input type="text1" id="accessing-no" name="accessing_no"  class="y" value="<%=request.getParameter("accessing_no")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text1" id="accessing-no" value="<%=acc_no%>" name="accessing_no"  class="y">
                                <%
                                }
                        %>
                    </div>                 
                    <div class="col-sm-4">
                         <%
                                if(request.getParameter("book_title")!=null)
                                {
                                %>
                                    <input type="text" id="book-title" name="book_title"  class="y" value="<%=request.getParameter("book_title")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text" id="book-title" value="<%=title%>" name="book_title"  class="y">
                                <%
                                }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <%
                                if(request.getParameter("department")!=null)
                                {
                                %>
                                    <input type="text"  name="department" onkeypress="return isString(event)"  class="y" value="<%=request.getParameter("department")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text"  value="<%=dept%>" onkeypress="return isString(event)" name="department"  class="y">
                                <%
                                }
                        %>
                    </div>
                </div><br><br>
                    <!--Third and Fourth Row-->
                <div class="row">
                   <div class="col-sm-4"><label class="x" for="borrower-name">Category</label></div>
                   <div class="col-sm-4"><label class="x" for="issue-date"> Date</label></div>  
                   <div class="col-sm-4"><label class="x" for="issue-date"> Lost_Disposal</label></div>                 
                </div>                   
                <div class="row">
                    <div class="col-sm-4">
                         <%
                                if(request.getParameter("category")!=null)
                                {
                                %>
                                    <input type="text"  name="category" onkeypress="return isString(event)"  class="y" value="<%=request.getParameter("category")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text"  value="<%=category%>" onkeypress="return isString(event)" name="category"  class="y">
                                <%
                                }
                        %>
                    </div>
                  <div class="col-sm-4">
                       <%
                            if(request.getParameter("date")!=null)
                            {
                            %>
                                    <input type="date" name="date" class="y" value="<%=request.getParameter("date")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="date" name="date" id="dateid" class="y">
                            <%
                            }
                        %>
                  </div>
                  <div class="col-sm-4">
                      <select name="lost_disposal" class="y">
                        <%
                                if(request.getParameter("lost_disposal")!=null)
                                {
                                %>
                                <option value="<%=request.getParameter("lost_disposal")%>"><%=request.getParameter("lost_disposal")%></option>
                                <%
                                }
                                else
                                {
                                %>
                                <option>Select One</option>
                                <option value="Lost">Lost</option>
                                <option value="Disposal">Disposal</option>
                                <option value="Missing">Missing</option>
                                <option value="Out Of Syllabus">Out Of Syllabus</option>
                        <%
                               }
                        %>
                        </select>
                  </div>
                </div><br><br>
                <div class="row">
                   <div class="col-sm-4"><label class="x" for="issue-date">Reasons for Lost/Disposal</label></div>                                    
                </div>                   
                <div class="row">
                  <div class="col-sm-3">
                      <%
                                if(request.getParameter("reason")!=null)
                                {
                                %>
                                    <input type="text1" id="lost" name="reason" onkeypress="return isString(event)"  class="y" value="<%=request.getParameter("reason")%>">
                                <%
                                }
                                else
                                {
                                %>
                                    <input type="text1" id="lost"  onkeypress="return isString(event)" name="reason"  class="y">
                                <%
                                }
                        %>
                  </div>                  
                  <input type="submit" value="Submit Book" name="submit" class="addbook" style="margin-bottom: 3%;">
                  <input type="submit" value="Update Book" name="submit" class="addbook" style="margin-bottom: 3%;">
                  <input type="reset" value="Reset" class="addbook" style="margin-bottom: 3%;">
                </div>
                    <!--Seven and Eight Row-->                              
                                  
                    </form>
 
               
            <!--Searching Method-->
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                <h4 style="margin: 0% 0% 0% 2%">Lost/Disposal Book List</h4>
                <br><br>
                <div class="row">
                      <input id="search" type="text" placeholder="Search Lost Book..." style="margin-left: 2.5%;">
                </div>
                <br>
                <table class="tableclass">                                            
                        <thead>
                          <tr>
                            <th class="textcenter">Accessing No.</th>
                            <th class="textcenter">Book Title</th>
                            <th class="textcenter">Department</th>
                            <th class="textcenter">Category</th>
                            <th class="textcenter">Date</th>
                            <th class="textcenter">Lost/Disposal</th>
                            <th class="textcenter">Reason</th>
                            <th class="textcenter">Action</th>
                          </tr>
                        </thead>
                        <tbody>
                        <% 
                try {
                     cn = null;  st=null;
                     Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                     String sql = "select * from lost_book"; ResultSet rs = st.executeQuery(sql);

        while (rs.next()) {
            %>
            <form action="book_lost_entry.jsp" method="post">
                <tr>
                    <td><%=rs.getString("accessing_no")%></td>
            <input type="hidden" name="accessing_no" value="<%=rs.getString("accessing_no")%>">
                    <td><%=rs.getString("book_title")%></td>
            <input type="hidden" name="book_title" value="<%=rs.getString("book_title")%>">
                    <td><%=rs.getString("department")%></td>
            <input type="hidden" name="department" value="<%=rs.getString("department")%>">
                    <td><%=rs.getString("category")%></td>
            <input type="hidden" name="category" value="<%=rs.getString("category")%>">
                    <td><%=rs.getString("date")%></td>
            <input type="hidden" name="date" value="<%=rs.getString("date")%>">
                    <td><%=rs.getString("lost_disposal")%></td>
            <input type="hidden" name="lost_disposal" value="<%=rs.getString("lost_disposal")%>">
                    <td><%=rs.getString("reason")%></td>
            <input type="hidden" name="reason" value="<%=rs.getString("reason")%>">
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
                    
                /*Seraching Data*/
                    
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
