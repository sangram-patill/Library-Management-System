<%-- 
    Document   : book_qr
    Created on : 28 May, 2023, 7:25:54 PM
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
    <title>YCM Admin - Book QR</title>
    <style>
        <%@include file="css/jspdashboard.css"%>
    </style>
    <link rel="icon" type="image/x-icon" href="image/fevicon.png">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrious/4.0.2/qrious.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/html2canvas@1.0.0-rc.5/dist/html2canvas.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
    <style media="screen">
        .container .content .cards .card {
            width: 1200px;
            height: 100%; /*Change Div height here*/
            background: white;
            margin: 10px 20px;
            display: flex;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        * {
            font-family: sans-serif;
        }
        .card1 {
            background-color: white;
            width: 200px;
            height: 200px;
            margin-left: 10px;
            margin-bottom: 3%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .photo1 {
            height: 100px;
            display: flex; /* Add this line */
            flex-direction: column; /* Add this line */
            justify-content: center; /* Add this line */
            align-items: center; /* Add this line */
        }
        .cards-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
        }
        .search-bar {
            margin-top: 20px;
        }
        .b{
                background-color: #4FBDBA;
                color: #fff;        
                width: auto;
                height: 28px;
                border-radius: 5px;
                border: 1px solid #ccc;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.1);
                margin-left: -150px;
                margin-top: 220px;
          }
          .s{
                margin-left: 450px;
                width: 250px;
                height: 28px;
                border-radius: 5px;
                border: 1px solid #ccc;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.1);
            }
            .sbtn{
                color: black;
                background: #4FBDBA;
                width: 130px;
                height: 30px;
                margin-left: 510px;
                color: white;
                border-radius: 5px;
                border: 1px solid #ccc;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
            }
    </style>
</head>
<body onload="autoClick();">
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<style>
    <%@include file="dashboard.jsp"%>
</style>

<!---Start Editing from Below Code--->

<div class="container">
    <div class="content">
        <div class="cards">
            <div class="card">
                <div class="box">
                    <br>
                    <div class="row">
                        <div class="col-sm-6">
                             <h4 style="margin: 0% 0% 0% 2%">Book QR Codes</h4>
                        </div>
                        <div class="col-sm-6">
                             <a href="book_qr_pdf.jsp"><button class="stock">Total Book QR</button></a>
                        </div>
                     </div>
                    <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                    <div class="search-bar">
                        <form method="post">
                            <input class="s" type="text" name="search" placeholder="Enter Accessing Number..."><br><br>
                            <input class="sbtn" type="submit" value="Search">
                        </form>
                    </div>
                    <hr style="background-color: grey;width: 1120px;height:1px;border-width:0;margin-left: 1%">
                    <br>
                    <div class="cards-container">
                        <%
                            try {
                                Connection cn = null;
                                Statement st = null;
                                Class.forName("com.mysql.jdbc.Driver");
                                cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system", "root", "root");
                                st = cn.createStatement();
                                String sql = "select * from add_book";
                                String searchQuery = request.getParameter("search");
                                if (searchQuery != null && !searchQuery.isEmpty()) {
                                    sql += " WHERE b_acc_no = '" + searchQuery + "'";
                                }
                                ResultSet rs = st.executeQuery(sql);

                                while (rs.next()) {
                        %>
                        <div class="card1" id="card_<%=rs.getString("b_acc_no")%>">
                            
                            <div class="photo1">
                                <span class="qrno"><%=rs.getString("b_acc_no")%></span>
                                <canvas id="qrcode_<%=rs.getString("b_acc_no")%>"></canvas>
                                <input type="hidden" name="idid" id="idid_<%=rs.getString("b_acc_no")%>"
                                       value="<%=rs.getString("b_acc_no")%>">
                                <script>
                                    var qr = new QRious({
                                        element: document.getElementById('qrcode_<%=rs.getString("b_acc_no")%>'),
                                        value: document.getElementById('idid_<%=rs.getString("b_acc_no")%>').value,
                                        size: 105
                                    });
                                </script>
                                <span><%=rs.getString("b_rackno")%></span>
                            </div>
                        </div>
                                <button class="b"
                                        onclick="screenshot('card_<%=rs.getString("b_acc_no")%>');">Download
                                </button>
                                <hr style="background-color: grey;width: 180px;height:1px;border-width:0;margin-left:-145px;margin-top: 260px;">                        <%
                            }
                        } catch (Exception ex) {
                            out.println(ex.toString());
                        }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function screenshot(cardId) {
        var card = document.getElementById(cardId);
        domtoimage.toBlob(card).then(function (blob) {
            var url = URL.createObjectURL(blob);
            var a = document.createElement('a');
            a.href = url;
            a.download = cardId + '.png'; // set the filename
            a.click();
            URL.revokeObjectURL(url);
        }).Catch(function (error) {
            console.error('error found', error);
        });
    }
</script>
</body>
</html>
