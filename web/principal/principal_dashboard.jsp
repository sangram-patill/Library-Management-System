<%-- 
    Document   : principal_dashboard
    Created on : 26 Feb, 2023, 4:20:04 PM
    Author     : Aditya
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta name="viewport" content="width=device-width,intial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Principal - Dashboard Page</title> 
        <style><%@include file="css/jspdashboard.css"%></style>
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
                        <a href="principal/../principal_home.jsp">
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
                            <li class="dropdown_two"><a href="principal_available_book_stock.jsp"class="stock-modify-btn"> ● Available Books</a></li>
                            <li class="dropdown_two"><a href="principal_book_stock.jsp"class="stock-modify-btn"> ● Total Books</a></li>                                   
                            <li class="dropdown_two"><a href="principal_journal_stock.jsp"class="general-modify-btn"> ● Journal</a></li>
                            <li class="dropdown_two"><a href="principal_magazine_stock.jsp"class="general-modify-btn"> ● Magazine</a></li>
                            <li class="dropdown_two"><a href="principal_newspaper_stock.jsp"class="general-modify-btn"> ● Newspaper</a></li>
                        </ul>                    
                    </li> 
                
                <!--three-->                                                                                            
                    <li class="dropdown">                    
                            <a href="#" class="give-btn">
                                <script class="icon" src="https://cdn.lordicon.com/ritcuqlt.js"></script>
                                <lord-icon
                                    src="https://cdn.lordicon.com/tgolujfo.json"
                                    trigger="hover"
                                    style="width:30px;height:30px">
                                </lord-icon>&nbsp;
                                Transaction                            
                                <span class="fas fa-caret-down nine"></span>  
                            </a>
                        <ul class="give-show">
                            <li><a href="principal_student_transaction.jsp" class="sub-item">● Stud Issue Transaction</a></li>
                            <li><a href="principal_staff_transaction.jsp" class="sub-item">● Staff Issue Transaction</a></li>
                        </ul>                    
                    </li>
                               
                <!--four-->                      
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
                    </li>-->
                    
                <!--five-->                             
                     
                     <li class="dropdown">
                        <a href="#" class="lost-btn">
                            <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
                            <lord-icon
                                src="https://cdn.lordicon.com/jmkrnisz.json"
                                trigger="hover"
                                colors="primary:#121331"
                                style="width:30px;height:30px">
                            </lord-icon>&nbsp; 
                            Lost/Disposal List
                            <span class="fas fa-caret-down eleven"></span> 
                        </a>
                        <ul class="lost-show">
                            <a href="principal_book_lost.jsp" class="sub-item">● Book</a>
                            <a href="principal_journal_lost.jsp" class="sub-item">● Journal</a>
                            <a href="principal_magazine_lost.jsp" class="sub-item">● Magazine</a>
                        </ul>                         
                    </li>
                    
                <!--seven-->                                 
                     <li class="dropdown">
                        <a href="#" class="curr-btn">
                            <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
                            <lord-icon
                                src="https://cdn.lordicon.com/xcevpeyr.json"
                                trigger="hover"
                                colors="primary:#121331"
                                style="width:30px;height:30px">
                            </lord-icon>&nbsp;
                            Fine Master
                            <span class="fas fa-caret-down five"></span> 
                        </a>
                        <ul class="curr-show">
                                <a href="principal_student_fine.jsp" class="sub-item">● Student</a>
                                <a href="principal_staff_fine.jsp" class="sub-item">● Staff</a>
                        </ul>
                    </li>  
                   
                 <!--eight-->                                                      
                    <form name="dashboard.jsp" action="view_report.jsp">
                    <li class="dropdown">
                        <a href="#" class="report-btn">
                            <script class="icon" src="https://cdn.lordicon.com/ritcuqlt.js"></script>
                            <lord-icon
                                src="https://cdn.lordicon.com/frjgvxce.json"
                                trigger="hover"
                                style="width:30px;height:30px">
                            </lord-icon>&nbsp; 
                            Reports
                            <span class="fas fa-caret-down twelve"></span> 
                        </a>
                        <ul class="report-show">
                            <a href="principal_book_report.jsp" class="sub-item">● Book</a>
                            <a href="principal_journal_report.jsp" class="sub-item">● Journal</a>
                            <a href="principal_magazine_report.jsp" class="sub-item">● Magazine</a>
                            <a href="principal_newspaper_report.jsp" class="sub-item">● Newspaper</a>
                            <a href="principal_update_newspaper_report.jsp" class="sub-item">● Update Newspaper</a>
                            <a href="student_report.jsp" class="sub-item">● Student</a>
                            <a href="staff_report.jsp" class="sub-item">● staff</a>
                            <a href="student_issue_report.jsp" class="sub-item">● Student Issue</a>
                            <a href="student_return_report.jsp" class="sub-item">● Student Return</a>
                            <a href="staff_issue_report.jsp" class="sub-item">● Staff Issue</a>
                            <a href="staff_return_report.jsp" class="sub-item">● Staff Return</a>
                            <a href="principal_invoice_report.jsp" class="sub-item">● Invoice</a>
                            <a href="principal_book_lost_report.jsp" class="sub-item">● Book Lost/Disposal</a>
                            <a href="principal_journal_lost_report.jsp" class="sub-item">● Journal Lost/Disposal</a>
                            <a href="principal_magazine_lost_report.jsp" class="sub-item">● Magazine Lost/Disposal</a>
                            <a href="principal_department_report.jsp" class="sub-item">● Department</a>
                            <a href="principal_binder_report.jsp" class="sub-item">● Binder</a>
                            <a href="principal_vendor_report.jsp" class="sub-item">● Vendor</a>                                                                
                        </ul>                         
                    </li>
                    </form>
                    
                  <!--nine-->                               
                    <li class="dropdown">
                        <a href="../index.jsp">
                            <script class="icon" src="https://cdn.lordicon.com/ritcuqlt.js"></script>
                            <lord-icon
                                src="https://cdn.lordicon.com/jxwksgwv.json"
                                trigger="hover"
                                style="width:30px;height:30px">
                            </lord-icon>&nbsp;
                            Logout                           
                        </a>                        
                    </li>
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
            $('.lost-btn').click(function(){
                $('nav ul .lost-show').toggleClass("show10")
                $('nav ul .eleven').toggleClass("rotate")
            });
            $('.report-btn').click(function(){
                $('nav ul .report-show').toggleClass("show12")
                $('nav ul .twelve').toggleClass("rotate")
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
                          <img src="../image/Create User/<%=session.getAttribute("image")%>" alt="NO Image found01">
                    </div>
                </div>
            </div>
        </div>       
        </div>
    </body>
</html>
