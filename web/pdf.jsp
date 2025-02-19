<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="image/fevicon.png">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.0/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrious/4.0.2/qrious.min.js"></script>
    <title>YCM Admin - Student ID Card PDF</title>
    <style media="screen">
        *{
            font-family: sans-serif;
        }
        .card {
            background-color: white;
            border: 2px solid black;
            padding: 10px;
            width: 220px;
            height: 320px;
            border-radius: 10px;
            float: left;
            margin: 10px;
        }
        .logo{
            height: 60px;
            width: 220px;
        }
        .photo {
            float: left;
            height: 100px;
            margin-top: 10px;
        }
        .details {
            float: left;
            margin-top: 10px;
            font-size: 5px;
        }
        .name {
            font-weight: bold;
            font-size: 10px;
        }
        .label {
            font-weight: bold;
            font-size: 12px;
            margin-right: 5px;
        }
        .value {
            font-size: 12px;
        }
        .sign1{
            margin-left: 70px;
            float:right;
            height: 50px;
            width: 110px;
        }
        .container {
            clear: both;
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

<%
    try {
        Connection cn = null;Statement st=null;
        Class.forName("com.mysql.jdbc.Driver");
        cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
        st= cn.createStatement();
        String sql = "select * from student";
        ResultSet rs = st.executeQuery(sql);

        int cardCount = 0; // Counter to keep track of the cards

        while (rs.next()) {
            cardCount++;
%>
            <div class="card" id="card<%= cardCount %>">
                <header>
                    <img class="logo" src="image/id_header.jpg" alt="College Logo">
                </header>

                <div class="photo">
                    <img src="image/Student/<%=rs.getString("stud_photo")%>" width="70" height="85">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <canvas id="qrcode<%= cardCount%>"></canvas>
                    <input type="hidden" name="idid" id="idid<%= cardCount %>" value="<%=rs.getString("registration_no")%>">
                    <script type="text/javascript">
                        var qr<%=cardCount%> = new QRious({
                            element: document.getElementById('qrcode<%= cardCount %>'),
                            value: document.getElementById('idid<%= cardCount %>').value,
                            size: 85
                        });
                    </script>
                </div>

                <div class="details">
                    <div class="name"><%=rs.getString("stud_name")%></div>
                    <div>
                        <span class="label">Roll No:</span>
                        <span class="value" id="roll<%= cardCount %>"><%=rs.getString("registration_no")%></span>
                    </div>
                    <div>
                        <span class="label">Branch:</span>
                        <span class="value"><%=rs.getString("stud_department")%></span>
                    </div>
                    <div>
                        <span class="label">Year:</span>
                        <span class="value"><%=rs.getString("stud_year")%></span>
                    </div>
                    <div>
                        <span class="label">D.O.B :</span>
                        <span class="value"><%=rs.getString("stud_dob")%></span>
                    </div>
                    <div>
                        <span class="label">Address:</span>
                        <span class="value"><%=rs.getString("stud_city")%></span>
                    </div>
                    <div>
                        <span class="label">Mobile No:</span>
                        <span class="value"><%=rs.getString("stud_mobno")%></span>
                    </div>
                </div>
                     <img class="sign1" src="image/psign.png" alt="Logo">
                </div>
            
<%
            // If 9 cards have been displayed, break the loop
            if (cardCount >= 9) {
                break;
            }
        }
    }
    catch (Exception ex)
    {
        out.println(ex.toString());
    }
%>

<button onclick="convertToPDF();">Download</button>
<button onclick="view();">View</button>

<script type="text/javascript">
    function convertToPDF() {
        var element = document.body;
        var opt = {
            margin: 5,
            filename: 'Student ID cards.pdf',
            image: { type: 'jpeg', quality: 1 },
            html2canvas: { scale: 2 },
            jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' }
        };
        html2pdf().set(opt).from(element).save();
    }
    
    function view() {
        html2canvas(document.getElementById('card1')).then(function(canvas) {
            var imgData = canvas.toDataURL('image/png');
            var newWindow = window.open();
            newWindow.document.write('<img src="' + imgData + '" />');
        });
    }
</script>
</body>
</html>
