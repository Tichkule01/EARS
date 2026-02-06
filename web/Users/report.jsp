<%-- 
    Document   : report
    Created on : Jan 7, 2026, 11:48:09 AM
    Author     : plazma
--%>

<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY"></script>

<link href="./css/style.css" rel="stylesheet" />
<link href="./css/srch.css" rel="stylesheet" />



<%@include file="includes/header.jsp"%>
<div class="content">
<form action="reportAccident" method="post">
<h2 style="color:#333;">Report an Accident</h2>     
<br><br>
<table id="Output">      
    <tr>
    <input type="hidden" name="latitude" id="lat">
    <input type="hidden" name="longitude" id="lng">
    <th>Severity:</th>
    <td>
    <select name="severity" required style="width: 100%;">
        <option>High</option>
        <option>Medium</option>
        <option>Low</option>
    </select><br>
    </td></tr>

    <tr>
        <th>Description:</th>
        <td>
            <textarea name="description" rows="3" cols="30" placeholder="Describe the accident" style="width: 100%;" required></textarea>
        </td>
    </tr>

<tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="save" id="save" value="Submit Accident" style="width: 50%; float: right;"></td>
    
</tr>
</table>    
    
</form>
</div>
<div id="map" style="height:400px;width:600px;margin-top:20px;"></div>

<script>
navigator.geolocation.getCurrentPosition(pos => {
    const lat = pos.coords.latitude;
    const lng = pos.coords.longitude;
    document.getElementById('lat').value = lat;
    document.getElementById('lng').value = lng;

    const map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: lat, lng: lng},
        zoom: 16
    });

    const marker = new google.maps.Marker({
        position: {lat: lat, lng: lng},
        map: map,
        draggable: true
    });

    marker.addListener('dragend', e => {
        document.getElementById('lat').value = e.latLng.lat();
        document.getElementById('lng').value = e.latLng.lng();
    });
});
</script>
</body>
</html>