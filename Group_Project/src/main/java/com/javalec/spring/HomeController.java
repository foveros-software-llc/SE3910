package com.javalec.spring;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
	
	@RequestMapping("/contact_details")
	public String contact_details(Model model)
	{
		return "contact_details";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/contact") // url
	public String screen5Controller(HttpServletRequest httpServletRequest, Model model) {
		//fname is given in the previous view
		String fname = httpServletRequest.getParameter("fname");
		
		model.addAttribute("name", fname);
		
		return "confirm_appt"; // jsp file name
	}
	
	
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
