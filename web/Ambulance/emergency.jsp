<%-- 
    Document   : emergency
    Created on : Feb 4, 2026, 12:31:28 PM
    Author     : plazma
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.EmergencyDAO, model.Emergency" %>

<link href="./css/style.css" rel="stylesheet" />
<link href="./css/srch.css" rel="stylesheet" />

<%@include file="includes/header.jsp"%>
<div class="content">
<h2 style="color:#333;">Emergency</h2>     
<br><br>

    <table border="1" cellpadding="5">
        <tr>
            <th>Emergency Request ID</th>
            <th>Accident ID</th>
            <th>Responded At</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <%
    EmergencyDAO dao = new EmergencyDAO();
    List<Emergency> accidents = (List<Emergency>) dao.getAllEmergencyAccidents();

    for(Emergency acc : accidents) {       
        String Status = acc.getStatus();
        String Type = acc.getResponderType();
        
if ("Ambulance".equals(Type)){
        %>
        <tr>
            <td><%= acc.getReuestId() %></td>
            <td><%= acc.getAccidentId() %></td>            
            <td><%= acc.getResponseTime() %></td>
            <td><%= acc.getStatus() %></td>
            <td>
                <form action="updateStatus" method="post">
                    <input type="hidden" name="id" value="<%= acc.getAccidentId() %>">
                    <input type="hidden" name="eid" value="<%= acc.getReuestId() %>">
            <select name="status">
            <%
                if ("Pending".equals(Status)) {
                    // High severity → ambulance can always act
            %>
                    <option value="Dispatch Ambulance">Dispatch Ambulance</option>
                    <option value="Not Available">Not Available</option>
                    <option value="Ignore">Ignore</option>                               

	    <%
                    } else if ("Dispatch Ambulance".equals(Status)) { //Contact immediately to ambulance and they will perform next
            %>                        
                        
                <option value="On the Way">On the Way</option>                                          
                        
	    <%
                    } else if ("Not Available".equals(Status)) { 
            %>                        
                        
                <option value="Dispatch Ambulance">Dispatch Ambulance</option>   
            <%
                    } else if ("On the Way".equals(Status)) { 
            %>                        
                        
                <option value="Ride Completed">Ride Completed</option>    
                        
            <%
                    } else {
            %>
                        <option disabled>No action available</option>
            <%
                    }                
            %>             
             
            </select>
                    <input type="submit" value="Update">
                </form>
            </td>
        </tr>
        <%      
            }} 
        %>
    </table>
</div>
