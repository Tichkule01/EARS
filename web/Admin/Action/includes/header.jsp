<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    // Stop browser caching
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // Session check
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/");
        return;
    }
%>


<link href="css/style.css" rel="stylesheet" />

<div class="logo"><a href="./" style="text-decoration:none; color:white;">EARS [Admin Portal]</a>
    </div>





    <div class="container">
        <div class="menu">
            <ul>
                <a href="./"><li>Ambulance Needed</li></a>
               <a href="<%= request.getContextPath() %>/logout">
                <li>&#10155; Log Out</li>
                </a>

            </ul>
        </div>