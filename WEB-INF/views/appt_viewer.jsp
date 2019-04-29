<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Viewer</title>
<style>
    div.container1{position: relative; top: 15px;}
    div.container2{position: relative; top: 40px;}
    #location{width:200px; height:25px;}
    #location option{width:200px; height:25px;}
    #date{width:200px;}
    #time{width:200px;}
    #submit{width:150px; margin-left:25px; background-color:#00a0c8; color:white; border:none; height:25px;}
    #l_location{margin-left:10px;}
    #l_date{margin-left:10px;}
    #l_time{margin-left:10px;}
    #viewer{border:1px solid black; border-collapse:collapse; table-layout:fixed; text-align:left; width:90%; margin-left:10px;}
    th, td{border:1px solid black; border-collapse:collapse; width:25%; margin-left:10px;}
</style>
</head>
<body>
<form>
<div class="container1">
<label id="l_location">Select Location:</label>
<select name="location" id="location">
	<!-- To be populated from database -->
	<!-- Will require REST API call -->
	<option value="branch1">Branch 1</option>
	<option value="branch2">Branch 2</option>
	<option value="branch3">Branch 3</option>
</select>
<label  id="l_date">Select Date:</label>
<input type="date" name="date" id="date">
<label id="l_time">Select Time:</label>
<input type="time" name="time" id="time">
<input type="submit" name="submit" id="submit" value="Submit">
</div>
<div class="container2">
<table  id="viewer">
	<tr>
		<th>Location:</th>
		<th>Date:</th>
        <th>Time:</th>
		<th>Customer:</th>
	</tr>
	<tr>
		<td>Branch 1</td>
		<td>1 JUN 19</td>
        <td>12:00 PM</td>
		<td>Bob</td>
	</tr>
</table>
</div>
</form>
</body>
</html>