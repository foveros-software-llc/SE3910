package com.javalec.spring_dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.javalec.spring_dto.BDto;


public class BDao {


	/*Once the database is imported into the project you MUST go to your server and modify the context.xml file 
		<Resource auth="Container" 
    	driverClassName="com.mysql.jdbc.Driver" 
    	maxActive="50" 
    	maxWait="1000" 
    	name="jdbc/sdg_db" 
    	password="password" 
    	type="javax.sql.DataSource" 
    	url="jdbc:mysql://localhost/sdg_db" 
    	username="mdb52120"
    	/>
		
		Download link for JBDC you must have on your computer
		https://dev.mysql.com/downloads/windows/installer/8.0.html

	*/
	DataSource dataSource;
	
	public BDao() {
		try {
				Context context = new InitialContext();				
				
				dataSource = (DataSource)context.lookup("java:comp/env/jdbc/sdg_db");
			
	             } catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

	      }		
	}
	
	public ArrayList<BDto> list() {
		
		ArrayList<BDto> dtos = new ArrayList<BDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		
		
		try {
			connection =  dataSource.getConnection();
			//Query from Miguel that you want to run.
			String query = "select concat(bl.BankStreet, ' ', bl.BankCity, ', ', bl.BankState,' ', bl.BankZipCode) as BankStreet from banklocationservices bls join banklocations bl on bl.BankLocationId = bls.BankLocationId where bls.serviceId = 1 and 3";
			
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			
			while(resultSet.next()) {
				String QuerybankStreet = resultSet.getString("bankStreet");
				BDto dto = new BDto(QuerybankStreet);
				dtos.add(dto);
				System.out.println(dto);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
			}catch(Exception e2) {
				
			}
		}
		
		return dtos;
	
	}
	
	public ArrayList<BDto> findLocationsViaServices(String services) {
		
		ArrayList<BDto> dtos = new ArrayList<BDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		//TODO turn String services into list of related serviceIds
		String serviceIDs = null; //should be "ID, ID, ID,... ID)"
		String[] tokens = services.split(", ");
		
		//I'm assuming the services string will be "SERVICE, SERVICE,... SERVICE"
		for (String t : tokens) {
			if (t.equals("Checking Account")) serviceIDs = serviceIDs + ", 1";
			if (t.equals("Savings Account")) serviceIDs = serviceIDs + ", 2";
			if (t.equals("CDs/Money Market Accounts")) serviceIDs = serviceIDs + ", 3";
			if (t.equals("Student Banking")) serviceIDs = serviceIDs + ", 4";
			if (t.equals("Auto Loans")) serviceIDs = serviceIDs + ", 5";
			if (t.equals("Home Equity")) serviceIDs = serviceIDs + ", 6";
			if (t.equals("Morgage")) serviceIDs = serviceIDs + ", 7";
			if (t.equals("Student Loans")) serviceIDs = serviceIDs + ", 8";
			if (t.equals("Savins for Retirement")) serviceIDs = serviceIDs + ", 9";
			if (t.equals("Investment Account")) serviceIDs = serviceIDs + ", 10";
			if (t.equals("Credit Card")) serviceIDs = serviceIDs + ", 11";
			if (t.equals("Other")) serviceIDs = serviceIDs + ", 12";
		}
		serviceIDs = serviceIDs + ")";
		
		//TODO create new String for the WHERE bls.serviceId query parameters
		
		
		try {
			connection =  dataSource.getConnection();
			String query = "SELECT CONCAT(bl.BankStreet, ' ', bl.BankCity, ', ', bl.BankState,' ', bl.BankZipCode) "
					+ "AS BankStreet FROM banklocationservices bls "
					+ "JOIN banklocations bl ON bl.BankLocationId = bls.BankLocationId "
					+ "WHERE bls.serviceId IN (";
			
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			
			while(resultSet.next()) {
				String QuerybankStreet = resultSet.getString("bankStreet");
				BDto dto = new BDto(QuerybankStreet);
				dtos.add(dto);
				System.out.println(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
			} catch(Exception e2) {
				
			}
		}
		
		return dtos;
	}
}
