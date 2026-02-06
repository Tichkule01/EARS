<%@ page language="java" import="java.sql.*" isThreadSafe="false" %>



<%
String err = (String) session.getAttribute("loginError");
session.removeAttribute("loginError");
session.removeAttribute("userId");
%>


<!DOCTYPE html>
<html>
<head>
    <title>EARS Login</title>
    
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body, html {
  height: 100%;
}

.container {
  display: flex;
  height: 100vh;
}

.image-section {
  flex: 1;
  background-color: #eee;
}

.image-section img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.login-section {
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #404040;;
}

.login-box {
  background: #ddd;
  padding: 40px;
  border-radius: 10px;
  box-shadow: 0 8px 16px rgba(0,0,0,0.2);
  width: 100%;
  max-width: 350px;
  text-align: center;
}

.login-box h2 {
  margin-bottom: 20px;
  color: #333;
}

.login-box input {
  width: 100%;
  padding: 10px 12px;
  margin: 10px 0;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
}

.login-box button {
  width: 100%;
  padding: 10px;
  background-color: #404040;;
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 16px;
  margin-top: 10px;
  cursor: pointer;
}

.login-box button:hover {
    color: #404040;
  background-color: #ddd;
  border: 1px solid #404040;
}

.signup {
  margin-top: 15px;
  font-size: 14px;
}

.signup a {
  color: #667eea;
  text-decoration: none;
}

.signup a:hover {
  text-decoration: underline;
}
  </style>    
    
    
</head>
<body>

  <div class="container">
    <div class="image-section">
      <img src="includes/login.jpg" alt="Login Image">
    </div>
    <div class="login-section">
      <div class="login-box">
          
<h2>Login</h2>          
          
<form action="EarsLogin" method="post">
    <input type="email" name="email" placeholder="Enter username" required><br><br>
    <input type="password" name="password" placeholder="Enter password" required><br><br>
    <button type="submit">Login</button>
    <p class="signup">Don't have an account?<a href="register.jsp">Sign up</a></p>
</form>
      </div>
    </div></div>

<% if(request.getParameter("error") != null){ %>
    <p id="fail" style="color:red;">Invalid email/password or account blocked.</p>
<% } %>



  <script>
setTimeout(function() {
    var fail = document.getElementById("fail");
    if (fail) fail.style.display = "none";
}, 10000);

</script>
