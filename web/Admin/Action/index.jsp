<%@ page import="java.util.*, dao.AdminDAO, dao.AuthDAO, model.User" %>
<%@ page import="java.sql.*" %>
<%
    String message = "";

    // Handle POST actions
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String action = request.getParameter("action");
        int userId = Integer.parseInt(request.getParameter("userId"));

        try {
            if ("unblock".equals(action)) {
                AuthDAO.resetFail(userId);
                message = "User " + userId + " unblocked successfully.";
            } else if ("delete".equals(action)) {
                AdminDAO.deleteUser(userId);
                message = "User " + userId + " deleted successfully.";
            } else if ("update".equals(action)) {
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("email");
                String role = request.getParameter("role");
                AdminDAO.updateUser(userId, fullName, email, role);
                message = "User " + userId + " updated successfully.";
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
    }

    // Fetch all users
    List<User> users = AdminDAO.getAllUsers();
%>


    
<link href="css/style.css" rel="stylesheet" />
<link href="css/srch.css" rel="stylesheet" />    
    
    
    <title>Admin Panel - EARS</title>

 <%@include file="includes/header.jsp"%>
<div class="content">    
    
<h2>Admin Panel</h2>
<p style="color: green;"><%= message %></p>

<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Status</th>
        <th>Failed Attempts</th>
        <th>Actions</th>
    </tr>
    <%
        for (User u : users) {
    %>
    <tr>
        <td><%= u.getUserId() %></td>
        <td>
            <!-- Form starts inside this td -->
            <form method="post">
                <input type="hidden" name="userId" value="<%= u.getUserId() %>"/>
                <input type="text" name="fullName" value="<%= u.getFullName() %>"/>
        </td>
        <td><input type="email" name="email" value="<%= u.getEmail() %>"/></td>
        <td>
            <select name="role">
                <option value="USER" <%= "USER".equals(u.getRole()) ? "selected" : "" %>>USER</option>
                <option value="POLICE" <%= "POLICE".equals(u.getRole()) ? "selected" : "" %>>POLICE</option>
                <option value="AMBULANCE" <%= "AMBULANCE".equals(u.getRole()) ? "selected" : "" %>>AMBULANCE</option>
                <option value="ADMIN" <%= "ADMIN".equals(u.getRole()) ? "selected" : "" %>>ADMIN</option>
            </select>
        </td>
        <td><%= u.getStatus() %></td>
        <td><%= u.getFailedAttempts() %></td>
        <td>
            <button type="submit" name="action" value="update">Update</button>
            <button type="submit" name="action" value="unblock">Unblock</button>
            <button type="submit" name="action" value="delete" onclick="return confirm('Delete this user?');">Delete</button>
            </form> <!-- Form ends here -->
        </td>
    </tr>
    <% } %>
</table>
</div>

