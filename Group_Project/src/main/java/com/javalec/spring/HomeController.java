package com.javalec.spring;

import java.text.DateFormat;
import java.util.ArrayList;
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
	
	@RequestMapping("/location_selection")
	public String location_selection(Model model) 
	{
		return "location_selection";
	}
	
	@RequestMapping("/date_selection")
	public String date_selection(Model model)
	{
		
		
		return "date_selection";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/date_selected")
	public String screen3Controller(HttpServletRequest httpServletRequest, Model model) {
		
		//Retrieving the data from the jsp
		String appointmentdate = httpServletRequest.getParameter("appointmentdate");
		String appointmentstartTime = httpServletRequest.getParameter("appointmentstartTime");
		//Adding data to the model
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
		System.out.println("AppointmentDate: " + httpServletRequest.getParameter("appointmentdate"));
		
		System.exit(0);
		// Data that should be passed to screen4?
		// For "appointmentservices" table:
		String appointmentid = null;
		String banklocationserviceid = null;
		String serviceid = null;
		// For "appointments" table:
		//String appointmentdate = null;
		String appointmentstartTime = null;
		String appointmentendtime = null;
		String customerid = null;
		String banklocationid = null;
		//String customerappointmentstatus = null;
		String appointmentserviceid = null;
		
		// Get model map to determine key,value pairs of previous views
		Map<String, Object> paramsMap = model.asMap();
		
		// Access map and assign to variables
		appointmentid = String.valueOf(paramsMap.get("appointmentid"));
		banklocationserviceid = String.valueOf(paramsMap.get("banklocationserviceid"));
		serviceid = String.valueOf(paramsMap.get("serviceid"));
		//String appointmentdate = String.valueOf(paramsMap.get("appointmentdate"));
		String appointmentdate = httpServletRequest.getParameter("appointmentdate");
		appointmentstartTime = String.valueOf(paramsMap.get("appointmentstartTime"));
		appointmentendtime = String.valueOf(paramsMap.get("appointmentendtime"));
		//customerid; //Should not exist in map
		banklocationid = String.valueOf(paramsMap.get("banklocationid"));
		//customerappointmentstatus = String.valueOf(paramsMap.get("customerappointmentstatus"));
		appointmentserviceid = String.valueOf(paramsMap.get("appointmentserviceid"));
		
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
		s4dto.setAppointmentStartTime(appointmentstartTime);
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
		customerid = s4dao.queryCustomerId(s4dto);
		s4dto.setCustomerId(customerid);
		
		// Insert into "appointments" table
		s4dao.insAppointmentData(s4dto);
		
		// Insert into "appointmentservices" table
		s4dao.insServicesData(s4dto);
		
		// Insert into "customerappointments" table
		s4dao.insCustomerStatus(s4dto);
		
		
		
		// Is this necessary?
		model.addAttribute("CustomerFirstName", fname);
		model.addAttribute("CustomerLastName", lname);
		model.addAttribute("CustomerEmail", email);
		model.addAttribute("CustomerPhoneNumber", phone);
		
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
