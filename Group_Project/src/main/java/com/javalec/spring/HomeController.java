package com.javalec.spring;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javalec.spring_dao.BDao;
import com.javalec.spring_dao.S4Dao;
import com.javalec.spring_dto.BDto;
import com.javalec.spring_dto.S4Dto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/service_selection")
	public String service_selection(Model model) 
	{
		return "service_selection";
	}	
	
	@RequestMapping(method=RequestMethod.POST, value="/service_selected")
	public String screen1Controller(HttpServletRequest httpServletRequest, Model model)
	{
		String serviceSelected = httpServletRequest.getParameter("service");
		
		System.out.println(serviceSelected);
		
		model.addAttribute("service_selected", serviceSelected);
		
		return "location_selection";
	}

	@RequestMapping("/location_selection")
	public String location_selection(Model model) 
	{
		return "location_selection";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/location_selected")
	public String screen2Controller(HttpServletRequest httpServletRequest, Model model) {
		
		//Retrieving the data from the jsp
		String banklocationid = httpServletRequest.getParameter("banklocationid");
		String appointmentservice = httpServletRequest.getParameter("appointmentservice");
		
		String appointmentserviceid;
		
		if(appointmentservice.equals("Checking Account")) {
			appointmentserviceid = "1";
		} else if(appointmentservice.equals("Savings Account")) {
			appointmentserviceid = "2";
		} else if(appointmentservice.equals("CDs/Money Market Accounts")) {
			appointmentserviceid = "3";
			
		} else if(appointmentservice.equals("Student Banking")) {
			appointmentserviceid = "4";
		} else if(appointmentservice.equals("Auto Loans")) {
			appointmentserviceid = "5";
		} else if(appointmentservice.equals("Home Equity")) {
			appointmentserviceid = "6";
			
		} else if(appointmentservice.equals("Morgage")) {
			appointmentserviceid = "7";
		} else if(appointmentservice.equals("Student Loans")) {
			appointmentserviceid = "8";
		} else if(appointmentservice.equals("Sivins for Retirement")) {
			appointmentserviceid = "9";
			
		} else if(appointmentservice.equals("Investment Account")) {
			appointmentserviceid = "10";
		} else if(appointmentservice.equals("Credit Cord")) {
			appointmentserviceid = "11";
		} else {
			appointmentserviceid = "12";
		}
		
		//Adding data to the model
		model.addAttribute("banklocationid", banklocationid);
		model.addAttribute("appointmentserviceid", appointmentserviceid);
		
		//Calling the next screen
		return "date_selection";
	}
	
	@RequestMapping("/date_selection")
	public String date_selection(Model model)
	{
		
		
		return "date_selection";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/date_selected")
	public String screen3Controller(HttpServletRequest httpServletRequest, Model model) {
		
		//Retrieving the data from the jsp
		String appointmentserviceid = httpServletRequest.getParameter("appointmentserviceid");
		String banklocationid = httpServletRequest.getParameter("banklocationid");
		String appointmentdate = httpServletRequest.getParameter("appointmentdate");
		String appointmentstartTime = httpServletRequest.getParameter("appointmentstarttime");
		//Adding data to the model
		model.addAttribute("appointmentserviceid", appointmentserviceid);
		model.addAttribute("banklocationid", banklocationid);
		model.addAttribute("appointmentdate", appointmentdate);
		model.addAttribute("appointmentstartTime", appointmentstartTime);
		
		//Calling the next screen
		return "contact_details";
	}
	
	
	
	@RequestMapping("/contact_details")
	public String contact_details(Model model)
	{
		return "contact_details";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/confirm_appt")
	public String screen4Controller(HttpServletRequest httpServletRequest, Model model)
	{
		// Data that should be passed to screen4?
		// For "appointmentservices" table:
		//String appointmentid = null;
		/*String banklocationserviceid = null;
		String serviceid = null;
		// For "appointments" table:
		String appointmentdate = null;
		String appointmentstartTime = null;
		String appointmentendtime = null;
		String customerid = null;*/
		//String banklocationid = "1";
		//String customerappointmentstatus = null;
		//String appointmentserviceid = "1";
		
		// Get model map to determine key,value pairs of previous views
		//Map<String, Object> paramsMap = model.asMap();
		
		// Access map and assign to variables
		int appointmentid = 4;//Integer.toString((int) (Math.random() * 100)); //String.valueOf(paramsMap.get("appointmentid"));
		String banklocationserviceid = "1"; //String.valueOf(paramsMap.get("banklocationserviceid"));
		String serviceid = "1"; //String.valueOf(paramsMap.get("serviceid"));
		String appointmentdate = httpServletRequest.getParameter("appointmentdate");
		String appointmentstarttime = httpServletRequest.getParameter("appointmentstarttime");
		
		
		String appointmentendtime;
	    
		Calendar calendar = Calendar.getInstance();
		Date date = null;
		try {
			// convert appointmentstarttime to a date object
			date = new SimpleDateFormat("hh:mm a").parse(appointmentstarttime);
			// set the calendar to the date
			calendar.setTime(date);
			// add an hour to the calendar
			calendar.add(Calendar.HOUR_OF_DAY, 1);
			// get the changed calendar time in a date
			Date enddate = calendar.getTime();
			// convert the updated date to a string
			appointmentendtime = new SimpleDateFormat("hh:mm a").format(enddate); 
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			appointmentendtime = "10:00 AM";
		}
		
		
		String banklocationid = httpServletRequest.getParameter("banklocationid");
		String appointmentserviceid = httpServletRequest.getParameter("appointmentserviceid");
		//customerid; //Should not exist in map
		//banklocationid = String.valueOf(paramsMap.get("banklocationid"));
		//customerappointmentstatus = String.valueOf(paramsMap.get("customerappointmentstatus"));
		//appointmentserviceid = String.valueOf(paramsMap.get("appointmentserviceid"));
		
		String fname = httpServletRequest.getParameter("fname");
		String lname = httpServletRequest.getParameter("lname");
		String email = httpServletRequest.getParameter("email");
		String phone = httpServletRequest.getParameter("phone");
		
		// Instantiate DTO
		S4Dto s4dto = new S4Dto();
		s4dto.setFname(fname);
		s4dto.setLname(lname);
		s4dto.setEmail(email);
		s4dto.setPhone(phone);
		s4dto.setAppointmentId(appointmentid);
		s4dto.setBankLocationServiceId(banklocationserviceid);
		s4dto.setServiceId(serviceid);
		s4dto.setAppointmentDate(appointmentdate);
		s4dto.setAppointmentStartTime(appointmentstarttime);
		s4dto.setAppointmentEndTime(appointmentendtime);
		//customerid;
		s4dto.setBankLocationId(banklocationid);
		//s4dto.setCustomerAppointmentStatus(customerappointmentstatus);
		s4dto.setAppointmentServiceId(appointmentserviceid);
		
		// Instantiate DAO
		S4Dao s4dao = new S4Dao();
		
		// Insert into "customers" table
		s4dao.insCustomerData(s4dto);
		
		// Query for customerid
		String customerid = s4dao.queryCustomerId(s4dto);
		s4dto.setCustomerId(customerid);
		
		
		// Insert into "appointments" table
		s4dao.insAppointmentData(s4dto);
		
		// Insert into "appointmentservices" table
		s4dao.insServicesData(s4dto);
		
		// Insert into "customerappointments" table
		s4dao.insCustomerStatus(s4dto);
		
		// Is this necessary?
		model.addAttribute("CustomerFirstName", fname);
		//model.addAttribute("CustomerLastName", lname);
		//model.addAttribute("CustomerEmail", email);
		//model.addAttribute("CustomerPhoneNumber", phone);
		model.addAttribute("appointmentdate", appointmentdate);
		model.addAttribute("appointmentstarttime", appointmentstarttime);
		
		return "confirm_appt";
	}
	
	
	/*  Not sure about the purpose of this; commented out:
	@RequestMapping(method=RequestMethod.POST, value="/contact") // url
	public String screen5Controller(HttpServletRequest httpServletRequest, Model model) {
		//fname is given in the previous view
		String fname = httpServletRequest.getParameter("fname");
		
		model.addAttribute("name", fname);
		
		return "confirm_appt"; // jsp file name
	}
	*/
	
	
	@RequestMapping("/confirm_appt")
	public String confirm_appt(Model model) 
	{
		return "confirm_appt";
	}
	
	@RequestMapping("/appt_viewer")
	public String appt_viewer(Model model) 
	{
		return "appt_viewer";
	}

}
