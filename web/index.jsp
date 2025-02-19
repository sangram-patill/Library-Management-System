<%-- 
    Document   : index
    Created on : 25 Apr, 2023, 2:51:30 PM
    Author     : sangr
--%>
<% 
    session.setAttribute("username",null);
    session.setAttribute("password",null);
    session.setAttribute("role",null);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM - Login</title>
        <link rel="icon" type="image/x-icon" href="image/fevicon.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Lexend+Mega:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <style>            
            *{
                font-family: 'Lexend Mega', sans-serif;
                text-decoration: none;
            }
            body
            {
                background-image: url(image/ba.jpg);
                background-repeat: no-repeat;
                background-size: 100%;
            }
        
            .container {
                    max-width: 650px;
                    margin: 50px auto;
                    margin-top: 10px;
                    padding: 20px;
                    background-color:whitesmoke;
                    border-radius: 10px;
                    box-shadow: 0 0 10px rgba(0,0,0,0.2);
            }
            #showPassword {
                cursor: pointer;
                color: blue;
            }

            h1 {
                    text-align: center;
                    margin-bottom: 20px;
                    padding: 5px;
                    color: #333;
                    font-family: 'Lexend Mega', sans-serif;
                    background-color: #4FBDBA;
                    width: 100%;
                    height: 50px;
                    box-shadow: 0 2px 25px 0 rgba(0, 0, 0,0.9);
            }
            h2 {
                    text-align: center;
                    color: #22A39F;
                    margin-top: 0px;
            }
            form {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
            }
            .radio-buttons {
                    display: flex;
                    margin-bottom: 20px;
            }
            .radio-buttons label {
                    margin-right: 20px;
            }
            .input-field {
                    display: flex;
                    flex-direction: column;
                    margin-bottom: 20px;
            }
            label {
                    color: #333;
                    margin-top: 20px;
            }
            input[type="text"],
            input[type="password"] {
                    padding: 10px;
                    border: none;
                    border-radius: 5px;
                    background-color: #fff;
                    color: #333;
                    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.6);
            }
            .submit{
                    padding: 10px;
                    width: 150px;
                    background-color: #22A39F;
                    color: #fff;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    transition: background-color 0.2s;
            }
            .submit:hover {
                    background-color: #4FBDBA;
            }
            .logo{
                height: 150px;
                width: 150px;
                margin-top: 10px;
                margin-left: 45%;                
            }
            
        </style>
    </head>
    <body>
         <img class="logo" src="image/yc_logo.png" alt="Logo">

        <h1>Yashwantrao Chavan Mahavidyalaya</h1>
        <div class="container">
		<h2>Login</h2>
                <form name="index" action="index" method="post">
		<label for="username">Username:</label>
		<input type="text" name="username" required>
		<label  for="password">Password:</label>
		<input type="password"  id="password" name="password" required><br>
                <span id="showPassword" onclick="togglePassword()">Show Password</span>
		<label for="role">Select your role:</label>
                <div class="radio-buttons">
                        <label>
                                <input style="margin-left:18px" type="radio" name="role" value="admin">
                                Admin
                        </label>
                        <label>
                            <input style="margin-left:18px" type="radio" name="role" value="principal">
                                Principal
                        </label>
                         <label>
                            <input style="margin-left:18px" type="radio" name="role" value="secretary">
                                Secretary
                        </label>
                </div>
                <div class="radio-buttons">
                        <label>
                            <input style="margin-left:40px" type="radio" name="role" value="student">
                                Student
                        </label>
                        <label>
                            <input style="margin-left:13px" type="radio" name="role" value="staff">
                                Staff
                        </label>
                        <label>
                                <input style="margin-left:15px" type="radio" name="role" value="assistant">
                                Library Assistant
                        </label>
                </div>
                <input class="submit" type="submit" value="Login" name="submit">
	</form>
	</div>
        <script type="text/javascript">
           function togglePassword() {
                var passwordField = document.getElementById("password");
                var passwordToggle = document.getElementById("showPassword");
                if (passwordField.type === "password") {
                  passwordField.type = "text";
                  passwordToggle.innerHTML = "Hide Password";
                } else {
                  passwordField.type = "password";
                  passwordToggle.innerHTML = "Show Password";
                }
            }
        </script>
    </body>
</html>
