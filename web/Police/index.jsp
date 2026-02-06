<%-- 
    Document   : dashboard
    Created on : Nov 23, 2025, 3:44:45 PM
    Author     : plazma
--%>

<%@ page language="java" import="java.sql.*" isThreadSafe="false" %>
<%@ page import="dao.AccidentDAO, model.Accident" %>
<%
AccidentDAO dao =new AccidentDAO();
int accident =dao.totalaccident();
int reported = dao.countByStatus("Reported");
int verified = dao.countByStatus("Verified");
int ignored = dao.countByStatus("Ignored");
int resolved = dao.countByStatus("Resolved");

%>
<%@include file="includes/header.jsp"%>

  <div class="content">

            <div class="dashboard">
                <div class="dashboard-card">Reported : <%= reported%></div>
                <div class="dashboard-card">Verified : <%= verified%></div>
                <div class="dashboard-card">Ignored : <%= ignored%></div>
                <div class="dashboard-card">Resolved : <%= resolved%></div>
            </div>
      <br>
      <hr>
      <br>
            <div class="dashboard">
                <div class="dashboard-card">Total Number of Accidents Occurred : <%= accident%> </div>
            </div>      
     
  </div>