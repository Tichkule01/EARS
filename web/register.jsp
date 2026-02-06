<%-- 
    Document   : register
    Created on : Jan 5, 2026, 12:34:41 PM
    Author     : plazma
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Register</title></head>
<body>
<h2>Register</h2>
<form action="register" method="post">
    Name: <input type="text" name="name" required /><br/>
    Email: <input type="email" name="email" required /><br/>
    Password: <input type="password" name="password" required /><br/>
    <input type="submit" value="Register" />
</form>

<% if(request.getParameter("error") != null) { %>
    <p style="color:red;">
        <% if(request.getParameter("error").equals("1")) { %>
            Email already exists.
        <% } else { %>
            Registration failed. Try again.
        <% } %>
    </p>
<% } %>

<p>Already have account? <a href="login.jsp">Login</a></p>
</body>
</html>
