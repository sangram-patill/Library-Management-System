<%-- 
    Document   : student
    Created on : 11 Mar, 2023, 7:33:37 PM
    Author     : sangr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Student - Student</title> 
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
        .container .content .cards .card{
    width: 1200px;
    height: 600px;     /*Change Div height here*/
    background: white;
    margin: 20px 20px;
    display: flex;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),0 6px 20px 0 rgba(0, 0, 0, 0.19);
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
        <style><%@include file="dashboard.jsp"%></style>
              
        <!--Container And Search Bar Starts Here-->
        
     <div class="container">
         <!---Start Editing from Below Code--->
            <div class="content">                   
                  <div class="cards">
                        <div class="card">
                            <div class="box">                                
                                          <br>
                <h4 style="margin: 0% 0% 0% 2%">Student Registration</h4>
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%;">
                
                <!--First and Second Row-->
                <div class="row">
                    <div class="col-sm-4"><label class="x">Registration No</label></div>
                    <div class="col-sm-4"><label for="department" class="x">Department</label></div>
                    <div class="col-sm-4"><label for="year" class="x">Year/Stream</label></div>
                   
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <%
                            if(request.getParameter("registration_no")!=null)
                            {
                            %>
                                    <input type="text" name="registration_no" class="y" value="<%=request.getParameter("registration_no")%>" id="accessing_no">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="text" name="registration_no" class="y">

                            <%
                            }
                        %>
                    </div>
                   <div class="col-sm-4">
                       <select id="department" name="department" class="y">
                         <option>Select Department</option>
                         <option name="department" value="eleven">11th</option>                         
                         <option name="department" value="twelve">12th</option>
                         <option name="department" value="ba">BA</option>
                         <option name="department" value="bcom">B.Com</option>
                         <option name="department" value="bsc">BSC</option>
                         <option name="department" value="bca">BCA</option>
                         <option name="department" value="bba">BBA</option>
                         <option name="department" value="mcom">M.Com</option>
                          <option name="department" value="ma">MA</option>
                        </select>
                    </div>                  
                    <div class="col-sm-4">
                        <select id="year" name="year" class="y">
                              <option>Select year/stream</option>
                              <option name="department" value="arts">Arts</option>
                              <option name="department" value="commerce">Commerce</option>
                              <option name="department" value="12_arts">12th Arts</option>
                              <option name="department" value="12_commerce">12th Commerce</option>
                              <option name="department" value="1">1st</option>
                              <option name="department" value="2">2nd</option>
                              <option name="department" value="3">3rd</option>
                         </select>
                    </div>
                </div><br><br>
                    <!--Third and Fourth Row-->
                <div class="row">
                   <div class="col-sm-4"><label class="x">Full Name</label></div>
                   <div class="col-sm-4"><label class="x">Mobile No</label></div>
                   <div class="col-sm-4"><label class="x">Email</label></div>
                </div>
                <div class="row">
                   <div class="col-sm-4"><input type="text" name="fullname" class="y"></div>
                   <div class="col-sm-4"><input type="text" name="mobileno" class="y"></div>
                   <div class="col-sm-4"><input type="text" name="email" class="y" ></div>
                </div><br><br>
                    <!--fifth and Six Row-->
                 <div class="row">
                   <div class="col-sm-4"><label class="x">Address</label></div>
                   <div class="col-sm-4"><label class="x">City</label></div>
                   <div class="col-sm-4"><label class="x">Taluka</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4"><input type="text" name="address" class="y"></div>
                    <div class="col-sm-4"><input type="text" name="city" class="y"></div>
                    <div class="col-sm-4"><input type="text" name="taluka" class="y"></div>
                </div><br><br>
                    <!--Seven and Eight Row-->
                <div class="row">
                    <div class="col-sm-4"><label class="x">District</label></div> 
                    <div class="col-sm-4"><label class="x">State</label></div>
                    <div class="col-sm-4"><label class="x">Pin Code</label></div>
                       
                </div>
                <div class="row">
                    <div class="col-sm-4"><input type="text" name="district" class="y"></div>
                    <div class="col-sm-4"><input type="text" name="state"class="y"></div>
                    <div class="col-sm-4"><input type="text" name="pincode"class="y"></div>
                </div><br><br>
                    <!--Nine and Ten Row-->
                <div class="row">
                    <div class="col-sm-4"><label class="x">Gender</label></div>
                    <div class="col-sm-4"><label class="x">Upload Photo</label></div>                   
                </div>
                <div class="row">
                    <div class="col-sm-4">
                         <input style="margin-left: 70px;" type="radio" value="Male" name="gender"><label for="Male">Male</label>
                         <input type="radio" value="Female" name="gender"><label for="Female">Female</label>
                         <input type="radio" value="Other" name="gender"><label for="Other">Other</label>
                    </div>
                    <div class="col-sm-4">
                        <input type="file" name="fileToUpload" id="fileToUpload" style="margin-left: 70px;">
                    </div>
                </div><br><br>
                 
                 <!--Buttons-->
               <div class="row">
                   <div class="col-sm-3"><input type="submit" name="submit" value="Register" class="addbook" style="margin-left: 50px;"></div>
               </div>
                 
                     
                                
                                
                            </div>                           
                        </div>                     
                  </div>
            </div>
        </div>
    </body> 
</html>
