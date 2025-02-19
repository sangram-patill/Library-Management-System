<%-- 
    Document   : student_dashboard
    Created on : 10 Apr, 2023, 9:45:51 PM
    Author     : Aditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
        <meta name="viewport" content="width=device-width,intial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Student - Dashboard Page</title> 
        <style><%@include file="css/jspdashboard.css"%></style>
        <link rel="icon" type="image/x-icon" href="image/fevicon.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Lexend+Mega:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
</head>
<body>
            <nav>             
            <h6 class="heading">YCM LIBRARY</h6>            
            <hr>          
            <ul>                
                <!--one-->                
                    <li class="dropdown">
                        <a href="student_home.jsp">
                            <script class="icon" src="https://cdn.lordicon.com/ritcuqlt.js"></script>
                            <lord-icon
                                src="https://cdn.lordicon.com/mrdiiocb.json"
                                trigger="hover"
                                style="width:30px;height:30px">
                            </lord-icon>&nbsp;
                            Dashboard                           
                        </a>
                    </li>            
                
                <!--two-->  
                <!--three-->               
                             
                                
                <!--four-->                
                <li class="dropdown">                    
                            <a href="#" class="modify-btn">
                                <script class="icon" src="https://cdn.lordicon.com/ritcuqlt.js"></script>
                                <lord-icon
                                    src="https://cdn.lordicon.com/hkkhwztk.json"
                                    trigger="hover"
                                    style="width:30px;height:30px">
                                </lord-icon>&nbsp;
                                Inventory                            
                                <span class="fas fa-caret-down three"></span>  
                            </a>
                        <ul class="modify-show">
                            <li class="dropdown_two"><a href="student_available_book_stock.jsp"class="stock-modify-btn"> ● Available Books</a></li>
                            <li class="dropdown_two"><a href="student_book_stock.jsp"class="stock-modify-btn"> ● Total Books</a></li>                                   
                            <li class="dropdown_two"><a href="student_journal_stock.jsp"class="general-modify-btn"> ● Journal</a></li>
                            <li class="dropdown_two"><a href="student_magazine_stock.jsp"class="general-modify-btn"> ● Magazine</a></li>
                            <li class="dropdown_two"><a href="student_newspaper_stock.jsp"class="general-modify-btn"> ● Newspaper</a></li>
                        </ul>                    
                </li>                                        
                
                <!--five-->                
                                       
                        <li class="dropdown">
                        <a href="student_fine.jsp">
                            <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
                            <lord-icon
                                src="https://cdn.lordicon.com/xcevpeyr.json"
                                trigger="hover"
                                colors="primary:#121331"
                                style="width:30px;height:30px">
                            </lord-icon>&nbsp;
                            Fine                           
                        </a>
                    
                     <li class="dropdown">
                        <a href="student_transaction.jsp">
                            <script class="icon" src="https://cdn.lordicon.com/ritcuqlt.js"></script>
                            <lord-icon
                                    src="https://cdn.lordicon.com/tgolujfo.json"
                                    trigger="hover"
                                    colors="primary:#121331"
                                    style="width:30px;height:30px">
                                </lord-icon>&nbsp;
                            Transaction                           
                        </a>
                    </li> 
                <form name="student_dashboard" action="../student_id" method="post">

                    <li class="dropdown">
                        <a href="#">
                            <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
                            <lord-icon
                                src="https://cdn.lordicon.com/ausvvtws.json"
                                trigger="hover"
                                colors="primary:#121331"
                                style="width:30px;height:30px">
                            </lord-icon>&nbsp;
                            <input type="hidden" value="<%session.getAttribute("username");%>" name="registration_no">
                            <input class="stock" type="submit" value="Download ID" name="submit">                           
                        </a>
                    </li>
                    
                        </form>

                <!--six-->               
<!--                    <li class="dropdown">
                        <a href="#">
                                <script class="icon" src="https://cdn.lordicon.com/ritcuqlt.js"></script>
                                 <lord-icon
                                     src="https://cdn.lordicon.com/rlizirgt.json"
                                     trigger="hover"
                                     style="width:30px;height:30px">
                                 </lord-icon>&nbsp;
                                 Search                                                       
                        </a>                        
                    </li>       -->
                
                <!--seven-->               
                    <form action="../logout" method="post">
                        <li class="dropdown">
                            <a>
                                <script class="icon" src="https://cdn.lordicon.com/ritcuqlt.js"></script>
                                <lord-icon
                                    src="https://cdn.lordicon.com/jxwksgwv.json"
                                    trigger="hover"
                                    style="width:30px;height:30px">
                                </lord-icon>&nbsp;
                                <input style="color: black" class="btn btn-link" type="submit" name="btn" value="Logout">  
                            </a>                 
                        </li>
                     </form>
            </ul>              
        </nav>      
        <script>            
            $('.stock-btn').click(function(){
                $('nav ul .stock-show').toggleClass("show")
                $('nav ul .one').toggleClass("rotate")
            });             
            $('.master-btn').click(function(){
                $('nav ul .master-show').toggleClass("show2")
                $('nav ul .two').toggleClass("rotate")
            });            
            $('.modify-btn').click(function(){
                $('nav ul .modify-show').toggleClass("show3")
                $('nav ul .three').toggleClass("rotate")
            });            
            $('.trans-btn').click(function(){
                $('nav ul .trans-show').toggleClass("show4")
                $('nav ul .four').toggleClass("rotate")
            });            
            $('.curr-btn').click(function(){
                $('nav ul .curr-show').toggleClass("show5")
                $('nav ul .five').toggleClass("rotate")
            });            
            $('.user-btn').click(function(){
                $('nav ul .user-show').toggleClass("show6")
                $('nav ul .six').toggleClass("rotate")
            });            
            $('.stock-modify-btn').click(function(){
                $('nav ul .stock-modify-show').toggleClass("show7")
                $('nav ul .seven').toggleClass("rotate")
            });            
            $('.general-modify-btn').click(function(){
                $('nav ul .general-modify-show').toggleClass("show8")
                $('nav ul .eight').toggleClass("rotate")
            });
                        
            $('.give-btn').click(function(){
                $('nav ul .give-show').toggleClass("show9")
                $('nav ul .nine').toggleClass("rotate")
            });
        </script>
               
        <!--Container And Search Bar Starts Here-->
        
     <div class="container">
        <div class="header">
            <div class="nav">
              
                <div class="logo">
                      <img class="logo" src="image/yc_logo.png" alt="Logo">
                </div>
                <div>
                    <h4 style="margin-left: 200px">Yashwantrao Chavan Mahavidyalaya, Urun-Islampur</h4>
                </div>
                <div class="user">
                    <div class="img-case">
                        <img src="../image/Student/<%=session.getAttribute("image")%>" alt="NO Image found...">
                    </div>
                </div>
            </div>
        </div>       
        </div>
    </body>
</html>


