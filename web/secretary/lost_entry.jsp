<%-- 
    Document   : student_issue_return
    Created on : 26 Apr, 2023, 2:12:00 PM
    Author     : PCS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta name="viewport" content="width=device-width,intial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Secretary - Lost/Disposal</title> 
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
            .container .content .cards .card{
                    width: 1200px;
                    height: 100%;     /*Change Div height here*/
                    background: white;
                    margin: 20px 20px;
                    display: flex;
                    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),0 6px 20px 0 rgba(0, 0, 0, 0.19);
                }
                
                .container .content{
                    position: relative;
                    margin-top: 10vh;
                       
                }
                .container .content .cards{
                    display: flex;
                    justify-content: space-between;
                }
                
                /*Issue*/
                .book-block{
                    margin: 0% 3% 4% 2%;
                    background-color: whitesmoke;
                    height: auto;
                    width: 1100px;
                }
                
                /*Return*/
                .magazine-block{
                    margin: 0% 3% 4% 2%;
                    background-color: whitesmoke;
                    height: auto;
                    width: 1100px;
                }
                .journal-block{
                    margin: 0% 3% 4% 2%;
                    background-color: whitesmoke;
                    height: auto;
                    width: 1100px;
                }
                form {
                        display: flex;
                        margin-left: 30px;
                        flex-direction: column;
                }
                label {
                        margin-top: 20px;
                        
                }
                input[type="text1"],
                input[type="date"] {
                        padding: 10px;
                        margin-top: 5px;
                        width: 300px;
                        border: 1px solid #ccc;
                        border-radius: 5px;
                        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),0 6px 20px 0 rgba(0, 0, 0, 0.19);
                }
                select{
                     padding: 10px;
                        margin-top: 5px;
                        width: 300px;
                        border: 1px solid #ccc;
                        border-radius: 5px;
                        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),0 6px 20px 0 rgba(0, 0, 0, 0.19);
                }

                button[type="submit1"] {
                        background-color: #68A7AD;
                        color: white;
                        padding: 10px;
                        margin-top: 20px;
                        border: none;
                        width: 300px;
                        border-radius: 5px;
                        cursor: pointer;
                }

                button[type="submit1"]:hover {
                        background-color: #99C4C8;
                        color: black;
                }
                
                button[type="submit2"] {
                        background-color: #68A7AD;
                        color: white;
                        padding: 10px;
                        margin-top: 20px;
                        border: none;
                        height: 40px;
                        width: 100px;
                        border-radius: 5px;
                        cursor: pointer;
                }

                button[type="submit2"]:hover {
                        background-color: #99C4C8;
                        color: black;
                }
                
                
                .tableclass{                 
                    border-collapse: collapse;
/*                    width: 100%;
                    max-width: 680px;*/
/*                    position: absolute;*/
/*                    margin-top: -520px;  */
                    margin-left: 55px;                  
                    background-color: white;
                    width: 1000px;
                    height: 100%;
                  }

                  th, td {
                    border-style: groove;
                    text-align:  center;
                  }

                  th {
                    background-color: #555;
                    color: #fff;
                    font-size: 15px;
                    text-align: center;
                  }

                  tr:nth-child(even) {
                    background-color: #f2f2f2;
                  }

                  tr:hover {
                    background-color: #ddd;
                  }
        </style>
        <script type="text/javascript">
                   function showbookForm() {
                        // Get the issue form element
                        var bookForm = document.getElementById("bookForm");

                        // Check if the element is hidden
                        if (bookForm.style.display === "none") {
                          // Hide the return form (if visible)
                          hidemagazineForm(); hidejournalForm();
                          // Show the issue form
                          bookForm.style.display = "block";
                        }
                      }

                      function showmagazineForm() {
                        // Get the return form element
                        var magazineForm = document.getElementById("magazineForm");

                        // Check if the element is hidden
                        if (magazineForm.style.display === "none") {
                          // Hide the issue form (if visible)
                          hidebookForm(); hidejournalForm();
                          // Show the return form
                          magazineForm.style.display = "block";
                        }
                      }
                      
                 function showjournalForm() {
                        // Get the issue form element
                        var journalForm = document.getElementById("journalForm");

                        // Check if the element is hidden
                        if (journalForm.style.display === "none") {
                          // Hide the return form (if visible)
                          hidemagazineForm();  hidebookForm();
                          // Show the issue form
                          journalForm.style.display = "block";
                        }
                      }
  
  

                      function hidebookForm() {
                        // Get the issue form element
                        var bookForm = document.getElementById("bookForm");

                        // Check if the element is visible
                        if (bookForm.style.display === "block") {
                          // Hide the element
                          bookForm.style.display = "none";
                        }
                      }

                      function hidemagazineForm() {
                        // Get the return form element
                        var magazineForm = document.getElementById("magazineForm");

                        // Check if the element is visible
                        if (magazineForm.style.display === "block") {
                          // Hide the element
                          magazineForm.style.display = "none";
                        }
                      }
                     function hidejournalForm() {
                        // Get the issue form element
                        var journalForm = document.getElementById("journalForm");

                        // Check if the element is visible
                        if (journalForm.style.display === "block") {
                          // Hide the element
                          journalForm.style.display = "none";
                        }
                      }
                 
                      
                      /*System Date*/
                            
                      window.onload = function() {
                         var currentDate = new Date();
                         var day = currentDate.getDate();
                         var month = currentDate.getMonth() + 1;
                         var year = currentDate.getFullYear();

                         var dateString = year + "-" + month.toString().padStart(2, '0') + "-" + day.toString().padStart(2, '0');
                         document.getElementById("issue-date").value = dateString;
                         document.getElementById("return-date").value = dateString;
                };

        </script>
    </head>
    <body>
        <%
        if(session.getAttribute("username")==null)
        {
            response.sendRedirect("index.jsp");
        }
        %>
        <style><%@include file="secretary_dashboard.jsp"%></style>
        
       <!--Start Editing from Below Code-->

     <div class="container">
            <div class="content">                   
                  <div class="cards">
                        <div class="card">
                            <div class="box">
                                <br>
                                <h4 style="margin: 0% 0% 0% 2%">Lost Stock</h4>
                                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%;">
                            <div class="row">
                                <div class="col-sm-4"> 
                                    <button onclick="showbookForm()" type="submit2" style="margin-left:30px; margin-bottom: 8%;">Book</button>
                                </div>
                                <div class="col-sm-4">                                    
                                    <button onclick="showmagazineForm()" type="submit2" style="margin-bottom: 8%;">Magazine</button>
                                </div>
                                <div class="col-sm-4">                                    
                                    <button onclick="showjournalForm()" type="submit2" style="margin-bottom: 8%;">Journal</button>
                                </div>
                                                          
                            </div>
                            <div id="bookForm" style="display: none;" class="book-block">                                
                                    <div class="row">
                                        <label style="margin-left:440px;margin-top: 40px;font-size: 20px;">Book lost/Disposal</label>
                                    </div><br>
                                <div class="row">
                                    <div class="col-sm-1">
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
                                              </tr>
                                            </thead>
                                            <tbody>
                                            <% 
                                    try {
                                         Connection cn = null; Statement st=null;
                                         Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                                         String sql = "select * from lost_book"; ResultSet rs = st.executeQuery(sql);

                                    while (rs.next()) {
                                        %>
                                            <tr>
                                                <td><%=rs.getString("accessing_no")%></td>
                                                <td><%=rs.getString("book_title")%></td>
                                                <td><%=rs.getString("department")%></td>
                                                <td><%=rs.getString("category")%></td>
                                                <td><%=rs.getString("date")%></td>
                                                <td><%=rs.getString("lost_disposal")%></td>
                                                <td><%=rs.getString("reason")%></td>
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
 
                                    </div>
                                </div>
                                    
                            </div>
                            
                            <div id="magazineForm" style="display: none;" class="magazine-block">                                
                                    <div class="row">
                                        <label style="margin-left:440px;margin-top: 40px;font-size: 20px;"> Magazine lost/Disposal </label>
                                     </div><br>

                                        <div class="row">
                                        <div class="col-sm-1">
                                        <table class="tableclass">
                                            <thead>
                                              <tr>
                                                <tr>
                                                <th class="textcenter">Accessing No.</th>
                                                <th class="textcenter">Magazine Title</th>
                                                <th class="textcenter">Category</th>
                                                <th class="textcenter">Date</th>
                                                <th class="textcenter">Lost/Disposal</th>
                                                <th class="textcenter">Reason</th>
                                              </tr>
                                              </tr>
                                            </thead>
                                            <tbody>
                                            <% 
                                                try {
                                                    Connection cn = null; Statement st=null;
                                                     Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                                                    String sql = "select * from lost_magazine"; ResultSet rs = st.executeQuery(sql);

                                        while (rs.next()) {
                                            %>
                                                <tr>
                                                    <td><%=rs.getString("accessing_no")%></td>
                                                    <td><%=rs.getString("magazine_title")%></td>
                                                    <td><%=rs.getString("category")%></td>
                                                    <td><%=rs.getString("date")%></td>
                                                    <td><%=rs.getString("lost_disposal")%></td>
                                                    <td><%=rs.getString("reason")%></td>
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
  
                                    </div>
                                </div>
                                    
                                    </div>
                                            
                                            
                                      
               <div id="journalForm" style="display: none;" class="journal-block">                                
                                    <div class="row">
                                        <label style="margin-left:440px;margin-top: 40px;font-size: 20px;">Journal Lost/Disposal</label>
                                    </div><br>

                                <div class="row">
                                    <div class="col-sm-1">
                                        <table class="tableclass">
                                            <thead>
                                              <tr>
                                                <tr>
                                                <th class="textcenter">Accessing No.</th>
                                                <th class="textcenter">Magazine Title</th>
                                                <th class="textcenter">Category</th>
                                                <th class="textcenter">Date</th>
                                                <th class="textcenter">Lost/Disposal</th>
                                                <th class="textcenter">Reason</th>
                                              </tr>
                                              </tr>
                                            </thead>
                                            <tbody>
                                            <% 
                                                try {
                                                     Connection cn = null; Statement st=null;
                                                     Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                                                     String sql = "select * from lost_journal"; ResultSet rs = st.executeQuery(sql);

                                                    while (rs.next()) {
                                                        %>
                                                            <tr>
                                                                <td><%=rs.getString("accessing_no")%></td>
                                                                <td><%=rs.getString("journal_title")%></td>
                                                                <td><%=rs.getString("category")%></td>
                                                                <td><%=rs.getString("date")%></td>
                                                                <td><%=rs.getString("lost_disposal")%></td>
                                                                <td><%=rs.getString("reason")%></td>
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
 
                                    </div>
                                </div>
                                    
                            </div>       
                             </div>
                            </div>                    
                        </div>
                  </div>
            </div>
    </body>
</html>

