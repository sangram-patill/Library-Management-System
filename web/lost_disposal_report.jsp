<%-- 
    Document   : lost_disposal_report
    Created on : 16 May, 2023, 1:16:44 PM
    Author     : Aditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Admin - Lost/Disposal Report </title> 
        <style><%@include file="css/jspdashboard.css"%></style>
        <link rel="icon" type="image/x-icon" href="image/fevicon.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script type="text/javascript" src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Lexend+Mega:wght@300&display=swap" rel="stylesheet">
   
        <style>
            .container .content .cards .card
            {
                width: 1200px;
                height: 700px;    
                background: white;
                margin: 20px 20px;
                padding-top: 10px;
                display: flex;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            .in{
                color: black;
                background: #4FBDBA;
                width: 130px;
                height: 30px;
                margin-left: 125px;
                color: white;
                border-radius: 5px;
                border: 1px solid #ccc;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
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

        
        <div class="container">
         <!---Start Editing from Below Code--->
            <div class="content">                   
                <div class="cards">
                    <div class="card">
                        <br>
                        <form name="lost_disposal_report" action="view_report.jsp" method="post">
                            
                                 <div class="row">
                                    <div class="col-sm-6">
                                         <h4 style="margin: 0% 0% 0% 2%">Lost/Disposal Reports</h4>
                                    </div> 
                                     <div class="col-sm-6">
                                         <input class="stock" type="submit" name="submit" value="Full Lost/Disposal Report">
                                    </div>
                                 </div>
                
                
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%;">
                
                            
                            <div class="row">
                                    <div class="col-sm-4"><label for="issue-date" class="x">Enter Accessing ID</label></div>
                            </div><br>                
                    <div class="row">
                       <div class="col-sm-4"><input type="text" name="id" class="y"></div>
                       <div class="col-sm-4"><input type="date" name="date" class="y"></div>
                       <div class="col-sm-4"><input type="date" name="date" class="y"></div>
                    </div> <br><br>   
                            
                             <!--Buttons-->
               <div class="row">
                   <input class="in" type="submit" name="submit" value="vendor">
                    
                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>     
    </body>
</html>

