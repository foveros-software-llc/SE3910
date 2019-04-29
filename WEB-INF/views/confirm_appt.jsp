<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/stylesheet.css"/>
<meta charset="ISO-8859-1">
<title>Confirm Appointment</title>

</head>
<body>
<!-- Several values must be provided by the controller to be displayed here -->

Here's your appointment:<br/><br/>
<label id="label1">${name},</label>
<label id="label2">Your appointment is scheduled.  We'll see you soon!</label><br/><br/>

<label id="label3">${address}</label><br/>
Open in Maps<br/><br/>

<label id="label4">${date}</label><br/>
<label id="label5">${time}</label><br/>
Add to Calendar<br/><br/><br/>

<label id="label6">${type}</label><br/><br/>

<form>
<input type="submit" name="close" id="close" value="Add Appointment">
<input type="submit" name="cancel" id="cancel" value="Cancel Appointment">

</form>

</body>
</html>