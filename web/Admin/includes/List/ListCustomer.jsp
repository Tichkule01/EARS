<%-- 
    Document   : ListCustomer
    Created on : Dec 12, 2025, 3:38:00 PM
    Author     : plazma
--%>

<%@ page language="java" import="java.sql.*" isThreadSafe="false" %>
<%@ page import="bill.*" %> 


<%
Connection bill = null;
bill  c = new bill();
ResultSet rs=null;
ResultSet rs1=null;
String sql=null;
c.connection();

String Customer_Name="";
%>


<link href="../../css/style.css" rel="stylesheet" />
<link href="../../css/srch.css" rel="stylesheet" />
<div class="logo"><a href="../../dashboard.jsp" style="text-decoration:none; color:white;">Bill Management System</a>
    </div>


  <div class="content">
      
<h2 style="color:#333;">List of users with their details</h2> 

      <form name="search" id="search" method="post">
    <table class="search-table" border="0">
        <tr class="search-tr">
            <th class="search-th">Customer Name</th>
            <td class="search-td"><select name="role" id="role" style="width:100%;">
           <option value="<%=Customer_Name%>" selected><%=Customer_Name%></option>
        <%
        rs = c.stmt.executeQuery("SELECT NAME FROM customers"); 
        while (rs.next()) {
          String instructorId = rs.getString("NAME");
          boolean isSelected = instructorId.equals(Customer_Name);
        %>
        <option value="<%= instructorId %>" <%= isSelected ? "selected" : "" %>><%= instructorId %></option>
        <%
        }
        rs.close();
        %>
           </select></td>
           <td class="search-td"><input type="submit" name="search" id="search" value="Search Record" style="width: 50%; float: right;"></td>
        </tr>
    </table>
      </form>
      
      <table>
          <tr>
              <th>Customer Id</th>
              <th>Customer Name</th>
              <th>Contact Number</th>
          </tr>
         
          
          <%
if (request.getParameter("search")!=null){
   if (request.getParameter("search").equals("Search Record")){              
              
String Date = request.getParameter("date");

              
          sql = "select CUSTOMER_ID, NAME, PHONE FROM customers";
          
if (Date != null && !Date.isEmpty()) {
    sql += " WHERE ROLE LIKE '%" + Date + "%'";
}          
          





       
rs=c.stmt.executeQuery(sql);
if (rs.next()){
    do{
          %>
          <tr>
              <td><%= rs.getString("CUSTOMER_ID")%></td>
              <td><a href="../../user.jsp?CUSTOMER_ID=<%= rs.getString("CUSTOMER_ID")%>" style="text-decoration: none; color: #36454F;"><%= rs.getString("NAME")%></a></td>
              <td><%= rs.getString("PHONE")%></td>
          </tr>
           
          
<% } while(rs.next());
}else{
%>         
<tr>
    <td colspan="8"><div align="center">You have entered wrong data for search!!!</div></td>
</tr>

<%}}}
else{
%>

          
          
          
          <%
        sql = "select CUSTOMER_ID, NAME, PHONE FROM customers";
rs=c.stmt.executeQuery(sql);

while(rs.next()){
          %>
 
          <tr>
              <td><%= rs.getString("CUSTOMER_ID")%></td>
              <td><a href="../../user.jsp?CUSTOMER_ID=<%= rs.getString("CUSTOMER_ID")%>" style="text-decoration: none; color: #36454F;"><%= rs.getString("NAME")%></a></td>
              <td><%= rs.getString("PHONE")%></td>
          </tr>
          <% }%>

<%}%>
      </table>

  </div>