<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script> <!--src for Jquery -->
	<script src="${pageContext.request.contextPath}/resources/air-datepicker-master/dist/js/datepicker.min.js"> </script> <!--src for calendar -->
	<script src="${pageContext.request.contextPath}/resources/air-datepicker-master/dist/js/i18n/datepicker.en.js"> </script> <!--src for calendar -->
    <link href="${pageContext.request.contextPath}/resources/air-datepicker-master/dist/css/datepicker.min.css" rel="stylesheet"/> <!--CSS specifically for calendar -->    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> <!-- font for the search button -->
    
    <style type="text/css">
    /*Styling for the blue search button*/
    * 
    {
        box-sizing: border-box;
    }
    /* Style for the search field */
    #datePicker
    {
        padding: 10px;
        font-size: 17px;
        border: 1px solid grey;
        float: left;
        width: 20%;
        background: #f1f1f1;
    }
    /* Style for the submit button */
    #submit_Button
    {
        float: left;
        width: 5%;
        padding: 10px;
        background: #2196F3;
        color: white;
        font-size: 17px;
        border: 1px solid grey;
        border-left: none; /* Prevent double borders */
        cursor: pointer;
    }
    /*Style for the search button hover */
    #submit_Button:hover    
    {
        background: #0b7dda;
    }
    </style>
    
    

<title>Appointment Date Selection</title>
</head>
<body>

    <h1>Let's find a time that works for you.</h1>
    <br>
    <form action="date_selected" method="post">
    <input id='datePicker' type='text' class='datepicker-here' data-language='en'/> <!--class for date picker must be "datepicker-here" -->
    <button type="submit" id="submit_Button"><i class="fa fa-search"></i></button> <!--https://www.w3schools.com/howto/howto_css_search_button.asp -->
    </form>
    <br>
    <br>
    <br>
    
    <div id="database_results">

        
    </div>


</body>
</html>