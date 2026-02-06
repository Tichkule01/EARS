<%-- 
    Document   : track
    Created on : Feb 3, 2026, 12:12:53 PM
    Author     : plazma
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.AccidentTrackingDAO, model.AccidentTracking" %>

<link href="./css/style.css" rel="stylesheet" />
<link href="./css/srch.css" rel="stylesheet" />

<%@include file="includes/header.jsp"%>
<div class="content">
<h2 style="color:#333;">Track</h2>     
<br><br>


<form method="get" action="track.jsp">
    <table class="search-table" border="0">
        <tr class="search-tr">
            <th class="search-th" style="width: 15%;"><div align="center">Enter Accident ID</div></th>
            <td class="search-td" style="width: 50%">
                <input type="number" name="st" id="st" style="width: 100%;">
            </td>
            <td class="search-td">
                <input type="submit" name="search" id="search" value="Search Record" style="width: 100%;">
            </td>
        </tr>
    </table>
</form>


    <table border="1" cellpadding="5">
        <tr>
            <th>Tracking ID</th>
            <th>Accident ID</th>
            <th>Emergency Req Id</th>
            <th>Status</th>
            <th>Action</th>
            <th>Time</th>
        </tr>

        <%
            
int searchId = 0;
String param = request.getParameter("st");

if (param != null && !param.isEmpty()) {
    searchId = Integer.parseInt(param);
}

AccidentTrackingDAO dao = new AccidentTrackingDAO();
List<AccidentTracking> accidents = new ArrayList<>();

if (searchId > 0) {
    accidents = dao.getTrackingByAccident(searchId);
}

    for(AccidentTracking acc : accidents) {       
SimpleDateFormat sdf = new SimpleDateFormat("MMMM dd, yyyy HH:mm:ss");
        
String Action=acc.getResponderType();
if ("Police".equals(Action) || "USER".equals(Action) || "POLICE".equals(Action)){
        %>
        <tr>
            <td><%= acc.getTrackingId() %></td>
            <td><%= acc.getAccidentId() %></td>            
            <td><%= acc.getRequestId() %></td>
            <td><%= acc.getAction() %></td>
            <td><%= acc.getResponderType() %></td>
            <td><%= sdf.format(acc.getActionTime()) %></td>
        </tr>
        <%      
            } }
        %>
    </table>
</div>
