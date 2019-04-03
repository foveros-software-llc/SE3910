<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Viewer</title>
<style>
    #location{width:200px;}
    #location option{width:200px;}
    #date{width:200px;}
    #submit{width:100px; margin-left:10px; background-color:#00a0c8; color:white; border:none;}
    #label1{margin-left:10px;}
    #label2{margin-left:10px;}
    #viewer{border:1px solid black; border-collapse:collapse; table-layout:fixed; text-align:left; width:900px; margin-left:10px;}
    th, td{border:1px solid black; border-collapse:collapse; width:300px; margin-left:10px;}
</style>
</head>
<body>

<form>

<br/>
<label name="label1" id="label1">Select Location:</label>
<select name="location" id="location">
	<!-- To be populated from database -->
	<!-- Will require REST API call -->
	<option value="branch1">Branch 1</option>
	<option value="branch2">Branch 2</option>
	<option value="branch3">Branch 3</option>
</select>
<label name="label2" id="label2">Select Date:</label>
<input type="date" name="date" id="date">
<input type="submit" name="submit" id="submit" value="Submit">
<br/>
<br/>
<table name="viewer" id="viewer">
	<tr>
		<th>Location:</th>
		<th>Date:</th>
		<th>Customer:</th>
	</tr>
	<tr>
		<td>Branch 1</td>
		<td>1JUN19</td>
		<td>Bob</td>
	</tr>
</table>

</form>

</body>
</html>