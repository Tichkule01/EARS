<%-- 
    Document   : suggestion
    Created on : Sep 17, 2025, 12:10:36 PM
    Author     : plazma
--%>
<%@ page language="java" import="java.sql.*" isThreadSafe="false" %>
<%@ page import="exp.*" %> 


<%
Connection e = null;
e  c = new e();
ResultSet rs=null;
ResultSet rs1=null;
String sql=null;
c.connection();


String suggestion="";

    sql = "select * FROM SALES";
    rs=c.stmt.executeQuery(sql);
    
while(rs.next()){
suggestion=rs.getString("NAME");
%>
<div class="suggest-item" onclick="selectSuggestion('<%=suggestion%>')"><%=suggestion%></div>
<%
}
%>


