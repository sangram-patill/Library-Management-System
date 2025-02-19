<%--
    Document   : newid
    Created on : 9 May, 2023, 2:56:16 PM
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
    <title>YCM Admin - Student ID Card</title>
    <style><%@include file="css/jspdashboard.css"%></style>
    <link rel="icon" type="image/x-icon" href="image/fevicon.png">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrious/4.0.2/qrious.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/html2canvas@1.0.0-rc.5/dist/html2canvas.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
    <style media="screen">
        
        .card1 {
            background-color: white;
            border: 2px solid black;
            padding: 10px;
            width: 270px;
            height: 420px;
            float: left;
        }
        .logo1{
            height: 70px;
            width: 255px;
        }
        .photo1{
            float: right;
            height: 100px;
            margin-top: 0px;
        }
        .details1{
            float: left;
            margin-top: 10px;
        }
        .name1{
            font-weight: bold;
            margin-bottom: 5px;
        }
        .label1{
            font-weight: bold;
            font-size: 12px;
            margin-right: 5px;
        }
        .value1{
            font-size: 12px;
        }
        h5{
            margin-left: 30px;
            margin-top: -15px;
            text-align: center;
        }
        h6{
            font-size: 7px;
            margin-left: 30px;
            margin-top: -15px;
            text-align: center;
        }
        .sign1{
            margin-left: 70px;
            float:right;
            height: 50px;
            width: 110px;
        }
        .idp{
            margin-top: 20px;
            margin-left: 10px;
        }
        .download-btn {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body onload="autoClick();">
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
                        <br><br>
                        <%
                            try {
                                Connection cn = null;
                                Statement st=null;
                                Class.forName("com.mysql.jdbc.Driver");
                                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
                                st= cn.createStatement();
                                String sql = "select * from student where registration_no = '"+session.getAttribute("registration_no")+"'";
                                ResultSet rs = st.executeQuery(sql);

                                while (rs.next()) 
                                {
                        %>
                        <div class="card1" id="card">
                            <header>
                                <img class="logo1" src="image/id_header.jpg" alt="Logo">
                            </header>
                            <img class="idp" src="image/Student/<%=rs.getString("stud_photo")%>" width="85" height="105">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <div class="photo1">
                                <canvas id="qrcode"></canvas>
                                <input type="hidden" name="idid" id="idid" value="<%=rs.getString("registration_no")%>">
                                <script>
                                    var qr = new QRious({
                                        element: document.getElementById('qrcode'),
                                        value: document.getElementById('idid').value,
                                        size: 105
                                    });
                                </script>
                            </div>

                            <div class="details1">
                                <div class="name1"><%=rs.getString("stud_name")%></div>
                                <div>
                                    <span class="label1">Registration NO:</span>
                                    <span class="value1" id="roll"><%=rs.getString("registration_no")%></span>
                                </div>
                                <div>
                                    <span class="label1">Department:</span>
                                    <span class="value1"><%=rs.getString("stud_department")%></span>
                                </div>
                                <div>
                                    <span class="label1">Year:</span>
                                    <span class="value1"><%=rs.getString("stud_year")%></span>
                                </div>
                                <div>
                                    <span class="label1">D.O.B :</span>
                                    <span class="value1"><%=rs.getString("stud_dob")%></span>
                                </div>
                                <div>
                                    <span class="label1">Address:</span>
                                    <span class="value1"><%=rs.getString("stud_city")%></span>
                                </div>
                                <div>
                                    <span class="label1">Mobile No:</span>
                                    <span class="value1"><%=rs.getString("stud_mobno")%></span>
                                </div>
                            </div>
                               <img class="sign1" src="image/psign.png" alt="Logo"> 
                        </div>
                        <%
                                }
                            } 
                            catch (Exception ex) 
                            {
                                out.println(ex.toString());
                            } 
                        %>

                        <div class="download-btn">
                            <button class="addbook" onclick="screenshot();">Download</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function screenshot() {
            var card = document.getElementById('card');
            domtoimage.toBlob(card).then(function(blob) {
                var url = URL.createObjectURL(blob);
                var a = document.createElement('a');
                a.href = url;
                a.download = 'Student ID card.png'; // set the filename
                a.click();
                URL.revokeObjectURL(url);
            }).Catch(function(error) {
                console.error('Error:', error);
            });
        }
    </script>
</body>
</html>
