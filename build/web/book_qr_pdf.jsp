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
    <title>YCM Admin - Book QR PDF</title>
    <style media="screen">
        *{
            font-family: sans-serif;
        }
        .card {
            background-color: white;
            border: 2px solid black;
            width: 200px;
            height: 200px;
            margin-left: 10px;
            margin-bottom: 3%;
            border-radius: 5px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            float: left;
            margin: 10px;
        }
        
        .photo {
            float: left;
            height: 100px;
            margin-top: 10px;
            display: flex; /* Add this line */
            flex-direction: column; /* Add this line */
            justify-content: center; /* Add this line */
            align-items: center; /* Add this line */
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
        Connection cn = null;
        Statement st=null;
        Class.forName("com.mysql.jdbc.Driver");
        cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root");
        st= cn.createStatement();
        String sql = "select * from add_book";
        ResultSet rs = st.executeQuery(sql);

        int cardCount = 0; // Counter to keep track of the cards

        while (rs.next()) {
            cardCount++;
%>
            <div class="card" id="card<%= cardCount %>">               

                <div class="photo">
                    <span class="qrno"><%=rs.getString("b_acc_no")%></span>
                    <canvas id="qrcode<%= cardCount%>"></canvas>
                    <input type="hidden" name="idid" id="idid<%= cardCount %>" value="<%=rs.getString("b_acc_no")%>">
                    <script type="text/javascript">
                        var qr<%=cardCount%> = new QRious({
                            element: document.getElementById('qrcode<%= cardCount %>'),
                            value: document.getElementById('idid<%= cardCount %>').value,
                            size: 115
                        });
                    </script>
                    <span><%=rs.getString("b_rackno")%></span>
                </div>

            </div>
<%
            // If 9 cards have been displayed, break the loop
            if (cardCount >= 1000000) {
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
            filename: 'Book QR Codes.pdf',
            image: { type: 'jpeg', quality: 1 },
            html2canvas: { scale: 2 },
            jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
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
