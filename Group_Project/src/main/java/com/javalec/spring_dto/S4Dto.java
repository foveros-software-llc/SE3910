package com.javalec.spring_dto;

public class S4Dto
{
	// For "appointmentservices" table; pending data passed from previous views
	int appointmentid;
	String banklocationserviceid;
	String serviceid;
	
	// For "appointments" table; pending data passed from previous views
	String appointmentdate;
	String appointmentstartTime;
	String appointmentendtime;
	String customerid;
	String banklocationid;
	
	// For "customerappointments" table; pending data passed from previous views
	//String customerappointmentstatus;
	String appointmentserviceid;
	
	// For "customers" table
	String fname;
	String lname;
	String email;
	String phone;
	
	// Constructor will be expanded depending on passed data from previous views
	public S4Dto()
	{
		appointmentid = 3;
		banklocationserviceid = null;
		serviceid = null;
		appointmentdate = null;
		appointmentstartTime = null;
		appointmentendtime = null;
		customerid = "0";
		banklocationid = null;
		
		fname = null;
		lname = null;
		email = null;
		phone = null;
	}
	
	public S4Dto(String fname, String lname, String email, String phone)
	{
		appointmentid = 30;
		banklocationserviceid = null;
		serviceid = null;
		appointmentdate = null;
		appointmentstartTime = null;
		appointmentendtime = null;
		customerid = "30";
		banklocationid = null;
		
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.phone = phone;
	}
	
	// Getters will be expanded depending on passed data from previous views
	public String getFname()
	{
		return fname;
	}
	
	public String getLname()
	{
		return lname;
	}
	
	public String getEmail()
	{
		return email;
	}
	
	public String getPhone()
	{
		return phone;
	}
	
	public int getAppointmentId()
	{
		return appointmentid;
	}
	
	public String getBankLocationServiceId()
	{
		return banklocationserviceid;
	}
	
	public String getServiceId()
	{
		return serviceid;
	}
	
	public String getAppointmentDate()
	{
		return appointmentdate;
	}
	
	public String getApppointmentStartTime()
	{
		return appointmentstartTime;
	}
	
	public String getAppointmentEndTime()
	{
		return appointmentendtime;
	}
	
	public String getCustomerId()
	{
		return customerid;
	}
	
	public String getBankLocationId()
	{
		return banklocationid;
	}
	
	/* Per Miguel, not required
	public String getCustomerAppointmentStatus()
	{
		return customerappointmentstatus;
	}
	*/
	
	public String getAppointmentServiceId()
	{
		return appointmentserviceid;
	}
	
	// Setters will be expanded depending on passed data from previous views
	public void setFname(String fname)
	{
		this.fname = fname;
	}
	
	public void setLname(String lname)
	{
		this.lname = lname;
	}
	
	public void setEmail(String email)
	{
		this.email = email;
	}
	
	public void setPhone(String phone)
	{
		this.phone = phone;
	}
	
	public void setAppointmentId(int appointmentid)
	{
		this.appointmentid = appointmentid;
	}
	
	public void setBankLocationServiceId(String banklocationserviceid)
	{
		this.banklocationserviceid = banklocationserviceid;
	}
	
	public void setServiceId(String serviceid)
	{
		this.serviceid = serviceid;
	}
	
	public void setAppointmentDate(String appointmentdate)
	{
		this.appointmentdate = appointmentdate;
	}
	
	public void setAppointmentStartTime(String appointmentstartTime)
	{
		this.appointmentstartTime = appointmentstartTime;
	}
	
	public void setAppointmentEndTime(String appointmentendtime)
	{
		this.appointmentendtime = appointmentendtime;
	}
	
	public void setCustomerId(String customerid)
	{
		this.customerid = customerid;
	}
	
	public void setBankLocationId(String banklocationid)
	{
		this.banklocationid = banklocationid;
	}
	
	/* Per Miguel, not required
	public void setCustomerAppointmentStatus(String customerappointmentstatus)
	{
		this.customerappointmentstatus = customerappointmentstatus;
	}
	*/
	
	public void setAppointmentServiceId(String appointmentserviceid)
	{
		this.appointmentserviceid = appointmentserviceid;
	}
}