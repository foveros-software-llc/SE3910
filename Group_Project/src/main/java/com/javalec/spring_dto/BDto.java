package com.javalec.spring_dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import com.javalec.spring_dao.BDao;

public class BDto {

	
	String bankStreet;
	
	
	public BDto(String bankStreet) {
		this.bankStreet = bankStreet;

	}
	
	//getters and setters here
	public String getbankStreet() {
		return bankStreet;
	}


	public void setbankstreet(String bankStreet) {
		this.bankStreet = bankStreet;
	}



}
