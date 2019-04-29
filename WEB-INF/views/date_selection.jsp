<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/stylesheet.css"/>
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
    
    .buttons
    {
        width: 100px;
        height: 50px;
        padding: 10px;
        background: white;
        color: black;
        font-size: 17px;
        border: 2px solid blue;
        
        cursor: pointer;
    }  
    
    th
    {
    	align: left;
    	font-size: 30px;
    }
    
    /*Style for the search button hover */
    #submit_Button:hover    
    {
        background: #0b7dda;
    }
    </style>
    
    <script type="text/javascript">
    var submit_btn;
    var date_container;
    var div;
    var weekday_times = new Array("9:00 AM","10:00 AM" ,"11:00 AM", "12:00 PM", "1:00 PM","2:00 PM","3:00 PM");
    var weekend_times = new Array("10:00 AM" ,"11:00 AM");
    var table_string = " ";
    var days_of_the_week = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
    var user_date, user_date1, user_date2;
    var parts; 
    var day, month, year;
    
    function start(){
    	
    	div = document.getElementById("database_results");
        submit_btn = document.getElementById("submit_Button");
        submit_btn.addEventListener("click", function(){ dateEntered(); });       
    }
    
    function dateEntered(){
    	table_string = " ";
    	date_container = document.getElementById("datePicker"); //Value is MM/DD/YYYY
    	parts = date_container.value.split('/');
    	day = parseInt(parts[1]);	//DD
    	month = parseInt(parts[0]); //MM
    	year = parseInt(parts[2]);	//YYYY
    	user_date = new Date(year, month - 1, day);
    	user_date1 = new Date(year, month - 1, day + 1);
    	user_date2 = new Date(year, month - 1, day + 2);
    	table_string += "<table>"
    		table_string += "<tr>"
    			table_string += "<th align='left' colspan='4'>" + user_date.toDateString() + "</th>";
    		table_string += "</tr>";
    		table_string += "<tr>";
    			table_string += "<td><button type='button' class='buttons'>9:00 AM</button></td>";
    			table_string += "<td><button  type='button' class='buttons'>10:00 AM</button></td>";
    			table_string += "<td><button type='button' class='buttons'>11:00 AM</button></td>";
    			table_string += "<td><button type='button' class='buttons'>12:00 AM</button></td>";
    		table_string += "</tr>";
        	table_string += "<tr>";
    			table_string += "<td><button type='button' class='buttons'>1:00 PM</button></td>";
    			table_string += "<td><button type='button' class='buttons'>2:00 PM</button></td>";
    			table_string += "<td><button type='button' class='buttons'>3:00 PM</button></td>";
    		table_string += "</tr>";    			
    	table_string += "</table>"
    	
        table_string += "<table>"
        	table_string += "<tr>"
       			table_string += "<th align='left' colspan='4'>" + user_date1.toDateString() + "</th>";
       		table_string += "</tr>";
       		table_string += "<tr>";
       			table_string += "<td><button type='button' class='buttons'>9:00 AM</button></td>";
       			table_string += "<td><button  type='button' class='buttons'>10:00 AM</button></td>";
       			table_string += "<td><button type='button' class='buttons'>11:00 AM</button></td>";
       			table_string += "<td><button type='button' class='buttons'>12:00 AM</button></td>";
       		table_string += "</tr>";
           	table_string += "<tr>";
       			table_string += "<td><button type='button' class='buttons'>1:00 PM</button></td>";
       			table_string += "<td><button type='button' class='buttons'>2:00 PM</button></td>";
       			table_string += "<td><button type='button' class='buttons'>3:00 PM</button></td>";
       		table_string += "</tr>";    			
       	table_string += "</table>"
        	
       	table_string += "<table>"
       		table_string += "<tr>"
       			table_string += "<th align='left' colspan='4'>" + user_date2.toDateString() + "</th>";
       		table_string += "</tr>";
       		table_string += "<tr>";
       			table_string += "<td><button type='button' class='buttons'>9:00 AM</button></td>";
       			table_string += "<td><button  type='button' class='buttons'>10:00 AM</button></td>";
       			table_string += "<td><button type='button' class='buttons'>11:00 AM</button></td>";
       			table_string += "<td><button type='button' class='buttons'>12:00 AM</button></td>";
       		table_string += "</tr>";
           	table_string += "<tr>";
       			table_string += "<td><button type='button' class='buttons'>1:00 PM</button></td>";
       			table_string += "<td><button type='button' class='buttons'>2:00 PM</button></td>";
       			table_string += "<td><button type='button' class='buttons'>3:00 PM</button></td>";
       		table_string += "</tr>";    			
       	table_string += "</table>"    	

    	div.innerHTML = table_string;
    }
    
    
    window.addEventListener('load', start, false);
    </script>
    

<title>Appointment Date Selection</title>
</head>
<body>

    <h1>Let's find a time that works for you.</h1>
    <br>
    <input id='datePicker' type='text' class='datepicker-here' data-language='en' name="date"/> <!--class for date picker must be "datepicker-here" -->
    <button type="button" id="submit_Button"><i class="fa fa-search" ></i></button> <!--https://www.w3schools.com/howto/howto_css_search_button.asp -->
    <br>
    <br>
    <br>
	<table width = "500" cellpadding = "0" cellspacing = "0" border="1">
	<tr> 
		<td> Branch </td>

	</tr>
    <c:forEach items ="${list}" var = "dto"> 
    <tr>
		<td> ${dto.bankStreet} </td>

	</tr>
	</c:forEach>
    </table>
    
 
    
    <div id="database_results">

        
    </div>


</body>
</html>