<%-- 
    Document   : index
    Created on : Jan 7, 2026, 3:07:59 PM
    Author     : plazma
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.AccidentDAO, model.Accident" %>

<link href="./css/style.css" rel="stylesheet" />
<link href="./css/srch.css" rel="stylesheet" />

<%@include file="includes/header.jsp"%>
<div class="content">
<h2 style="color:#333;">Ambulance</h2>     
<br><br>

    <table border="1" cellpadding="5">
        <tr>
            <th>Accident ID</th>
            <th>Latitude</th>
            <th>Longitude</th>
            <th>Severity</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <%
    AccidentDAO dao = new AccidentDAO();
    List<Accident> accidents = (List<Accident>) dao.getAllAccidents();

    for(Accident acc : accidents) {
        String status = acc.getStatus();
        String severity = acc.getSeverity();

        // Only show accidents assigned to ambulance or relevant
        if ("Reported".equals(status) || "Verified".equals(status)) {
        %>
        <tr>
            <td><%= acc.getAccidentId() %></td>
            <td><%= acc.getLatitude() %></td>
            <td><%= acc.getLongitude() %></td>
            <td><%= acc.getSeverity() %></td>
            <td><%= status %></td>
            <td>
                <form action="updateStatus" method="post">
                    <input type="hidden" name="id" value="<%= acc.getAccidentId() %>">
            <select name="status">
            <%
                if ("High".equals(severity)) {
                    // High severity → ambulance can always act
            %>
                    <option value="On the Way">On the Way</option>
                    <option value="Completed">Completed</option>
            <%
                } else {
                    // Low/Medium → only if police verified
                    if ("Verify".equals(status)) {
            %>
                        <option value="On the Way">On the Way</option>
                        <option value="Completed">Completed</option>
            <%
                    } else {
            %>
                        <option disabled>Waiting for Police Verification</option>
            <%
                    }
                }
            %>
            </select>
                    <input type="submit" value="Update">
                </form>
            </td>
        </tr>
        <%      } 
            } 
        %>
    </table>
</div>