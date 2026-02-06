<%-- 
    Document   : ListProduct
    Created on : Dec 12, 2025, 3:38:30 PM
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

String Sdate="";
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
            <th class="search-th">Date</th>
            <td class="search-td"><select name="date" id="date" style="width:100%;">
           <option value="<%=Sdate%>" selected><%=Sdate%></option>
        <%
        rs = c.stmt.executeQuery("SELECT ENTRY_DATE FROM products"); 
        while (rs.next()) {
          String instructorId = rs.getString("ENTRY_DATE");
          boolean isSelected = instructorId.equals(Sdate);
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
              <th>Product Id</th>
              <th>Product Name</th>
              <th>Entry Date</th>
              <th>Category</th>
              <th>Cost</th>
              <th>Price</th>
              <th>Stock</th>
          </tr>
         
          
          <%
if (request.getParameter("search")!=null){
   if (request.getParameter("search").equals("Search Record")){              
              
String Date = request.getParameter("date");

              
          sql = "select PRODUCT_ID, PRODUCT_NAME, ENTRY_DATE, CATEGORY, COST, PRICE, STOCK FROM products";
          
if (Date != null && !Date.isEmpty()) {
    sql += " WHERE ENTRY_DATE LIKE '%" + Date + "%'";
}          
          





       
rs=c.stmt.executeQuery(sql);
if (rs.next()){
    do{
          %>
          <tr>
              <td><%= rs.getString("PRODUCT_ID")%></td>
              <td><a href="../../inventory.jsp?PRODUCT_ID=<%= rs.getString("PRODUCT_ID")%>" style="text-decoration: none; color: #36454F;"><%= rs.getString("PRODUCT_NAME")%></a></td>
              <td><%= rs.getString("ENTRY_DATE")%></td>
              <td><%= rs.getString("CATEGORY")%></td>
              <td><%= rs.getString("COST")%></td>
              <td><%= rs.getString("PRICE")%></td>
              <td><%= rs.getString("STOCK")%></td>
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
         sql = "select PRODUCT_ID, PRODUCT_NAME, ENTRY_DATE, CATEGORY, COST, PRICE, STOCK FROM products";
rs=c.stmt.executeQuery(sql);

while(rs.next()){
          %>
 
          <tr>
              <td><%= rs.getString("PRODUCT_ID")%></td>
              <td><a href="../../inventory.jsp?PRODUCT_ID=<%= rs.getString("PRODUCT_ID")%>" style="text-decoration: none; color: #36454F;"><%= rs.getString("PRODUCT_NAME")%></a></td>
              <td><%= rs.getString("ENTRY_DATE")%></td>
              <td><%= rs.getString("CATEGORY")%></td>
              <td><%= rs.getString("COST")%></td>
              <td><%= rs.getString("PRICE")%></td>
              <td><%= rs.getString("STOCK")%></td>
          </tr>
          <% }%>

<%}%>
      </table>

  </div>