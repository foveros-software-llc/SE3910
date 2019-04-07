package com.javalec.spring_dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.javalec.spring_dto.BDto;

public class BDao {

	/*Once the database is imported into the project you MUST go to your server and modify the context.xml file 
		<Context>		
		<Resource name="jdbc/[YourDatabaseName]"		
		auth="Container"		
		type="javax.sql.DataSource"		
		username="[DatabaseUsername]"		
		password="[DatabasePassword]"		
		driverClassName="com.mysql.jdbc.Driver"		
		url="jdbc:mysql:/[yourserver]:3306/[yourapplication]"		
		maxActive="15"		
		maxIdle="3"/>		
		</Context>

	*/
	DataSource dataSource;
	
	public BDao() {
		try {
				Context context = new InitialContext();
				
				//*****This must be updated when we import the database
				dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			
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
			//*****The list of queries will have to be updated
			String query = "select id, pw, name, phone from se3910";
			
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			//*****This will have to be modified
			while(resultSet.next()) {
				String Uid = resultSet.getString("id");
				String Upw = resultSet.getString("pw");
				String Uname = resultSet.getString("name");
				String Uphone = resultSet.getString("phone");
				BDto dto = new BDto(Uid, Upw, Uname, Uphone);
				dtos.add(dto);
				
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
	
	
}
