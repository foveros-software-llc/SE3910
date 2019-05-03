<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
    .submit_Button
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
    
   .submit_Button1
    {
        float: left;
        width: 10%;
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
        padding: 5px;
        background: white;
        color: black;
        font-size: 17px;
        border: 2px solid #2196F3;
        border-bottom: 4px solid #2196F3;
        border-radius: 5px;
        cursor: pointer;
    }
    
    .buttons:hover
    {
        border: 2px solid #0b7dda;
        border-bottom: 4px solid #0b7dda;
        background: yellow;
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
    
    .hidden
    {
    	visibility: hidden;
    }
    
    .visible
    {
    	visibility: visible;
    }
    
    </style>
    
    <script type="text/javascript">
    var submit_btn;
    var date_container;
    var div;
    var submit_form;
    var date_holder;
    var time_holder;
    var weekday_times1 = "<tr>";
    weekday_times1 += "<td><button type='button' class='buttons' onclick='timeSelected(0, \"9:00 AM\")'>9:00 AM</button></td>";
    weekday_times1 += "<td><button  type='button' class='buttons' onclick='timeSelected(0, \"10:00 AM\")'>10:00 AM</button></td>";
    weekday_times1 += "<td><button type='button' class='buttons' onclick='timeSelected(0, \"11:00 AM\")'>11:00 AM</button></td>";
    weekday_times1 += "<td><button type='button' class='buttons' onclick='timeSelected(0, \"12:00 PM\")'>12:00 PM</button></td>";
    weekday_times1 += "</tr>";
    weekday_times1 += "<tr>";
    weekday_times1 += "<td><button type='button' class='buttons' onclick='timeSelected(0, \"1:00 PM\")'>1:00 PM</button></td>";
    weekday_times1 += "<td><button type='button' class='buttons' onclick='timeSelected(0, \"2:00 PM\")'>2:00 PM</button></td>";
    weekday_times1 += "<td><button type='button' class='buttons' onclick='timeSelected(0, \"3:00 PM\")'>3:00 PM</button></td>";
    weekday_times1 += "</tr>"; 
    	
    var weekend_times1 = "<tr>";
    weekend_times1 += "<td><button  type='button' class='buttons' onclick='timeSelected(0, \"10:00 AM\")'>10:00 AM</button></td>";
    weekend_times1 += "<td><button type='button' class='buttons' onclick='timeSelected(0, \"11:00 AM\")'>11:00 AM</button></td>";
    weekend_times1 += "</tr>";
    
    var weekday_times2 = "<tr>";
    weekday_times2 += "<td><button type='button' class='buttons' onclick='timeSelected(1, \"9:00 AM\")'>9:00 AM</button></td>";
    weekday_times2 += "<td><button  type='button' class='buttons' onclick='timeSelected(1, \"10:00 AM\")'>10:00 AM</button></td>";
    weekday_times2 += "<td><button type='button' class='buttons' onclick='timeSelected(1, \"11:00 AM\")'>11:00 AM</button></td>";
    weekday_times2 += "<td><button type='button' class='buttons' onclick='timeSelected(1, \"12:00 PM\")'>12:00 PM</button></td>";
    weekday_times2 += "</tr>";
    weekday_times2 += "<tr>";
    weekday_times2 += "<td><button type='button' class='buttons' onclick='timeSelected(1, \"1:00 PM\")'>1:00 PM</button></td>";
    weekday_times2 += "<td><button type='button' class='buttons' onclick='timeSelected(1, \"2:00 PM\")'>2:00 PM</button></td>";
    weekday_times2 += "<td><button type='button' class='buttons' onclick='timeSelected(1, \"3:00 PM\")'>3:00 PM</button></td>";
    weekday_times2 += "</tr>"; 
    	
    var weekend_times2 = "<tr>";
    weekend_times2 += "<td><button  type='button' class='buttons' onclick='timeSelected(1, \"10:00 AM\")'>10:00 AM</button></td>";
    weekend_times2 += "<td><button type='button' class='buttons' onclick='timeSelected(1, \"11:00 AM\")'>11:00 AM</button></td>";
    weekend_times2 += "</tr>";
    
    var weekday_times3 = "<tr>";
    weekday_times3 += "<td><button type='button' class='buttons' onclick='timeSelected(2, \"9:00 AM\")'>9:00 AM</button></td>";
    weekday_times3 += "<td><button  type='button' class='buttons' onclick='timeSelected(2, \"10:00 AM\")'>10:00 AM</button></td>";
    weekday_times3 += "<td><button type='button' class='buttons' onclick='timeSelected(2, \"11:00 AM\")'>11:00 AM</button></td>";
    weekday_times3 += "<td><button type='button' class='buttons' onclick='timeSelected(2, \"12:00 PM\")'>12:00 PM</button></td>";
    weekday_times3 += "</tr>";
    weekday_times3 += "<tr>";
    weekday_times3 += "<td><button type='button' class='buttons' onclick='timeSelected(2, \"1:00 PM\")'>1:00 PM</button></td>";
    weekday_times3 += "<td><button type='button' class='buttons' onclick='timeSelected(2, \"2:00 PM\")'>2:00 PM</button></td>";
    weekday_times3 += "<td><button type='button' class='buttons' onclick='timeSelected(2, \"3:00 PM\")'>3:00 PM</button></td>";
    weekday_times3 += "</tr>"; 
    	
    var weekend_times3 = "<tr>";
    weekend_times3 += "<td><button  type='button' class='buttons' onclick='timeSelected(2, \"10:00 AM\")'>10:00 AM</button></td>";
    weekend_times3 += "<td><button type='button' class='buttons' onclick='timeSelected(2, \"11:00 AM\")'>11:00 AM</button></td>";
    weekend_times3 += "</tr>";
    
    var branch_closed = "<tr>";
    branch_closed += "<td>Branch Closed</td>";
    branch_closed += "</tr>";
    
    var table_string = " ";
    var days_of_the_week = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
    var user_date, user_date1, user_date2;
    var parts; 
    var day, month, year;
    
    function start(){
    	
    	div = document.getElementById("database_results");
        submit_btn = document.getElementById("submit_Button");
        submit_btn.addEventListener("click", function(){ dateEntered(); });
        submit_form = document.getElementById("submit_form");
        date_holder = document.getElementById("date_holder");
        time_holder = document.getElementById("time_holder");
    }
    
    function dateEntered(){
    	table_string = " ";
    	date_container = document.getElementById("datePicker"); //Value is MM/DD/YYYY
    	parts = date_container.value.split('/');
    	day = parseInt(parts[1]);	//DD
    	month = parseInt(parts[0]); //MM
    	year = parseInt(parts[2]);	//YYYY
    	user_date0 = new Date(year, month - 1, day);
    	user_date1 = new Date(year, month - 1, day + 1);
    	user_date2 = new Date(year, month - 1, day + 2);
    	table_string += "<table>"
    		table_string += "<tr>"
    			table_string += "<th align='left' colspan='4'>" + user_date0.toDateString() + "</th>";
    		table_string += "</tr>";
    		if(user_date0.toDateString().includes("Sat")){
    			table_string += weekend_times1;	
    		}else if(user_date0.toDateString().includes("Sun")){
    			table_string += branch_closed;
    		}else{
    			table_string += weekday_times1;
    		}    			
    	table_string += "</table>"
    		table_string += "<br/>"
        table_string += "<table>"
        	table_string += "<tr>"
       			table_string += "<th align='left' colspan='4'>" + user_date1.toDateString() + "</th>";
       		table_string += "</tr>";
    		if(user_date1.toDateString().includes("Sat")){
    			table_string += weekend_times2;	
    		}else if(user_date1.toDateString().includes("Sun")){
    			table_string += branch_closed;
    		}else{
    			table_string += weekday_times2;
    		}   

       	table_string += "</table>"
       		table_string += "<br/>"
       	table_string += "<table>"
       		table_string += "<tr>"
       			table_string += "<th align='left' colspan='4'>" + user_date2.toDateString() + "</th>";
       		table_string += "</tr>";
       		
    		if(user_date2.toDateString().includes("Sat")){
    			table_string += weekend_times3;	
    		}else if(user_date2.toDateString().includes("Sun")){
    			table_string += branch_closed;
    		}else{
    			table_string += weekday_times3;
    		}       			
       	table_string += "</table>";
       	table_string += "<br/>";    	

    	div.innerHTML = table_string;
       	
       	submit_form.classList.remove("hidden");
       	submit_form.classList.add("visible");
    }
    
    
    function timeSelected(date, time){
    	
    	if(date == 0){
    		date_holder.value = user_date0; //.toDateString();
    	}else if(date == 1){
    		date_holder.value = user_date1; //.toDateString();
    	}else if(date == 2){
			date_holder.value = user_date2; //.toDateString();
		}
    	
    	time_holder.value = time; 
    }
    
    window.addEventListener('load', start, false);
    </script>
    

<title>Appointment Date Selection</title>
</head>
<body>

    <h1>Let's find a time that works for you.</h1>
    <br>
    <input id='datePicker' type='text' class='datepicker-here' data-language='en' name="date" value="CHOOSE DATE"/> <!--class for date picker must be "datepicker-here" -->
    <button type="button" id="submit_Button" class="submit_Button"><i class="fa fa-search" ></i></button> <!--https://www.w3schools.com/howto/howto_css_search_button.asp -->
    <br>
    <br>
    <br>
 
    
    <div id="database_results">
    
	
    </div>
    <form class="hidden" id="submit_form" action="/spring/date_selected" method="post">
	<input type="hidden" id="date_holder" name="appointmentdate" value="">
	<input type="hidden" id="location_holder" name="banklocationid" value="${banklocationid}">
	<input type="hidden" id="service_holder" name="appointmentserviceid" value="${appointmentserviceid}">
	<input type="hidden" id="time_holder"name="appointmentstarttime" value="">
	<button type="submit" class="submit_Button1">Continue</button>
	</form>

</body>
</html>