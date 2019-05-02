<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/stylesheet.css"/>
<meta charset="ISO-8859-1">
<title>Contact Details</title>
<style>
    div.container1{position:relative; top:10px;}
    div.container2{position:relative; top:10px;}
    div.container3{position:relative; top:10px;}
    div.container4{position:relative; top:30px;}
    label{font-family:verdana}
    #fname{width:250px; margin-left:10px;}
    #lname{width:250px; margin-left:60px;}
    #email{width:250px; margin-left:10px;}
    #phone{width:250px; margin-left:60px;}
    #submit{width:150px; height:25px; margin-left:10px; background-color:#00a0c8; color:white; border:none;}
    #l_fname{min-width:100px; margin-left:10px; display:inline-block;}
    #l_lname{min-width:100px; margin-left:210px; display:inline-block;}
    #l_email{min-width:100px; margin-left:10px; display:inline-block;}
    #l_phone{min-width:100px; margin-left:210px; display:inline-block;}
    #email_consent{margin-left:10px;}
    #l_consent{margin-left:10px;}
    #l_consent2{margin-left:10px;}
</style>
</head>
<body>
<h1>Now we just need a few more details.</h1>
Date: ${appointmentdate}
Time: ${appointmentstartTime}
<form action="/spring/confirm_appt" method="post">
    <div class="container1">
    </div>
    <div class="container2">
    <label id="l_fname">First Name:</label>
    <label id="l_lname">Last Name:</label>
    <br/>
    <input type="text" name="fname" id="fname"><input type="text" name="lname" id="lname">
    <br/>
    </div>
    <div class="container3">
    <br/>
    <label id="l_email">Email:</label>
    <label id="l_phone">Phone:</label>
    <br/>
    <input type="text" name="email" id="email"><input type="text" name="phone" id="phone">
    <br/>
    </div>
    <br/>
    <div class="container4">
    <input type="checkbox" name="email_consent" id="email_consent">
    <label id="l_consent">Email Consent</label>
    <br/>
    <label id="l_consent2">By checking, I am providing my consent to receive email updates.</label>
    <br/>
    <br/>
    <br/>
    <input type="text"name="appointmentdate" id="appointmentdate" value="${appointmentdate}">
    <input type="text" name="appointmentstarttime" id="appointmentstarttime" value="${appointmentstartTime}">
    <input type="submit" id="submit" value="Continue">
    </div>
</form>
</body>
</html>