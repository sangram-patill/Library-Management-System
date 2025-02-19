<%-- 
    Document   : student_jspdashboard
    Created on : 12 Apr, 2023, 9:21:38 AM
    Author     : Aditya
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Student - Dashboard</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="icon" type="image/x-icon" href="image/fevicon.png">
        <style>
            .container .content .cards .card{
                width: 1200px;
                height: 100%;     /*Change Div height here*/
                background: white;
                margin: 20px 20px;
                display: flex;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            .container1{
                background-color: whitesmoke;
                height: 260px;
                width: 1100px;
                margin: 20px 20px;
                padding: 5px 20px;
            }
            table {
                    border-collapse: collapse;                    
                    position: absolute;
                    background-color: white;
                    margin: 20px 10px;
                    column-width: 100%;
                  }

                  th, td {
                    border-style: groove;
                    text-align:  center;
                  }

                  th {
                    background-color: #555;
                    color: #fff;
                    font-size: 15px;
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
            response.sendRedirect("../index.jsp");
        }
        %>
         <style><%@include file="student_dashboard.jsp"%></style>
        <div class="container">
        
         <!---Start Editing from Below Code--->

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
                                        <p style="text-align: center;">Total Maganize</p>
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

        // Create initial chart data
        const initialData = {
            labels: ['Total Books', 'Total Journals', 'Total Magazine', 'Total Newspaper'],
            datasets: [{
                data: [slice1Input.value, slice2Input.value, slice3Input.value, slice4Input.value],
                backgroundColor: ['green', 'skyblue', 'yellow','pink']
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

        function updateChart() {
            pieChart.data.datasets[0].data = [slice1Input.value, slice2Input.value, slice3Input.value, slice4Input.value];
            pieChart.update();
        }
    </script>

    </body>
</html>
