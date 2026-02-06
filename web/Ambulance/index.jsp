
<%@ page language="java" import="java.sql.*" isThreadSafe="false" %>
<%@ page import="dao.AccidentDAO, model.Accident" %>
<%
AccidentDAO dao =new AccidentDAO();
int accident =dao.totalaccident();
int reported = dao.countByStatus("Reported");
int verified = dao.countByStatus("Verified");
int complete = dao.countByStatus("Ride Completed");
int resolved = dao.countByStatus("Resolved");

%>
<%@include file="includes/header.jsp"%>

  <div class="content">

            <div class="dashboard">
                <div class="dashboard-card">Reported : <%= reported%></div>
                <div class="dashboard-card">Verified : <%= verified%></div>
                <div class="dashboard-card">Ride Completed : <%= complete%></div>
            </div>
      <br>
      <hr>
      <br>
            <div class="dashboard">
                <div class="dashboard-card">Total Number of Accidents Occurred : <%= accident%> </div>
            </div>      
     
  </div>