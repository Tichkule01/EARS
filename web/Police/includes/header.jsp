<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

if (session.getAttribute("userId") == null) {
    response.sendRedirect(request.getContextPath() + "/");
    return;
}
%>


<link href="css/style.css" rel="stylesheet" />

<div class="logo"><a href="./dashboard.jsp" style="text-decoration:none; color:white;">EARS [Police Portal]</a>
    </div>

    <div class="container">
        <div class="menu">
            <ul>
                <a href="./"><li>Dashboard</li></a>
                <a href="accident.jsp"><li>Accident</li></a>     
                <a href="track.jsp"><li>Tracker</li></a>                 
                <a href="emergency.jsp"><li>Emergency</li></a>  
        <a href="<%= request.getContextPath() %>/logout">
            <li>&#10155; Log Out</li>
        </a>

            </ul>
        </div>