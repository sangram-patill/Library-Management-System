<%-- 
    Document   : staff_id_card
    Created on : 17 May, 2023, 9:43:56 AM
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
	<title>YCM Student - Download ID Card</title>
        <style><%@include file="css/jspdashboard.css"%></style>
        <link rel="icon" type="image/x-icon" href="image/fevicon.png">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/qrious/4.0.2/qrious.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/html2canvas@1.0.0-rc.5/dist/html2canvas.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src ="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
	<style media="screen">
               *{
                   font-family: sans-serif;
                 }
		.card1 {
                        background-color: white;
			  border: 2px solid black;
			  padding: 10px;
			  width: 300px;
			  height: 450px;
                        margin-left: 5px;
		}
                .logo1{
                    height: 70px;
                    width: 280px;
                }
                
		.photo1{
			float: left;
                      margin-top: 5px;
		}
		.details1{
			float: left;
			margin-top: 5px;
		}
		.name1{
			font-weight: bold;
			font-size: 15px;
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
	</style>
</head>
<body onload="autoClick();">
    <%
        if(session.getAttribute("username")==null)
        {
            response.sendRedirect("../index.jsp");
        }
        %>
        <style><%@include file="staff/../staff_dashboard.jsp"%></style>       
         
         <!---Start Editing from Below Code--->
         
         <div class="container">
            <div class="content">                   
                  <div class="cards">
                        <div class="card">
                            <div class="box"> 
    <br><br>
        <% 
            try {
                 Connection cn = null; Statement st=null;
                 Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                 String sql = "select * from staff where registration_no = '"+session.getAttribute("registration_no")+"'"; ResultSet rs = st.executeQuery(sql);

                    while (rs.next()) 
                    {
                    %>
                        <div class="card1" id="card">
            <header>
                <img class="logo1" src="../image/id_header.jpg" alt="Logo">
            </header>
            
		<div class="photo1">
                    <img src="../image/Staff/<%=rs.getString("staff_photo")%>" width="95" height="105" style="margin-top: -125px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
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
			<div class="name1"><%=rs.getString("staff_name")%></div>
			<div>
				<span class="label1">Registration NO:</span>
                                <span class="value1" id="roll"><%=rs.getString("registration_no")%></span>
			</div>
			<div>
				<span class="label1">Department:</span>
				<span class="value1"><%=rs.getString("department")%></span>
			</div>
                        <div>
				<span class="label1">D.O.B :</span>
				<span class="value1"><%=rs.getString("dob")%></span>
			</div>
			<div>
				<span class="label1">Address:</span>
				<span class="value1"><%=rs.getString("city")%></span>
			</div>
                        <div>
				<span class="label1">Mobile No:</span>
				<span class="value1"><%=rs.getString("mobile")%></span>
			</div>
		</div>
                        
                <img class="sign1" src="../image/psign.png" alt="Logo">  
                
                </div>
                        <button class="addbook" onclick="screenshot();"  style="margin-left: 30px; background-color: none;">Download</button>
                    <%
                }
            } 
            catch (Exception ex) 
            {
                out.println(ex.toString());
            } 
        %>
    
                </div>                           
                        </div>                     
                  </div>
            </div>
        </div>
                <script>
                    function screenshot() {
                    var shot = document.getElementById('card');
                    domtoimage.toBlob(shot).then
                    (function(blob) 
                    {
                      var url = URL.createObjectURL(blob);
                      var a = document.createElement('a');
                      a.href = url;
                      a.download = 'Staff ID card.png'; // set the filename
                      a.click();
                      URL.revokeObjectURL(url);
                    })
                    .Catch(function(error) {
                      console.error('error found', error);
                    });
                  }
                 </script>
</body>
</html>


