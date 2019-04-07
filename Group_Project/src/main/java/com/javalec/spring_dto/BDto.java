package com.javalec.spring_dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import com.javalec.spring_dao.BDao;

public class BDto {
	//*****This will have to be rewritten (need help remembering what all we will have stored)
	String Id;
	String Pw;
	String Name;
	String Phone;
	
	public BDto(String Id, String Pw, String Name, String Phone) {
		this.Id = Id;
		this.Pw = Pw;
		this.Name = Name;
		this.Phone = Phone;
	}
	//getters and setters here
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getPw() {
		return Pw;
	}
	public void setPw(String pw) {
		Pw = pw;
	}

}
