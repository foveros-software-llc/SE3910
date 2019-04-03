<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<meta name="viewport" content="initial-scale=1.0">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        width: 100%;
        height: 50%;
        background-color: grey;
      }
      /* Makes the page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
</head>
<body style="margin:0px; padding:0px;" onload="initMap()">
	<h1>Which location works best for you?</h1>
    <div>
         <label for="raddressInput">Search location:</label>
         <input type="text" id="addressInput" size="15"/>
        <label for="radiusSelect">Radius:</label>
        <select id="radiusSelect" label="Radius">
          <option value="50" selected>50 kms</option>
          <option value="30">30 kms</option>
          <option value="20">20 kms</option>
          <option value="10">10 kms</option>
        </select>

        <input type="button" id="searchButton" value="Search"/>
    </div>
    <div><select id="locationSelect" style="width: 10%; visibility: hidden"></select></div>
	<div id="map"></div>
    <script type="text/javascript">

		var map;
    	
		// Initialize and add the map
		function initMap() {
  			// The location of the default center of the map
  			var center = {lat: 39.0997, lng: -94.5786};
  			// The map centered 
  			map = new google.maps.Map(
      			document.getElementById('map'), {zoom: 11, center: center});

  			// Example Marker
  			var marker = new google.maps.Marker({position: {lat: 39.0997, lng: -94.5786}, map: map});
		}
		
	    function triggerInput() {
	        var zipCode = document.getElementById('addressInput').value;
	     	// This is creating the GeocoderRequest object
	        var geocoderRequest = {address: zipCode}
	        var geocoder = new google.maps.Geocoder();
	     	// This is making the Geocode request
	        geocoder.geocode(geocoderRequest, function(results, status) {
	        	// Check if status is OK before proceeding
	            if (status == google.maps.GeocoderStatus.OK) {
	            	// Center the map on the returned location
	                map.setCenter(results[0].geometry.location);
	                map.setZoom(11);
	            	console.log(results);
	            	searchLocationsNear(results[0].geometry.location);
	            } else {
	                alert(address + ' not found');
	            }
	        })
	    }
    	document.getElementById('searchButton')
    			.addEventListener('click', triggerInput, false);
    </script>
    <script async defer 
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcH0cL9aL8PDd0Cww0Alxjez0rh2vtZkQ&callback=initMap">
    </script>
</body>
</html>