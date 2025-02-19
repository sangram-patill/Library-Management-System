<%-- 
    Document   : jspdashboard
    Created on : 26 Feb, 2023, 4:20:04 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Assistant - Dashboard</title> 
        <style><%@include file="css/jspdashboard.css"%></style>
        <link rel="icon" type="image/x-icon" href="image/fevicon.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
        <style><%@include file="library_assistant/../library_assistant_dashboard.jsp"%></style>   
        
        <!---Start Editing from Below Code--->
        <div class="container">
            <div class="content">                   
                  <div class="cards">
                        <div class="card">
                            <div class="box">                                
                                          <br>
                                <h4 style="margin: 0% 0% 0% 2%">Welcome <%= session.getAttribute("username")%></h4>
                                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                                
                                <div class="row one">
                                    <div class="col-sm-3 first">
                                <%
                                  long count = 0;
                                  Connection cn =null; Statement st = null;
                                  String sr_no;
                                  Class.forName("com.mysql.jdbc.Driver"); cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                                  String sql = "select * from add_book where b_status = 'Returned' OR b_status = 'Issued'"; ResultSet rs = st.executeQuery(sql);
                                  while(rs.next()){ count++;                                      }

                                %>         
                                 <h1 style="text-align: center;"><%=count%></h1>
                                 <input type="hidden" name="number"  id="slice1" value="<%=count%>">
                                 <%
                                 %>
                                        <p style="text-align: center;">Total Books</p>  
                                    </div>
                                    <div class="col-sm-3 second">
                                <%
                                    count = 0;
                                    cn =null; st = null;
                                    String j_acc_no;
                                    Class.forName("com.mysql.jdbc.Driver"); cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                                    sql = "select * from journal where status = 'Returned'";  rs = st.executeQuery(sql);
                                    while(rs.next()){ count++;                                      }
                                %>         
                                 <h1 style="text-align: center;"><%=count%></h1>
                                 <input type="hidden" name="number"  id="slice2" value="<%=count%>">
                                 <%
                                 %>
                                        <p style="text-align: center;">Total Journal</p>
                                    </div>
                                    <div class="col-sm-3 third">
                                <%
                                    count = 0;
                                    cn =null; st = null;
                                    String m_acc_no;
                                    Class.forName("com.mysql.jdbc.Driver"); cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                                    sql = "select * from magzine where status = 'Returned'";  rs = st.executeQuery(sql);
                                    while(rs.next()){ count++;                                      }
                                %>         
                                 <h1 style="text-align: center;"><%=count%></h1>
                                 <input type="hidden" name="number"  id="slice3" value="<%=count%>">
                                 <%
                                 %>
                                       <p style="text-align: center;">Total Magazine</p>
                                    </div>
                                    <div class="col-sm-3 four">
                                <%
                                    count = 0;
                                    cn =null; st = null;
                                    String news_id;
                                    Class.forName("com.mysql.jdbc.Driver"); cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                                    sql = "select news_id from newspaper";  rs = st.executeQuery(sql);
                                    while(rs.next()){ count++;   }
                                %>         
                                 <h1 style="text-align: center;"><%=count%></h1>
                                 <input type="hidden" name="number"  id="slice4" value="<%=count%>">
                                 <%
                                 %>        
                                        <p style="text-align: center;">Total Newspaper</p>
                                    </div>
                                </div><br><br>
                                        <div class="row one">
                                           <div class="col-sm-3 first">
                                <%
                                    count = 0;
                                    cn =null; st = null;
                                    String b_status;
                                    Class.forName("com.mysql.jdbc.Driver"); cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                                    sql = "select b_status from add_book where b_status = 'Issued'";  rs = st.executeQuery(sql);
                                    while(rs.next()){ count++;                                      }
                                %>         
                                 <h1 style="text-align: center;"><%=count%></h1>
                                 <input type="hidden" name="number"  id="slice5" value="<%=count%>">
                                 <%
                                 %>
                                       <b> <p style="text-align: center;color: red;">Issued Books</p></b>
                                    </div>
                                        
                                        <div class="col-sm-3 second">
                                <%
                                  count = 0;
                                  cn =null; st = null;
                                  Class.forName("com.mysql.jdbc.Driver"); cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                                  sql = "select b_status from add_book where b_status = 'Returned'"; rs = st.executeQuery(sql);
                                  while(rs.next()){ count++;                                      }

                                %>         
                                 <h1 style="text-align: center;"><%=count%></h1>
                                 <input type="hidden" name="number"  id="slice6" value="<%=count%>">
                                 <%
                                 %>
                                <b> <p style="text-align: center;color: green;">Available Books</p></b>
                                    </div>
                                      <div class="col-sm-3 third">
                                <%
                                  count = 0;
                                  cn =null; st = null;
                                  Class.forName("com.mysql.jdbc.Driver"); cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                                  sql = "select registration_no from student"; rs = st.executeQuery(sql);
                                  while(rs.next()){ count++;                                      }

                                %>         
                                 <h1 style="text-align: center;"><%=count%></h1>
                                 <%
                                 %>
                                        <p style="text-align: center;">Total Student</p>  
                                    </div>
                                        
                                    <div class="col-sm-3 four">
                                <%
                                  count = 0;
                                  cn =null; st = null;
                                  Class.forName("com.mysql.jdbc.Driver"); cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                                  sql = "select registration_no from staff"; rs = st.executeQuery(sql);
                                  while(rs.next()){ count++;                                      }

                                %>         
                                 <h1 style="text-align: center;"><%=count%></h1>
                                 <%
                                 %>
                                 <p style="text-align: center;">Total Staff</p>
                                    </div>    
                                        </div>
                                
                                 <canvas id="pieChart"></canvas>
                                 
                            </div>                           
                        </div>                     
                  </div>
            </div>
        </div>
    <script type="text/javascript">
        // Get input elements
        const slice1Input = document.getElementById('slice1');
        const slice2Input = document.getElementById('slice2');
        const slice3Input = document.getElementById('slice3');
        const slice4Input = document.getElementById('slice4');
        const slice5Input = document.getElementById('slice5');
        const slice6Input = document.getElementById('slice6');

        // Create initial chart data
        const initialData = {
            labels: ['Total Books', 'Total Journals', 'Total Magazine', 'Total Newspaper','Issued Books','Available Books'],
            datasets: [{
                data: [slice1Input.value, slice2Input.value, slice3Input.value, slice4Input.value,slice5Input.value,slice6Input.value],
                backgroundColor: ['orange', 'skyblue', 'yellow','pink','red','green']
            }]
        };

        // Create chart
        const ctx = document.getElementById('pieChart').getContext('2d');
        const pieChart = new Chart(ctx, {
            type: 'pie',
            data: initialData
        });

        // Update chart when inputs change
        slice1Input.addEventListener('change', updateChart);
        slice2Input.addEventListener('change', updateChart);
        slice3Input.addEventListener('change', updateChart);
        slice4Input.addEventListener('change', updateChart);
        slice5Input.addEventListener('change', updateChart);
        slice6Input.addEventListener('change', updateChart);

        function updateChart() {
            pieChart.data.datasets[0].data = [slice1Input.value, slice2Input.value, slice3Input.value, slice4Input.value, slice5Input.value, slice6Input.value];
            pieChart.update();
        }
    </script>
    </body>
</html>
