<%-- 
    Document   : ListUser
    Created on : Dec 12, 2025, 3:37:43 PM
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

String Role="";
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
            <th class="search-th">Role</th>
            <td class="search-td"><select name="role" id="role" style="width:100%;">
           <option value="<%=Role%>" selected><%=Role%></option>
        <%
        rs = c.stmt.executeQuery("SELECT ROLE FROM user_mng"); 
        while (rs.next()) {
          String instructorId = rs.getString("ROLE");
          boolean isSelected = instructorId.equals(Role);
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
              <th>User Id</th>
              <th>User Name</th>
              <th>Contact</th>
              <th>Role</th>
              <th>Status</th>
          </tr>
         
          
          <%
if (request.getParameter("search")!=null){
   if (request.getParameter("search").equals("Search Record")){              
              
String Date = request.getParameter("date");

              
          sql = "select USER_ID, USER_NAME, CONTACT, ROLE, STATUS FROM user_mng";
          
if (Date != null && !Date.isEmpty()) {
    sql += " WHERE ROLE LIKE '%" + Date + "%'";
}          
          





       
rs=c.stmt.executeQuery(sql);
if (rs.next()){
    do{
          %>
          <tr>
              <td><%= rs.getString("USER_ID")%></td>
              <td><a href="../../userManagement.jsp?USER_ID=<%= rs.getString("USER_ID")%>" style="text-decoration: none; color: #36454F;"><%= rs.getString("USER_NAME")%></a></td>
              <td><%= rs.getString("CONTACT")%></td>
              <td><%= rs.getString("ROLE")%></td>
              <td><%= rs.getString("STATUS")%></td>
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
        sql = "select USER_ID, USER_NAME, CONTACT, ROLE, STATUS FROM user_mng";
rs=c.stmt.executeQuery(sql);

while(rs.next()){
          %>
 
          <tr>
              <td><%= rs.getString("USER_ID")%></td>
              <td><a href="../../userManagement.jsp?USER_ID=<%= rs.getString("USER_ID")%>" style="text-decoration: none; color: #36454F;"><%= rs.getString("USER_NAME")%></a></td>
              <td><%= rs.getString("CONTACT")%></td>
              <td><%= rs.getString("ROLE")%></td>
              <td><%= rs.getString("STATUS")%></td>
          </tr>
          <% }%>

<%}%>
      </table>

  </div>