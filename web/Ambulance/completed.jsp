<%-- 
    Document   : completed
    Created on : Feb 1, 2026, 2:55:48 PM
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
<h2 style="color:#333;">Completed</h2>     
<br><br>

    <table border="1" cellpadding="5">
        <tr>
            <th>Accident ID</th>
            <th>Latitude</th>
            <th>Longitude</th>
            <th>Severity</th>
        </tr>

        <%
    AccidentDAO dao = new AccidentDAO();
    List<Accident> accidents = (List<Accident>) dao.getAllAccidents();

    for(Accident acc : accidents) {
        String status = acc.getStatus();

        // Only show accidents assigned to ambulance or relevant
        if ("Completed".equals(status)) {
        %>
        <tr>
            <td><%= acc.getAccidentId() %></td>
            <td><%= acc.getLatitude() %></td>
            <td><%= acc.getLongitude() %></td>
            <td><%= acc.getSeverity() %></td>
            <td><%= status %></td>
        </tr>
        <%      } 
            } 
        %>
    </table>

