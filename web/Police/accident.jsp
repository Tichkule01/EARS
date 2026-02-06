<%-- 
    Document   : accident
    Created on : Jan 30, 2026, 3:02:55 PM
    Author     : plazma
--%>

<%-- 
    Document   : index
    Created on : Jan 7, 2026, 3:06:26 PM
    Author     : plazma
--%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.AccidentDAO, model.Accident" %>
<link href="./css/style.css" rel="stylesheet" />
<link href="./css/srch.css" rel="stylesheet" />
<%
int x=1;
%>


<%@include file="includes/header.jsp"%>
<div class="content">
<h2 style="color:#333;">Reported Accident</h2>     
<br><br>

<form method="get" action="accident.jsp">
    <table class="search-table" border="0">
        <tr class="search-tr">
            <th class="search-th" style="width: 15%;"><div align="center">Status</div></th>
            <td class="search-td" style="width: 50%">
                <select name="st" id="st" style="width:100%;">
                    <option value="" <%= (request.getParameter("st")==null || request.getParameter("st").isEmpty()) ? "selected" : "" %>>All</option>         
                    <option value="Case Solved" <%= "Case Solved".equals(request.getParameter("st")) ? "selected" : "" %>>Resolved</option>
                    <option value="Reported" <%= "Reported".equals(request.getParameter("st")) ? "selected" : "" %>>Reported</option>
                    <option value="Verified" <%= "Verified".equals(request.getParameter("st")) ? "selected" : "" %>>Verified</option>
                    <option value="Ignored" <%= "Ignored".equals(request.getParameter("st")) ? "selected" : "" %>>Ignored</option>
                    <option value="Ride Completed" <%= "Ride Completed".equals(request.getParameter("st")) ? "selected" : "" %>>Ambulance Ride Completed</option>
                </select>
            </td>
            <td class="search-td">
                <input type="submit" name="search" id="search" value="Search Record" style="width: 100%;">
            </td>
        </tr>
    </table>
</form>

<br>
<hr>
<br>



    <table id="Output" border="1" cellpadding="5">
        <tr>
            <th>S.N.</th>
            <th>Accident ID</th>
            <th>User ID</th>
            <th>Latitude</th>
            <th>Longitude</th>
            <th>Severity</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <%
            
String searchStatus = request.getParameter("st");            
            
    AccidentDAO dao = new AccidentDAO();
    List<Accident> accidents;

    if (searchStatus != null && !searchStatus.isEmpty()) {
        accidents = dao.getAccidentsByStatus(searchStatus); // filtered
    } else {
        accidents = dao.getAllAccidents(); // all
    }

    for (Accident acc : accidents) {
        String severity = acc.getSeverity();
        String accStatus = acc.getStatus();
        
if ("Medium".equals(severity) || "Low".equals(severity)){
        %>
        <tr>
        <td><%=x%></td>    
        <td><%= acc.getAccidentId() %></td>
        <td><%= acc.getUserId() %></td>
        <td><%= acc.getLatitude() %></td>
        <td><%= acc.getLongitude() %></td>
        <td><%= acc.getSeverity() %></td>
        <td><%= acc.getStatus() %></td>
            <td>
                <form action="updateStatus" method="post">
                    <input type="hidden" name="id" value="<%= acc.getAccidentId() %>">
                    <input type="hidden" name="severity" value="<%= acc.getSeverity() %>">
            <select name="status">
            <%                                  // Low/Medium → police must verify first
                    if ("Reported".equals(accStatus)) {
            %>
                        <option value="Verifying">Verifying</option>
                        
             <%
                    } else if ("Verifying".equals(accStatus)) {
            %>
                        <option value="Verified">Verified</option>
                        <option value="Ignored">Ignored</option>                                                                       
            
                        
            <%
                    } else if ("Ride Completed".equals(accStatus)) { //Contact Ambulance then set On the way
            %>                        
                        
                <option value="Case Solved">Case Solved</option>            
            
            <%
                    } else {
            %>
                        <option disabled>No action available</option>
            <%
                    }
               
            %>
            </select>
                    <input type="submit" name="save" id="save" value="Update" style="width: 50%; float: right;">
                </form>
            </td>
        </tr>
        <% x++;}} %>
    </table>
</div>