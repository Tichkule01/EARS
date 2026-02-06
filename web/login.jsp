<%-- 
    Document   : login.jsp
    Created on : Jan 5, 2026, 12:34:25 PM
    Author     : plazma
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Login</title></head>
<body>
<h2>Login</h2>
<form action="login" method="post">
    Email: <input type="email" name="email" required /><br/>
    Password: <input type="password" name="password" required /><br/>
    <input type="submit" value="Login" />
</form>

<% if(request.getParameter("error") != null) { %>
    <p style="color:red;">Invalid email/password or account blocked.</p>
<% } %>

<p>Don't have account? <a href="register.jsp">Register</a></p>
</body>
</html>
