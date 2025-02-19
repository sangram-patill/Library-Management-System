<%-- 
    Document   : principal_current_magazine_status
    Created on : 30 Apr, 2023, 12:48:14 PM
    Author     : Aditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Principal - Current Magazine Status</title> 
        <style><%@include file="css/jspdashboard.css"%></style>
        <link rel="icon" type="image/x-icon" href="image/fevicon.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
    </style>
    
    <body>  
        <%
        if(session.getAttribute("username")==null)
        {
            response.sendRedirect("index.jsp");
        }
        %>
        <style><%@include file="principal/../principal_dashboard.jsp"%></style>       
 
                 <!--Start Editing from Below Code-->
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
