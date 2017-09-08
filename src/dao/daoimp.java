package dao;

import java.sql.*;

import modal.UserNotFoundException;

public class daoimp implements UserLoginInterface{
static String validateUserQry = "select * from user where usn = ? and password = ?";
static String insertqry = "insert into user(usn,name,password,phone) values (?,?,?,?)";
static String sellqry = "insert into details(usn,bk_name,category,cost,edition) values (?,?,?,?,?)";	
static String deleteqry = "delete from details where usn = ? and bk_name=?";
static String updateqry = "update user set phone = ? where usn = ?";
static String forgotqry = "update user set password=? where usn=? and phone=?";
public boolean validateUser(int usn,String password) throws UserNotFoundException {
		int rowCount = 0;
		boolean validUser = false;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seller", "root","admin");
			System.out.println(usn);
			System.out.println(password);
			PreparedStatement stat = con.prepareStatement(validateUserQry);
			stat.setInt(1, usn);
			stat.setString(2, password);
			ResultSet rs = stat.executeQuery();
			
			while(rs.next()) {				
				rowCount++;
				//if(rs.getInt(usn)==usn && rs.getString("password").equals(password)){
					
					validUser = true;
					
				//}
			}
			if(rowCount == 0 ){
				
				throw new UserNotFoundException("Invalid User");
				
			}
			
			
			
		}
		catch(UserNotFoundException unf){
			
			throw unf;
			
		}
		catch(Exception e){
			System.out.println("Exception:"+e);
			
		}
		System.out.println(validUser);
		System.out.println(rowCount);
		return validUser;
	}
	
	
	public boolean registration (int usn,String name,String password,long phone)throws Exception{
		int pin;
		System.out.println("in daoimp"+usn+name+password+phone);
		boolean valid = false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seller", "root","admin");
			PreparedStatement stat = con.prepareStatement(insertqry);
			
			stat.setInt(1,usn);
			stat.setString(2, name);
			stat.setString(3, password);
			stat.setLong(4, phone);
			pin =stat.executeUpdate();
			if(pin > 0){
				valid=true;
				
			}
			else{
				valid=false;
			}
			
		}
		
		catch(Exception e)
		{
			throw e;
		}
		return valid;
	}
	public boolean selling(int usn, String book, String category, int cost,
			int edition){
		int pin;
		
		boolean valid = false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seller", "root","admin");
			PreparedStatement stat = con.prepareStatement(sellqry);
			
			stat.setInt(1,usn);
			stat.setString(2, book);
			stat.setString(3, category);
			stat.setInt(4, cost);
			stat.setInt(5, edition);
			pin =stat.executeUpdate();
			if(pin > 0){
				valid=true;
				
			}
			else{
				valid=false;
			}
			
		}
		catch(Exception e)
		{
			System.out.println("Exception is "+e);
		}
		return valid;
	}
	public boolean deleteBooks(int usn,String[] book){
		int pin;
	
		boolean valid = false;
		if((book.length)!=0){
			for(int i=0;i<book.length;i++){
		try
		{   
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seller", "root","admin");
			PreparedStatement stat = con.prepareStatement(deleteqry);
			
			stat.setInt(1,usn);
			stat.setString(2, book[i]);
			pin =stat.executeUpdate();
			if(pin > 0){
				valid=true;
				
			}
			else{
				valid=false;
			}
			
		}
		catch(Exception e)
		{
			System.out.println("Exception is "+e);
		}
			
		}
	
		}return valid;
	}
	public boolean updateMobile(int usn,long phone){
		int pin;
		
		boolean valid = false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seller", "root","admin");
			PreparedStatement stat = con.prepareStatement(updateqry);
			
			stat.setLong(1, phone);
			stat.setInt(2, usn);
			pin =stat.executeUpdate();
			if(pin > 0){
				valid=true;
				
			}
			else{
				valid=false;
			}
			
		}
		catch(Exception e)
		{
			System.out.println("Exception is "+e);
		}
		return valid;
	}
	public boolean updatePassword(int usn, Long phone, String password)throws Exception{
		int pin;
		System.out.println("in daoimp"+usn+password+phone);
		boolean valid = false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seller", "root","admin");
			PreparedStatement stat = con.prepareStatement(forgotqry);
			
			stat.setString(1, password);
			stat.setInt(2,usn);
			stat.setLong(3, phone);
			
			pin =stat.executeUpdate();
			if(pin > 0){
				valid=true;
				
			}
			else{
				String e = null;
				throw new  Exception(e);
			}
			
		}
		
		catch(Exception e)
		{
			throw e;
		}
		return valid;
	}
}
