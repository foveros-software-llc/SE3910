package com.javalec.spring_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.javalec.spring_dto.S4Dto;

public class S4Dao
{
	DataSource dataSource;
	
	public S4Dao()
	{
		try
		{
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/sdg_db");
		}
		catch (NamingException e)
		{
			e.printStackTrace();
		}
	}
	
	// Method to insert data into "customers" table
	public void insCustomerData(S4Dto s4dto)
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		/* Per DB readme:
		//do not enter any information for the customerid, it is auto-generated
		insert into customers
		(CustomerFirstName, CustomerLastName, CustomerEmail, CustomerPhoneNumber)
		values ('bob', 'smith', 'bobsmith@gmail.com', '816123456') 
		*/
		
		// Data for "customers" table
		String CustomerFirstName = s4dto.getFname();
		String CustomerLastName = s4dto.getLname();
		String CustomerEmail = s4dto.getEmail();
		String CustomerPhoneNumber = s4dto.getPhone();
		
		// Insert data into "customers" table
		try
		{
			connection = dataSource.getConnection();
			String query = "INSERT INTO customers (CustomerFirstName, CustomerLastName, CustomerEmail, CustomerPhoneNumber)" +
			" VALUES ('" + CustomerFirstName + "', '" + CustomerLastName + "', '" + CustomerEmail + "', '" + CustomerPhoneNumber + "');";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.executeUpdate();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if (resultSet != null) resultSet.close();
				if (preparedStatement != null) preparedStatement.close();
				if (connection != null) connection.close();
			}
			catch (Exception e2)
			{
				
			}
		}
	}
	
	// Method to query for customerid
	public String queryCustomerId(S4Dto s4dto)
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String customerid = null;
		
		String CustomerFirstName = s4dto.getFname();
		String CustomerLastName = s4dto.getLname();
		String CustomerEmail = s4dto.getEmail();
		String CustomerPhoneNumber = s4dto.getPhone();
		
		// Query "customers" table for customerid
		try
		{
			connection = dataSource.getConnection();
			String query = "SELECT CustomerId FROM customers " +
			"WHERE CustomerEmail = '" + CustomerEmail + "';";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next())
			{
				customerid = resultSet.getString("CustomerId");
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if (resultSet != null) resultSet.close();
				if (preparedStatement != null) preparedStatement.close();
				if (connection != null) connection.close();
			}
			catch (Exception e2)
			{
				
			}
		}
		
		return customerid;
	}
	
	// Method to insert data into "appointments" table
	public void insAppointmentData(S4Dto s4dto)
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		/* Per DB Readme:
		NOTE: time format is HH:MIN:SEC, date format is 'yyyy-mm-dd'
		insert into appointments
		(appointmentdate, appointmentstartTime, appointmentendtime, customerid, banklocationid)
		values ('2018-01-01', '10:30:00', '11:00:00', 1, 1); 
		*/
		
		// Data for "appointments" table
		String AppointmentDate = s4dto.getAppointmentDate();
		String AppointmentStartTime = s4dto.getApppointmentStartTime();
		String AppointmentEndTime = s4dto.getAppointmentEndTime();
		String CustomerId = s4dto.getCustomerId();
		String BankLocationId = s4dto.getBankLocationId();
		
		// Insert data into "appointments" table
		try
		{
			connection = dataSource.getConnection();
			String query = "INSERT INTO appointments (AppointmentDate, AppointmentStartTime, AppointmentEndTime, CustomerId, BankLocationId)" +
			" VALUES ('" + AppointmentDate + "', '" + AppointmentStartTime + "', '" + AppointmentEndTime + "', " + CustomerId + ", " + BankLocationId + ");";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.executeUpdate();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if (resultSet != null) resultSet.close();
				if (preparedStatement != null) preparedStatement.close();
				if (connection != null) connection.close();
			}
			catch (Exception e2)
			{
				
			}
		}
	}
	
	// Method to insert data into "appointmentservices" table
	public void insServicesData(S4Dto s4dto)
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
			
		/* Per DB Readme:
		insert into appointmentservices
		(appointmentid, banklocationserviceid, serviceid)
		values (1, 2, 1)
		*/
			
		// Data for "appointmentservices" table
		int appointmentid = s4dto.getAppointmentId();
		String BankLocationServiceId = s4dto.getBankLocationServiceId();
		String ServiceId = s4dto.getServiceId();
			
		// Insert data into "appointmentservices" table
		try
		{
			connection = dataSource.getConnection();
			String query = "INSERT INTO appointmentservices (appointmentid, BankLocationServiceId, ServiceId)" +
			" VALUES (" + appointmentid + ", " + BankLocationServiceId + ", " + ServiceId + ");";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.executeUpdate();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if (resultSet != null) resultSet.close();
				if (preparedStatement != null) preparedStatement.close();
				if (connection != null) connection.close();
			}
			catch (Exception e2)
			{
					
			}
		}
	}
		
	// Method to insert data into "customerappointments" table
	public void insCustomerStatus(S4Dto s4dto)
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
			
		/* Per DB Readme:
		//customerappointmentstatus accepted values are 0,1,2
		-0 means appointment not completed, 1 means appoinment completed, 2 means appointment canceled
		insert into customerappointments
		(customerappointmentstatus, appointmentid, appointmentserviceid)
		values (1, 2, 1)
		*/
					
		// Data for "customerappointments" table
		//String CustomerAppointmentStatus = s4dto.getCustomerAppointmentStatus();
		int appointmentid = s4dto.getAppointmentId();
		String AppointmentServiceId = s4dto.getAppointmentServiceId();
					
		// Insert data into "customerappointments" table
		try
		{
			connection = dataSource.getConnection();
			String query = "INSERT INTO customerappointments (CustomerAppointmentStatus, appointmentid, AppointmentServiceId)" +
			" VALUES (0," + appointmentid + ", " + AppointmentServiceId + ");";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.executeUpdate();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if (resultSet != null) resultSet.close();
				if (preparedStatement != null) preparedStatement.close();
				if (connection != null) connection.close();
			}
			catch (Exception e2)
			{
							
			}
		}
	}	
}