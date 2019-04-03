<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Details</title>
<style>
    #fname{width:300px;}
    #lname{width:300px; margin-left:10px}
    #email{width:300px;}
    #phone{width:300px; margin-left:10px}
    #label2{margin-left:234px}
    #label4{margin-left:267px}
    #label5{margin-left:15px;}
    #label6{margin-left:38px;}
    #submit{background-color:#00a0c8; color:white; border:none;}
</style>
</head>
<body>

<form action="contact" method="post">

    <br/>
    <label id="label1">First Name:</label>
    <label id="label2">Last Name:</label>
    <br/>
    <input type="text" name="fname" id="fname"><input type="text" name="lname" id="lname">
    <br/>
    <br/>
    <label id="label3">Email:</label>
    <label id="label4">Phone:</label>
    <br/>
    <input type="text" name="email" id="email"><input type="text" name="phone" id="phone">
    <br/>
    <br/>
    <input type="checkbox" name="email_consent" id="email_consent">
    <label id="label5">Email Consent</label>
    <br/>
    <label id="label6">By checking, I am providing my consent to receive email updates.</label>
    <br/>
    <br/>
    <br/>
    <br/>
    <input type="submit" name="submit" id="submit" value="Continue">

</form>

</body>
</html>