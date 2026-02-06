
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
                    <option value="Verified" <%= "Verified".equals(request.getParameter("st")) ? "selected" : "" %>>Verified</option>
                    <option value="Dispatch Ambulance" <%= "Dispatch Ambulance".equals(request.getParameter("st")) ? "selected" : "" %>>Ambulance Req</option>
                    <option value="On the Way" <%= "On the Way".equals(request.getParameter("st")) ? "selected" : "" %>>Ambulance Dispatched</option>     
                    <option value="Ride Completed" <%= "Ride Completed".equals(request.getParameter("st")) ? "selected" : "" %>>Completed Ride</option>                    
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
        <td><%= acc.getSeverity() %></td>
        <td><%= acc.getStatus() %></td>
                        <td>
                <form action="updateStatus" method="post">
                    <input type="hidden" name="id" value="<%= acc.getAccidentId() %>">
            <select name="status">

            <%
                    // Low/Medium → only if police verified
                    if ("Verified".equals(accStatus)) {
            %>
                        <option value="Dispatch Ambulance">Dispatch Ambulance</option>
  
	    <%
                    } else if ("Dispatch Ambulance".equals(accStatus)) { //Contact immediately to ambulance and they will perform next
            %>                        
                        
                <option value="On the Way">On the Way</option>                     
            <%
                    } else if ("On the Way".equals(accStatus)) { 
            %>                        
                        
                <option value="Ride Completed">Ride Completed</option>                          
                        
            <%
                    } else {
            %>
                        <option disabled>Waiting for Police Verification</option>
            <%
                    }
                
            %>
            </select>
                    <input type="submit" value="Update">
                </form>
            </td>
        </tr>
        <% x++;}} %>
    </table>
</div>