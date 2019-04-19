package com.javalec.spring;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javalec.spring_dao.BDao;
import com.javalec.spring_dto.BDto;

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
	
	@RequestMapping(method=RequestMethod.POST, value="/location_selection2")
	public String screen2Controller(HttpServletRequest httpServletRequest, Model model) {
		
		String userSelectedServices = httpServletRequest.getParameter("whateverShannonNamesThisParameter");
		model.addAttribute("selectedServices", userSelectedServices);
		
		//TODO query database for list of valid locations and their address via the dao
		
		//TODO add the list of locations to the dao
		
		return "location_selection";
	}
	
	@RequestMapping("/date_selection")
	public String date_selection(Model model)
	{
		BDao dao = new BDao();
		ArrayList<BDto> dtos = dao.list();
		model.addAttribute("list", dtos);
		
		
		return "date_selection";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/date_selected")
	public String screen3Controller(HttpServletRequest httpServletRequest, Model model) {
		
		String user_selected_date = httpServletRequest.getParameter("date");
		model.addAttribute("user_selected_date", user_selected_date);
		
		//use query stored in Dao to query available branches/times based on input date


		//send that data to jsp
		
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
