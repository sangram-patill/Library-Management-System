<%-- 
    Document   : vendor_transaction
    Created on : 30 Mar, 2023, 2:30:26 PM
    Author     : Aditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Secretary - Vendor Transaction</title> 
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
            .container .content .cards .card
            {
                width: 1200px;
                height: 730px;     /*Change Div height here*/
                background: white;
                margin: 20px 20px;
                display: flex;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }

            form {
                    margin: 20px;
            }

            h1 {
                    margin-bottom: 20px;
            }

            label {
                    display: inline-block;
                    width: 100px;
                    margin-bottom: 10px;
            }

            input[type="text"], input[type="number"] {
                    width: 200px;
                    padding: 5px;
                    border-radius: 5px;
                    border: 1px solid #ccc;
                    margin-bottom: 10px;
            }

            #books {
                    margin-bottom: 20px;
            }

            .book {
                    margin-bottom: 10px;
            }

            #addBookBtn {
                    display: block;
                    padding: 10px;
                    border-radius: 5px;
                    background-color: #4FBDBA;
                    color: #fff;
                    border: none;
                    cursor: pointer;
                    margin-bottom: 20px;
            }

            #addBookBtn:hover {
                    background-color: #99C4C8;
                    color: black;
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
        <style><%@include file="secretary/../secretary_dashboard.jsp"%></style>
        <div class="container">
            <div class="content">                   
                  <div class="cards">
                        <div class="card">
                            <div class="box">
                             
  
                            </div>
                        </div>
                  </div>
            </div>
        </div>        
    </body>
</html>
